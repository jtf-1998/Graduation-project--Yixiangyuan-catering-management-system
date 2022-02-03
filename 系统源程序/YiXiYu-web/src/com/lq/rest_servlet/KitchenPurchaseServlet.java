package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestKitchenPurchase;
import com.lq.service.Kitchen;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "KitchenPurchaseServlet",urlPatterns="/rest/KitchenPurchaseServlet")
public class KitchenPurchaseServlet extends BaseServlet
{
    Kitchen kitchen=new Kitchen();
    RestKitchenPurchase restKitchenPurchase=null;
    List<RestKitchenPurchase> restKitchenPurchases=new ArrayList<RestKitchenPurchase>();
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String purchase_date=request.getParameter("purchase_date");
		restKitchenPurchases=null;
        if(purchase_date==null){
            restKitchenPurchases=kitchen.ShowKitchenPurchase("null");
			System.out.println("日期："+purchase_date);
        }
        else {
            purchase_date=purchase_date.replaceAll("[A-Za-z]"," ");
            restKitchenPurchases=kitchen.ShowKitchenPurchase(purchase_date);
			System.out.println("日期："+purchase_date);
        }
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restKitchenPurchases",restKitchenPurchases);       //进货表基本信息
		String URL=request.getContextPath();
		response.sendRedirect(URL+"/rest/kitchen/kitchen_purchase.jsp?purchase_date="+purchase_date);
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String status=null;
        String purchase_date=request.getParameter("purchase_date");
        String purchase_id=request.getParameter("purchase_id");
        status=kitchen.DeleteKitchenPurchaseByDateAndId(purchase_date,purchase_id);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String purchase_date=request.getParameter("purchase_date");
        String purchase_id=request.getParameter("purchase_id");
        String purchase_name=request.getParameter("purchase_name");
        String purchase_type=request.getParameter("purchase_type");
        String purchase_person=request.getParameter("purchase_person");
        String purchase_phone=request.getParameter("purchase_phone");
        float vegetable_stock=Float.parseFloat(request.getParameter("vegetable_stock"));
        float purchase_number=Float.parseFloat(request.getParameter("purchase_number"));
        float purchase_price=Float.parseFloat(request.getParameter("purchase_price"));
		if(purchase_date==null){
		}
		else {
			purchase_date=purchase_date.replaceAll("[A-Za-z]"," ");
		}
        restKitchenPurchase=new RestKitchenPurchase(purchase_date,purchase_id,purchase_name,purchase_type,purchase_person,purchase_phone,vegetable_stock,purchase_number,purchase_price);
        status=kitchen.UpdateOrAddByPurchase(restKitchenPurchase);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
