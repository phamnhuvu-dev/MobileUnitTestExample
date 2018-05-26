package com.phamnhuvu.androidunittestexample.login;

import android.arch.lifecycle.ViewModel;
import android.util.Patterns;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.reactivex.Observable;

public class LoginViewModel extends ViewModel {

    enum Message {
        EMPTY_EMAIL,
        INVALID_EMAIL,
        EMPTY_PASSWORD,
        SHORT_PASSWORD
    }

    private Observable<Message> obLogin;
    private String email;
    private String password;

    public Observable<Message> login(String email, String password) {
        this.email = email;
        this.password = password;

        obLogin = obLogin != null? obLogin : Observable.create(emitter -> {
            boolean complete = true;

            Message messageEmail = checkEmail(this.email);
            if (messageEmail != null) {
                complete = false;
                emitter.onNext(messageEmail);
            }

            Message messagePassword = checkPassword(this.password);
            if (messagePassword != null) {
                complete = false;
                emitter.onNext(messagePassword);
            }

            if (complete) emitter.onComplete();
        });
        return obLogin;
    }

    private boolean isInvalidEmail(String email) {
        Pattern pattern = Patterns.EMAIL_ADDRESS;
        Matcher matcher = pattern.matcher(email);
        return !matcher.matches();
    }

    private Message checkEmail(String email) {
        Message result = null;
        if (email.isEmpty()) {
            result = Message.EMPTY_EMAIL;
        } else if (isInvalidEmail(email)) {
            result = Message.INVALID_EMAIL;
        }
        return result;
    }

    private Message checkPassword(String password) {
        Message result = null;
        if (password.isEmpty()) {
            result = Message.EMPTY_PASSWORD;
        } else if (password.length() < 6) {
            result = Message.SHORT_PASSWORD;
        }
        return result;
    }
}
