package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.Customer;
import com.lq.bean.StateBody;
import com.lq.service.android.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 李秦
 * @version V1.0
 * @Package ${PACKAGE_NAME}
 * @date 2021-03-19 10:55
 * @Copyright © 2020-2021
 */
@WebServlet(name = "RLServlet",urlPatterns="/android/RLServlet")
public class RLServlet extends BaseServlet
{
	private String status=null;
	Customer customer=null;
	StateBody stateBody=null;
	loginOrRegist loginOrRegist=new loginOrRegist();
	AboutCustomer aboutCustomer=new AboutCustomer();
	Gson gson=new Gson();

	protected void Regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Regist运行");
		String customer_nickname=null;
		String customer_sex=null;
		String customer_password=null;
		String customer_phone=null;
		customer_nickname= RandomName.GetNickName();
		customer_sex=request.getParameter("sex");
		customer_password=request.getParameter("password");
		customer_phone=request.getParameter("phone");
		customer=new Customer(customer_nickname,customer_sex,customer_password,customer_phone);
		customer.toString();
		status=loginOrRegist.Regist(customer);    //注册
		if(status=="exists"){
			Login(request,response);
		}
		else {
			System.out.println(status);
			response.setContentType("text/html;charset=utf-8");
			Map<String,Object> resultMap=new HashMap<>();
			resultMap.put("status",status);
			request.getSession().setAttribute("phone", customer_phone);
			request.getSession().setAttribute("nickname", customer_nickname);
			String resultJson=gson.toJson(resultMap);    //返回前端的json值
			response.getWriter().write(resultJson);      //将json值回传到前端
		}

	}

	protected void Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Login运行");

		String customer_password=null;
		String customer_phone=null;
		customer_password=request.getParameter("password");
		customer_phone=request.getParameter("phone");
		customer=new Customer(customer_password,customer_phone);
		customer.toString();
		if(!loginOrRegist.Login(customer)){
			status="登录失败";
		}
		else{
			status="登录成功";
		}
//		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		System.out.println(resultMap);
		request.getSession().setAttribute("phone", customer_phone);

		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void ForgetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ForgetPassword运行");

		String customer_password=null;
		String customer_phone=null;
		customer_password=request.getParameter("customer_password");
		customer_phone=request.getParameter("customer_phone");
		customer=new Customer(customer_password,customer_phone);
		customer.toString();
		status=loginOrRegist.UpdatePassword(customer);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void SendSMS(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SendSMS运行");
		String customer_phone=null;
		String code=null;
		customer_phone=request.getParameter("phone");
		StringBuilder sb = new StringBuilder();
		sb.append("accountSid").append("=").append(Config.ACCOUNT_SID);
		sb.append("&to").append("=").append(customer_phone);
		int radomInt=(int)((Math.random()*9+1)*100000);
		code=radomInt+"";
		sb.append("&param").append("=").append(URLEncoder.encode(code,"UTF-8"));
		sb.append("&templateid").append("=").append(Config.templateid);
		String body = sb.toString() + HttpUtil.createCommonParam(Config.ACCOUNT_SID, Config.AUTH_TOKEN);
		String result = HttpUtil.post(Config.BASE_URL, body);
//		System.out.println(result);
		System.out.println(code);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("code",code);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

	protected void doShow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpSession session =  request.getSession();// 获取session
		String phone=null;
		phone=(String)session.getAttribute("phone");
		if(null==phone||phone.isEmpty()){
			phone=request.getParameter("phone");
		}
		customer=aboutCustomer.SearchByCustomer(phone);
		response.setContentType("text/html;charset=utf-8");
		System.out.println("运行doShow");
		session.setAttribute("customer",customer);       //菜品信息
		String URL=request.getContextPath();
		response.sendRedirect(URL+"/android/Minner/UpdateCustomer.jsp");
	}

	protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		HttpSession session =  request.getSession();// 获取session
		System.out.println("运行doUpdate");
		String status=null;
		String customer_nickname=request.getParameter("customer_nickname");
		String customer_sex=request.getParameter("customer_sex");
		String customer_name=request.getParameter("customer_name");
		String birth=request.getParameter("birth");
		String customer_phone=(String)session.getAttribute("phone");
		customer=new Customer(customer_nickname,customer_sex,customer_phone,customer_name,birth);
		status=aboutCustomer.Update(customer);
		System.out.println(status);
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		resultMap.put("status",status);
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

}
