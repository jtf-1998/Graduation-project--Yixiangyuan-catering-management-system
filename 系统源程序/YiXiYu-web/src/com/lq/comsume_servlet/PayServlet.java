package com.lq.comsume_servlet;

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

@WebServlet(name = "PayServlet",urlPatterns="/comsume/PayServlet")
public class PayServlet extends BaseServlet
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
        	String pay_date="";
        	String eat_type="";
			pay_date=request.getParameter("pay_date");
			System.out.println("pay_date="+pay_date);
			eat_type=request.getParameter("eat_type");
            response.setContentType("text/html;charset=utf-8");
            System.out.println("运行doShow");
            Random random = new Random();
            String type="";
            if(pay_date==null||eat_type==null){
            	pay_date="null";
            	eat_type="null";
			}
            if(eat_type.equals("传统")){
				String bill_id="";
				for(int i=0;i<6;i++){
					bill_id+=random.nextInt(10);
				}
				bill_id=bill_id+"CT";
				session.setAttribute("bill_ct_id",bill_id);       //传统点菜编号
				type="CT";
			}else if(eat_type.equals("手机")){
            	type="SJ";
			}
			else {
            	type="";
			}
			payForms=billOfOrder.SearchpayByBillAll(pay_date);
            restPayForms=pay.ShowRestPayForm(pay_date);
			session.setAttribute("restPayForms",restPayForms);       //传统点菜编号
			session.setAttribute("payForms",payForms);       //传统点菜编号
            String URL=request.getContextPath();
            System.out.println(pay_date);
			if(pay_date.equals("null")||type.equals("null")){
				response.sendRedirect(URL+"/comsume/pay/pay_forms.jsp");
			}
			else {
				response.sendRedirect(URL+"/comsume/pay/pay_forms.jsp?pay_date="+pay_date+"&&eat_type="+type);
			}
    }

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doDelete");
		String bill_id=null;
		String status=null;
		bill_id=request.getParameter("bill_id");
		status=pay.DeleteRestPayFormById(bill_id);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
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
		payForms=(List<PayForm>) session.getAttribute("payForms");
		for(PayForm payForm1:payForms){
			if(payForm1.getBillId().equals(bill_id)){
				resultMap.put("p_room",payForm1.getpRoom());
				resultMap.put("pay_price",payForm1.getPayPrice());
			}
		}
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doUpdateOrAdd");
		String status=null;
		String bill_id=request.getParameter("bill_id");
		String p_room_id=request.getParameter("p_room_id");
		String pay_date=request.getParameter("pay_date");
		String pay_time=request.getParameter("pay_time");
		String is_takeaway=request.getParameter("is_takeaway");
		String takeaway_type=request.getParameter("takeaway_type");
		String pay_type=request.getParameter("pay_type");
		System.out.println("pay_price:"+request.getParameter("pay_price"));
		float pay_price=Float.parseFloat(request.getParameter("pay_price"));

		restPayForm=new RestPayForm(bill_id,p_room_id,pay_date,pay_time,is_takeaway,takeaway_type,pay_type,pay_price);
		status=pay.UpdateOrAddByRestPayForm(restPayForm);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

}
