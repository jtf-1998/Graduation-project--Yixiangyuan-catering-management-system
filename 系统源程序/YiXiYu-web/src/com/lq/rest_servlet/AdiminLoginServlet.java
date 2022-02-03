package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.service.Login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdiminLoginServlet",urlPatterns="/rest/AdiminLoginServlet")
public class AdiminLoginServlet extends BaseServlet
{
    protected void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        Login login=new Login();
        Gson gson=new Gson();
        System.out.println("doLogin运行");
        String status=null;
        String admin_ID=null;
        String admin_password=null;
        admin_ID=request.getParameter("username");
        admin_password=request.getParameter("password");
       // System.out.println("用户名："+admin_ID+"\n密码："+admin_password);
        status=login.Judge(admin_ID,admin_password);    //判断用户名，密码是否存在
        //System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

}
