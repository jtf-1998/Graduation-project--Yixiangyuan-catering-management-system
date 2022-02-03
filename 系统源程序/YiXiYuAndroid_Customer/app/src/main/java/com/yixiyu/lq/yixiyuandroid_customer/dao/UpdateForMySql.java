package com.yixiyu.lq.yixiyuandroid_customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.yixiyu.lq.yixiyuandroid_customer.bean.*;
public class UpdateForMySql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static int connt = 0;
    public static Connection con = null;
    Customer customer=null;

    public String UpdateCustomer(String sql, Customer customer)  //从客户表中修改记录
    {
        int num = 0;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String customer_nickname=customer.getCustomerNickname();
            String customer_sex=customer.getCustomerSex();
            String customer_password= customer.getCustomerPassword();
            String customer_phone=customer.getCustomerPhone();
            pstmt.setString(1, customer_nickname);
            pstmt.setString(2, customer_sex);
            pstmt.setString(3, customer_password);
            pstmt.setString(4, customer_phone);
            pstmt.setString(5, customer_phone);
            pstmt.setString(6, customer_password);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("修改成功");
                return "updateyes";
            }
            else {
                System.out.println("修改失败");
                return "updateno";
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

    public String UpdateCustomerPassword(String sql, Customer customer)  //从客户表中修改密码
    {
        int num = 0;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String customer_password= customer.getCustomerPassword();
            String customer_phone=customer.getCustomerPhone();
            pstmt.setString(1, customer_password);
            pstmt.setString(2, customer_phone);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("修改成功");
                return "updateyes";
            }
            else {
                System.out.println("修改失败");
                return "updateno";
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
