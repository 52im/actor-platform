package im.actor.server.api.rpc.service

import scala.concurrent.Future

import com.amazonaws.auth.EnvironmentVariableCredentialsProvider
import com.amazonaws.services.s3.transfer.TransferManager

import im.actor.api.rpc._
import im.actor.api.rpc.Implicits._
import im.actor.api.rpc.messaging._
import im.actor.api.rpc.misc.ResponseVoid
import im.actor.api.rpc.peers.PeerType
import im.actor.server.api.rpc.service.groups.GroupsServiceImpl
import im.actor.server.models
import im.actor.server.persist
import im.actor.server.presences.{ GroupPresenceManager, PresenceManager }
import im.actor.server.social.SocialManager
import im.actor.server.util.ACLUtils

class MessagingServiceHistorySpec extends BaseServiceSuite with GroupsServiceHelpers {
  behavior of "MessagingServiceHistoryService"

  it should "Load history (private)" in s.privat

  it should "Load dialogs" in s.dialogs

  it should "mark messages received and send updates (private)" in s.historyPrivate.markReceived

  it should "mark messages read and send updates (private)" in s.historyPrivate.markRead

  it should "mark messages received and send updates (group)" in s.historyGroup.markReceived

  it should "mark messages read and send updates (group)" in s.historyGroup.markRead

  implicit val sessionRegion = buildSessionRegionProxy()

  implicit val seqUpdManagerRegion = buildSeqUpdManagerRegion()
  implicit val socialManagerRegion = SocialManager.startRegion()
  implicit val presenceManagerRegion = PresenceManager.startRegion()
  implicit val groupPresenceManagerRegion = GroupPresenceManager.startRegion()

  val bucketName = "actor-uploads-test"
  val awsCredentials = new EnvironmentVariableCredentialsProvider()
  implicit val transferManager = new TransferManager(awsCredentials)

  implicit val service = new messaging.MessagingServiceImpl
  implicit val groupsService = new GroupsServiceImpl(bucketName)
  implicit val authService = buildAuthService()
  implicit val ec = system.dispatcher

  object s {
    val (user1, authId1, _) = createUser()
    val sessionId1 = createSessionId()

    val (user2, authId2, _) = createUser()
    val sessionId2 = createSessionId()

    val clientData1 = ClientData(authId1, sessionId1, Some(user1.id))
    val clientData2 = ClientData(authId2, sessionId2, Some(user2.id))

    val user1Model = getUserModel(user1.id)
    val user1AccessHash = ACLUtils.userAccessHash(authId2, user1.id, user1Model.accessSalt)
    val user1Peer = peers.OutPeer(PeerType.Private, user1.id, user1AccessHash)

    val user2Model = getUserModel(user2.id)
    val user2AccessHash = ACLUtils.userAccessHash(authId1, user2.id, user2Model.accessSalt)
    val user2Peer = peers.OutPeer(PeerType.Private, user2.id, user2AccessHash)

    def privat() = {
      val step = 100L

      val (message1Date, message2Date, message3Date) = {
        implicit val clientData = clientData1

        whenReady(service.handleSendMessage(user2Peer, 1L, TextMessage("Hi Shiva 1", Vector.empty, None)))(_ ⇒ ())

        val message1Date = System.currentTimeMillis()
        Thread.sleep(step)

        whenReady(service.handleSendMessage(user2Peer, 2L, TextMessage("Hi Shiva 2", Vector.empty, None)))(_ ⇒ ())

        val message2Date = System.currentTimeMillis()
        Thread.sleep(step)

        whenReady(service.handleSendMessage(user2Peer, 3L, TextMessage("Hi Shiva 3", Vector.empty, None)))(_ ⇒ ())

        val message3Date = System.currentTimeMillis()
        Thread.sleep(step)

        whenReady(service.handleSendMessage(user2Peer, 4L, TextMessage("Hi Shiva 4", Vector.empty, None)))(_ ⇒ ())

        (message1Date, message2Date, message3Date)
      }

      {
        implicit val clientData = clientData2

        whenReady(service.handleMessageReceived(user1Peer, message2Date)) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseVoid) ⇒
          }
        }

        whenReady(service.handleMessageRead(user1Peer, message1Date)) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseVoid) ⇒
          }
        }
      }

      {
        implicit val clientData = clientData1

        whenReady(service.handleLoadHistory(user2Peer, message3Date, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }
          val respBody = resp.toOption.get

          respBody.users.length should ===(0)
          respBody.history.length should ===(3)
          respBody.history.map(_.state) should ===(Seq(Some(MessageState.Sent), Some(MessageState.Received), Some(MessageState.Read)))
        }
      }
    }

    def dialogs() = {
      {
        implicit val clientData = clientData1

        whenReady(service.handleLoadDialogs(0, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }

          val respBody = resp.toOption.get

          respBody.dialogs.length should ===(1)
          val dialog = respBody.dialogs.head
          dialog.unreadCount should ===(0)
          respBody.users.length should ===(2)
        }
      }

      {
        implicit val clientData = clientData2

        whenReady(service.handleLoadDialogs(0, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }

          val respBody = resp.toOption.get

          respBody.dialogs.length should ===(1)
          val dialog = respBody.dialogs.head
          dialog.unreadCount should ===(3)
          respBody.users.length should ===(1)
        }
      }
    }

    object historyPrivate {
      val (user1, authId1, _) = createUser()
      val sessionId1 = createSessionId()

      val (user2, authId2, _) = createUser()
      val sessionId2 = createSessionId()

      val clientData1 = ClientData(authId1, sessionId1, Some(user1.id))
      val clientData2 = ClientData(authId2, sessionId2, Some(user2.id))

      val user1Model = getUserModel(user1.id)
      val user1AccessHash = ACLUtils.userAccessHash(authId2, user1.id, user1Model.accessSalt)
      val user1Peer = peers.OutPeer(PeerType.Private, user1.id, user1AccessHash)

      val user2Model = getUserModel(user2.id)
      val user2AccessHash = ACLUtils.userAccessHash(authId1, user2.id, user2Model.accessSalt)
      val user2Peer = peers.OutPeer(PeerType.Private, user2.id, user2AccessHash)

      def markReceived() = {

        val startDate = {
          implicit val clientData = clientData1

          val startDate = System.currentTimeMillis()

          val sendMessages = Future.sequence(Seq(
            service.handleSendMessage(user2Peer, 1L, TextMessage("Hi Shiva 1", Vector.empty, None)),
            futureSleep(1500).flatMap(_ ⇒ service.handleSendMessage(user2Peer, 2L, TextMessage("Hi Shiva 2", Vector.empty, None))),
            futureSleep(3000).flatMap(_ ⇒ service.handleSendMessage(user2Peer, 3L, TextMessage("Hi Shiva 3", Vector.empty, None)))
          ))

          whenReady(sendMessages)(_ ⇒ ())

          startDate
        }

        {
          implicit val clientData = clientData2

          whenReady(service.handleMessageReceived(user1Peer, startDate + 2000)) { resp ⇒
            resp should matchPattern {
              case Ok(ResponseVoid) ⇒
            }
          }

          whenReady(db.run(persist.Dialog.find(user1.id, models.Peer.privat(user2.id)).head)) { dialog ⇒
            dialog.lastReceivedAt.getMillis should be < startDate + 3000
            dialog.lastReceivedAt.getMillis should be > startDate + 1000
          }
        }

        {
          whenReady(db.run(persist.sequence.SeqUpdate.find(authId1).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageReceived.header)
          }
        }
      }

      def markRead() = {
        val startDate = {
          implicit val clientData = clientData1

          val startDate = System.currentTimeMillis()

          val sendMessages = Future.sequence(Seq(
            service.handleSendMessage(user2Peer, 1L, TextMessage("Hi Shiva 1", Vector.empty, None)),
            futureSleep(1500).flatMap(_ ⇒ service.handleSendMessage(user2Peer, 2L, TextMessage("Hi Shiva 2", Vector.empty, None))),
            futureSleep(3000).flatMap(_ ⇒ service.handleSendMessage(user2Peer, 3L, TextMessage("Hi Shiva 3", Vector.empty, None)))
          ))

          whenReady(sendMessages)(_ ⇒ ())

          startDate
        }

        {
          implicit val clientData = clientData2

          whenReady(service.handleMessageRead(user1Peer, startDate + 2000)) { resp ⇒
            resp should matchPattern {
              case Ok(ResponseVoid) ⇒
            }
          }

          whenReady(db.run(persist.Dialog.find(user1.id, models.Peer.privat(user2.id)).head)) { dialog ⇒
            dialog.lastReadAt.getMillis should be < startDate + 3000
            dialog.lastReadAt.getMillis should be > startDate + 1000
          }

          whenReady(service.handleLoadDialogs(Long.MaxValue, 100)) { resp ⇒
            val dialog = resp.toOption.get.dialogs.head

            dialog.unreadCount shouldEqual 1
          }
        }

        {
          whenReady(db.run(persist.sequence.SeqUpdate.find(authId1).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageRead.header)
          }

          whenReady(db.run(persist.sequence.SeqUpdate.find(authId2).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageReadByMe.header)
          }
        }
      }
    }

    object historyGroup {
      val (user1, authId1, _) = createUser()
      val sessionId1 = createSessionId()

      val (user2, authId2, _) = createUser()
      val sessionId2 = createSessionId()

      val clientData1 = ClientData(authId1, sessionId1, Some(user1.id))
      val clientData2 = ClientData(authId2, sessionId2, Some(user2.id))

      val groupOutPeer = {
        implicit val clientData = clientData1

        createGroup("Fun group", Set(user2.id)).groupPeer
      }

      def markReceived() = {
        val startDate = System.currentTimeMillis()

        {
          implicit val clientData = clientData1

          val sendMessages = Future.sequence(Seq(
            service.handleSendMessage(groupOutPeer.asOutPeer, 1L, TextMessage("Hi Shiva 1", Vector.empty, None)),
            futureSleep(1500).flatMap(_ ⇒ service.handleSendMessage(groupOutPeer.asOutPeer, 2L, TextMessage("Hi Shiva 2", Vector.empty, None))),
            futureSleep(3000).flatMap(_ ⇒ service.handleSendMessage(groupOutPeer.asOutPeer, 3L, TextMessage("Hi Shiva 3", Vector.empty, None)))
          ))

          whenReady(sendMessages)(_ ⇒ ())
        }

        {
          implicit val clientData = clientData2

          whenReady(service.handleMessageReceived(groupOutPeer.asOutPeer, startDate + 2000)) { resp ⇒
            resp should matchPattern {
              case Ok(ResponseVoid) ⇒
            }
          }

          whenReady(db.run(persist.Dialog.find(user1.id, models.Peer.group(groupOutPeer.groupId)).head)) { dialog ⇒
            dialog.ownerLastReceivedAt.getMillis should be < startDate + 3000
            dialog.ownerLastReceivedAt.getMillis should be > startDate + 1000
          }
        }

        {
          implicit val clientData = clientData1

          whenReady(db.run(persist.sequence.SeqUpdate.find(authId1).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageReceived.header)
          }
        }
      }

      def markRead() = {
        val startDate = System.currentTimeMillis()

        {
          implicit val clientData = clientData1

          val sendMessages = Future.sequence(Seq(
            service.handleSendMessage(groupOutPeer.asOutPeer, 1L, TextMessage("Hi Shiva 1", Vector.empty, None)),
            futureSleep(1500).flatMap(_ ⇒ service.handleSendMessage(groupOutPeer.asOutPeer, 2L, TextMessage("Hi Shiva 2", Vector.empty, None))),
            futureSleep(3000).flatMap(_ ⇒ service.handleSendMessage(groupOutPeer.asOutPeer, 3L, TextMessage("Hi Shiva 3", Vector.empty, None)))
          ))

          whenReady(sendMessages)(_ ⇒ ())
        }

        {
          implicit val clientData = clientData2

          whenReady(service.handleMessageRead(groupOutPeer.asOutPeer, startDate + 2000)) { resp ⇒
            resp should matchPattern {
              case Ok(ResponseVoid) ⇒
            }
          }

          whenReady(db.run(persist.Dialog.find(user1.id, models.Peer.group(groupOutPeer.groupId)).head)) { dialog ⇒
            dialog.lastReadAt.getMillis should be < startDate + 3000
            dialog.lastReadAt.getMillis should be > startDate + 1000
          }

          whenReady(service.handleLoadDialogs(Long.MaxValue, 100)) { resp ⇒
            val dialog = resp.toOption.get.dialogs.head
            dialog.unreadCount shouldEqual 1
          }
        }

        {
          whenReady(db.run(persist.sequence.SeqUpdate.find(authId1).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageRead.header)
          }

          whenReady(db.run(persist.sequence.SeqUpdate.find(authId2).head)) { lastUpdate ⇒
            lastUpdate.header should ===(UpdateMessageReadByMe.header)
          }
        }
      }
    }
  }

}