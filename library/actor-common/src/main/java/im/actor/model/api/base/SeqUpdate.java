package im.actor.model.api.base;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import im.actor.model.droidkit.bser.util.SparseArray;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;
import com.google.j2objc.annotations.ObjectiveCName;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class SeqUpdate extends RpcScope {

    public static final int HEADER = 0xd;
    public static SeqUpdate fromBytes(byte[] data) throws IOException {
        return Bser.parse(new SeqUpdate(), data);
    }

    private int seq;
    private byte[] state;
    private int updateHeader;
    private byte[] update;

    public SeqUpdate(int seq, @NotNull byte[] state, int updateHeader, @NotNull byte[] update) {
        this.seq = seq;
        this.state = state;
        this.updateHeader = updateHeader;
        this.update = update;
    }

    public SeqUpdate() {

    }

    public int getSeq() {
        return this.seq;
    }

    @NotNull
    public byte[] getState() {
        return this.state;
    }

    public int getUpdateHeader() {
        return this.updateHeader;
    }

    @NotNull
    public byte[] getUpdate() {
        return this.update;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.seq = values.getInt(1);
        this.state = values.getBytes(2);
        this.updateHeader = values.getInt(3);
        this.update = values.getBytes(4);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeInt(1, this.seq);
        if (this.state == null) {
            throw new IOException();
        }
        writer.writeBytes(2, this.state);
        writer.writeInt(3, this.updateHeader);
        if (this.update == null) {
            throw new IOException();
        }
        writer.writeBytes(4, this.update);
    }

    @Override
    public String toString() {
        String res = "update box SeqUpdate{";
        res += "seq=" + this.seq;
        res += ", state=" + byteArrayToStringCompact(this.state);
        res += ", updateHeader=" + this.updateHeader;
        res += ", update=" + byteArrayToStringCompact(this.update);
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
