package com.yixiyu.lq.yixiyuandroid_customer.dao;
import java.sql.*;

public class Connect
{
    private static Connection conn=null;
    //注册驱动，驱动只需要加载一次即可
    //所以写在静态代码段中（static）
    //类的静态代码块，随着类的加载，只执行一次。
    public static String DriverName="com.mysql.jdbc.Driver";
    public static String UName="root";
    public static String Upwd="1108.shjzh..sql.lq";
    public static String Url="jdbc:mysql://192.168.137.1:3306/yixiyu?useSSL=false&useUnicode=true&zeroDateTimeBehavior=convertToNull" +
            "&characterEncoding=UTF-8";

    public static Connection reCon()
    {
        try {
            Class.forName(DriverName);
            conn=DriverManager.getConnection(Url, UName, Upwd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("MySQL驱动连接错误！");
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("yixiyu数据库连接错误！");
        }
        return conn;
    }
    //创建数据库关闭的工具类(查询）
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet result){
        try {
            if(result!=null) result.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
    //创建数据库关闭的工具类(非查询）
    public static void close(Connection conn,PreparedStatement pstmt){

        if (pstmt!=null)
        {
            try
            {
                pstmt.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        if (conn!=null)
        {
            try
            {
                conn.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
    }
}

