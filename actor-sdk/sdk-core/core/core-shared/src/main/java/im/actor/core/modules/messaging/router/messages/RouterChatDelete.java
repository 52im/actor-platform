package im.actor.core.modules.messaging.router.messages;

import im.actor.core.entity.Peer;

public class RouterChatDelete {

    private Peer peer;

    public RouterChatDelete(Peer peer) {
        this.peer = peer;
    }

    public Peer getPeer() {
        return peer;
    }
}