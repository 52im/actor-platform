/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.model.network;

import com.google.j2objc.annotations.ObjectiveCName;

public interface CreateConnectionCallback {
    @ObjectiveCName("onConnectionCreatedWithConnection:")
    void onConnectionCreated(Connection connection);

    @ObjectiveCName("onConnectionCreateError")
    void onConnectionCreateError();
}
