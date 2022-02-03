package com.yixiyu.lq.yixiyuandroid_customer.dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.yixiyu.lq.yixiyuandroid_customer.bean.*;
public class QueryForMySql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static ResultSet result = null;
    public static Connection con = null;

    public List<Customer> SearchCustomer(String sql)
    {
        int num = 0;                            //查询所有客户信息
        Customer customer=null;
        List<Customer> customers = new ArrayList<Customer>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);

            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String customer_nickname=result.getString("customer_nickname");
                String customer_sex=result.getString("customer_sex");
                String customer_password=result.getString("customer_password");
                String customer_phone=result.getString("customer_phone");
                customer=new Customer(customer_nickname,customer_sex,customer_password,customer_phone);
                System.out.println(customer.toString());
                customers.add(customer);
            }
            return customers;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            connect.close(con, pstmt, result);
        }
    }

    public int QueryCustomerByNameAndPass(String sql,String customer_phone,String customer_password)
    {
        int num = 0;                            //查询的条数
        Customer customer=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,customer_phone);
            pstmt.setString(2,customer_password);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
            }
            return num;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            num=-1;
            return num;
        } catch (Exception e) {
            e.printStackTrace();
            num=-2;
            return num;
        } finally {
            connect.close(con, pstmt, result);
        }
    }
}
