package im.actor.server.user

import akka.actor.{ Actor, ActorRef, Props }
import im.actor.api.rpc.PeersImplicits
import im.actor.api.rpc.misc.ApiExtension
import im.actor.server.dialog.{ Dialog, DialogCommand }
import im.actor.server.model.{ Peer, PeerType }

private[user] object UserPeer {
  def props(userId: Int, extensions: Seq[ApiExtension]) = Props(classOf[UserPeer], userId, extensions)
}

private[user] final class UserPeer(userId: Int, extensions: Seq[ApiExtension]) extends Actor with PeersImplicits {

  def receive: Receive = {
    case dc: DialogCommand ⇒ dialogRef(dc.dest) forward dc
    case other             ⇒ context.system.log.debug("Unmatched message: {}", other)
  }

  private def dialogRef(peer: Peer): ActorRef =
    context.child(dialogName(peer)) getOrElse context.actorOf(Dialog.props(peer, userId, extensions), dialogName(peer))

  private def dialogName(peer: Peer): String = peer.typ match {
    case PeerType.Private ⇒ s"Private_${peer.id}"
    case PeerType.Group   ⇒ s"Group_${peer.id}"
    case other            ⇒ throw new Exception(s"Unknown peer type: $other")
  }

}
