package com.lq.service;

import com.lq.bean.RestBillOfFare;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class BillOfFare {
    RestBillOfFare restBillOfFare=null;
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();
    public List<RestBillOfFare> ShowBillOfFare()
    {
        List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
        String sql="select * from rest_bill_of_fare";
        restBillOfFares=queryFromMysql.SearchAllByBillOfFare(sql);
        if(restBillOfFares==null||restBillOfFares.isEmpty()){
            return null;
        }
        else {
            return restBillOfFares;
        }

    }
    public List<RestBillOfFare> ShowBillOfFareByTip(String vegetable_type)
    {
        List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
        String sql="select * from rest_bill_of_fare where vegetable_type=?";
        restBillOfFares=queryFromMysql.SearchByBillOfFare_Tip(sql,vegetable_type);
        if(restBillOfFares==null||restBillOfFares.isEmpty()){
            return null;
        }
        else {
            return restBillOfFares;
        }

    }
    public RestBillOfFare SearchRestBillOfFareByName(String vegetable_name)
    {

        String sql="select * from rest_bill_of_fare where vegetable_name=?";
        restBillOfFare=queryFromMysql.SearchByBillOfFare_Name(sql,vegetable_name);
        if(restBillOfFare==null){
            return null;
        }
        else {
            return restBillOfFare;
        }
    }
    public boolean QueryBillOfFareById(String vegetable_id)
    {
        String sql="select * from rest_bill_of_fare where vegetable_id=?";
        int num=0;
        num=queryFromMysql.QueryAllBillOfFareById(sql,vegetable_id);
        if(num==1)
            return true;
        else
            return false;
    }
    public String DeleteBillOfFare(String vegetable_id)
    {
        String result="";
        String sql="delete from rest_bill_of_fare where vegetable_id=?";
        if(QueryBillOfFareById(vegetable_id))
        {
            result= deleteFromMysql.DeleteByBillForm(sql,vegetable_id);
        }
        else {
            result="nohave";
        }
        return result;
    }
    public String UpdateOrAdd(RestBillOfFare restBillOfFare)
    {
        String result="";
        String vegetable_id=restBillOfFare.getVegetableId();
        if(QueryBillOfFareById(vegetable_id)){        //如果有该记录则调用修改方法
            String sql="UPDATE rest_bill_of_fare SET vegetable_name=?,vegetable_image=?," +
                    "vegetable_price=?,vegetable_number=?,vegetable_remark=? WHERE vegetable_id=?";
            result=updateFromMysql.UpdateByBillForm(sql,restBillOfFare);
        }
        else{
            String sql="insert into rest_bill_of_fare(vegetable_id, vegetable_type, " +
                    "vegetable_name, vegetable_image, vegetable_price,vegetable_number, vegetable_remark)" +
                    " VALUES(?,?,?,?,?,?,?)";
            result=addFromMysql.AddByBillForm(sql,restBillOfFare);
        }
        return result;
    }
}
