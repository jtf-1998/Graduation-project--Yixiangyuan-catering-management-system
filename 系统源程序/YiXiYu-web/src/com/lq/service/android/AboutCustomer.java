package com.lq.service.android;

import com.lq.bean.Analyze;
import com.lq.bean.Customer;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;

public class AboutCustomer {
    Customer customer=null;
    Analyze analyze=null;
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();
    ArrayList<Analyze> analyzes=new ArrayList<Analyze>();
	public Customer SearchByCustomer(String customer_phone)
	{
		String sql="SELECT * FROM customer where customer_phone=?;";
		customer=queryFromMysql.QueryAllCustomerByPhone(sql,customer_phone);
		return customer;

	}

    public String Update(Customer customer)
    {
        String result="";
        String sql="UPDATE customer SET customer_nickname=? ,customer_sex=?,customer_name=?,birth=? WHERE customer_phone=?";
        result=updateFromMysql.UpdateByCustomer(sql,customer);
        System.out.println(result);

        return result;
    }

	public ArrayList<Analyze> ShowCustomerFromBeganToFinish(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select bill_customer as name,count(1) as num from bill_all GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select bill_customer as name,count(1) as num from bill_all WHERE bill_data>=? and bill_data<=? GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}

	public ArrayList<Analyze> ShowCustomerFromBeganToFinish2(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select bill_customer as name,sum(vegetable_number*bill_all.vegetable_price) as num from bill_all GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select bill_customer as name,sum(vegetable_number*bill_all.vegetable_price) as num from bill_all WHERE bill_data>=? and bill_data<=? GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}
}
