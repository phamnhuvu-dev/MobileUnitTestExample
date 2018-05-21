package com.phamnhuvu.androidunittestexample.login;


import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import com.phamnhuvu.androidunittestexample.R;
import com.phamnhuvu.androidunittestexample.main.MainFragment;

import io.reactivex.disposables.Disposable;

/**
 * A simple {@link Fragment} subclass.
 */
public class LoginFragment extends Fragment implements View.OnClickListener {

    private LoginViewModel mViewModel;
    private EditText etEmail, etPassword;
    private Button btnLogin, btnRegister;

    private Disposable disposableLogin;

    public LoginFragment() {
        // Required empty public constructor

    }

    public static LoginFragment newInstance() {
        return new LoginFragment();
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_login, container, false);
        mViewModel = ViewModelProviders.of(this).get(LoginViewModel.class);

        etEmail = view.findViewById(R.id.etEmail_Login);
        etPassword = view.findViewById(R.id.etPassword_Login);

        btnLogin = view.findViewById(R.id.btnLogin_Login);
        btnRegister = view.findViewById(R.id.btnRegister_Login);

        btnLogin.setOnClickListener(this);
        btnRegister.setOnClickListener(this);

        return view;
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnLogin_Login:
                String email = etEmail.getText().toString();
                String password = etPassword.getText().toString();
                Log.d("OK", "OK");
                disposableLogin = mViewModel.login(email, password)
                        .subscribe(
                                message -> {
                                    switch (message) {
                                        case EMPTY_EMAIL:
                                            etEmail.setText("");
                                            etEmail.setHint("Empty Email");
                                            break;

                                        case INVALID_EMAIL:
                                            etEmail.setText("");
                                            etEmail.setHint("Invalid Email");
                                            break;

                                        case EMPTY_PASSWORD:
                                            etPassword.setText("");
                                            etPassword.setHint("Empty Password");
                                            break;

                                        case SHORT_PASSWORD:
                                            etPassword.setText("");
                                            etPassword.setHint("Short Password");
                                            break;
                                    }
                                },
                                throwable -> {},
                                () -> {
                                    if (getFragmentManager() == null) return;
                                    getFragmentManager().beginTransaction()
                                            .replace(R.id.main_container, new MainFragment())
                                            .addToBackStack(null)
                                            .commit();
                                });
                break;

            case R.id.btnRegister_Login:
                break;
        }
    }
}
