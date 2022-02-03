package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.*;
import com.lq.service.BillOfFare;
import com.lq.service.Order_Form;
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

@WebServlet(name = "CustomerPayServlet",urlPatterns="/android/CustomerPayServlet")
public class CustomerPayServlet extends BaseServlet
{
    BillOfFare billOfFare=new BillOfFare();
    PRoom pRoom=new PRoom();
    Pay pay=new Pay();
    BillOfOrder billOfOrder=new BillOfOrder();
    Order_Form order_form=new Order_Form();
    RestPRoom restPRoom=null;
    RestBillOfFare restBillOfFare=null;
    RestPayForm restPayForm=null;
    PayForm payForm=null;
    List<RestPayForm> restPayForms=new ArrayList<RestPayForm>();
    List<PayForm> payForms=new ArrayList<PayForm>();
    List<BillAll> billAlls=new ArrayList<BillAll>();
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    	HttpSession session =  request.getSession();// 获取session
		String pRoomName=null;
		String phone=null;
		String zongjia=null;
		String bill_id=null;
		String bill_data=null;
		phone=(String)session.getAttribute("phone");
		bill_data=(String)session.getAttribute("bill_data");
		zongjia=session.getAttribute("zongjia")+"";
		pRoomName=(String)session.getAttribute("bill_proom");
		bill_id=(String)session.getAttribute("bill_id");
		if(zongjia==null||pRoomName==null||bill_id==null){
			BillAll billAll=new BillAll(bill_data,phone);
			payForm=billOfOrder.SearchIdByBillOfOrder(billAll);
			payForm.toString();
			bill_id=payForm.getBillId();
			pRoomName=payForm.getpRoom();
			zongjia=payForm.getPayPrice()+"";
			session.setAttribute("bill_id",bill_id);       //菜单编号
			session.setAttribute("zongjia",zongjia);       //总价
			session.setAttribute("bill_proom",payForm);       //包间
		}
		System.out.println("总价："+zongjia);
		List<BillAll> billAlls=new ArrayList<BillAll>();
		billAlls=billOfOrder.ShowBillOfOrder(bill_id);
		restPayForms=pay.ShowRestPayForm("null");
		session.setAttribute("restPayForms",restPayForms);       //包间
		session.setAttribute("billAlls",billAlls);       //菜品信息
		response.setContentType("text/html;charset=utf-8");
		System.out.println("运行doShow");
		String URL=request.getContextPath();
		response.sendRedirect(URL+"/android/Cart/ShowPay.jsp");
    }

	protected void doSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpSession session =  request.getSession();// 获取session
		System.out.println("运行doSearch");
		String bill_id=null;
		String status=null;
		bill_id=request.getParameter("bill_id");
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		restPayForm=pay.SearchRestPayForm(bill_id);
		if(restPayForm==null){
			status="no";
		}
		else {
			status="yes";
		}
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

//	protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException
//	{
//		System.out.println("运行doUpdateOrAdd");
//		String status=null;
//		String bill_id=request.getParameter("bill_id");
//		String p_room_id=request.getParameter("p_room_id");
//		String pay_date=request.getParameter("pay_date");
//		String pay_time=request.getParameter("pay_time");
//		String is_takeaway=request.getParameter("is_takeaway");
//		String takeaway_type=request.getParameter("takeaway_type");
//		String pay_type=request.getParameter("pay_type");
//		System.out.println("pay_price:"+request.getParameter("pay_price"));
//		float pay_price=Float.parseFloat(request.getParameter("pay_price"));
//
//		restPayForm=new RestPayForm(bill_id,p_room_id,pay_date,pay_time,is_takeaway,takeaway_type,pay_type,pay_price);
//		status=pay.UpdateOrAddByRestPayForm(restPayForm);
//		System.out.println(status);
//		response.setContentType("text/html;charset=utf-8");
//		Map<String,Object> resultMap=new HashMap<>();
//		resultMap.put("status",status);
//		String resultJson=gson.toJson(resultMap);    //返回前端的json值
//		response.getWriter().write(resultJson);      //将json值回传到前端
//	}

}
