package im.actor.server.dialog

import java.time.Instant

import akka.actor._
import akka.event.Logging
import akka.pattern.ask
import akka.util.Timeout
import im.actor.api.rpc.PeersImplicits
import im.actor.api.rpc.messaging.{ ApiDialogGroup, ApiDialogShort, ApiMessage }
import im.actor.api.rpc.misc.ApiExtension
import im.actor.api.rpc.peers.{ ApiPeer, ApiPeerType }
import im.actor.extension.InternalExtensions
import im.actor.server.db.DbExtension
import im.actor.server.dialog.DialogCommands._
import im.actor.server.group.GroupExtension
import im.actor.server.model.{ Peer, PeerType, Dialog ⇒ DialogModel }
import im.actor.server.persist.{ DialogRepo, HistoryMessageRepo }
import im.actor.server.sequence.SeqStateDate
import im.actor.server.user.UserExtension
import org.joda.time.DateTime
import slick.dbio.DBIO

import scala.concurrent.duration._
import scala.concurrent.{ ExecutionContext, Future }

sealed trait DialogExtension extends Extension

final class DialogExtensionImpl(system: ActorSystem) extends DialogExtension with PeersImplicits {
  Dialog.register()

  val InternalDialogExtensions = "modules.messaging.extensions"

  private val db = DbExtension(system).db
  private lazy val userExt = UserExtension(system)
  private lazy val groupExt = GroupExtension(system)

  private implicit val s: ActorSystem = system
  private implicit val ec: ExecutionContext = system.dispatcher
  private implicit val timeout: Timeout = Timeout(20.seconds) // TODO: configurable

  private val log = Logging(system, getClass)

  private def withValidPeer[A](peer: ApiPeer, senderUserId: Int, failed: ⇒ A)(f: ⇒ A): A =
    peer match {
      case ApiPeer(ApiPeerType.Private, id) if id == senderUserId ⇒
        log.error(s"Attempt to work with yourself, userId: $senderUserId")
        failed
      case _ ⇒ f
    }

  def sendMessage(peer: ApiPeer, senderUserId: Int, senderAuthSid: Int, randomId: Long, message: ApiMessage, isFat: Boolean = false): Future[SeqStateDate] =
    withValidPeer(peer, senderUserId, Future.successful(SeqStateDate())) {
      val date = Instant.now().toEpochMilli
      val sender = Peer.privat(senderUserId)
      val sendMessage = SendMessage(sender, peer.asModel, senderAuthSid, date, randomId, message, isFat)
      (userExt.processorRegion.ref ? Envelope(sender).withSendMessage(sendMessage)).mapTo[SeqStateDate]
    }

  def ackSendMessage(peer: Peer, sm: SendMessage): Future[Unit] =
    (processorRegion(peer) ? Envelope(peer).withSendMessage(sm)).mapTo[SendMessageAck] map (_ ⇒ ())

  def writeMessage(
    peer:         ApiPeer,
    senderUserId: Int,
    date:         DateTime,
    randomId:     Long,
    message:      ApiMessage
  ): Future[Unit] =
    withValidPeer(peer, senderUserId, Future.successful(())) {
      val sender = Peer.privat(senderUserId)
      val writeMessage = WriteMessage(sender, peer.asModel, date.getMillis, randomId, message)
      (userExt.processorRegion.ref ? Envelope(sender).withWriteMessage(writeMessage)).mapTo[WriteMessageAck] map (_ ⇒ ())
    }

  def messageReceived(peer: ApiPeer, receiverUserId: Int, date: Long): Future[Unit] =
    withValidPeer(peer, receiverUserId, Future.successful(())) {
      val now = Instant.now().getEpochSecond
      val receiver = Peer.privat(receiverUserId)
      val messageReceived = MessageReceived(receiver, peer.asModel, date, now)
      (userExt.processorRegion.ref ? Envelope(receiver).withMessageReceived(messageReceived)).mapTo[MessageReceivedAck] map (_ ⇒ ())
    }

  def ackMessageReceived(peer: Peer, mr: MessageReceived): Future[Unit] =
    (processorRegion(peer) ? Envelope(peer).withMessageReceived(mr)).mapTo[MessageReceivedAck] map (_ ⇒ ())

  def messageRead(peer: ApiPeer, readerUserId: Int, readerAuthSid: Int, date: Long): Future[Unit] =
    withValidPeer(peer, readerUserId, Future.successful(())) {
      val now = Instant.now().getEpochSecond
      val reader = Peer.privat(readerUserId)
      val messageRead = MessageRead(reader, peer.asModel, readerAuthSid, date, now)
      (userExt.processorRegion.ref ? Envelope(reader).withMessageRead(messageRead)).mapTo[MessageReadAck] map (_ ⇒ ())
    }

  def ackMessageRead(peer: Peer, mr: MessageRead): Future[Unit] =
    (processorRegion(peer) ? Envelope(peer).withMessageRead(mr)).mapTo[MessageReadAck] map (_ ⇒ ())

  def getDeliveryExtension(extensions: Seq[ApiExtension]): DeliveryExtension = {
    extensions match {
      case Seq() ⇒
        system.log.debug("No delivery extensions, using default one")
        new ActorDelivery()
      case ext +: tail ⇒
        system.log.debug("Got extensions: {}", extensions)
        val idToName = InternalExtensions.extensions(InternalDialogExtensions)
        idToName.get(ext.id) flatMap { className ⇒
          val extension = InternalExtensions.extensionOf[DeliveryExtension](className, system, ext.data).toOption
          system.log.debug("Created delivery extension: {}", extension)
          extension
        } getOrElse {
          val err = s"Dialog extension with id: ${ext.id} was not found"
          system.log.error(err)
          throw new Exception(err)
        }
    }
  }

  def getUnreadCount(clientUserId: Int, historyOwner: Int, peer: Peer, ownerLastReadAt: DateTime): DBIO[Int] = {
    if (isSharedUser(historyOwner)) {
      for {
        isMember ← DBIO.from(groupExt.getMemberIds(peer.id) map { case (memberIds, _, _) ⇒ memberIds contains clientUserId })
        result ← if (isMember) HistoryMessageRepo.getUnreadCount(historyOwner, peer, ownerLastReadAt) else DBIO.successful(0)
      } yield result
    } else {
      HistoryMessageRepo.getUnreadCount(historyOwner, peer, ownerLastReadAt)
    }
  }

  def isSharedUser(userId: Int): Boolean = userId == 0

  def getGroupedDialogs(userId: Int) = {
    db.run(DialogRepo.findNotArchivedSortByCreatedAt(userId, None, Int.MaxValue) flatMap { dialogModels ⇒
      val (groupModels, privateModels) = dialogModels.foldLeft((Vector.empty[DialogModel], Vector.empty[DialogModel])) {
        case ((groupModels, privateModels), dialog) ⇒
          if (dialog.peer.typ == PeerType.Group)
            (groupModels :+ dialog, privateModels)
          else
            (groupModels, privateModels :+ dialog)
      }

      for {
        groupDialogs ← DBIO.sequence(groupModels map getDialogShort)
        privateDialogs ← DBIO.sequence(privateModels map getDialogShort)
      } yield Vector(
        ApiDialogGroup("Groups", "groups", groupDialogs),
        ApiDialogGroup("Private", "privates", privateDialogs.toVector)
      )
    })
  }

  private def getDialogShort(dialogModel: DialogModel)(implicit ec: ExecutionContext): DBIO[ApiDialogShort] = {
    HistoryUtils.withHistoryOwner(dialogModel.peer, dialogModel.userId) { historyOwner ⇒
      for {
        messageOpt ← HistoryMessageRepo.findNewest(historyOwner, dialogModel.peer) map (_.map(_.ofUser(dialogModel.userId)))
        unreadCount ← getUnreadCount(dialogModel.userId, historyOwner, dialogModel.peer, dialogModel.ownerLastReadAt)
      } yield ApiDialogShort(
        peer = ApiPeer(ApiPeerType(dialogModel.peer.typ.value), dialogModel.peer.id),
        counter = unreadCount,
        date = messageOpt.map(_.date.getMillis).getOrElse(0)
      )
    }
  }

  private def processorRegion(peer: Peer): ActorRef = peer.typ match {
    case PeerType.Private ⇒
      userExt.processorRegion.ref //to user peer
    case PeerType.Group ⇒
      groupExt.processorRegion.ref //to group peer
    case _ ⇒ throw new RuntimeException("Unknown peer type!")
  }
}

object DialogExtension extends ExtensionId[DialogExtensionImpl] with ExtensionIdProvider {
  override def lookup = DialogExtension

  override def createExtension(system: ExtendedActorSystem) = new DialogExtensionImpl(system)
}
