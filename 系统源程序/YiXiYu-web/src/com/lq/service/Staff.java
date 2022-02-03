package com.lq.service;

import com.lq.bean.RestStaffBasicForm;
import com.lq.bean.RestStaffCheckForm;
import com.lq.bean.RestStaffLeaveForm;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class Staff {
    RestStaffBasicForm restStaffBasicForm=null;
    RestStaffCheckForm restStaffCheckForm=null;
    RestStaffLeaveForm restStaffLeaveForm=null;
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();

    public List<RestStaffBasicForm> ShowStaffBasic()
    {
        List<RestStaffBasicForm> restStaffBasicForms=new ArrayList<RestStaffBasicForm>();
        String sql="select * from rest_staff_basic_form";
        restStaffBasicForms=queryFromMysql.SearchAllByStaffBasic(sql);
        if(restStaffBasicForms==null||restStaffBasicForms.isEmpty()){
            return null;
        }
        else {
            return restStaffBasicForms;
        }
    }
    public List<RestStaffCheckForm> ShowStaffCheck()
    {
        List<RestStaffCheckForm> restStaffCheckForms=new ArrayList<RestStaffCheckForm>();
        String sql="select * from rest_staff_check_form";
        restStaffCheckForms=queryFromMysql.SearchAllByStaffCheck(sql);
        if(restStaffCheckForms==null||restStaffCheckForms.isEmpty()){
            return null;
        }
        else {
            return restStaffCheckForms;
        }
    }
    public List<RestStaffLeaveForm> ShowStaffLeave()
    {
        List<RestStaffLeaveForm> restStaffLeaveForms=new ArrayList<RestStaffLeaveForm>();
        String sql="select * from rest_staff_leave_form";
        restStaffLeaveForms=queryFromMysql.SearchAllByStaffLeave(sql);
        if(restStaffLeaveForms==null||restStaffLeaveForms.isEmpty()){
            return null;
        }
        else {
            return restStaffLeaveForms;
        }
    }

    public boolean QueryStaffBasicById(String staff_id)
    {
        String sql="select * from rest_staff_basic_form where staff_id=?";
        int num=0;
        num=queryFromMysql.QueryAllStaffBasicById(sql,staff_id);
        if(num==1)
            return true;
        else
            return false;
    }
    public boolean QueryStaffCheckByIdAndDate(String staff_id,String date)
    {
        String sql="select * from rest_staff_check_form where date=? and staff_id=?";
        int num=0;
        num=queryFromMysql.QueryAllStaffCheckByIdAndDate(sql,staff_id,date);
        if(num==1)
            return true;
        else
            return false;
    }
	public boolean QueryStaffLeaveByIdAndDate(String staff_id,String date)
	{
		String sql="select * from rest_staff_leave_form where data=? and staff_id=?";
		int num=0;
		num=queryFromMysql.QueryAllStaffCheckByIdAndDate(sql,staff_id,date);
		if(num==1)
			return true;
		else
			return false;
	}

    public String DeleteStaffBasicById(String staff_id)
    {
        String result="";
        String sql="delete from rest_staff_basic_form where staff_id=?";
        if(QueryStaffBasicById(staff_id))
        {
            result= deleteFromMysql.DeleteByStaffBasic(sql,staff_id);
        }
        else {
            result="nohave";
        }
        return result;
    }
    public String DeleteStaffCheckByIdAndDate(String staff_id,String date)
    {
        String result="";
        String sql="delete from rest_staff_check_form where date=? and staff_id=?";
        if(QueryStaffCheckByIdAndDate(staff_id,date))
        {
            result= deleteFromMysql.DeleteByStaffCheck(sql,staff_id,date);
        }
        else {
            result="nohave";
        }
        return result;
    }
	public String DeleteStaffLeaveByIdAndDate(String staff_id,String date)
	{
		String result="";
		String sql="delete from rest_staff_leave_form where data=? and staff_id=?";
		if(QueryStaffLeaveByIdAndDate(staff_id,date))
		{
			result= deleteFromMysql.DeleteByStaffLeave(sql,staff_id,date);
		}
		else {
			result="nohave";
		}
		return result;
	}

    public String UpdateOrAdd(RestStaffBasicForm restStaffBasicForm)
    {
        String result="";
        String staff_id=restStaffBasicForm.getStaffId();
        if(QueryStaffBasicById(staff_id)){        //如果有该记录则调用修改方法
            String sql="UPDATE rest_staff_basic_form SET staff_password=?,staff_name=?," +
                    "staff_sex=?,staff_phone=?,staff_section=?,staff_salary=?," +
                    "staff_remuneration=? WHERE " +
                    "staff_id=?";
            result=updateFromMysql.UpdateByStaffBasic(sql,restStaffBasicForm);
        }
        else{
            String sql="insert into rest_staff_basic_form(staff_id, staff_password, " +
                    "staff_name, staff_sex, staff_phone,staff_section, staff_salary, " +
                    "staff_remuneration)" +
                    " VALUES(?,?,?,?,?,?,?,?)";
            result=addFromMysql.AddByStaffBasic(sql,restStaffBasicForm);
        }
        return result;
    }
	public String UpdateOrAddByCheck(RestStaffCheckForm restStaffCheckForm)
	{
		String result="";
		String date=restStaffCheckForm.getDate();
		List<RestStaffCheckForm> restStaffCheckForms=new ArrayList<RestStaffCheckForm>();
		List<RestStaffBasicForm> restStaffBasicForms=new ArrayList<RestStaffBasicForm>();
		String staff_id=restStaffCheckForm.getStaffId();
		float old_staff_data_deduction=0;
		float old_staff_remuneration=0;
		String state="";
		restStaffCheckForms=ShowStaffCheck();
		restStaffBasicForms=ShowStaffBasic();
		if(restStaffCheckForms!=null && restStaffCheckForms.size()>=0){
			for(RestStaffCheckForm restStaffCheckForm1:restStaffCheckForms){
				if(restStaffCheckForm1.getStaffId().equals(staff_id)){
					old_staff_data_deduction=restStaffCheckForm1.getStaffDataDeduction();   //数据库中原有的日扣除金额
//					System.out.println("获得旧日扣金额");
				}
			}
		}
//		System.out.println(QueryStaffCheckByIdAndDate(staff_id,date));
		if(QueryStaffCheckByIdAndDate(staff_id,date)){        //如果有该记录则调用修改方法
			String sql="UPDATE rest_staff_check_form SET staff_check=?," +
					"staff_special_matters=?,staff_data_deduction=?" +
					" WHERE date=? and staff_id=?";
			result=updateFromMysql.UpdateByStaffCheck(sql,restStaffCheckForm);
		}
		else{
			String sql="insert into rest_staff_check_form(date,staff_id,staff_name," +
					" staff_sex, staff_check,staff_special_matters,staff_data_deduction)" +
					" VALUES(?,?,?,?,?,?,?)";
			result=addFromMysql.AddByStaffCheck(sql,restStaffCheckForm);
		}

		for(RestStaffBasicForm restStaffBasicForm1:restStaffBasicForms){
			if(restStaffBasicForm1.getStaffId().equals(staff_id)){
				old_staff_remuneration=restStaffBasicForm1.getStaffRemuneration();
//				System.out.println("获得旧月扣金额");
			}
		}
		float staff_data_deduction=restStaffCheckForm.getStaffDataDeduction();     //新修改或添加的日扣除金额
		float staff_remuneration=old_staff_remuneration+old_staff_data_deduction-staff_data_deduction;
		String sql="UPDATE rest_staff_basic_form SET staff_remuneration=? WHERE " +
				"staff_id=?";
		state=updateFromMysql.UpdateByStaffBasicRem(sql,staff_remuneration,staff_id);
//		System.out.println("旧月扣："+old_staff_remuneration+"/n旧日扣："+old_staff_data_deduction+"/n新日扣："+staff_data_deduction);
		return result;
	}
	public String UpdateOrAddByLeave(RestStaffLeaveForm restStaffLeaveForm)
	{
		String result="";
		String date=restStaffLeaveForm.getData();
		List<RestStaffCheckForm> restStaffCheckForms=new ArrayList<RestStaffCheckForm>();
		List<RestStaffLeaveForm> restStaffLeaveForms=new ArrayList<RestStaffLeaveForm>();
		String staff_id=restStaffLeaveForm.getStaffId();
		//		System.out.println(QueryStaffCheckByIdAndDate(staff_id,date));
		if(QueryStaffLeaveByIdAndDate(staff_id,date)){        //如果有该记录则调用修改方法
			String sql="UPDATE rest_staff_leave_form SET staff_leave_began=?," +
					"staff_leave_finish=?,staff_leave_verify_stage=?" +
					" WHERE data=? and staff_id=?";
			result=updateFromMysql.UpdateByStaffLeave(sql,restStaffLeaveForm);
		}
		else{
			String sql="insert into rest_staff_leave_form(data,staff_id,staff_name," +
					" staff_phone, staff_leave_began,staff_leave_finish,staff_leave_verify_stage)" +
					" VALUES(?,?,?,?,?,?,?)";
			result=addFromMysql.AddByStaffLeave(sql,restStaffLeaveForm);
		}

		return result;
	}
}
