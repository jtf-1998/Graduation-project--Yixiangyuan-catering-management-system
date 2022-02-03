package com.yixiyu.lq.yixiyuandroid_customer.service.adapter;

import android.content.Context;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/**
 * 通用的ViewHolder,通过控件的ID查找控件
 */
public class ViewHolder
{
    private View mConvertView;
    //1.效率较高
    //2.key值只能是integer
    SparseArray<View> mViews = null;

    public ViewHolder(Context context, int layoutID, ViewGroup parent) {

        mViews = new SparseArray<>();
        mConvertView = LayoutInflater.from(context).inflate(layoutID, parent,false);
        mConvertView.setTag(this);
    }

    /***
     * 获取一个ViewHolder的对象
     * @param context
     * @param layoutID
     * @param convertView
     * @param parent
     * @return
     */
    public static ViewHolder get(Context context,int layoutID,View convertView,ViewGroup parent){

        if (convertView == null){
            return new ViewHolder(context,layoutID,parent);
        }
        return (ViewHolder) convertView.getTag();
    }


    public <T extends View> T getView(int viewID){

        View view = mViews.get(viewID);
        if (view == null){
            view = mConvertView.findViewById(viewID);
            mViews.put(viewID,view);
        }
        return (T)view;
    }

    public View getConvertView(){
        return mConvertView;
    }


}
