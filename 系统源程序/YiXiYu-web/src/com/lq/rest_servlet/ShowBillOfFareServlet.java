package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestBillOfFare;
import com.lq.service.BillOfFare;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowBillOfFareServlet",urlPatterns="/rest/ShowBillOfFareServlet")
public class ShowBillOfFareServlet extends BaseServlet
{
    BillOfFare billOfFare=new BillOfFare();
    RestBillOfFare restBillOfFare=null;
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
        restBillOfFares=billOfFare.ShowBillOfFare();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restBillOfFares",restBillOfFares);       //菜品信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/rest/bill/bill_of_fare.jsp");
    }

    protected void doSearchByName(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String vegetable_name=request.getParameter("vegetable_name");
        restBillOfFare=billOfFare.SearchRestBillOfFareByName(vegetable_name);
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        String vegetable_type=restBillOfFare.getVegetableType();
        String vegetable_id=restBillOfFare.getVegetableId();
        String vegetable_price=restBillOfFare.getVegetablePrice();
        resultMap.put("vegetable_type",vegetable_type);
        resultMap.put("vegetable_id",vegetable_id);
        resultMap.put("vegetable_price",vegetable_price);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String vegetableId=null;
        String status=null;
        vegetableId=request.getParameter("vegetableId");
        status=billOfFare.DeleteBillOfFare(vegetableId);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String vegetable_id=request.getParameter("vegetable_id");
        String vegetable_type=request.getParameter("vegetable_type");
        String vegetable_name=request.getParameter("vegetable_name");
        String vegetable_image=request.getParameter("vegetable_image");
        String vegetable_price=request.getParameter("vegetable_price");
        String vegetable_number=request.getParameter("vegetable_number");
        String vegetable_remark=request.getParameter("vegetable_remark");
        restBillOfFare=new RestBillOfFare(vegetable_id,vegetable_type,vegetable_name,
                vegetable_image,vegetable_price,vegetable_number,vegetable_remark);
        status=billOfFare.UpdateOrAdd(restBillOfFare);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
