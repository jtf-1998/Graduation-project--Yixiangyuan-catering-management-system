package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestStaffBasicForm;
import com.lq.bean.RestStaffLeaveForm;
import com.lq.service.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "StaffLeaveServlet",urlPatterns="/rest/StaffLeaveServlet")
public class StaffLeaveServlet extends BaseServlet
{
    Gson gson=new Gson();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Staff staff=new Staff();
    RestStaffLeaveForm restStaffLeaveForm=null;
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        List<RestStaffLeaveForm> restStaffLeaveForms=new ArrayList<RestStaffLeaveForm>();
        restStaffLeaveForms= staff.ShowStaffLeave();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restStaffLeaveForms",restStaffLeaveForms);       //包间信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/rest/staff/staff_leave.jsp");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String status=null;
        String staff_id=request.getParameter("staff_id");
        String date=request.getParameter("data");
        status=staff.DeleteStaffLeaveByIdAndDate(staff_id,date);
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
				resultMap.put("staff_phone",restStaffBasicForm.getStaffPhone());
			}
		}
		String resultJson=gson.toJson(resultMap);    //返回前端的json值
		//		System.out.println(resultJson);
		response.getWriter().write(resultJson);      //将json值回传到前端
	}

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        Date date=null;
        String data=request.getParameter("data");
        String staff_id=request.getParameter("staff_id");
        String staff_name=request.getParameter("staff_name");
        String staff_phone=request.getParameter("staff_phone");
        String staff_leave_began=request.getParameter("staff_leave_began");
        String staff_leave_finish=request.getParameter("staff_leave_finish");
        String staff_leave_verify_stage=request.getParameter("staff_leave_verify_stage");
		if(staff_leave_began!=""){ staff_leave_began=staff_leave_began.replaceAll("[A-Za-z]"," "); }
		if(staff_leave_finish!=""){ staff_leave_finish=staff_leave_finish.replaceAll("[A-Za-z]"," "); }
        restStaffLeaveForm=new RestStaffLeaveForm(data,staff_id,staff_name,staff_phone,staff_leave_began,staff_leave_finish,staff_leave_verify_stage);
        status=staff.UpdateOrAddByLeave(restStaffLeaveForm);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
