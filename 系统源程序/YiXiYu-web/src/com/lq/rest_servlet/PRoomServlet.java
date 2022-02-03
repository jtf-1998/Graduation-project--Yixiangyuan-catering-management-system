package com.lq.rest_servlet;

import com.google.gson.Gson;
import com.lq.bean.RestPRoom;
import com.lq.service.PRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "PRoomServlet",urlPatterns="/rest/PRoomServlet")
public class PRoomServlet extends BaseServlet
{
    PRoom pRoom=new PRoom();
    RestPRoom restPRoom=null;
    Gson gson=new Gson();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    protected void doShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<RestPRoom> restPRooms=new ArrayList<RestPRoom>();
        restPRooms=pRoom.ShowPRoom();
        response.setContentType("text/html;charset=utf-8");
        System.out.println("运行doShow");
        HttpSession session=request.getSession();
        session.setAttribute("restPRooms",restPRooms);       //包间信息
        String URL=request.getContextPath();
        response.sendRedirect(URL+"/rest/room/p_room.jsp");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        System.out.println("运行doDelete");
        String P_room_id=null;
        String status=null;
        P_room_id=request.getParameter("P_room_id");
        status=pRoom.DeletePRoom(P_room_id);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }

    protected void doUpdateOrAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println("运行doUpdateOrAdd");
        String status=null;
        Date date=null;
        String P_room_id=request.getParameter("P_room_id");
        String P_room_type=request.getParameter("P_room_type");
        String P_room_name=request.getParameter("P_room_name");
        String P_room_image=request.getParameter("P_room_image");
        int P_room_number=Integer.parseInt(request.getParameter("P_room_number"));
        String P_room_state=request.getParameter("P_room_state");
        String P_room_remark=request.getParameter("P_room_remark");
        String P_room_began=request.getParameter("P_room_began");
        if(P_room_began!=""){ P_room_began=P_room_began.replaceAll("[A-Za-z]"," "); }
        System.out.println(P_room_began);
        String P_room_finish=request.getParameter("P_room_finish");
        if(P_room_finish!=""){ P_room_finish=P_room_finish.replaceAll("[A-Za-z]"," "); }
        System.out.println(P_room_finish);
        restPRoom=new RestPRoom(P_room_id,P_room_type,P_room_name,P_room_image,P_room_number,
                P_room_state,P_room_remark,P_room_began,P_room_finish);
        status=pRoom.UpdateOrAdd(restPRoom);
        System.out.println(status);
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("status",status);
        String resultJson=gson.toJson(resultMap);    //返回前端的json值
        response.getWriter().write(resultJson);      //将json值回传到前端
    }
}
