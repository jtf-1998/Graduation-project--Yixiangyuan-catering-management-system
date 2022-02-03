package com.yixiyu.lq.yixiyuandroid_customer.service;

import android.util.Log;

public class MyLog {

    private static boolean debugLog = true;

    /*
     * 颜色为红色，报错
     */
    public  void e(String tag, String msg) {
        if (debugLog) {
            Log.e(tag, msg);
        }
    }

    /*
     * 颜色是蓝色的，仅输出debug调试的意思，但他会输出上层的信息，过滤起来可以通过DDMS的Logcat标签来选择
     */
    public  void d(String tag, String msg) {
        if (debugLog) {
            Log.d(tag, msg);
        }
    }

    /*
     * 调试颜色为黑色的，任何消息都会输出
     */
    public  void v(String tag, String msg) {
        if (debugLog) {
            Log.v(tag, msg);
        }
    }

    /*
     * 橙色，可以看作为warning警告，一般需要我们注意优化Android代码，同时选择它后还会输出Log.e的信息。
     */
    public  void w(String tag, String msg) {
        if (debugLog) {
            Log.w(tag, msg);
        }
    }

    /*
     * 绿色，一般提示性的消息information
     */
    public  void i(String tag, String msg) {
        if (debugLog) {
            Log.i(tag, msg);
        }
    }
}