package com.lq.test;
//
//import java.net.URLEncoder;
//import com.alibaba.fastjson.JSONObject;
//import com.zout.common.Config;
//import com.zout.common.HttpUtil;
//

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestDate{
	static TestDate testDate=new TestDate();
	public static void main(String[] args){
		String began="2021-02-08 12:00";
		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
		sdf.applyPattern("yyyy-MM-dd' 'HH:mm");// a为am/pm的标记
		Date P_room_began = testDate.StringToDate(began);
		P_room_began.setTime(P_room_began.getTime() + 120*60*1000);
		System.out.println("现在时间：" + testDate.DateToString(P_room_began)); // 输出已经格式化的现在时间（24小时制）
	}

	public Date StringToDate(String source) {
		//1.定义我们要转成的日期类型（格式是：yyyy-MM-dd HH:mm）,
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			//2.进行转化，转化成功直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//3.如果转化失败返回null
		return null;
	}

	//将Date型日期转化成指定格式的字符串形式。例如：yyyy-MM-dd HH:mm
	public String DateToString(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return format.format(date);

	}
}

