package com.yixiyu.lq.yixiyuandroid_customer.Main;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.InputType;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TimePicker;

import com.yixiyu.lq.yixiyuandroid_customer.R;

import java.util.Calendar;

import butterknife.ButterKnife;
//预订片段

public class Order_Fragment extends Fragment implements View.OnTouchListener
{
    private View mInflate;
    private View mView;
    private TextView order_room_tv;          //预订包间
    private TextView order_room_enter_bt;   //点击包间选择
    private EditText order_dtime_et;        //预订日期时间
    private EditText order_cust_num_et;     //顾客人数
    private TextView order_cust_griddle_et;  //预订锅底
    private TextView order_cust_griddle_enter_bt;  //点击锅底选择
    private Button bt_order;   //预订确定
    private Button bt_takeaway;   //外卖
    private Button bt_search_order;  //查询预订
    private Button bt_modify_order;   //修改预订
    private Button bt_delete_order;   //删除预订

    public Order_Fragment()
    {
    }


//    @Override
//    public View onCreateView(LayoutInflater inflater, ViewGroup container,
//                             Bundle savedInstanceState)
//    {
//        //        防止重新加载数据
//        if (mInflate == null){
//
//            mInflate = inflater.inflate(R.layout.fragment_scan_, container, false);
//            ButterKnife.inject(this, mInflate);
//            initData();
//            initView(savedInstanceState);
//        }
//        return mInflate;
//    }

    private void initView(Bundle savedInstanceState)
    {
        mView = getLayoutInflater().from(getActivity()).inflate(R.layout.order_headviewall, null);
        order_room_enter_bt.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                Intent intent=new Intent();
                intent.addCategory("android.intent.category.MY_CATEGORY");
                intent.putExtra("aaa", "this is a message");
                startActivityForResult(intent, 0x11);
            }
        });
       order_dtime_et.setOnTouchListener(this::onTouch);

    }

    private void initData()
    {
        mView = getLayoutInflater().from(getActivity()).inflate(R.layout.order_headviewall, null);
        order_room_tv=(TextView) mView.findViewById(R.id.order_room_tv);
        order_room_enter_bt=(TextView)mView.findViewById(R.id.order_room_enter_bt);
        order_dtime_et=(EditText)mView.findViewById(R.id.order_dtime_et);
        order_cust_num_et=(EditText)mView.findViewById(R.id.order_cust_num_et);
        order_cust_griddle_et=(TextView)mView.findViewById(R.id.order_cust_griddle_et);
        order_cust_griddle_enter_bt=(TextView)mView.findViewById(R.id.order_cust_griddle_enter_bt);
        bt_order=(Button)mView.findViewById(R.id.bt_order);
        bt_takeaway=(Button)mView.findViewById(R.id.bt_takeaway);
        bt_search_order=(Button)mView.findViewById(R.id.bt_search_order);
        bt_modify_order=(Button)mView.findViewById(R.id.bt_modify_order);
        bt_delete_order=(Button)mView.findViewById(R.id.bt_delete_order);
    }

    @Override
    public boolean onTouch(View v, MotionEvent event)
    {
        if (event.getAction() == MotionEvent.ACTION_DOWN) {

            AlertDialog.Builder builder = new AlertDialog.Builder(mView.getContext());
            View view = getLayoutInflater().from(getActivity()).inflate(R.layout.date_time_dialog, null);
            final DatePicker datePicker = (DatePicker) view.findViewById(R.id.date_picker);
            final TimePicker timePicker = (android.widget.TimePicker) view.findViewById(R.id.time_picker);
            builder.setView(view);

            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(System.currentTimeMillis());
            datePicker.init(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), null);

            timePicker.setIs24HourView(true);
            timePicker.setCurrentHour(cal.get(Calendar.HOUR_OF_DAY));
            timePicker.setCurrentMinute(Calendar.MINUTE);

            if (v.getId() == R.id.order_dtime_et) {
                final int inType = order_dtime_et.getInputType();
                order_dtime_et.setInputType(InputType.TYPE_NULL);
                order_dtime_et.onTouchEvent(event);
                order_dtime_et.setInputType(inType);
                order_dtime_et.setSelection(order_dtime_et.getText().length());

                builder.setTitle("选取起始时间");
                builder.setPositiveButton("确  定", new DialogInterface.OnClickListener() {

                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        StringBuffer sb = new StringBuffer();
                        sb.append(String.format("%d-%02d-%02d",
                                datePicker.getYear(),
                                datePicker.getMonth() + 1,
                                datePicker.getDayOfMonth()));
                        sb.append("  ");
                        sb.append(timePicker.getCurrentHour())
                                .append(":").append(timePicker.getCurrentMinute());

                        order_dtime_et.setText(sb);
                        dialog.cancel();
                    }
                });

            }

            Dialog dialog = builder.create();
            dialog.show();
        }

        return true;
    }
}
//}