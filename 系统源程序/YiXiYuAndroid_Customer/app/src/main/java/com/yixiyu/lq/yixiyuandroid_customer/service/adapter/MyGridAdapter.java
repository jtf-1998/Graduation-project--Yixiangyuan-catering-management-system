package com.yixiyu.lq.yixiyuandroid_customer.service.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.yixiyu.lq.yixiyuandroid_customer.R;
import com.yixiyu.lq.yixiyuandroid_customer.bean.HomeIconInfo;

import java.util.ArrayList;
import java.util.List;

public class MyGridAdapter extends BaseAdapter
{

    private List<HomeIconInfo> itemData = new ArrayList<>();
    private Context mContext;

    public MyGridAdapter(List<HomeIconInfo> itemData, Context context) {
        this.itemData = itemData;
        mContext = context;
    }

    @Override
    public int getCount() {
        return itemData.size();
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {

        View inflate = LayoutInflater.from(mContext).inflate(R.layout.sort_gv_item, null);

        ImageView imageView = (ImageView) inflate.findViewById(R.id.sort_iv);
        imageView.setImageResource(itemData.get(i).getIconID());
        TextView tv = (TextView) inflate.findViewById(R.id.sort_tv);
        tv.setText(itemData.get(i).getIconName());
        return inflate;
    }
}