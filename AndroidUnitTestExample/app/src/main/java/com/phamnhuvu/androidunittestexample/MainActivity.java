package com.phamnhuvu.androidunittestexample;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.phamnhuvu.androidunittestexample.login.LoginFragment;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (savedInstanceState != null) return;

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.main_container, LoginFragment.newInstance())
                .commit();
    }
}
