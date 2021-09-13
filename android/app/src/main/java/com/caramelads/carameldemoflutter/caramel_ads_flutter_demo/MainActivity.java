package com.caramelads.carameldemoflutter.caramel_ads_flutter_demo;

import android.graphics.drawable.GradientDrawable;
import android.text.Html;
import android.view.Gravity;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.caramelads.sdk.CaramelAdListener;
import com.caramelads.sdk.CaramelAds;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "caramel.flutter/native";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {

                    switch (call.method){
                        case "initialize":
                            caramelInitialize();
                            break;

                        case "isloaded":
                            result.success(caramelIsLoaded());
                            break;

                        case "cache":
                            caramelCache();
                            break;
                    }
                });
    }

    public void caramelInitialize(){
        CaramelAds.initialize(MainActivity.this);

        CaramelAds.setAdListener(new CaramelAdListener() {
            @Override
            public void sdkReady() {
                showToast("SDK READY","sdk is ready, wait while ad is load to cache and Caramel button is enable");
                //cache ads after CaramelSDK is ready
                CaramelAds.cache(MainActivity.this);
            }

            @Override
            public void sdkFailed() {
                showToast("SDK FAILED","sdk is failed");
            }

            @Override
            public void adLoaded() {
                showToast("AD LOADED","ad is loaded and you can push the Caramel button");
            }

            @Override
            public void adOpened() {
                showToast("AD OPENED","ad is opened");
            }

            @Override
            public void adClicked() {
                showToast("AD CLICKED","clicked on ad");
            }

            @Override
            public void adClosed() {
                showToast("AD CLOSED","ad is closed");
            }

            @Override
            public void adFailed() {
                showToast("AD FAILED","ad is failed");
            }
        });
    }

    public boolean caramelIsLoaded(){
        if(CaramelAds.isLoaded()==true) {
            CaramelAds.show();
            return true;
        }
        else
            showToast("WAIT","wait while ad is load to cache and Caramel button is enable");
        return false;
    }

    public void caramelCache(){
        CaramelAds.cache(MainActivity.this);
    }


    private void showToast(String title,String text){
        Toast toast=new Toast(getApplicationContext());
        toast.setGravity(Gravity.FILL_HORIZONTAL,0,0);
        toast.setDuration(Toast.LENGTH_LONG);

        GradientDrawable grad = new GradientDrawable();
        grad.setColor(0xffffffff);
        grad.setCornerRadius(6);
        grad.setStroke(2, 0xff000000);

        TextView tv=new TextView(this);
        tv.setText(Html.fromHtml("<b><font color=#f89406>"+title+":<br></font></b><br>"+text));
        tv.setTextSize(20);
        tv.setGravity(Gravity.CENTER);
        tv.setBackground(grad);

        toast.setView(tv);
        toast.show();
    }
}
