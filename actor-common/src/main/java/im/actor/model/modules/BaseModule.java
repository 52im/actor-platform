package im.actor.model.modules;

import im.actor.model.entity.Group;
import im.actor.model.entity.User;
import im.actor.model.network.RpcCallback;
import im.actor.model.network.RpcException;
import im.actor.model.network.parser.Request;
import im.actor.model.network.parser.Response;
import im.actor.model.storage.KeyValueEngine;
import im.actor.model.storage.PreferencesStorage;

/**
 * Created by ex3ndr on 16.02.15.
 */
public class BaseModule {
    private Modules modules;

    public BaseModule(Modules modules) {
        this.modules = modules;
    }

    public Modules modules() {
        return modules;
    }

    public Updates updates() {
        return modules.getUpdatesModule();
    }

    public void runOnUiThread(Runnable runnable) {
        modules.getConfiguration().getMainThread().runOnUiThread(runnable);
    }

    public PreferencesStorage preferences() {
        return modules.getPreferences();
    }

    public int myUid() {
        return modules.getAuthModule().myUid();
    }

    public <T extends Response> void request(Request<T> request, RpcCallback<T> callback) {
        modules.getActorApi().request(request, callback);
    }

    public <T extends Response> void request(Request<T> request) {
        modules.getActorApi().request(request, new RpcCallback<T>() {
            @Override
            public void onResult(T response) {

            }

            @Override
            public void onError(RpcException e) {

            }
        });
    }

    public KeyValueEngine<User> users() {
        return modules.getUsersModule().getUsers();
    }

    public KeyValueEngine<Group> groups() {
        return modules.getGroupsModule().getGroups();
    }
}

