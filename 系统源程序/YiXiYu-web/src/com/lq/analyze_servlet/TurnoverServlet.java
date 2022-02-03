package com.lq.analyze_servlet;

import net.sf.json.JSONArray;
import com.lq.bean.Analyze;
import com.lq.bean.RestPayForm;
import com.lq.service.Pay;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet(name = "TurnoverServlet",urlPatterns="/analyze/TurnoverServlet")
public class TurnoverServlet extends BaseServlet {

	Pay pay=new Pay();
	RestPayForm restPayForm=null;
	Analyze analyze=null;
	ArrayList<RestPayForm> restPayForms=null;
	ArrayList<Analyze> analyzes=new ArrayList<Analyze>();

	protected void doLine(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String began_date=null;
		String finish_date=null;
		System.out.println("运行doLine");
		began_date=request.getParameter("began_date");
		finish_date=request.getParameter("finish_date");
		if(began_date==null||finish_date==null){
			began_date="null";
			finish_date="null";
		}
		analyzes=pay.ShowRestPayFormFromBeganToFinish(began_date,finish_date);
		response.setContentType("text/html; charset=utf-8");
		System.out.println("**************************************");
		JSONArray jsonArray=JSONArray.fromObject(analyzes);
		System.out.println(jsonArray.toString());
		PrintWriter writer = response.getWriter();
		writer.println(jsonArray);
		writer.flush();
		writer.close();
	}

	protected void doLine2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String began_date=null;
		String finish_date=null;
		System.out.println("运行doLine2");
		began_date=request.getParameter("began_date");
		finish_date=request.getParameter("finish_date");
		if(began_date==null||finish_date==null){
			began_date="null";
			finish_date="null";
		}
		analyzes=pay.ShowRestPayFormFromBeganToFinish2(began_date,finish_date);
		response.setContentType("text/html; charset=utf-8");
		System.out.println("**************************************");
		JSONArray jsonArray=JSONArray.fromObject(analyzes);
		System.out.println(jsonArray.toString());
		PrintWriter writer = response.getWriter();
		writer.println(jsonArray);
		writer.flush();
		writer.close();
	}

	protected void doPie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String began_date=null;
		String finish_date=null;
		System.out.println("运行doPie");
		began_date=request.getParameter("began_date");
		finish_date=request.getParameter("finish_date");
		if(began_date==null||finish_date==null){
			began_date="null";
			finish_date="null";
		}
		analyzes=pay.ShowRestPayFormFromBeganToFinish(began_date,finish_date);
		response.setContentType("text/html; charset=utf-8");
		System.out.println("**************************************");
		JSONArray jsonArray=JSONArray.fromObject(analyzes);
		System.out.println(jsonArray.toString());
		PrintWriter writer = response.getWriter();
		writer.println(jsonArray);
		writer.flush();
		writer.close();
	}

	protected void doPie2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String began_date=null;
		String finish_date=null;
		System.out.println("运行doPie2");
		began_date=request.getParameter("began_date");
		finish_date=request.getParameter("finish_date");
		if(began_date==null||finish_date==null){
			began_date="null";
			finish_date="null";
		}
		analyzes=pay.ShowRestPayFormFromBeganToFinish2(began_date,finish_date);
		response.setContentType("text/html; charset=utf-8");
		System.out.println("**************************************");
		JSONArray jsonArray=JSONArray.fromObject(analyzes);
		System.out.println(jsonArray.toString());
		PrintWriter writer = response.getWriter();
		writer.println(jsonArray);
		writer.flush();
		writer.close();
	}


}
