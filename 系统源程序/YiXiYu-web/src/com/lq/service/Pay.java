package com.lq.service;

import com.lq.bean.Analyze;
import com.lq.bean.BillAll;
import com.lq.bean.RestPRoom;
import com.lq.bean.RestPayForm;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class Pay {
    RestPayForm restPayForm=null;
    Analyze analyze=null;
    PRoom pRoom=new PRoom();
    BillAll billAll=null;
	List<RestPayForm> restPayForms=new ArrayList<RestPayForm>();
	List<BillAll> billAlls=new ArrayList<BillAll>();
	ArrayList<Analyze> analyzes=new ArrayList<Analyze>();
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();

    public List<RestPayForm> ShowRestPayForm(String pay_date)
    {
    	if(pay_date.equals("null")){
			String sql="SELECT * FROM rest_pay_form;";
			restPayForms=queryFromMysql.SearchAllByRestPayForm(sql,"null");
		}
        else {
			String sql="SELECT * FROM rest_pay_form WHERE pay_date=?;";
			restPayForms=queryFromMysql.SearchAllByRestPayForm(sql,pay_date);
		}
        if(restPayForms==null||restPayForms.isEmpty()){
            return null;
        }
        else {
            return restPayForms;
        }
    }

	public ArrayList<Analyze> ShowRestPayFormFromBeganToFinish(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select pay_date as name,sum(pay_price) as num from rest_pay_form GROUP BY name ASC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select pay_date as name,sum(pay_price) as num from rest_pay_form WHERE pay_date>=? and pay_date<=? GROUP BY name ASC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}

	public ArrayList<Analyze> ShowRestPayFormFromBeganToFinish2(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select pay_date as name,count(1) as num from rest_pay_form GROUP BY name ASC ;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select pay_date as name,count(1) as num from rest_pay_form WHERE pay_date>=? and pay_date<=? GROUP BY name ASC ;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}

	public ArrayList<Analyze> ShowBillAllFromBeganToFinish(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select vegetable_name as name,count(1) as num from bill_all GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select vegetable_name as name,count(1) as num from bill_all WHERE bill_data>=? and bill_data<=? GROUP BY name ORDER BY num DESC;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}

	public ArrayList<Analyze> ShowBillAllFromBeganToFinish2(String began_date, String finish_date)
	{
		if(began_date.equals("null")||finish_date.equals("null")){
			String sql="select vegetable_name as name,sum(vegetable_number*vegetable_price) as num from bill_all GROUP BY name ORDER BY num DESC ;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,"null","null");
		}
		else {
			String sql="select vegetable_name as name,sum(vegetable_number*vegetable_price) as num from bill_all WHERE bill_data>=? and bill_data<=? GROUP BY name ORDER BY num DESC ;";
			analyzes=queryFromMysql.SearchAllByRestPayFormFromBeganToFinish(sql,began_date,finish_date);
		}
		if(analyzes==null||analyzes.isEmpty()){
			return null;
		}
		else {
			return analyzes;
		}
	}


	public RestPayForm SearchRestPayForm(String bill_id)
    {

        String sql="SELECT * FROM rest_pay_form WHERE bill_id=?;";
        restPayForm=queryFromMysql.SearchRestPayFormById(sql,bill_id);
        return restPayForm;
    }

    public List<BillAll> SearchBillAll(String bill_id)
    {

        String sql="SELECT * FROM bill_all WHERE bill_id=?;";
        billAlls=queryFromMysql.SearchBillAllById(sql,bill_id);
        if(billAlls==null||billAlls.isEmpty()){
            return null;
        }
        else {
            return billAlls;
        }
    }

    public boolean QueryRestPayFormById(String bill_id)
    {
        String sql="select * from rest_pay_form where bill_id=?";
        int num=0;
        num=queryFromMysql.QueryAllRestPayFormById(sql,bill_id);
        if(num==1)
            return true;
        else
            return false;
    }

    public boolean QueryBillAllBybvId(String bill_id,String vegetable_id)
    {
        String sql="select * from bill_all where bill_id=? and vegetable_id=?";
        int num=0;
        num=queryFromMysql.QueryBillALlBybvId(sql,bill_id,vegetable_id);
        if(num==1)
            return true;
        else
            return false;
    }

    public String DeleteRestPayFormById(String bill_id)
    {
        String result="";
        String sql="delete from rest_pay_form where bill_id=?";
        if(QueryRestPayFormById(bill_id))
        {
            result= deleteFromMysql.DeleteByRestPayForm(sql,bill_id);
        }
        else {
            result="nohave";
        }
        return result;
    }

    public String DeleteBIllAllBybvId(String bill_id,String vegetable_id)
    {
        String result="";
        String sql="delete from bill_all where bill_id=? and vegetable_id=?";
        if(QueryBillAllBybvId(bill_id,vegetable_id))
        {
            result= deleteFromMysql.DeleteBillAllBybvId(sql,bill_id,vegetable_id);
        }
        else {
            result="nohave";
        }
        return result;
    }

	public String UpdateOrAddByRestPayForm(RestPayForm restPayForm)
	{
		String result="";
		String bill_id=restPayForm.getBillId();
		String state="";
		if(QueryRestPayFormById(bill_id)){        //如果有该记录则调用修改方法
			String sql="UPDATE rest_pay_form SET p_room_id=?," +
					"pay_date=?,pay_time=?,is_takeaway=?," +
					"takeaway_type=?,pay_type=?,pay_price=?" +
					" WHERE bill_id=?";
			result=updateFromMysql.UpdateByRestPayForm(sql,restPayForm);
		}
		else{
			String sql="insert into rest_pay_form(bill_id,p_room_id,pay_date," +
					"pay_time, is_takeaway,takeaway_type,pay_type,pay_price) VALUES(?,?,?,?,?,?,?,?)";
			result=addFromMysql.AddByRestPayForm(sql,restPayForm);
			String old_p_room=restPayForm.getPRoomId();
            String P_room_state="空闲";
            String P_room_began="";
            String P_room_finish="";
            RestPRoom restPRoom2=new RestPRoom(old_p_room,P_room_state,"",P_room_began,P_room_finish);
            result+=pRoom.UpdatePRoomByOrder(restPRoom2);
		}
		return result;
	}


}
