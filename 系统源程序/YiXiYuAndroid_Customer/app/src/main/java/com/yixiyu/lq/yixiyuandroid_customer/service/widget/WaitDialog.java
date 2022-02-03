package com.yixiyu.lq.yixiyuandroid_customer.service.widget;

import android.app.ProgressDialog;
import android.content.Context;
import android.view.Window;

/**
 * Created by hongkl on 16/8/1.
 */
public class WaitDialog extends ProgressDialog {
    public WaitDialog(Context context) {
        super(context);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setCanceledOnTouchOutside(false);
        setProgressStyle(STYLE_SPINNER);
        setMessage("正在请求，请稍候…");
    }

    public WaitDialog(Context context, int theme) {
        super(context, theme);
    }



}
