package com.yixiyu.lq.yixiyuandroid_customer.Main;

import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.yixiyu.lq.yixiyuandroid_customer.R;
//广告条滚动
public class AdvertiseActivity extends FragmentActivity
{
    ViewPager view_advertise=null;
    //广告的图片资源
    private  int[] ImgRes=new int[]{
            R.drawable.bottom_bar1,R.drawable.bottom_bar2,R.drawable.bottom_bar3,R.drawable.bottom_bar4,
            R.drawable.bottom_bar5
    };
    AdvertiseFragment advertiseFragment=null;
    private Handler handler=new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_advertise);
        Init();
        autoScroll();
    }

    public void Init(){
        view_advertise=(ViewPager)findViewById(R.id.view_advertise);
        view_advertise.setAdapter(new MyPagerAdapter(getSupportFragmentManager()));
    }

    //广告条自动滚动
    public void autoScroll(){
        handler.postDelayed(new Runnable()
        {
            @Override
            public void run()
            {
                //获取当前页面下标
                int current= view_advertise.getCurrentItem();
                view_advertise.setCurrentItem(current+1);
                handler.postDelayed(this,2000);
            }
        },2000);
    }

    class MyPagerAdapter extends FragmentPagerAdapter{

        public MyPagerAdapter(FragmentManager fm)
        {
            super(fm);
        }

        //返回Fragement的视图
        @Override
        public Fragment getItem(int position)
        {
            //防止超时
            position %=ImgRes.length;
            advertiseFragment=new AdvertiseFragment();
            advertiseFragment.setImg(ImgRes[position]);
            return advertiseFragment;
        }

        //
        @Override
        public int getCount()
        {
            return Integer.MAX_VALUE;
        }
    }
}