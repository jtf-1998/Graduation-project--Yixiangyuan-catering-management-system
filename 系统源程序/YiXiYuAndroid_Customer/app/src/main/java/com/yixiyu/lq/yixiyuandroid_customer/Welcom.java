package com.yixiyu.lq.yixiyuandroid_customer;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.yixiyu.lq.yixiyuandroid_customer.Main.MainActivity;

public class Welcom extends AppCompatActivity
{
    Handler handler=new Handler();
    Intent intent=null;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcom);
        //设置停留一段时间进入主界面
        handler.postDelayed(new Runnable()
        {
            @Override
            public void run()
            {
                SharedPreferences sharedPreferences=getPreferences(MODE_PRIVATE);
                boolean isFirst=sharedPreferences.getBoolean("isFirst",true);
//                if(isFirst){              //如果用户第一次安装程序则进入引导界面
//                    sharedPreferences.edit().putBoolean("isFirst",false).commit();
//                    intent.setClass(Welcom.this,GuideActivity.class);
//                }
                intent=new Intent();
                intent.setClass(Welcom.this, MainActivity.class);
                startActivity(intent);
                //设置界面之间的切换动画
                overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
                finish();
            }
        },2000);
    };
}