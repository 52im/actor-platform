package im.actor.server.api.rpc.service

import scala.util.Random

import akka.contrib.pattern.DistributedPubSubMediator
import akka.testkit.TestProbe
import com.amazonaws.auth.EnvironmentVariableCredentialsProvider
import com.amazonaws.services.s3.transfer.TransferManager
import com.google.protobuf.CodedInputStream

import im.actor.api.rpc.Implicits._
import im.actor.api.rpc._
import im.actor.api.rpc.files.FileLocation
import im.actor.api.rpc.messaging._
import im.actor.api.rpc.misc.ResponseSeqDate
import im.actor.api.rpc.peers.{ Peer, PeerType, UserOutPeer }
import im.actor.server.api.rpc.service.groups.GroupsServiceImpl
import im.actor.server.api.rpc.service.messaging.{ GroupPeerManager, PrivatePeerManager, Events }
import im.actor.server.persist
import im.actor.server.presences.{ GroupPresenceManager, PresenceManager }
import im.actor.server.social.SocialManager
import im.actor.server.util.ACLUtils

class MessagingServiceSpec extends BaseServiceSuite with GroupsServiceHelpers {
  behavior of "MessagingService"

  "Messaging" should "send messages" in s.privat.sendMessage

  it should "send group messages" in s.group.sendMessage

  it should "not send messages when user is not in group" in s.group.restrictAlienUser

  it should "publish messages in PubSub" in s.pubsub.publish

  object s {
    implicit val sessionRegion = buildSessionRegionProxy()
    implicit val seqUpdManagerRegion = buildSeqUpdManagerRegion()
    implicit val socialManagerRegion = SocialManager.startRegion()
    implicit val presenceManagerRegion = PresenceManager.startRegion()
    implicit val groupPresenceManagerRegion = GroupPresenceManager.startRegion()
    implicit val privatePeerManagerRegion = PrivatePeerManager.startRegion()
    implicit val groupPeerManagerRegion = GroupPeerManager.startRegion()

    val bucketName = "actor-uploads-test"
    val awsCredentials = new EnvironmentVariableCredentialsProvider()
    implicit val transferManager = new TransferManager(awsCredentials)

    implicit val service = messaging.MessagingServiceImpl(mediator)
    implicit val groupsService = new GroupsServiceImpl(bucketName)
    implicit val authService = buildAuthService()
    implicit val ec = system.dispatcher

    object privat {
      val (user, user1AuthId1, _) = createUser()
      val user1AuthId2 = createAuthId(user.id)

      val sessionId = createSessionId()
      implicit val clientData = ClientData(user1AuthId1, sessionId, Some(user.id))

      val (user2, user2AuthId, _) = createUser()
      val user2Model = getUserModel(user2.id)
      val user2AccessHash = ACLUtils.userAccessHash(user1AuthId1, user2.id, user2Model.accessSalt)
      val user2Peer = peers.OutPeer(PeerType.Private, user2.id, user2AccessHash)

      def sendMessage() = {
        val randomId = Random.nextLong()

        whenReady(service.handleSendMessage(user2Peer, randomId, TextMessage("Hi Shiva", Vector.empty, None))) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseSeqDate(1000, _, _)) ⇒
          }
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user1AuthId1))) { updates ⇒
          updates.length shouldEqual 1

          val update = updates.head
          update.header shouldEqual UpdateMessageSent.header
          val seqUpdate = UpdateMessageSent.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Private, user2.id)
          seqUpdate.randomId shouldEqual randomId
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user1AuthId2))) { updates ⇒
          updates.length shouldEqual 1

          val update = updates.head
          update.header shouldEqual UpdateMessage.header
          val seqUpdate = UpdateMessage.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Private, user2.id)
          seqUpdate.randomId shouldEqual randomId
          seqUpdate.senderUserId shouldEqual user.id
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user2AuthId))) { updates ⇒
          updates.length shouldEqual 1

          val update = updates.head
          update.header shouldEqual UpdateMessage.header
          val seqUpdate = UpdateMessage.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Private, user.id)
          seqUpdate.randomId shouldEqual randomId
          seqUpdate.senderUserId shouldEqual user.id
        }
      }
    }

    object group {
      val (user1, user1AuthId1, _) = createUser()
      val user1AuthId2 = createAuthId(user1.id)

      val (user2, user2AuthId, _) = createUser()
      val sessionId = createSessionId()
      implicit val clientData = ClientData(user1AuthId1, sessionId, Some(user1.id))

      val groupOutPeer = createGroup("Fun group", Set(user2.id)).groupPeer

      def sendMessage() = {
        val randomId = Random.nextLong()

        whenReady(service.handleSendMessage(groupOutPeer.asOutPeer, randomId, TextMessage("Hi again", Vector.empty, None))) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseSeqDate(1001, _, _)) ⇒
          }
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user1AuthId1).head)) { update ⇒
          update.header should ===(UpdateMessageSent.header)

          val seqUpdate = UpdateMessageSent.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Group, groupOutPeer.groupId)
          seqUpdate.randomId shouldEqual randomId
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user1AuthId2).head)) { update ⇒
          update.header should ===(UpdateMessage.header)

          val seqUpdate = UpdateMessage.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Group, groupOutPeer.groupId)
          seqUpdate.randomId shouldEqual randomId
          seqUpdate.senderUserId shouldEqual user1.id
        }

        whenReady(db.run(persist.sequence.SeqUpdate.find(user2AuthId).head)) { update ⇒
          update.header should ===(UpdateMessage.header)

          val seqUpdate = UpdateMessage.parseFrom(CodedInputStream.newInstance(update.serializedData)).right.toOption.get
          seqUpdate.peer shouldEqual Peer(PeerType.Group, groupOutPeer.groupId)
          seqUpdate.randomId shouldEqual randomId
          seqUpdate.senderUserId shouldEqual user1.id
        }
      }

      def restrictAlienUser() = {
        val (alien, authIdAlien, _) = createUser()

        val alienClientData = ClientData(user1AuthId1, sessionId, Some(alien.id))

        whenReady(service.handleSendMessage(groupOutPeer.asOutPeer, 3L, TextMessage("Hi again", Vector.empty, None))(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

        whenReady(groupsService.handleEditGroupTitle(groupOutPeer, 4L, "Loosers")(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

        val (user3, authId3, _) = createUser()
        val user3OutPeer = UserOutPeer(user3.id, 11)

        whenReady(groupsService.handleInviteUser(groupOutPeer, 4L, user3OutPeer)(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

        val fileLocation = FileLocation(1L, 1L)
        whenReady(groupsService.handleEditGroupAvatar(groupOutPeer, 5L, fileLocation)(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

        whenReady(groupsService.handleRemoveGroupAvatar(groupOutPeer, 5L)(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

        whenReady(groupsService.handleLeaveGroup(groupOutPeer, 5L)(alienClientData)) { resp ⇒
          resp should matchNotAuthorized
        }

      }
    }

    object pubsub {
      import DistributedPubSubMediator._

      val (user, authId, _) = createUser()
      val sessionId = createSessionId()
      implicit val clientData = ClientData(authId, sessionId, Some(user.id))

      val (user2, _, _) = createUser()
      val user2Model = getUserModel(user2.id)
      val user2AccessHash = ACLUtils.userAccessHash(authId, user2.id, user2Model.accessSalt)
      val user2Peer = peers.OutPeer(PeerType.Private, user2.id, user2AccessHash)

      def publish() = {
        val probe = TestProbe()

        val topics = Seq(
          s"messaging.messages.private.${user.id}",
          s"messaging.messages.private.${user2.id}"
        )

        topics foreach { topic ⇒
          mediator.tell(Subscribe(topic, Some("testProbe"), probe.ref), probe.ref)
          probe.expectMsg(SubscribeAck(Subscribe(topic, Some("testProbe"), probe.ref)))
        }

        whenReady(service.handleSendMessage(user2Peer, 1L, TextMessage("Hi PubSub", Vector.empty, None))) { resp ⇒
          probe.expectMsgClass(classOf[Events.PeerMessage])
          probe.expectMsgClass(classOf[Events.PeerMessage])
        }
      }
    }
  }
}
