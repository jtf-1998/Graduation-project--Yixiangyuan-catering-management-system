package com.lq.service;

import com.lq.bean.Admin;
import com.lq.dao.QueryFromMysql;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Login                //如果登录信息存在于admin表则返回yes
{

    public String Judge(String admin_ID,String admin_password)
    {
        QueryFromMysql queryFromMysql=new QueryFromMysql();
        Admin admin=null;
        String password=null;
        String status=null;
        String sql="select * from admin where admin_ID=?";
        List<Admin>admins=new ArrayList<Admin>();
        admins=queryFromMysql.SearchByAdmin(sql,admin_ID);
        if(admins==null||admins.isEmpty()){
            System.out.println("查不到此账号");
        }
        else {
            admin=new Admin(admin_ID,admin_password);
            admin=admins.get(0);
            password=admin.getAdminPassword();
            //System.out.println("密码："+password);
            if(password.equals(admin_password))
            {
                status="yes";
            }else{
                status="no";
            }
        }
        return status;
    }

}
