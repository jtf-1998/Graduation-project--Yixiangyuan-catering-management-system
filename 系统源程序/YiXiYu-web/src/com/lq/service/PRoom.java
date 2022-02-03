package com.lq.service;

import com.lq.bean.RestPRoom;
import com.lq.dao.AddFromMysql;
import com.lq.dao.DeleteFromMysql;
import com.lq.dao.QueryFromMysql;
import com.lq.dao.UpdateFromMysql;

import java.util.ArrayList;
import java.util.List;

public class PRoom {
    RestPRoom restPRoom=null;
    QueryFromMysql queryFromMysql=new QueryFromMysql();
    DeleteFromMysql deleteFromMysql=new DeleteFromMysql();
    UpdateFromMysql updateFromMysql=new UpdateFromMysql();
    AddFromMysql addFromMysql=new AddFromMysql();
    public List<RestPRoom> ShowPRoom()
    {
        List<RestPRoom> restPRooms=new ArrayList<RestPRoom>();
        String sql="select * from rest_p_room";
        restPRooms=queryFromMysql.SearchAllByPRoom(sql);
        if(restPRooms==null||restPRooms.isEmpty()){
            return null;
        }
        else {
            return restPRooms;
        }

    }
    public boolean QueryPRoomById(String P_room_id)
    {
        String sql="select * from rest_p_room where P_room_id=?";
        int num=0;
        num=queryFromMysql.QueryAllPRoomById(sql,P_room_id);
        if(num==1)
            return true;
        else
            return false;
    }
    public String DeletePRoom(String P_room_id)
    {
        String result="";
        String sql="delete from rest_p_room where P_room_id=?";
        if(QueryPRoomById(P_room_id))
        {
            result= deleteFromMysql.DeleteByPRoom(sql,P_room_id);
        }
        else {
            result="nohave";
        }
        return result;
    }
    public String UpdateOrAdd(RestPRoom restPRoom)
    {
        String result="";
        String P_room_id=restPRoom.getPRoomId();
        if(QueryPRoomById(P_room_id)){        //如果有该记录则调用修改方法
            String sql="UPDATE rest_p_room SET P_room_name=?,P_room_image=?," +
                    "P_room_number=?,P_room_state=?,P_room_remark=?,P_room_began=?," +
                    "P_room_finish=? WHERE " +
                    "P_room_id=?";
            result=updateFromMysql.UpdateByPRoom(sql,restPRoom);
        }
        else{
            String sql="insert into rest_p_room(P_room_id, P_room_type, " +
                    "P_room_name, P_room_image, P_room_number,P_room_state, P_room_remark, " +
                    "P_room_began, P_room_finish)" +
                    " VALUES(?,?,?,?,?,?,?,?,?)";
            result=addFromMysql.AddByPRoom(sql,restPRoom);
        }
        return result;
    }
    public String UpdatePRoomByOrder(RestPRoom restPRoom)
    {
        String result="";
        String sql="UPDATE rest_p_room SET P_room_state=?,P_room_began=?," +
                    "P_room_finish=? WHERE " +
                    "P_room_name=?";
        result=updateFromMysql.UpdatePRoomByOrder(sql,restPRoom);
        return  result;
    }
}
