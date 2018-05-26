package com.phamnhuvu.androidunittestexample;

import android.support.test.espresso.ViewInteraction;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.widget.EditText;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.*;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.*;
import static org.junit.Assert.*;

/**
 * Instrumented test, which will execute on an Android device.
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
@RunWith(AndroidJUnit4.class)
public class ExampleInstrumentedTest {

    private ViewInteraction etEmail = onView(withId(R.id.etEmail_Login));
    private ViewInteraction etPassword = onView(withId(R.id.etPassword_Login));
    private ViewInteraction btnLogin = onView(withId(R.id.btnLogin_Login));

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule = new ActivityTestRule<>(
            MainActivity.class);


    @Test
    public void loginEmptyEmailAndPassword() {

        checkLogin("", "",
                "Empty Email", "Empty Password");
        checkLogin("", "1345",
                "Empty Email", "Short Password");

        checkLogin("phamnhuvu.ou", "",
                "Invalid Email", "Empty Password");

        checkLogin("phamnhuvu.ou", "1345",
                "Invalid Email", "Short Password");

    }

    public void checkLogin(String typeEmail, String typePassword, String expectedEmail, String expectedPassword) {
        etEmail.perform(typeText(typeEmail));
        etPassword.perform(typeText(typePassword));
        sleep(200);

        btnLogin.perform(click());
        etEmail.check((view, noViewFoundException12) -> {
            String hint = ((EditText) view).getHint().toString();
            assertEquals("checkEmail", expectedEmail, hint);
        });
        etPassword.check((view, noViewFoundException1) -> {
            String hint = ((EditText) view).getHint().toString();
            assertEquals("checkPassword", expectedPassword, hint);
        });
        sleep(1000);
    }

    @Test
    public void checkLoginSuccess() {
        etEmail.perform(typeText("phamnhuvu.ou@gmail.com"));
        etPassword.perform(typeText("123456"));
        sleep(200);
        btnLogin.perform(click());
        sleep(500);

        onView(withId(R.id.main_fragment)).check(matches(isDisplayed()));
    }

    private void sleep(long times) {
        try {
            Thread.sleep(times);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
