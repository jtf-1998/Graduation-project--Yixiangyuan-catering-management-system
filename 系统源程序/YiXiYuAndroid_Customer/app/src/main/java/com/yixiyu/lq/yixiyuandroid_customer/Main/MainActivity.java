package com.yixiyu.lq.yixiyuandroid_customer.Main;

import android.content.Context;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTabHost;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.yixiyu.lq.yixiyuandroid_customer.R;

public class MainActivity extends FragmentActivity
{
    FragmentTabHost tabHost_main;
    TextView tab_tv;
    ImageView tab_iv;
    View inflat;
    Context context=MainActivity.this;
    private Class[] fragments=new Class[]{scan_Fragment.class,Sort_Fragment.class,Order_Fragment.class,
    Bill_Fragment.class,MinerFragment.class};  //扫一扫片段，分类片段，预订片段，订单
    // 片段，个人中心片段
    private int[] imgSelectors=new int[]{
      R.drawable.bottom_bar1,R.drawable.bottom_bar2,R.drawable.bottom_bar3,R.drawable.bottom_bar4,
            R.drawable.bottom_bar5
    };

    private String[] tab_text=new String[]{
            "主页","菜单","预订","订单","我的"
    };

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        init();
    }

    public void init(){
        tabHost_main=(FragmentTabHost)findViewById(R.id.tabHost_main);
        tabHost_main.setup(context,getSupportFragmentManager(),android.R.id.tabcontent);
        for(int i=0;i<fragments.length;i++){   //添加片段
            inflat=getLayoutInflater().inflate(R.layout.tab_item,null);
            tab_iv=(ImageView)inflat.findViewById(R.id.tab_iv);
            tab_iv.setImageResource(imgSelectors[i]);
            tab_tv=(TextView)inflat.findViewById(R.id.tab_tv);
            tab_tv.setText(tab_text[i]);
            tabHost_main.addTab(tabHost_main.newTabSpec(""+i).setIndicator("maintab").
                            setIndicator(inflat), fragments[i], null);
        }

    }
}