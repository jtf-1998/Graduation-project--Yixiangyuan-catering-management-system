package com.lq.dao;

import com.lq.bean.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteFromMysql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static int connt = 0;
    public static Connection con = null;

    public String DeleteByBillForm(String sql, String vegetable_id)  //从菜单中删除记录
    {
        int num = 0;                            //
        RestBillOfFare restBillOfFare =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, vegetable_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByPRoom(String sql, String P_room_id)  //从包间表中删除记录
    {
        int num = 0;                            //
        RestBillOfFare restBillOfFare =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, P_room_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByStaffBasic(String sql, String staff_id)  //从员工基本表中删除记录
    {
        int num = 0;                            //
        RestStaffBasicForm restStaffBasicForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, staff_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByStaffCheck(String sql, String staff_id,String date)  //从员工基本表中删除记录
    {
        int num = 0;                            //
        RestStaffBasicForm restStaffBasicForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, date);
            pstmt.setString(2, staff_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByStaffLeave(String sql, String staff_id,String date)  //从员工请假表中删除记录
    {
        int num = 0;                            //
        RestStaffBasicForm restStaffBasicForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, date);
            pstmt.setString(2, staff_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByKitchenPurchase(String sql, String purchase_date,String purchase_id)  //从进货表表中删除记录
    {
        int num = 0;                            //
        RestKitchenPurchase restKitchenPurchase=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, purchase_date);
            pstmt.setString(2, purchase_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByKitchenIngredientById(String sql, String ingredient_id)  //从配方表表中删除记录
    {
        int num = 0;                            //
        RestKitchenIngredientsManagement restKitchenIngredientsManagement=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, ingredient_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteOrderFormById(String sql, String order_id)  //从预订表中删除记录
    {
        int num = 0;
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, order_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByBillOrderVg(String sql,String bill_data,String bill_custmomer,String bill_proom,String vegetable_id)  //从点菜记录中删除记录
    {
        int num = 0;                            //
        BillAll billAll =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bill_data);
            pstmt.setString(2, bill_custmomer);
            pstmt.setString(3, bill_proom);
            pstmt.setString(4, vegetable_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByBillOrderAll(String sql)  //从点菜记录中删除菜数量为非法的记录
    {
        int num = 0;                            //
        BillAll billAll =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteTakeawayOrderFormById(String sql, String takeaway_id)  //从外卖表中删除记录
    {
        int num = 0;
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, takeaway_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteByRestPayForm(String sql, String bill_id)  //从账单表中删除记录
    {
        int num = 0;                            //
        RestPayForm restPayForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bill_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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

    public String DeleteBillAllBybvId(String sql, String bill_id,String vegetable_id)  //从点菜单表中删除记录
    {
        int num = 0;
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bill_id);
            pstmt.setString(2, vegetable_id);
            connt = pstmt.executeUpdate();
            if (connt > 0) {
                System.out.println("删除成功");
                return "yes";
            }
            else {
                System.out.println("删除失败");
                return "no";
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
