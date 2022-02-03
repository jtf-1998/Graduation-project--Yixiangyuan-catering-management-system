package com.yixiyu.lq.yixiyuandroid_customer.service;

import android.content.Context;
import android.widget.Toast;

import com.google.gson.Gson;
import com.yixiyu.lq.yixiyuandroid_customer.bean.ContantsPool;

import java.lang.reflect.Type;

public class Basic implements ContantsPool
{
    Gson gson=new Gson();
    Toast toast=null;
    public static final String RegistAndLogin= baseUrl+"/RLServlet";
    public void showToast(Context context, String msg)
    {
        if(toast==null){
            toast = Toast.makeText(context, msg, Toast.LENGTH_SHORT);
        }
        toast.setText(msg);
        toast.show();
    }

    public boolean Isempty(String str)
    {
        if(null == str || "".equals(str))
            return true;
        else
            return false;
    }

    public String deleteUTF8Bom(String str) {
        byte[] UTF8_BOM_BYTES = new byte[]{(byte) 0xEF, (byte) 0xBB, (byte) 0xBF};
        byte[] bytes = str.getBytes();
        if (bytes[0] == UTF8_BOM_BYTES[0]
                && bytes[1] == UTF8_BOM_BYTES[1]
                && bytes[2] == UTF8_BOM_BYTES[2]) {
            return new String(bytes, 3, bytes.length - 3);
        }
        return str;
    }

    public <T> T fromToJson(String json, Type listType){
        T t=null;
        t=gson.fromJson(json,listType);
        return t;
    }

}
