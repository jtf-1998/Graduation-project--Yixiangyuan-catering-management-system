package com.yixiyu.lq.yixiyuandroid_customer.service.listner;
import android.support.v4.view.ViewPager;

import com.yixiyu.lq.yixiyuandroid_customer.service.widget.ViewPagerIndicator;

public class MyPagerListner implements ViewPager.OnPageChangeListener {
    private ViewPagerIndicator mIndicator;

    public MyPagerListner(ViewPagerIndicator indicator) {
        mIndicator = indicator;
    }

    @Override
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        mIndicator.setOffX(position, positionOffset);
    }

    @Override
    public void onPageSelected(int position) {

    }

    @Override
    public void onPageScrollStateChanged(int state) {

    }
}