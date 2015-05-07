package im.actor.server.session

import java.util.concurrent.TimeUnit

import scala.collection.immutable
import scala.concurrent.ExecutionContext
import scala.concurrent.duration._

import akka.actor._
import akka.contrib.pattern.ShardRegion.Passivate
import akka.contrib.pattern.{ ClusterSharding, ShardRegion }
import akka.pattern.pipe
import akka.stream.FlowMaterializer
import akka.stream.actor._
import akka.stream.scaladsl._
import com.typesafe.config.Config
import scodec.DecodeResult
import scodec.bits.BitVector
import slick.driver.PostgresDriver.api._

import im.actor.api.rpc.ClientData
import im.actor.server.mtproto.codecs.protocol.MessageBoxCodec
import im.actor.server.mtproto.protocol._
import im.actor.server.mtproto.transport.{ Drop, MTPackage }
import im.actor.server.presences.{ GroupPresenceManagerRegion, PresenceManagerRegion }
import im.actor.server.push.{ SeqUpdatesManagerRegion, WeakUpdatesManagerRegion }
import im.actor.server.{ models, persist }

case class SessionConfig(idleTimeout: Duration, reSendConfig: ReSenderConfig)

object SessionConfig {
  def fromConfig(config: Config): SessionConfig = {
    SessionConfig(
      idleTimeout = config.getDuration("idle-timeout", TimeUnit.SECONDS).seconds,
      reSendConfig = ReSenderConfig.fromConfig(config.getConfig("resend"))
    )
  }
}

object Session {

  import SessionMessage._

  private[this] val idExtractor: ShardRegion.IdExtractor = {
    case env @ Envelope(authId, sessionId, payload) ⇒ (authId.toString + "-" + sessionId.toString, env)
  }

  private[this] val shardResolver: ShardRegion.ShardResolver = msg ⇒ msg match {
    case Envelope(authId, sessionId, _) ⇒ (authId % 32).toString // TODO: configurable
  }

  def startRegion(props: Option[Props])(implicit system: ActorSystem): SessionRegion =
    SessionRegion(
      ClusterSharding(system).start(
        typeName = "Session",
        entryProps = props,
        idExtractor = idExtractor,
        shardResolver = shardResolver
      )
    )

  def startRegionProxy()(implicit system: ActorSystem): SessionRegion = startRegion(None)

  def props(
    implicit
    config:                     SessionConfig,
    seqUpdManagerRegion:        SeqUpdatesManagerRegion,
    weakUpdManagerRegion:       WeakUpdatesManagerRegion,
    presenceManagerRegion:      PresenceManagerRegion,
    groupPresenceManagerRegion: GroupPresenceManagerRegion,
    db:                         Database,
    materializer:               FlowMaterializer
  ): Props =
    Props(
      classOf[Session],
      config,
      seqUpdManagerRegion,
      weakUpdManagerRegion,
      presenceManagerRegion,
      groupPresenceManagerRegion,
      db,
      materializer
    )
}

class Session(
  implicit
  config:                     SessionConfig,
  seqUpdManagerRegion:        SeqUpdatesManagerRegion,
  weakUpdManagerRegion:       WeakUpdatesManagerRegion,
  presenceManagerRegion:      PresenceManagerRegion,
  groupPresenceManagerRegion: GroupPresenceManagerRegion,
  db:                         Database,
  materializer:               FlowMaterializer
)
  extends Actor with ActorLogging with MessageIdHelper with Stash {

  import SessionMessage._

  implicit val ec: ExecutionContext = context.dispatcher

  private[this] var optUserId: Option[Int] = None
  private[this] var clients = immutable.Set.empty[ActorRef]

  context.setReceiveTimeout(config.idleTimeout)

  def receive = waitingForEnvelope

  def waitingForEnvelope: Receive = {
    case env @ Envelope(authId, sessionId, _) ⇒
      stash()
      context.become(waitingForSessionInfo)

      // TODO: handle errors
      // TODO: refactor
      val infoAction = {
        for {
          authIdModelOpt ← persist.AuthId.find(authId).headOption
          infoModel ← persist.SessionInfo.find(authId, sessionId).headOption.map(_.getOrElse(models.SessionInfo(authId, sessionId, None)))
        } yield {
          authIdModelOpt match {
            case Some(models.AuthId(_, Some(userId), _)) ⇒
              persist.SessionInfo.updateUserId(authId, sessionId, Some(userId))
              models.SessionInfo(authId, sessionId, Some(userId))
            case Some(models.AuthId(_, None, _)) ⇒
              infoModel
            case None ⇒
              infoModel
          }
        }
      }

      val infoFuture = db.run(infoAction)

      infoFuture.pipeTo(self)
    case msg ⇒ stash()
  }

  def waitingForSessionInfo: Receive = {
    case info: models.SessionInfo ⇒
      optUserId = info.optUserId
      unstashAll()
      context.become(anonymous)
    case msg ⇒ stash()
  }

  def anonymous: Receive = {
    case env @ Envelope(authId, sessionId, HandleMessageBox(messageBoxBytes)) ⇒
      val client = sender()

      withValidMessageBox(client, messageBoxBytes) { mb ⇒
        val sessionMessagePublisher = context.actorOf(SessionMessagePublisher.props(), "messagePublisher")
        val rpcHandler = context.actorOf(RpcHandler.props, "rpcHandler")
        val updatesHandler = context.actorOf(UpdatesHandler.props(authId), "updatesHandler")
        val reSender = context.actorOf(ReSender.props(authId, sessionId)(config.reSendConfig), "reSender")

        val graph = SessionStream.graph(authId, sessionId, mb.messageId, rpcHandler, updatesHandler, reSender)

        val flow = FlowGraph.closed(graph) { implicit b ⇒ g ⇒
          import FlowGraph.Implicits._

          val source = b.add(Source(ActorPublisher[SessionStreamMessage](sessionMessagePublisher)))
          val sink = b.add(Sink.foreach[MTPackage](m ⇒ clients foreach (_ ! m)))
          val bcast = b.add(Broadcast[MTPackage](2))

          // format: OFF

          source   ~> g ~> bcast ~> sink
                           bcast ~> Sink.onComplete {_ ⇒ log.warning("Dying due to stream completion"); self ! PoisonPill  }

          // format: ON
        }

        flow.run()

        recordClient(client, reSender)

        sessionMessagePublisher ! SessionStreamMessage.SendProtoMessage(NewSession(sessionId, mb.messageId))
        sessionMessagePublisher ! Tuple2(mb, ClientData(authId, sessionId, optUserId))

        context.become(resolved(authId, sessionId, sessionMessagePublisher, reSender))
      }
    case internal ⇒ handleInternal(internal)
  }

  def resolved(authId: Long, sessionId: Long, publisher: ActorRef, reSender: ActorRef): Receive = {
    case env @ Envelope(eauthId, esessionId, msg) ⇒
      val client = sender()

      if (authId != eauthId || sessionId != esessionId) // Should never happen
        log.error("Received Envelope with another's authId and sessionId {}", env)
      else
        handleSessionMessage(authId, sessionId, client, msg, publisher, reSender)
    case internal ⇒ handleInternal(internal)
  }

  private def recordClient(client: ActorRef, reSender: ActorRef): Unit = {
    if (!clients.contains(client)) {
      clients += client
      reSender ! ReSenderMessage.NewClient(client)
      context watch client
    }
  }

  private def handleSessionMessage(
    authId:    Long,
    sessionId: Long,
    client:    ActorRef,
    message:   SessionMessage,
    publisher: ActorRef,
    reSender:  ActorRef
  ): Unit = {
    //log.debug("Session message {}", message)
    message match {
      case HandleMessageBox(messageBoxBytes) ⇒
        withValidMessageBox(client, messageBoxBytes) { mb ⇒
          publisher ! Tuple2(mb, ClientData(authId, sessionId, optUserId))
        }
        recordClient(client, reSender)
      case cmd: SubscribeCommand ⇒
        publisher ! cmd
      case UserAuthorized(userId) ⇒
        log.debug("User {} authorized session {}", userId, sessionId)

        this.optUserId = Some(userId)

        // TODO: handle errors
        persist.SessionInfo.updateUserId(authId, sessionId, this.optUserId)
    }
  }

  private def withValidMessageBox(client: ActorRef, messageBoxBytes: Array[Byte])(f: MessageBox ⇒ Unit): Unit =
    decodeMessageBox(messageBoxBytes) match {
      case Some(mb) ⇒ f(mb)
      case None ⇒
        log.warning("Failed to parse MessageBox. Droping client.")
        client ! Drop(0, 0, "Cannot parse MessageBox")
        context.stop(self)
    }

  private def decodeMessageBox(messageBoxBytes: Array[Byte]): Option[MessageBox] =
    MessageBoxCodec.decode(BitVector(messageBoxBytes)).toEither match {
      case Right(DecodeResult(mb, _)) ⇒ Some(mb)
      case _                          ⇒ None
    }

  private def handleInternal(message: Any) =
    message match {
      case ReceiveTimeout ⇒
        context.parent ! Passivate(stopMessage = PoisonPill)
      case Terminated(client) ⇒
        clients -= client
      case unmatched ⇒
        log.error("Received unmatched message {}", message)
    }

}
