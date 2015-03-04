package im.actor.messenger.app.activity;

import android.os.Bundle;

import im.actor.messenger.R;
import im.actor.messenger.app.base.BaseFragmentActivity;
import im.actor.messenger.app.fragment.auth.CountrySelectFragment;

/**
 * Created by ex3ndr on 12.01.15.
 */
public class PickCountryActivity extends BaseFragmentActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().setTitle(R.string.auth_phone_country_title);

        if (savedInstanceState == null) {
            showFragment(new CountrySelectFragment(), false, false);
        }
    }
}
