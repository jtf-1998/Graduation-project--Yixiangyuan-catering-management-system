package com.lq.comsume_servlet;

import com.google.gson.Gson;
import com.lq.bean.*;
import com.lq.service.Bill;
import com.lq.service.BillOfFare;
import com.lq.service.PRoom;
import com.lq.service.Pay;
import com.lq.service.android.BillOfOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "OrderBillServlet",urlPatterns="/comsume/OrderBillServlet")
public class OrderBillServlet extends BaseServlet
{
    Pay pay=new Pay();
    PRoom pRoom=new PRoom();
    Bill bill=new Bill();
    BillOfFare billOfFare=new BillOfFare();
    BillOfOrder billOfOrder=new BillOfOrder();
    RestPayForm restPayForm=null;
    RestBillOfFare restBillOfFare=null;
    BillAll billAll=null;
    PayForm payForm=null;
    List<RestPayForm> restPayForms=new ArrayList<RestPayForm>();
    List<BillAll> billAlls=new ArrayList<BillAll>();
    List<RestPRoom> restPRooms=new ArrayList<RestPRoom>();
    List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session=request.getSession();
        String bill_data=request.getParameter("bill_data");
        String bill_id=null;
        if(bill_data==null){
            bill_data="null";
        }
        billAlls=bill.SearchBillId(bill_data);
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        session.setAttribute("billAlls",billAlls);       //账单表基本信息
		String URL=request.getContextPath();
		if(bill_data==null||bill_data.isEmpty()){
            response.sendRedirect(URL+"/comsume/order_bill/order_bill.jsp");
        }else {
            response.sendRedirect(URL+"/comsume/order_bill/order_bill.jsp?pay_date="+bill_data);
        }

    }

    protected void doSearchById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session =  request.getSession();// 获取session
        Random random = new Random();
        String bill_id=null;
        String phone=null;
        String bill_date=null;
        String zongjia=null;
        bill_id=request.getParameter("bill_id");
        bill_date=request.getParameter("bill_date");
        phone=request.getParameter("phone");
        billAll=new BillAll(bill_date,phone);
        payForm=billOfOrder.SearchIdByBillOfOrder(billAll);
        zongjia=payForm.getPayPrice()+"";
        if(bill_id==null||bill_id.isEmpty()){
            bill_id="";
            for(int i=0;i<6;i++){
                bill_id+=random.nextInt(10);
            }
            bill_id=bill_id+"CT";
        }
        session.setAttribute("bill_id",bill_id);       //预订编号
        session.setAttribute("phone",phone);       //顾客电话
        session.setAttribute("zongjia",zongjia);       //顾客电话
        restPayForm=pay.SearchRestPayForm(bill_id);
        billAlls=pay.SearchBillAll(bill_id);
        restPRooms=pRoom.ShowPRoom();
        restBillOfFares=billOfFare.ShowBillOfFare();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        session.setAttribute("restPayForm",restPayForm);       //账单表基本信息
        session.setAttribute("billAlls",billAlls);       //点菜单表基本信息
        session.setAttribute("restPRooms",restPRooms);       //点菜单表基本信息
        session.setAttribute("restBillOfFares",restBillOfFares);       //点菜单表基本信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/comsume/order_bill/order_bill_full.jsp");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String status=null;
        String bill_id=request.getParameter("bill_id");
        status=pay.DeleteRestPayFormById(bill_id);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doDeleteForBillAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String status=null;
        String bill_id=request.getParameter("bill_id");
        String vegetable_id=request.getParameter("vegetable_id");
        status=pay.DeleteBIllAllBybvId(bill_id,vegetable_id);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doUpdateOrAddBillAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String bill_data=request.getParameter("bill_data");
        String bill_id=request.getParameter("bill_id");
        String bill_customer=request.getParameter("bill_customer");
        String bill_proom=request.getParameter("bill_proom");
        String vegetable_id=request.getParameter("vegetable_id");
        String vegetable_name=request.getParameter("vegetable_name");
        String vegetable_type=request.getParameter("vegetable_type");
        float vegetable_price=Float.parseFloat(request.getParameter("vegetable_price"));
        int vegetable_number=Integer.parseInt(request.getParameter("vegetable_number"));
        String vegetable_state=request.getParameter("vegetable_state");
        String vegetable_id_old=request.getParameter("vegetable_id_old");
        billAll=new BillAll(bill_id,bill_data,bill_customer,bill_proom,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
        status=billOfOrder.UpdateOrAddBillAll(billAll,vegetable_id_old);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
