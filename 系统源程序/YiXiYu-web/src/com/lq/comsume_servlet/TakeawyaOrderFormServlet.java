package com.lq.comsume_servlet;

import com.google.gson.Gson;
import com.lq.bean.Customer;
import com.lq.bean.TakeawayOrderForm;
import com.lq.service.TakeawayOrder_Form;

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

@WebServlet(name = "TakeawyaOrderFormServlet",urlPatterns="/comsume/TakeawyaOrderFormServlet")
public class TakeawyaOrderFormServlet extends BaseServlet
{
    TakeawayOrder_Form takeawayOrder_Form=new TakeawayOrder_Form();
    TakeawayOrderForm takeawayOrderForm=null;
    List<TakeawayOrderForm> takeawayOrderForms=new ArrayList<TakeawayOrderForm>();
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
		String takeaway_date=null;
		String takeaway_type=null;
		String type="";
		takeawayOrderForms=null;
		takeaway_date=request.getParameter("takeaway_date");
		takeaway_type=request.getParameter("takeaway_type");
		if(takeaway_date==null||takeaway_type==null){
			takeawayOrderForms=takeawayOrder_Form.ShowTakeawayOrder_Form("null","null");
			System.out.println("日期："+takeaway_date+"平台："+takeaway_type);
		}else {
//			takeaway_date=takeaway_date.replaceAll("[A-Za-z]"," ");
			takeawayOrderForms=takeawayOrder_Form.ShowTakeawayOrder_Form(takeaway_date,takeaway_type);
			System.out.println("日期："+takeaway_date+"平台："+takeaway_type);
			if(takeaway_type.equals("美团"))
			{
				type="MT";
			}else{
				type="ELM";
			}
		}
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
//        System.out.println("信息："+takeawayOrderForms);
        session.setAttribute("takeawyaOrderForms",takeawayOrderForms);       //外卖表基本信息
        String URL=request.getContextPath();
        if(takeaway_date==null||type==null){
			response.sendRedirect(URL+"/comsume/takeaway/takeawayorder_forms.jsp");
		}else {
			response.sendRedirect(URL+"/comsume/takeaway/takeawayorder_forms.jsp?takeaway_date="+takeaway_date+"&&takeaway_type="+type);
		}
        response.setCharacterEncoding("UTF-8");//设置响应编码格式为utf-8
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String takeaway_id=null;
        String status=null;
		takeaway_id=request.getParameter("takeaway_id");
        status=takeawayOrder_Form.DeleteTakeawayOrderFormById(takeaway_id);
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
        String takeaway_id=request.getParameter("takeaway_id");
        String takeaway_type=request.getParameter("takeaway_type");
        String takeaway_date=request.getParameter("takeaway_date");
		if(takeaway_date==null){
			takeaway_date="null";
		}else {
			takeaway_date=takeaway_date.replaceAll("[A-Za-z]"," ");
		}
        String takeaway_time=request.getParameter("takeaway_time");
        float takeaway_money=Float.parseFloat(request.getParameter("takeaway_money"));
        String customer_nickname=request.getParameter("customer_nickname");
        System.out.println("日期："+takeaway_date+";时间："+takeaway_time);
        String customer_phone=request.getParameter("customer_phone");
        takeawayOrderForm=new TakeawayOrderForm(takeaway_id,takeaway_type,takeaway_date,takeaway_time,takeaway_money,customer_nickname,customer_phone);
        status=takeawayOrder_Form.UpdateOrAddByTakeawayOrder(takeawayOrderForm);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
