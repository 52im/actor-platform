package im.actor.server.api.frontend

import scala.concurrent.duration._
import scala.concurrent.{ ExecutionContextExecutor, Future }

import akka.actor.{ ActorRef, ActorSystem }
import akka.pattern.{ AskTimeoutException, ask }
import akka.stream.stage._
import akka.util.Timeout
import org.apache.commons.codec.digest.DigestUtils
import scodec.bits.BitVector

import im.actor.server.mtproto.transport._

private[frontend] final class PackageHandleStage(
  protoVersions:    Set[Byte],
  apiMajorVersions: Set[Byte],
  authManager:      ActorRef,
  sessionClient:    ActorRef
)(implicit system: ActorSystem)
  extends StatefulStage[TransportPackage, Future[MTProto]] {

  implicit val ec: ExecutionContextExecutor = system.dispatcher
  implicit val askTimeout: Timeout = Timeout(5.seconds)

  override def initial: StageState[TransportPackage, Future[MTProto]] = new StageState[TransportPackage, Future[MTProto]] {
    override def onPush(elem: TransportPackage, ctx: Context[Future[MTProto]]): SyncDirective = {
      elem match {
        case TransportPackage(_, h: Handshake) ⇒
          ctx.push(Future.successful {
            val sha256Sign = BitVector(DigestUtils.sha256(h.bytes.toByteArray))
            val protoVersion: Byte = if (protoVersions.contains(h.protoVersion)) h.protoVersion else 0
            val apiMajorVersion: Byte = if (apiMajorVersions.contains(h.apiMajorVersion)) h.apiMajorVersion else 0
            val apiMinorVersion: Byte = if (apiMajorVersion == 0) 0 else h.apiMinorVersion
            val hresp = HandshakeResponse(protoVersion, apiMajorVersion, apiMinorVersion, sha256Sign)
            hresp
          })
        case TransportPackage(index, body) ⇒
          // TODO: get rid of respOptFuture and ask pattern

          val ackFuture = Future.successful(Ack(index))

          val fs: Seq[Future[MTProto]] = body match {
            case m: MTPackage ⇒
              if (m.authId == 0) {
                val f = authManager.ask(AuthorizationManager.FrontendPackage(m)).mapTo[MTProto].recover {
                  case e: AskTimeoutException ⇒
                    val msg = s"handleAsk within $askTimeout"
                    throw new Exception(msg)
                }

                Seq(ackFuture, f)
              } else {
                sessionClient ! SessionClient.SendToSession(m)

                Seq(ackFuture)
              }
            case Ping(bytes) ⇒ Seq(ackFuture, Future.successful(Pong(bytes)))
            case Pong(bytes) ⇒ Seq(ackFuture)
            case m           ⇒ Seq(ackFuture)
          }

          emit(fs.iterator, ctx)
      }
    }
  }
}
