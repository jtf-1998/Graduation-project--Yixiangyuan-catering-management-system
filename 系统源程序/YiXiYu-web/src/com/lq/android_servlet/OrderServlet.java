package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.OrderForm;
import com.lq.bean.RestBillOfFare;
import com.lq.bean.RestPRoom;
import com.lq.service.BillOfFare;
import com.lq.service.Order_Form;
import com.lq.service.PRoom;
import com.lq.service.android.BillOfOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "OrderServlet",urlPatterns="/android/OrderServlet")
public class OrderServlet extends BaseServlet
{
    BillOfFare billOfFare=new BillOfFare();
    PRoom pRoom=new PRoom();
    BillOfOrder billOfOrder=new BillOfOrder();
    Order_Form order_form=new Order_Form();
    RestPRoom restPRoom=null;
    RestBillOfFare restBillOfFare=null;
    OrderForm orderForm=null;
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        	HttpSession session =  request.getSession();// 获取session
        	String phone=null;
        	phone=(String)session.getAttribute("phone");
            response.setContentType("text/html;charset=utf-8");
            System.out.println("运行doShow");
            Random random = new Random();
            String order_id="";
            for(int i=0;i<6;i++){
				order_id+=random.nextInt(10);
            }
			order_id=order_id+"Order";
            session.setAttribute("order_id",order_id);       //预订编号
            String URL=request.getContextPath();
            response.sendRedirect(URL+"/android/Order/OrderProom.jsp");
    }

	protected void doShowOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpSession session =  request.getSession();// 获取session
		String phone=null;
		phone=(String)session.getAttribute("phone");
		List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
		List<RestPRoom> restPRooms=new ArrayList<RestPRoom>();
		restBillOfFares=billOfFare.ShowBillOfFareByTip("干锅类");
		restPRooms=pRoom.ShowPRoom();
		List<OrderForm> orderForms=new ArrayList<OrderForm>();
		orderForms=order_form.ShowOrderFormByPhone(phone);
		response.setContentType("text/html;charset=utf-8");
		System.out.println("运行doShowOrder");
		session.setAttribute("restBillOfFares",restBillOfFares);       //干锅
		session.setAttribute("restPRooms",restPRooms);       //包间信息
		session.setAttribute("orderForms",orderForms);       //预订编号
		String URL=request.getContextPath();
		response.sendRedirect(URL+"/android/Order/ShowOrder.jsp");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doDelete");
		String order_id=null;
		String status=null;
		order_id=request.getParameter("order_id");
		status=order_form.DeleteOrderFormById(order_id);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void doJudgePRoom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doJudgePRoom");
		String P_room_id=null;
		String status=null;
		String order_datetime=null;
		P_room_id=request.getParameter("P_room_id");
		order_datetime=request.getParameter("order_datetime");
		status=order_form.SearchStateFromPRoom(P_room_id,order_datetime);
		System.out.println("包间状态："+status);
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
		String order_id=request.getParameter("order_id");
		String P_room_id=request.getParameter("P_room_id");
		String order_date=request.getParameter("order_date");
		String order_time=request.getParameter("order_time");
		int customer_number=Integer.parseInt(request.getParameter("customer_number"));
		String order_griddle=request.getParameter("order_griddle");
		if(order_griddle=="GG0"){
			order_griddle="";
		}
		String customer_phone=request.getParameter("customer_phone");
		String customer_name=request.getParameter("customer_name");
		orderForm=new OrderForm(order_id,P_room_id,order_date,order_time,customer_number,order_griddle,customer_phone,customer_name);
		status=order_form.UpdateOrAddByOrder(orderForm,"old");
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void doUpdateOrAdd2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doUpdateOrAdd");
		String status=null;
		String order_id=request.getParameter("order_id");
		String P_room_id=request.getParameter("P_room_id");
		String old_p_room=request.getParameter("old_p_room");
		String order_date=request.getParameter("order_date");
		String order_time=request.getParameter("order_time");
		int customer_number=Integer.parseInt(request.getParameter("customer_number"));
		String order_griddle=request.getParameter("order_griddle");
		if(order_griddle=="GG0"){
			order_griddle="";
		}
		String customer_phone=request.getParameter("customer_phone");
		String customer_name=request.getParameter("customer_name");
		orderForm=new OrderForm(order_id,P_room_id,order_date,order_time,customer_number,order_griddle,customer_phone,customer_name);
		status=order_form.UpdateOrAddByOrder(orderForm,old_p_room);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

}
