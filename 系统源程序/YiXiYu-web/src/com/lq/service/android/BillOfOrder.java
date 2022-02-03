package com.lq.service.android;

import com.lq.bean.BillAll;
import com.lq.bean.PayForm;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class BillOfOrder {
    BillAll billAll=null;
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();
    public List<BillAll> ShowBillOfOrder(String bill_id)
    {
        List<BillAll> BillAlls=new ArrayList<BillAll>();
        String sql="select * from bill_all where bill_id=?";
        BillAlls=queryFromMysql.SearchAllByBillAllOfId(sql,bill_id);
        if(BillAlls==null||BillAlls.isEmpty()){
            return null;
        }
        else {
            return BillAlls;
        }

    }
    public List<BillAll> ShowBillOfOrderBycdp(String bill_data,String bill_custmomer,String bill_proom)
    {
        List<BillAll> BillAlls=new ArrayList<BillAll>();
        String sql="select * from bill_all where bill_data=? and bill_customer=? and bill_proom=?";
        BillAlls=queryFromMysql.SearchBillOfOrderBycdp(sql,bill_data,bill_custmomer,bill_proom);
        if(BillAlls==null||BillAlls.isEmpty()){
            return null;
        }
        else {
            return BillAlls;
        }

    }

    public List<PayForm> SearchpayByBillAll(String bill_data)
    {
        List<PayForm> payForms=new ArrayList<PayForm>();
        String sql="SELECT sum(vegetable_number*bill_all.vegetable_price) as zongjia,bill_proom,bill_id FROM bill_all where bill_data=? group by bill_proom,bill_id;";
        //		System.out.println("bill_data,bill_customer="+bill_data+bill_custmomer);
        payForms=queryFromMysql.QueryAllBillAllBydate(sql,bill_data,null);
        return payForms;

    }

	public PayForm SearchIdByBillOfOrder(BillAll billAll)
	{
		PayForm payForm=null;
		String sql="SELECT sum(vegetable_number*bill_all.vegetable_price) as zongjia,bill_proom,bill_id FROM bill_all where bill_data=? and bill_customer=? group by bill_proom,bill_id;";
		String bill_data=billAll.getBillData();
		String bill_custmomer=billAll.getBillCustomer();
//		System.out.println("bill_data,bill_customer="+bill_data+bill_custmomer);
		payForm=queryFromMysql.QueryAllBillAllById(sql,bill_data,bill_custmomer);
		return payForm;

	}

    public int SearchNumByBillOfOrder(BillAll billAll)
    {
        String sql="select vegetable_number from bill_all where bill_data=? and bill_customer=? and bill_proom=? and vegetable_id=?;";
        String bill_data=billAll.getBillData();
        String bill_custmomer=billAll.getBillCustomer();
        String bill_proom=billAll.getBillProom();
        String vegetable_id=billAll.getVegetableId();
        int vegetable_number=queryFromMysql.QueryAllBillAllByNumber(sql,bill_data,bill_custmomer,bill_proom,vegetable_id);

        return vegetable_number;

    }

    public boolean QueryBillOfOrderByNumber(String bill_data,String bill_custmomer,String bill_proom,String vegetable_id)
    {
        String sql="select * from bill_all where bill_data=? and bill_customer=? and bill_proom=? and vegetable_id=?";
        int num=0;
        num=queryFromMysql.QueryAllBillOfOrderByNumber(sql, bill_data, bill_custmomer, bill_proom, vegetable_id);
        System.out.println("数量："+num);
        if(num==1)
            return true;
        else
            return false;
    }
    public String DeleteBillOfOrder(String bill_data,String bill_custmomer,String bill_proom,String vegetable_id)
    {
        String result="";
        String sql="delete from bill_all where bill_data=? and bill_customer=? and bill_proom=? and vegetable_id=?";
        if(QueryBillOfOrderByNumber(bill_data, bill_custmomer, bill_proom, vegetable_id)) {
            result = deleteFromMysql.DeleteByBillOrderVg(sql, bill_data, bill_custmomer, bill_proom, vegetable_id);
        }
        else {
        result="nohave";
        }
         return result;
    }
    public String UpdateOrAdd(BillAll billAll)
    {
        String result="";
        String bill_data=billAll.getBillData();
        String bill_custmomer=billAll.getBillCustomer();
        String bill_proom=billAll.getBillProom();
        String vegetable_id=billAll.getVegetableId();
        if(QueryBillOfOrderByNumber(bill_data, bill_custmomer, bill_proom, vegetable_id)){        //如果有该记录则调用修改方法
            String sql="UPDATE bill_all SET vegetable_number=vegetable_number+?  WHERE bill_data=? and bill_customer=? and bill_proom=? and vegetable_id=?";
            result=updateFromMysql.UpdateNumByBillOrder(sql,billAll);
            String sql2="DELETE FROM bill_all  WHERE vegetable_number<=0";
            String result2=deleteFromMysql.DeleteByBillOrderAll(sql2);
            System.out.println(result2);

        }
        else{
            String sql="insert into bill_all(bill_id,bill_data,bill_customer,bill_proom,vegetable_id, vegetable_type, " +
                    "vegetable_name, vegetable_price,vegetable_number,vegetable_state)" +
                    " VALUES(?,?,?,?,?,?,?,?,?,?)";
            result=addFromMysql.AddByBillOrder(sql,billAll);
        }
        return result;
    }

    public String UpdateOrAddBillAll(BillAll billAll,String vegetable_id_old)
    {
        String result="";
        String bill_data=billAll.getBillData();
        String bill_custmomer=billAll.getBillCustomer();
        String bill_proom=billAll.getBillProom();
        String vegetable_id=billAll.getVegetableId();
        if(QueryBillOfOrderByNumber(bill_data, bill_custmomer, bill_proom, vegetable_id)){        //如果有该记录则调用修改方法
            String sql="UPDATE bill_all SET vegetable_id=?,vegetable_type=?,vegetable_name=?,vegetable_price=?,vegetable_number=?,vegetable_state=? WHERE bill_id=? and vegetable_id=?";
            result=updateFromMysql.UpdateBillAllByBillOrder(sql,billAll,vegetable_id_old);
            String sql2="DELETE FROM bill_all  WHERE vegetable_number<=0";
            String result2=deleteFromMysql.DeleteByBillOrderAll(sql2);
            System.out.println(result2);

        }
        else{
            String sql="insert into bill_all(bill_id,bill_data,bill_customer,bill_proom,vegetable_id, vegetable_type, " +
                    "vegetable_name, vegetable_price,vegetable_number,vegetable_state)" +
                    " VALUES(?,?,?,?,?,?,?,?,?,?)";
            result=addFromMysql.AddByBillOrder(sql,billAll);
        }
        return result;
    }
}
