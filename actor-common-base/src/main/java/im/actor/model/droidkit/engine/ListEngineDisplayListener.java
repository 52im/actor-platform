package im.actor.model.droidkit.engine;

import java.util.List;

/**
 * Created by ex3ndr on 14.03.15.
 */
public interface ListEngineDisplayListener<T> {

    public void onItemRemoved(long id);

    public void onItemsRemoved(long[] ids);

    public void addOrUpdate(T item);

    public void addOrUpdate(List<T> items);

    public void onItemsReplaced(List<T> items);

    public void onListClear();
}
