package com.yixiyu.lq.yixiyuandroid_customer.dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.yixiyu.lq.yixiyuandroid_customer.bean.*;
public class AddForMySql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static int connt = 0;
    public static Connection con = null;

    public String AddByCustomer(String sql, Customer customer)  //从客户表中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String customer_nickname=customer.getCustomerNickname();
            String customer_sex=customer.getCustomerSex();
            String customer_password=customer.getCustomerPassword();
            String customer_phone=customer.getCustomerPhone();
            pstmt.setString(1, customer_nickname);
            pstmt.setString(2,customer_sex);
            pstmt.setString(3, customer_password);
            pstmt.setString(4, customer_phone);

            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("添加成功");
                return "addyes";
            }
            else {
                System.out.println("添加失败");
                return "addno";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            return "error";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        } finally {
            connect.close(con, pstmt);
        }
    }
}
