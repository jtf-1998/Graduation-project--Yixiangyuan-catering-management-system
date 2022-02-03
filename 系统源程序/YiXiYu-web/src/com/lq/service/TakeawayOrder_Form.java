package com.lq.service;

import com.lq.bean.TakeawayOrderForm;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class TakeawayOrder_Form {
	TakeawayOrder_Form takeawayOrder_form=null;
	PRoom pRoom=new PRoom();
	List<TakeawayOrderForm>takeawayOrderForms=new ArrayList<TakeawayOrderForm>();
	QueryFromMysql queryFromMysql=new QueryFromMysql();
	DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
	UpdateFromMysql updateFromMysql=new UpdateFromMysql();
	AddFromMysql addFromMysql=new AddFromMysql();

	public List<TakeawayOrderForm> ShowTakeawayOrder_Form(String takeaway_date,String takeaway_type)
	{
		if(takeaway_date.equals("null")&&takeaway_type.equals("null")){
			String sql="SELECT * FROM takeaway_order_form;";
			takeawayOrderForms=queryFromMysql.SearchAllTakeawayOrderForm(sql,takeaway_date,takeaway_type);
		}
		else {
			String sql="SELECT * FROM takeaway_order_form where  takeaway_date=? and takeaway_type=?;";
			takeawayOrderForms=queryFromMysql.SearchAllTakeawayOrderForm(sql,takeaway_date,takeaway_type);

		}
		if(takeawayOrderForms==null||takeawayOrderForms.isEmpty()){
			return null;
		}
		else {
			return takeawayOrderForms;
		}
	}

	public boolean QueryTakeawayOrder_FormById(String takeaway_id)
	{
		String sql="select * from takeaway_order_form where takeaway_id=?";
		int num=0;
		num=queryFromMysql.QueryAllTakeawayOrderFormById(sql,takeaway_id);
		if(num==1)
			return true;
		else
			return false;
	}

	public String DeleteTakeawayOrderFormById(String takeaway_id)
	{
		String result="";
		String sql="delete from takeaway_order_form where takeaway_id=?";
		if(QueryTakeawayOrder_FormById(takeaway_id))
		{
			result= deleteFromMysql.DeleteTakeawayOrderFormById(sql,takeaway_id);
		}
		else {
			result="nohave";
		}
		return result;
	}

	public String UpdateOrAddByTakeawayOrder(TakeawayOrderForm takeawayOrderForm)
	{
		String result="";
		String takeaway_id=takeawayOrderForm.getTakeawayId();
		String state="";
		if(QueryTakeawayOrder_FormById(takeaway_id)){        //如果有该记录则调用修改方法
			String sql="UPDATE takeaway_order_form SET takeaway_type=?," +
					"takeaway_date=?,takeaway_time=?,takeaway_money=?," +
					"customer_nickname=?,customer_phone=?" +
					" WHERE takeaway_id=?";
			result=updateFromMysql.UpdateByTakeawayOrder(sql,takeawayOrderForm);
		}
		else{
			String sql="insert into takeaway_order_form(takeaway_id,takeaway_type,takeaway_date," +
					"takeaway_time,takeaway_money,customer_nickname,customer_phone) VALUES(?,?,?,?,?,?,?)";
			result=addFromMysql.AddByTakeawayOrder(sql,takeawayOrderForm);
		}
		return result;
	}

}

