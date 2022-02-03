package com.lq.service;

import com.lq.bean.OrderForm;
import com.lq.bean.RestPRoom;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order_Form {
	OrderForm orderForm=null;
	PRoom pRoom=new PRoom();
	Basic basic=new Basic();
	List<OrderForm> orderForms=new ArrayList<OrderForm>();
	QueryFromMysql queryFromMysql=new QueryFromMysql();
	DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
	UpdateFromMysql updateFromMysql=new UpdateFromMysql();
	AddFromMysql addFromMysql=new AddFromMysql();

	public List<OrderForm> ShowOrderForm(String order_date)
	{
		if(order_date.equals("null")){
			String sql="SELECT * FROM order_form;";
			orderForms=queryFromMysql.SearchAllOrderForm(sql,"null");
		}
		else {
			String sql="SELECT * FROM order_form WHERE order_date=?;";
			orderForms=queryFromMysql.SearchAllOrderForm(sql,order_date);
		}
		if(orderForms==null||orderForms.isEmpty()){
			return null;
		}
		else {
			return orderForms;
		}
	}

	public OrderForm ShowOrderFormById(String order_id)
	{
		String sql="SELECT * FROM order_form WHERE order_id=?;";
		orderForm=queryFromMysql.SearchAllOrderFormById(sql,order_id);
		if(orderForm==null){
			return null;
		}
		else {
			return orderForm;
		}
	}

	public List<OrderForm> ShowOrderFormByPhone(String customer_phone)
	{

		String sql="SELECT * FROM order_form WHERE customer_phone=?;";
		orderForms=queryFromMysql.SearchAllOrderForm(sql,customer_phone);
		if(orderForms==null||orderForms.isEmpty()){
			return null;
		}
		else {
			return orderForms;
		}
	}

	public boolean QueryOrderFormById(String order_id)
	{
		String sql="select * from order_form where order_id=?";
		int num=0;
		num=queryFromMysql.QueryAllOrderFormById(sql,order_id);
		if(num==1)
			return true;
		else
			return false;
	}

	public String SearchStateFromPRoom(String P_room_id,String order_datetime)
	{
		String result="";
		String P_room_state="";
		String sql="SELECT P_room_state FROM rest_p_room WHERE P_room_name=? and ?>=rest_p_room.P_room_began and ?<= rest_p_room.P_room_finish;";
		P_room_state= queryFromMysql.SearchStateFromPRoom(sql,P_room_id,order_datetime);
		System.out.println("P_room_state："+P_room_state);
		if(P_room_state==null||P_room_state.isEmpty()||P_room_state.equals("空闲")){
			result="yes";
		}
		else {
			result="no";
		}
		return result;
	}

	public String DeleteOrderFormById(String order_id)
	{
		String result="";
		String sql="delete from order_form where order_id=?";
		if(QueryOrderFormById(order_id))
		{
			orderForm=ShowOrderFormById(order_id);
			System.out.println(orderForms);
			String P_room_name=null;
			String P_room_began="";
			String P_room_finish="";
			String P_room_state="空闲";
			P_room_name=orderForm.getPRoomId();
			result= deleteFromMysql.DeleteOrderFormById(sql,order_id);
			RestPRoom restPRoom=new RestPRoom(P_room_name,P_room_state,"",P_room_began,P_room_finish);
			result+=pRoom.UpdatePRoomByOrder(restPRoom);
		}
		else {
			result="nohave";
		}
		return result;
	}

	public String UpdateOrAddByOrder(OrderForm orderForm,String old_p_room)
	{
		String result="";
		String order_id=orderForm.getOrderId();
		String state="";
		if(QueryOrderFormById(order_id)){        //如果有该记录则调用修改方法
			String sql="UPDATE order_form SET P_room_id=?," +
					"order_date=?,order_time=?,customer_number=?," +
					"order_griddle=?,customer_phone=?,customer_name=?" +
					" WHERE order_id=?";
			result=updateFromMysql.UpdateByOrder(sql,orderForm);

		}
		else{
			String sql="insert into order_form(order_id,P_room_id,order_date," +
					" order_time, customer_number,order_griddle,customer_phone,customer_name) VALUES(?,?,?,?,?,?,?,?)";
			result=addFromMysql.AddByOrder(sql,orderForm);
		}
		String P_room_name=orderForm.getPRoomId();
		String P_room_state="已预订";
		String P_room_began=orderForm.getOrderDate()+" "+orderForm.getOrderTime();

		String P_room_finish="";
		Date date = basic.StringToDate(P_room_began);
		date.setTime(date.getTime() + 120*60*1000);
		P_room_finish=basic.DateToString(date);
		RestPRoom restPRoom=new RestPRoom(P_room_name,P_room_state,"",P_room_began,P_room_finish);
		result+=pRoom.UpdatePRoomByOrder(restPRoom);
		System.out.println(old_p_room);
		if(!old_p_room.equals("old")){
			P_room_state="空闲";
			P_room_began="";
			P_room_finish="";
			RestPRoom restPRoom2=new RestPRoom(old_p_room,P_room_state,"",P_room_began,P_room_finish);
			result+=pRoom.UpdatePRoomByOrder(restPRoom2);
		}

		return result;
	}

}

