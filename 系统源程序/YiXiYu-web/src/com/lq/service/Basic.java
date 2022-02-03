package com.lq.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.service
 * @date 2021-05-27 9:41
 * @Copyright © 2020-2021
 */
public class Basic {
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
