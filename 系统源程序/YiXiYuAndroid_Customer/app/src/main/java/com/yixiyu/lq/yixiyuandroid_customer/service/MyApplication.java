package com.yixiyu.lq.yixiyuandroid_customer.service;

import android.app.Application;

import com.yolanda.nohttp.NoHttp;

/**
 * Created by hongkl on 16/7/31.
 */
public class MyApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        //NoHttp初始化
        NoHttp.initialize(this);
    }
}
