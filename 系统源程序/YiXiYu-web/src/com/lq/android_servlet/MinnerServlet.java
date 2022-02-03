package com.lq.android_servlet;

import com.google.gson.Gson;
import com.lq.bean.Customer;
import com.lq.service.android.Minner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MinnerServlet",urlPatterns="/android/MinnerServlet")
public class MinnerServlet extends BaseServlet
{
	Customer customer=null;
	Minner minner=new Minner();
    Gson gson=new Gson();
    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
            response.setContentType("text/html;charset=utf-8");
            System.out.println("运行doShow");
            String URL=request.getContextPath();
            response.sendRedirect(URL+"/android/Minner/Minner.jsp");
    }

}
