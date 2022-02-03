package com.lq.comsume_servlet;

import com.google.gson.Gson;
import com.lq.bean.Customer;
import com.lq.bean.OrderForm;
import com.lq.bean.RestBillOfFare;
import com.lq.bean.RestPRoom;
import com.lq.service.BillOfFare;
import com.lq.service.Order_Form;
import com.lq.service.PRoom;

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

@WebServlet(name = "OrderFormServlet",urlPatterns="/comsume/OrderFormServlet")
public class OrderFormServlet extends BaseServlet
{
    Order_Form order_form=new Order_Form();
    BillOfFare billOfFare=new BillOfFare();
    PRoom pRoom=new PRoom();
    OrderForm orderForm=null;
    List<OrderForm> orderForms=new ArrayList<OrderForm>();
    List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
    List<RestPRoom> restPRooms=new ArrayList<RestPRoom>();
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
		String order_date=null;
		orderForms=null;
		order_date=request.getParameter("order_date");
		if(order_date==null){
			orderForms=order_form.ShowOrderForm("null");
			System.out.println("日期："+order_date);
		}else {
			order_date=order_date.replaceAll("[A-Za-z]"," ");
			orderForms=order_form.ShowOrderForm(order_date);
			System.out.println("日期："+order_date);
		}
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
		restBillOfFares=billOfFare.ShowBillOfFareByTip("干锅类");
		restPRooms=pRoom.ShowPRoom();
		session.setAttribute("restBillOfFares",restBillOfFares);       //干锅
		session.setAttribute("restPRooms",restPRooms);       //包间信息
        session.setAttribute("orderForms",orderForms);       //预订表基本信息
        String URL=request.getContextPath();
        if(order_date==null){
			response.sendRedirect(URL+"/comsume/order/order_forms.jsp");
		}else {
			response.sendRedirect(URL+"/comsume/order/order_forms.jsp?order_date="+order_date);
		}

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

	protected void doSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		System.out.println("运行doSearch");
		String customer_name=request.getParameter("customer_name");
		List<Customer> customers=new ArrayList<Customer>();
		customers=null;
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		for(Customer customer:customers){
			if(customer.getCustomerNickname().equals(customer_name)){
				resultMap.put("customer_phone",customer.getCustomerPhone());
			}
		}
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
				System.out.println(resultJson);
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String order_id=request.getParameter("order_id");
        String P_room_id=request.getParameter("P_room_id");
        String order_date=request.getParameter("order_date");
		if(order_date==null){
			order_date="null";
		}else {
			order_date=order_date.replaceAll("[A-Za-z]"," ");
		}
        String order_time=request.getParameter("order_time");
        int customer_number=Integer.parseInt(request.getParameter("customer_number"));
        String order_griddle=request.getParameter("order_griddle");
        String customer_name=request.getParameter("customer_name");
        String customer_phone=request.getParameter("customer_phone");
        orderForm=new OrderForm(order_id,P_room_id,order_date,order_time,customer_number,order_griddle,customer_phone,customer_name);
        status=order_form.UpdateOrAddByOrder(orderForm,"old");
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
