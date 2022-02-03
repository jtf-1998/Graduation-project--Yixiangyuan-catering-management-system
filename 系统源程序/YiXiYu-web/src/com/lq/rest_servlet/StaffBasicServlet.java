package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestStaffBasicForm;
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

@WebServlet(name = "StaffBasicServlet",urlPatterns="/rest/StaffBasicServlet")
public class StaffBasicServlet extends BaseServlet
{
    Staff staff=new Staff();
    RestStaffBasicForm restStaffBasicForm=null;
    Gson gson=new Gson();

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<RestStaffBasicForm> restStaffBasicForms=new ArrayList<RestStaffBasicForm>();
        restStaffBasicForms=staff.ShowStaffBasic();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restStaffBasicForms",restStaffBasicForms);       //员工基本信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/rest/staff/staff_basic.jsp");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String P_room_id=null;
        String status=null;
        String staff_id=request.getParameter("staff_id");
        status=staff.DeleteStaffBasicById(staff_id);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        String staff_id=request.getParameter("staff_id");
        String staff_password=request.getParameter("staff_password");
        String staff_name=request.getParameter("staff_name");
        String staff_sex=request.getParameter("staff_sex");
        String staff_phone=request.getParameter("staff_phone");
        String staff_section=request.getParameter("staff_section");
        float staff_salary=Float.parseFloat(request.getParameter("staff_salary"));
        float staff_remuneration=Float.parseFloat(request.getParameter("staff_remuneration"));
        restStaffBasicForm=new RestStaffBasicForm(staff_id,staff_name,staff_password,staff_sex,staff_phone,staff_section
		,staff_salary,staff_remuneration);
        status=staff.UpdateOrAdd(restStaffBasicForm);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
