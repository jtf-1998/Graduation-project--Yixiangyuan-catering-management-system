package com.yixiyu.lq.yixiyuandroid_customer;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

import com.yixiyu.lq.yixiyuandroid_customer.Main.ToolBarActivity;

public class TestActivity extends ToolBarActivity
{
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_test);
    }

    @Override
    public void onCreateCustomToolbar(Toolbar toolbar) {
        super.onCreateCustomToolbar(toolbar);
        toolbar.showOverflowMenu();    //悬浮三点菜单

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }
//    private Toolbar toolbar;
//    @Override
//    protected void onCreate(Bundle savedInstanceState)
//    {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_test);
//        init();
//    }
//
//    public void init(){
//        toolbar=(Toolbar)findViewById(R.id.test_toolbar);
//        toolbar.setTitle("主标题");//设置主标题,要设置在setsupportActionbar之前
//        setSupportActionBar(toolbar);
//
//        toolbar.setNavigationIcon(R.mipmap.ic_launcher);//设置导航栏图标
//        toolbar.setLogo(R.mipmap.ic_launcher);//设置APP logo
//        toolbar.setSubtitle("子标题");//设置子标题
//
//        toolbar.inflateMenu(R.menu.toolbar_menu);  //添加三个点的小菜单
//    }
//
//    public void initView(){
//
//        toolbar.setOnMenuItemClickListener(new Toolbar.OnMenuItemClickListener() {
//            @Override
//            public boolean onMenuItemClick(MenuItem item) {
//                return true;
//            }
//        });
//    }
//
//    @Override
//    public boolean onCreateOptionsMenu(Menu menu) {
//        getMenuInflater().inflate(R.menu.toolbar_menu,menu);
//        return true;
//    }

}