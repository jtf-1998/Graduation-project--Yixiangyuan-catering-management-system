package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.BillAll;
import com.lq.bean.Customer;
import com.lq.bean.PayForm;
import com.lq.bean.RestBillOfFare;
import com.lq.service.BillOfFare;
import com.lq.service.android.BillOfOrder;
import com.lq.service.android.Minner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@WebServlet(name = "BillOfFareServlet",urlPatterns="/android/BillOfFareServlet")
public class BillOfFareServlet extends BaseServlet
{
    BillOfFare billOfFare=new BillOfFare();
    BillOfOrder billOfOrder=new BillOfOrder();
    RestBillOfFare restBillOfFare=null;
    Customer customer=null;
    Minner minner=new Minner();
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session =  request.getSession();// 获取session
        String BillOfFares_tip=null;
        String phone=null;
        PayForm payForm=null;
        BillOfFares_tip=request.getParameter("BillOfFares_tip");
        phone=(String)session.getAttribute("phone");
        if(null==phone||phone.isEmpty()){
            phone=request.getParameter("phone");
			session.setAttribute("phone",phone);       //菜单编号
        }
            List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
            restBillOfFares=billOfFare.ShowBillOfFare();
            response.setContentType("text/html;charset=utf-8");
            System.out.println("运行doShow");
            session.setAttribute("restBillOfFares",restBillOfFares);       //菜品信息
            Random random = new Random();
            String bill_id="";
			String bill_proom="";
			float zongjia=0;
			SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
			sdf.applyPattern("yyyy-MM-dd");// a为am/pm的标记
			Date date = new Date();// 获取当前时间
			String bill_data=sdf.format(date);
			BillAll billAll=new BillAll(bill_data,phone);
			payForm=billOfOrder.SearchIdByBillOfOrder(billAll);
//			payForm.toString();
			if(null==payForm){
				bill_id="";
				for(int i=0;i<6;i++){
					bill_id+=random.nextInt(10);
				}
			}
			else {
				bill_id=payForm.getBillId();
				bill_proom=payForm.getpRoom();
				zongjia=payForm.getPayPrice();
			}
			customer=minner.Show(phone);
			session.setAttribute("customer",customer);       //菜单编号
			session.setAttribute("restBillOfFares",restBillOfFares);       //菜单
            session.setAttribute("bill_id",bill_id);       //菜单编号
            session.setAttribute("zongjia",zongjia);       //总价
            session.setAttribute("bill_proom",bill_proom);       //包间
            session.setAttribute("bill_data",bill_data);       //点菜日期
            String URL=request.getContextPath();
            response.sendRedirect(URL+"/android/Main/main.jsp");


    }

}
