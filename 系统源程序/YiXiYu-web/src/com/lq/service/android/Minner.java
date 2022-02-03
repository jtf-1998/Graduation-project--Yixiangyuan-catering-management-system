package com.lq.service.android;

import com.lq.bean.Customer;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

/**
 * @author 李秦
 * @version V1.0
 * @Package com.lq.service.android
 * @date 2021-03-19 10:48
 * @Copyright © 2020-2021
 */
public class Minner {
	Customer customer=null;
	QueryFromMysql queryForMySql=new QueryFromMysql();
	AddFromMysql addForMySql=new AddFromMysql();
	UpdateFromMysql updateForMySql=new UpdateFromMysql();
	DeleteFromMysql deleteForMySql=new DeleteFromMysql();

	public Customer Show(String customer_phone)
	{
		String sql="select * from customer where customer_phone=?";
		customer=queryForMySql.SearchCustomerByphone(sql,customer_phone);
		return customer;
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
