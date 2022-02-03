package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestStaffBasicForm;
import com.lq.bean.RestStaffCheckForm;
import com.lq.service.Staff;

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

@WebServlet(name = "StaffCheckServlet",urlPatterns="/rest/StaffCheckServlet")
public class StaffCheckServlet extends BaseServlet
{
    Staff staff=new Staff();
    RestStaffCheckForm restStaffCheckForm=null;
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<RestStaffCheckForm> restStaffCheckForms=new ArrayList<RestStaffCheckForm>();
        restStaffCheckForms=staff.ShowStaffCheck();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restStaffCheckForms",restStaffCheckForms);       //员工考核基本信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/rest/staff/staff_check.jsp");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String status=null;
        String staff_id=request.getParameter("staff_id");
        String date=request.getParameter("date");
        status=staff.DeleteStaffCheckByIdAndDate(staff_id,date);
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
		String staff_id=request.getParameter("staff_id");
		List<RestStaffBasicForm> restStaffBasicForms=new ArrayList<RestStaffBasicForm>();
		restStaffBasicForms=staff.ShowStaffBasic();
		response.setContentType("text/html;charset=utf-8");
		Map<String,Object> resultMap=new HashMap<>();
		for(RestStaffBasicForm restStaffBasicForm:restStaffBasicForms){
			if(restStaffBasicForm.getStaffId().equals(staff_id)){
				resultMap.put("staff_name",restStaffBasicForm.getStaffName());
				resultMap.put("staff_sex",restStaffBasicForm.getStaffSex());
			}
		}
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
//		System.out.println(resultJson);
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String date=request.getParameter("date");
        String staff_id=request.getParameter("staff_id");
        String staff_name=request.getParameter("staff_name");
        String staff_sex=request.getParameter("staff_sex");
        String staff_check=request.getParameter("staff_check");
        String staff_special_matters=request.getParameter("staff_special_matters");
        float staff_data_deduction=Float.parseFloat(request.getParameter("staff_data_deduction"));
		restStaffCheckForm=new RestStaffCheckForm(date,staff_id,staff_name,staff_sex,staff_check,staff_special_matters,staff_data_deduction);
        status=staff.UpdateOrAddByCheck(restStaffCheckForm);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
