package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.BillAll;
import com.lq.bean.PayForm;
import com.lq.bean.RestPayForm;
import com.lq.service.Pay;
import com.lq.service.android.BillOfOrder;

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

@WebServlet(name = "CartServlet",urlPatterns="/android/CartServlet")
public class CartServlet extends BaseServlet
{
    BillOfOrder billOfOrder=new BillOfOrder();
    Pay pay=new Pay();
    BillAll billAll=null;
	PayForm payForm=null;
	RestPayForm restPayForm=null;
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session =  request.getSession();// 获取session
        String BillOfOrders_tip=null;
        String phone=null;
        BillOfOrders_tip=request.getParameter("BillOfOrders_tip");
        phone=(String)session.getAttribute("phone");
        if(null==phone||phone.isEmpty()){
            phone=request.getParameter("phone");
        }
            List<BillAll> billAlls=new ArrayList<BillAll>();
//            billAlls=BillOfOrder.ShowBillOfOrder();
            response.setContentType("text/html;charset=utf-8");
            System.out.println("运行doShow");
            session.setAttribute("BillAlls",billAlls);       //菜品信息
            String URL=request.getContextPath();
            response.sendRedirect(URL+"/android/Main/main.jsp");
    }

    protected void doShowCart(HttpServletRequest request, HttpServletResponse response)
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
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        session.setAttribute("billAlls",billAlls);       //菜品信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/android/Cart/cart-settlement.jsp");
    }

	protected void doUpdateCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpSession session =  request.getSession();// 获取session
		String phone=null;
		String bill_id=null;
		String bill_data=null;
		phone=(String)session.getAttribute("phone");
		bill_data=(String)session.getAttribute("bill_data");
		bill_id=(String)session.getAttribute("bill_id");
		if(bill_id==null){
			BillAll billAll=new BillAll(bill_data,phone);
			payForm=billOfOrder.SearchIdByBillOfOrder(billAll);
			bill_id=payForm.getBillId();
		}
		List<BillAll> billAlls=new ArrayList<BillAll>();
		billAlls=billOfOrder.ShowBillOfOrder(bill_id);
		response.setContentType("text/html;charset=utf-8");
		System.out.println("运行doUpdateCart");
		session.setAttribute("billAlls",billAlls);       //菜品信息
		String URL=request.getContextPath();
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",billAlls);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

//    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException
//    {
//        System.out.println("运行doDelete");
//        String vegetableId=null;
//        String status=null;
//        vegetableId=request.getParameter("vegetableId");
//        status=BillOfOrder.DeleteBillOfOrder(vegetableId);
//        System.out.println(status);
//        response.setContentType("text/html;charset=utf-8");
//        Map<String,Object> resultMap=new HashMap<>();
//        resultMap.put("status",status);
//        String resultJson=gson.toJson(resultMap);    //返回前端的json值
//        response.getWriter().write(resultJson);      //将json值回传到前端
//    }

    protected void doAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doAdd");
        String status=null;
        String bill_id=request.getParameter("bill_id");
        String bill_data=request.getParameter("bill_data");
        String bill_custmomer=request.getParameter("bill_customer");
        String bill_proom=request.getParameter("pRoomName");
        String vegetable_id=request.getParameter("vegetable_id");
        String vegetable_type=request.getParameter("vegetable_type");
        String vegetable_name=request.getParameter("vegetable_name");
        double vegetable_price=Double.parseDouble(request.getParameter("vegetable_price"));
        int vegetable_number=Integer.parseInt(request.getParameter("vegetable_number"));
		String vegetable_state=request.getParameter("vegetable_state");
        billAll=new BillAll(bill_id,bill_data,bill_custmomer,bill_proom,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
        System.out.println(billAll.toString());
        status=billOfOrder.UpdateOrAdd(billAll);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

}
