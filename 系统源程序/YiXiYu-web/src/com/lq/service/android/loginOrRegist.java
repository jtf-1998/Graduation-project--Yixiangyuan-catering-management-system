package com.lq.service.android;

import com.lq.bean.Customer;
import com.lq.dao.*;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.service.android
 * @date 2021-03-19 10:48
 * @Copyright © 2020-2021
 */
public class loginOrRegist {
	Customer customer=null;
	QueryFromMysql queryForMySql=new QueryFromMysql();
	AddFromMysql addForMySql=new AddFromMysql();
	UpdateFromMysql updateForMySql=new UpdateFromMysql();
	DeleteFromMysql deleteForMySql=new DeleteFromMysql();

	public boolean Login(Customer customer)
	{
		String customer_phone=customer.getCustomerPhone();
		String customer_password=customer.getCustomerPassword();
		String sql="select * from customer where customer_phone=? and customer_password=?";
		int num=0;
		num=queryForMySql.QueryCustomerByNameAndPass(sql,customer_phone,customer_password);
		if(num==1)
			return true;
		else
			return false;
	}

	public String Regist(Customer customer)
	{
		customer.toString();
		String result="";
		if(Login(customer)){        //如果有该记录则返回已存在信息
			result="exists";
		}
		else{
			String sql="insert into customer(customer_nickname, customer_sex, " +
					"customer_password, customer_phone)" +
					" VALUES(?,?,?,?)";
			result=addForMySql.AddByCustomer(sql,customer);
		}
		return result;
	}

	public String Update(Customer customer)
	{
		customer.toString();
		String result="";
		String sql="UPDATE customer SET customer_nickname=?,customer_sex=?," +
				"customer_password=?,customer_phone=? WHERE " +
				"customer_phone=? and customer_password=?";
		result=updateForMySql.UpdateCustomer(sql,customer);
		return result;
	}

	public String UpdatePassword(Customer customer)
	{
		customer.toString();
		String result="";
		String sql="UPDATE customer SET customer_password=? WHERE " +
				"customer_phone=?";
		result=updateForMySql.UpdateCustomerPassword(sql,customer);
		return result;
	}
}
