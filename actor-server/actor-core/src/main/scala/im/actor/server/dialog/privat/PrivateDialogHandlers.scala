package im.actor.server.dialog.privat

import akka.pattern.pipe
import im.actor.api.rpc.messaging._
import im.actor.api.rpc.peers.{ ApiPeer, ApiPeerType }
import im.actor.server.dialog._
import im.actor.server.event.TSEvent
import im.actor.server.misc.UpdateCounters
import im.actor.server.model
import im.actor.server.model.PeerType
import im.actor.server.persist.HistoryMessageRepo
import im.actor.server.sequence.{ SeqState, SeqStateDate }
import im.actor.server.social.SocialManager._
import HistoryUtils._
import im.actor.util.cache.CacheHelpers._
import org.joda.time.DateTime

import scala.concurrent.Future

trait PrivateDialogHandlers extends UpdateCounters {
  this: PrivateDialog ⇒

  import DialogCommands._
  import PrivateDialogEvents._

  protected def sendMessage(
    dialogState:   PrivateDialogState,
    senderUserId:  Int,
    senderAuthSid: Int,
    randomId:      Long,
    message:       ApiMessage,
    isFat:         Boolean
  ): Unit = {
    val date = new DateTime
    val dateMillis = date.getMillis
    val userState = dialogState(senderUserId)
    deferStashingReply(TSEvent(now(), LastMessageDate(dateMillis, userState.peerId)), dialogState) { e ⇒
      withCachedFuture[AuthSidRandomId, SeqStateDate](senderAuthSid → randomId) {
        for {
          SeqState(seq, state) ← deliveryExt(senderUserId).senderDelivery(senderUserId, senderAuthSid, privatePeerStruct(userState.peerId), randomId, dateMillis, message, isFat)
          _ = recordRelation(senderUserId, userState.peerId)
          _ ← db.run(writeHistoryMessage(model.Peer(PeerType.Private, senderUserId), model.Peer(PeerType.Private, userState.peerId), date, randomId, message.header, message.toByteArray))
          _ ← deliveryExt(userState.peerId).receiverDelivery(userState.peerId, senderUserId, privatePeerStruct(senderUserId), randomId, dateMillis, message, isFat)
        } yield SeqStateDate(seq, state, dateMillis)
      } recover {
        case e ⇒
          log.error(e, "Failed to send message")
          throw e
      }
    }
  }

  protected def writeMessage(
    dialogState:  PrivateDialogState,
    senderUserId: Int,
    dateMillis:   Long,
    randomId:     Long,
    message:      ApiMessage
  ): Unit = {
    val date = new DateTime(dateMillis)
    val userState = dialogState(senderUserId)

    val fut =
      message match {
        case ApiServiceMessage(_, Some(ApiServiceExContactRegistered(userId))) ⇒
          db.run(HistoryMessageRepo.create(
            model.HistoryMessage(
              userId = userState.peerId,
              peer = model.Peer(PeerType.Private, userId),
              date = date,
              senderUserId = userId,
              randomId = randomId,
              messageContentHeader = message.header,
              messageContentData = message.toByteArray,
              deletedAt = None
            )
          ))
        case _ ⇒
          db.run(writeHistoryMessage(
            model.Peer(PeerType.Private, senderUserId),
            model.Peer(PeerType.Private, userState.peerId),
            date,
            randomId,
            message.header,
            message.toByteArray
          ))
      }

    fut map (_ ⇒ WriteMessageAck()) pipeTo sender()
  }

  protected def messageReceived(state: PrivateDialogState, receiverUserId: Int, date: Long): Unit = {
    val replyTo = sender()

    val userState = state(receiverUserId)
    val now = System.currentTimeMillis
    (if (!userState.lastReceiveDate.exists(_ >= date) &&
      !(date > now) &&
      (userState.lastMessageDate.isEmpty || userState.lastMessageDate.exists(_ >= date))) {
      context become working(updatedState(TSEvent(new DateTime(now), LastReceiveDate(date, receiverUserId)), state))

      val update = UpdateMessageReceived(privatePeerStruct(receiverUserId), date, now)
      for {
        _ ← userExt.broadcastUserUpdate(userState.peerId, update, None, isFat = false, deliveryId = None)
        _ ← db.run(markMessagesReceived(model.Peer(PeerType.Private, receiverUserId), model.Peer(PeerType.Private, userState.peerId), new DateTime(date)))
      } yield MessageReceivedAck()
    } else {
      Future.successful(MessageReceivedAck())
    }) pipeTo replyTo onFailure {
      case e ⇒
        log.error(e, "Failed to mark messages received")
    }
  }

  protected def messageRead(state: PrivateDialogState, readerUserId: Int, readerAuthSid: Int, date: Long): Unit = {
    val replyTo = sender()

    val userState = state(readerUserId)
    val now = System.currentTimeMillis
    (if (!userState.lastReadDate.exists(_ >= date) &&
      !(date > now) &&
      (userState.lastMessageDate.isEmpty || userState.lastMessageDate.exists(_ >= date))) {
      context become working(updatedState(TSEvent(new DateTime(now), LastReadDate(date, readerUserId)), state))

      for {
        _ ← db.run(markMessagesRead(model.Peer(PeerType.Private, readerUserId), model.Peer(PeerType.Private, userState.peerId), new DateTime(date)))
        _ ← deliveryExt(userState.peerId).authorRead(readerUserId, userState.peerId, date, now)
        _ ← deliveryExt(readerUserId).readerRead(readerUserId, readerAuthSid, userState.peerId, date)
      } yield MessageReadAck()
    } else {
      Future.successful(MessageReadAck())
    }) pipeTo replyTo onFailure {
      case e ⇒
        log.error(e, "Failed to mark messages read")
    }
  }

  private def privatePeerStruct(userId: Int): ApiPeer = ApiPeer(ApiPeerType.Private, userId)

}
