package im.actor.model.modules.messages.entity;

import java.io.IOException;

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.entity.Peer;

/**
 * Created by ex3ndr on 17.02.15.
 */
public class PlainCursor extends BserObject {

    public static PlainCursor fromBytes(byte[] data) throws IOException {
        return Bser.parse(new PlainCursor(), data);
    }

    private Peer peer;
    private long sortDate;
    private long pendingSortDate;

    public PlainCursor(Peer peer, long sortDate, long pendingSortDate) {
        this.peer = peer;
        this.sortDate = sortDate;
        this.pendingSortDate = pendingSortDate;
    }

    private PlainCursor() {

    }

    public Peer getPeer() {
        return peer;
    }

    public long getSortDate() {
        return sortDate;
    }

    public long getPendingSortDate() {
        return pendingSortDate;
    }

    public PlainCursor changeSortDate(long date) {
        return new PlainCursor(peer, date, pendingSortDate);
    }

    public PlainCursor changePendingSortDate(long pendingDate) {
        return new PlainCursor(peer, sortDate, pendingDate);
    }

    @Override
    public void parse(BserValues values) throws IOException {
        peer = Peer.fromUid(values.getLong(1));
        sortDate = values.getLong(2);
        pendingSortDate = values.getLong(3);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeLong(1, peer.getUid());
        writer.writeLong(2, sortDate);
        writer.writeLong(3, pendingSortDate);
    }
}
