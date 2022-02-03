package com.yixiyu.lq.yixiyuandroid_customer.service;

import android.content.Context;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.yixiyu.lq.yixiyuandroid_customer.R;

public class ToolbarHelper
{
    /**上下文,创建View的时候用到**/
    private Context mContext;

    private FrameLayout mContentView;  //根布局

    /**打气筒：视图构造器**/
    LayoutInflater mInflater;
    /**自定义View*/
    private View mUserView;

    private Toolbar toolbar;

    public ToolbarHelper(int layoutID, Context context) {

        this.mContext = context;
        mInflater = LayoutInflater.from(context);
        /**初始化整个内容**/
        initContentView();

        /**初始化用户自定义的布局**/
        initUserView(layoutID);

        /**初始化toolbar**/
        initToolbar();

    }

    private void initUserView(int layoutID) {
        mUserView = mInflater.inflate(layoutID, null);
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        mUserView.setLayoutParams(params);


    }

    private void initToolbar() {
        View inflate = mInflater.inflate(R.layout.activity_tool_bar, mContentView);
        toolbar = (Toolbar) inflate.findViewById(R.id.toolbar);

    }

    private void initContentView() {
        /**创建一个布局,作为视图容器的父容器**/
        mContentView = new FrameLayout(mContext);
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        mContentView.setLayoutParams(params);

    }

    public Toolbar getToolbar() {

        return toolbar;

    }

    public FrameLayout getmContentView(){
        return mContentView;
    }
}
