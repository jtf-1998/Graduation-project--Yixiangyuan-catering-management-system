package com.lq.service;

import com.lq.bean.*;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class Kitchen {
    RestKitchenPurchase restKitchenPurchase=null;
    RestKitchenIngredientsManagement restKitchenIngredientsManagement=null;
	List<RestKitchenPurchase> restKitchenPurchases=new ArrayList<RestKitchenPurchase>();
	List<RestKitchenIngredientsManagement> restKitchenIngredientsManagements=new ArrayList<RestKitchenIngredientsManagement>();
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();

    public List<RestKitchenPurchase> ShowKitchenPurchase(String purchase_date)
    {
    	if(purchase_date.equals("null")){
			String sql="SELECT * FROM rest_kitchen_purchase;";
			restKitchenPurchases=queryFromMysql.SearchAllByKitchenPurchase(sql,"null");
		}
        else {
			String sql="SELECT * FROM rest_kitchen_purchase WHERE purchase_date=?;";
			restKitchenPurchases=queryFromMysql.SearchAllByKitchenPurchase(sql,purchase_date);
		}
        if(restKitchenPurchases==null||restKitchenPurchases.isEmpty()){
            return null;
        }
        else {
            return restKitchenPurchases;
        }
    }

    public boolean QueryKitchenPurchaseByDateAndId(String purchase_date,String purchase_id)
    {
        String sql="select * from rest_kitchen_purchase where purchase_date=? and purchase_id=?";
        int num=0;
        num=queryFromMysql.QueryAllKitchenPurchaseByIdAndDate(sql,purchase_date,purchase_id);
        if(num==1)
            return true;
        else
            return false;
    }

    public String DeleteKitchenPurchaseByDateAndId(String purchase_date,String purchase_id)
    {
        String result="";
        String sql="delete from rest_kitchen_purchase where purchase_date=? and purchase_id=?";
        if(QueryKitchenPurchaseByDateAndId(purchase_date,purchase_id))
        {
            result= deleteFromMysql.DeleteByKitchenPurchase(sql,purchase_date,purchase_id);
        }
        else {
            result="nohave";
        }
        return result;
    }

	public String UpdateOrAddByPurchase(RestKitchenPurchase restKitchenPurchase)
	{
		String result="";
		String purchase_date=restKitchenPurchase.getPurchaseDate();
		String purchase_id=restKitchenPurchase.getPurchaseId();
		String state="";
		if(QueryKitchenPurchaseByDateAndId(purchase_date,purchase_id)){        //如果有该记录则调用修改方法
			String sql="UPDATE rest_kitchen_purchase SET purchase_name=?," +
					"purchase_type=?,purchase_person=?,purchase_phone=?," +
					"vegetable_stock=?,purchase_number=?,purchase_price=?" +
					" WHERE purchase_date=? and purchase_id=?";
			result=updateFromMysql.UpdateByKitchenPurchase(sql,restKitchenPurchase);
		}
		else{
			String sql="insert into rest_kitchen_purchase(purchase_date,purchase_id,purchase_name," +
					" purchase_type, purchase_person,purchase_phone,vegetable_stock,purchase_number," +
					"purchase_price) VALUES(?,?,?,?,?,?,?,?,?)";
			result=addFromMysql.AddByKitchenPurchase(sql,restKitchenPurchase);
		}
		return result;
	}

	public List<RestKitchenIngredientsManagement> ShowKitchenIngerdientsManagement()
	{
		String sql="SELECT * FROM rest_kitchen_ingredients_management;";
		restKitchenIngredientsManagements=queryFromMysql.SearchAllByKitchenIngredientsManagement(sql);
		if(restKitchenIngredientsManagements==null||restKitchenIngredientsManagements.isEmpty()){
			return null;
		}
		else {
			return restKitchenIngredientsManagements;
		}
	}

	public boolean QueryKitchenIngredient(String ingredient_id)
	{
		String sql="select * from rest_kitchen_ingredients_management where ingredient_id=?";
		int num=0;
		num=queryFromMysql.QueryAllByKitchenIngredientById(sql,ingredient_id);
		if(num==1)
			return true;
		else
			return false;
	}

	public String DeleteKitchenIngredientById(String ingredient_id)
	{
		String result="";
		String sql="delete from rest_kitchen_ingredients_management where ingredient_id=?";
		if(QueryKitchenIngredient(ingredient_id))
		{
			result= deleteFromMysql.DeleteByKitchenIngredientById(sql,ingredient_id);
		}
		else {
			result="nohave";
		}
		return result;
	}
}
