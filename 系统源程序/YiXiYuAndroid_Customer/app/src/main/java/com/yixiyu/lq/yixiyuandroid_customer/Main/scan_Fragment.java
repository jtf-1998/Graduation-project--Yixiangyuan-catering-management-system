package com.yixiyu.lq.yixiyuandroid_customer.Main;

import android.content.ContentResolver;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

//import com.uuzuche.lib_zxing.activity.CaptureActivity;
//import com.uuzuche.lib_zxing.activity.CodeUtils;
import com.yixiyu.lq.yixiyuandroid_customer.R;
import com.yixiyu.lq.yixiyuandroid_customer.service.Basic;
import com.yixiyu.lq.yixiyuandroid_customer.service.MyLog;

import butterknife.ButterKnife;
//扫一扫片段

public class scan_Fragment extends Fragment
{

    private View mInflate;
    private View mView;
    private Button btn_scan;
    Basic basic=new Basic();
    MyLog myLog=new MyLog();
    private String TAG = "scan_Fragment";

    public scan_Fragment()
    {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState)
    {

//        防止重新加载数据
        if (mInflate == null){

            mInflate = inflater.inflate(R.layout.fragment_scan_, container, false);
            ButterKnife.inject(this, mInflate);
            initData();
        }
        return mInflate;
    }

    public void initData()
    {
        mView=getLayoutInflater().from(getActivity()).inflate(R.layout.scan_headviewall, null);
        btn_scan=(Button)mView.findViewById(R.id.btn_scan);
    }

//    public void Scan(View view) {
//        Intent intent = new Intent(getActivity(), CaptureActivity.class);
//        startActivityForResult(intent, 0);
//    }
//
//    @Override
//    public void onActivityResult(int requestCode, int resultCode, Intent data) {
//        /**
//         * 处理二维码扫描结果
//         */
//        if (requestCode == 0) {
//            //处理扫描结果（在界面上显示）
//            if (null != data) {
//                Bundle bundle = data.getExtras();
//                if (bundle == null) {
//                    return;
//                }
//                if (bundle.getInt(CodeUtils.RESULT_TYPE) == CodeUtils.RESULT_SUCCESS) {
//                    String result = bundle.getString(CodeUtils.RESULT_STRING);
//                    basic.showToast(getContext(),"解析结果:" + result);
//                    myLog.e(TAG,"解析结果: " + result);
//                } else if (bundle.getInt(CodeUtils.RESULT_TYPE) == CodeUtils.RESULT_FAILED) {
//                    basic.showToast(getContext(),"二维码解析失败");
//                }
//            }
//        }
//
//    }

}