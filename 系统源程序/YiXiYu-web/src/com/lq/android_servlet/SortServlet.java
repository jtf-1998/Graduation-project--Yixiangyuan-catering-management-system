package com.lq.android_servlet;

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
import java.util.List;

/**
 * @author 李秦
 * @version V1.0
 * @Package ${PACKAGE_NAME}
 * @date 2021-03-19 10:55
 * @Copyright © 2020-2021
 */
@WebServlet(name = "SortServlet",urlPatterns="/SortServlet")
public class SortServlet extends BaseServlet
{
	BillOfFare billOfFare=new BillOfFare();
	RestBillOfFare restBillOfFare=null;
	Gson gson=new Gson();
	//http://localhost:8888/YiXiYu-web/SortServlet?action=ShowVegetables
	protected void ShowVegetables(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ShowVegetables运行");
		List<RestBillOfFare> restBillOfFares=new ArrayList<RestBillOfFare>();
		restBillOfFares=billOfFare.ShowBillOfFare();
		response.setContentType("text/html;charset=utf-8");
		System.out.println("运行doShow");
		HttpSession session=request.getSession();
		session.setAttribute("restBillOfFares",restBillOfFares);       //菜品信息
		String resultJson=gson.toJson(restBillOfFares);    //返回前端的json值
		response.getWriter().write(resultJson);      //将json值回传到前端
	}


}
