package com.lq.dao;

import com.lq.bean.*;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class QueryFromMysql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static ResultSet result = null;
    public static Connection con = null;

    public List<Admin> SearchByAdmin(String sql, String admin_ID)  //管理员登录查询
    {
        int num = 0;                            //查询的条数
        Admin admin =null;
        List<Admin> admins = new ArrayList<Admin>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, admin_ID);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String admin_password=result.getString("admin_password");
                admin= new Admin(admin_ID,admin_password);
                //System.out.println(admin.toString());
                admins.add(admin);
            }
            return admins;
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

    public List<RestBillOfFare> SearchAllByBillOfFare(String sql)//查询菜单
    {
        int num = 0;                            //查询的条数
        RestBillOfFare restBillOfFare =null;
        List<RestBillOfFare> restBillOfFares = new ArrayList<RestBillOfFare>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String vegetable_id=result.getString("vegetable_id");
                String vegetable_type=result.getString("vegetable_type");
                String vegetable_name=result.getString("vegetable_name");
                String vegetable_image=result.getString("vegetable_image");
                String vegetable_price=result.getString("vegetable_price");
                String vegetable_number=result.getString("vegetable_number");
                String vegetable_remark=result.getString("vegetable_remark");
                restBillOfFare= new RestBillOfFare(vegetable_id,vegetable_type,vegetable_name,
                        vegetable_image,vegetable_price,vegetable_number,vegetable_remark);
//                System.out.println(restBillOfFare.toString());
                restBillOfFares.add(restBillOfFare);
            }
            return restBillOfFares;
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

    public List<RestBillOfFare> SearchByBillOfFare_Tip(String sql,String vegetable_type)
    {
        int num = 0;                            //查询的条数
        RestBillOfFare restBillOfFare =null;
        List<RestBillOfFare> restBillOfFares = new ArrayList<RestBillOfFare>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,vegetable_type);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String vegetable_id=result.getString("vegetable_id");
                vegetable_type=result.getString("vegetable_type");
                String vegetable_name=result.getString("vegetable_name");
                String vegetable_image=result.getString("vegetable_image");
                String vegetable_price=result.getString("vegetable_price");
                String vegetable_number=result.getString("vegetable_number");
                String vegetable_remark=result.getString("vegetable_remark");
                restBillOfFare= new RestBillOfFare(vegetable_id,vegetable_type,vegetable_name,
                        vegetable_image,vegetable_price,vegetable_number,vegetable_remark);
                //                System.out.println(restBillOfFare.toString());
                restBillOfFares.add(restBillOfFare);
            }
            return restBillOfFares;
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

    public RestBillOfFare SearchByBillOfFare_Name(String sql,String vegetable_name)
    {
        int num = 0;                            //查询的条数
        RestBillOfFare restBillOfFare =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,vegetable_name);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String vegetable_type=result.getString("vegetable_type");
                String vegetable_id=result.getString("vegetable_id");
                String vegetable_image=result.getString("vegetable_image");
                String vegetable_price=result.getString("vegetable_price");
                String vegetable_number=result.getString("vegetable_number");
                String vegetable_remark=result.getString("vegetable_remark");
                restBillOfFare= new RestBillOfFare(vegetable_id,vegetable_type,vegetable_name,
                        vegetable_image,vegetable_price,vegetable_number,vegetable_remark);
                //                System.out.println(restBillOfFare.toString());
            }
            return restBillOfFare;
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

    public int QueryAllBillOfFareById(String sql,String vegetable_id)
    {
        int num = 0;                            //查询的条数
        RestBillOfFare restBillOfFare =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,vegetable_id);
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

    //查询包间信息
    public List<RestPRoom> SearchAllByPRoom(String sql)//查询包间
    {
        int num = 0;                            //查询的条数
        RestPRoom restPRoom =null;
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        List<RestPRoom> restPRooms = new ArrayList<RestPRoom>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String P_room_id=result.getString("P_room_id");
                String P_room_type=result.getString("P_room_type");
                String P_room_name=result.getString("P_room_name");
                String P_room_image=result.getString("P_room_image");
                int P_room_number=result.getInt("P_room_number");
                String P_room_state=result.getString("P_room_state");
                String P_room_remark=result.getString("P_room_remark");
//                Timestamp _began=result.getTimestamp("P_room_began");
                String P_room_began=result.getString("P_room_began");
//                Timestamp _finish=result.getTimestamp("P_room_finish");
                String P_room_finish=result.getString("P_room_finish");
                restPRoom=new RestPRoom(P_room_id,P_room_type,P_room_name,P_room_image,
                        P_room_number,P_room_state,P_room_remark,P_room_began,P_room_finish);
                System.out.println(restPRoom.toString());
                restPRooms.add(restPRoom);
            }
            return restPRooms;
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

    public int QueryAllPRoomById(String sql,String P_room_id)
    {
        int num = 0;                            //查询的条数
        RestPRoom restPRoom =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,P_room_id);
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

    //查询员工基本信息
    public List<RestStaffBasicForm> SearchAllByStaffBasic(String sql)//查询员工基本信息
    {
        int num = 0;                            //查询的条数
        RestStaffBasicForm restStaffBasicForm=null;
        List<RestStaffBasicForm> restStaffBasicForms = new ArrayList<RestStaffBasicForm>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String staff_id=result.getString("staff_id");
                String staff_password=result.getString("staff_password");
                String staff_name=result.getString("staff_name");
                String staff_sex=result.getString("staff_sex");
                String staff_phone=result.getString("staff_phone");
                String staff_section=result.getString("staff_section");
                float staff_salary=result.getFloat("staff_salary");
                float staff_remuneration=result.getFloat("staff_remuneration");
                restStaffBasicForm=new RestStaffBasicForm(staff_id,staff_name,staff_password,staff_sex,staff_phone,staff_section,staff_salary,staff_remuneration);
//                System.out.println(restStaffBasicForm.toString());
                restStaffBasicForms.add(restStaffBasicForm);
            }
            return restStaffBasicForms;
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

    public int QueryAllStaffBasicById(String sql,String staff_id)
    {
        int num = 0;                            //查询的条数
        RestStaffBasicForm restStaffBasicForm =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,staff_id);
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

    //查询员工基本信息
    public List<RestStaffCheckForm> SearchAllByStaffCheck(String sql)//查询员工基本信息
    {
        int num = 0;                            //查询的条数
        RestStaffCheckForm restStaffCheckForm=null;
        List<RestStaffCheckForm> restStaffCheckForms = new ArrayList<RestStaffCheckForm>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String date=result.getString("date");
                String staff_id=result.getString("staff_id");
                String staff_name=result.getString("staff_name");
                String staff_sex=result.getString("staff_sex");
                String staff_check=result.getString("staff_check");
                String staff_special_matters=result.getString("staff_special_matters");
                float staff_data_deduction=result.getFloat("staff_data_deduction");
                restStaffCheckForm=new RestStaffCheckForm(date,staff_id,staff_name,staff_sex,staff_check,staff_special_matters,staff_data_deduction);
//                System.out.println(restStaffCheckForm.toString());
                restStaffCheckForms.add(restStaffCheckForm);
            }
            return restStaffCheckForms;
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

    public int QueryAllStaffCheckByIdAndDate(String sql,String staff_id,String date)
    {
        int num = 0;                            //查询的条数
        RestStaffCheckForm restStaffCheckForm =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,date);
            pstmt.setString(2,staff_id);
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

    public List<RestStaffLeaveForm> SearchAllByStaffLeave(String sql)//查询员工请假信息
    {
        int num = 0;                            //查询的条数
        RestStaffLeaveForm restStaffLeaveForm=null;
        List<RestStaffLeaveForm> restStaffLeaveForms = new ArrayList<RestStaffLeaveForm>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String date=result.getString("data");
                String staff_id=result.getString("staff_id");
                String staff_name=result.getString("staff_name");
                String staff_phone=result.getString("staff_phone");
                String staff_leave_began=result.getString("staff_leave_began");
                String staff_leave_finish=result.getString("staff_leave_finish");
                String staff_leave_verify_stage=result.getString("staff_leave_verify_stage");
                restStaffLeaveForm=new RestStaffLeaveForm(date,staff_id,staff_name,staff_phone,staff_leave_began,staff_leave_finish,staff_leave_verify_stage);
                 System.out.println(restStaffLeaveForm.toString());
                restStaffLeaveForms.add(restStaffLeaveForm);
            }
            return restStaffLeaveForms;
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

    public int QueryAllStaffLeaveByIdAndDate(String sql,String staff_id,String date)
    {
        int num = 0;                            //查询的条数
        RestStaffCheckForm restStaffCheckForm =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,date);
            pstmt.setString(2,staff_id);
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

    //查询进货表基本信息
    public List<RestKitchenPurchase> SearchAllByKitchenPurchase(String sql,String purchase_date)
    {
        int num = 0;                            //查询的条数
        RestKitchenPurchase restKitchenPurchase=null;
        List<RestKitchenPurchase> restKitchenPurchases = new ArrayList<RestKitchenPurchase>();
        try {
            con = Connect.reCon();
            if(purchase_date.equals("null")){
                pstmt = con.prepareStatement(sql);
            }
            else {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,purchase_date);
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                purchase_date=result.getString("purchase_date");
                String purchase_id=result.getString("purchase_id");
                String purchase_name=result.getString("purchase_name");
                String purchase_type=result.getString("purchase_type");
                String purchase_person=result.getString("purchase_person");
                String purchase_phone=result.getString("purchase_phone");
                float vegetable_stock=result.getFloat("vegetable_stock");
                float purchase_number=result.getFloat("purchase_number");
                float purchase_price=result.getFloat("purchase_price");
                restKitchenPurchase=new RestKitchenPurchase(purchase_date,purchase_id,purchase_name,purchase_type,purchase_person,purchase_phone,vegetable_stock,purchase_number,purchase_price);
//                System.out.println(restKitchenPurchase.toString());
                restKitchenPurchases.add(restKitchenPurchase);
            }
            return restKitchenPurchases;
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

    public int QueryAllKitchenPurchaseByIdAndDate(String sql,String purchase_date,String purchase_id)
    {
        int num = 0;                            //查询的条数
        RestKitchenPurchase restKitchenPurchase =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,purchase_date);
            pstmt.setString(2,purchase_id);
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

    //查询进货表基本信息
    public List<RestKitchenIngredientsManagement> SearchAllByKitchenIngredientsManagement(String sql)
    {
        int num = 0;                            //查询的条数
        RestKitchenIngredientsManagement restKitchenIngredientsManagement=null;
        List<RestKitchenIngredientsManagement> restKitchenIngredientsManagements = new ArrayList<RestKitchenIngredientsManagement>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String ingredient_id=result.getString("ingredient_id");
                String ingredient_name=result.getString("ingredient_name");
                String ingredient_type=result.getString("ingredient_type");
                String purchase_mes=result.getString("purchase_mes");
                restKitchenIngredientsManagement=new RestKitchenIngredientsManagement(ingredient_id,ingredient_name,ingredient_type,purchase_mes);
                                System.out.println(restKitchenIngredientsManagement.toString());
                restKitchenIngredientsManagements.add(restKitchenIngredientsManagement);
            }
            return restKitchenIngredientsManagements;
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

    public int QueryAllByKitchenIngredientById(String sql,String ingredient_id)
    {
        int num = 0;                            //查询的条数
        RestKitchenIngredientsManagement restKitchenIngredientsManagement =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,ingredient_id);
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

    //查询预订表基本信息
    public List<OrderForm> SearchAllOrderForm(String sql,String order_date)
    {
        int num = 0;                            //查询的条数
        OrderForm orderForm=null;
        List<OrderForm> orderForms = new ArrayList<OrderForm>();
        try {
            con = Connect.reCon();
            if(order_date.equals("null")){
                pstmt = con.prepareStatement(sql);
            }
            else {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,order_date);
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                order_date=result.getString("order_date");
                String order_id=result.getString("order_id");
                String P_room_id=result.getString("P_room_id");
                String order_time=result.getString("order_time");
                int customer_number=result.getInt("customer_number");
                String order_griddle=result.getString("order_griddle");
                String customer_phone=result.getString("customer_phone");
                String customer_name=result.getString("customer_name");
                orderForm=new OrderForm(order_id,P_room_id,order_date,order_time,customer_number,order_griddle,customer_phone,customer_name);
                                System.out.println(orderForm.toString());
                orderForms.add(orderForm);
            }
            return orderForms;
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

    //查询预订表基本信息
    public OrderForm SearchAllOrderFormById(String sql,String order_id)
    {
        int num = 0;                            //查询的条数
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            if(order_id.equals("null")){
                pstmt = con.prepareStatement(sql);
            }
            else {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,order_id);
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String order_date=result.getString("order_date");
                order_id=result.getString("order_id");
                String P_room_id=result.getString("P_room_id");
                String order_time=result.getString("order_time");
                int customer_number=result.getInt("customer_number");
                String order_griddle=result.getString("order_griddle");
                String customer_phone=result.getString("customer_phone");
                String customer_name=result.getString("customer_name");
                orderForm=new OrderForm(order_id,P_room_id,order_date,order_time,customer_number,order_griddle,customer_phone,customer_name);
            }
            return orderForm;
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

    public int QueryAllOrderFormById(String sql,String order_id)
    {
        int num = 0;                            //查询的条数
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,order_id);
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

    public String SearchStateFromPRoom(String sql, String P_room_id,String order_datetime)  //从包间表中查询记录
    {
        int num = 0;
        String P_room_state=null;
        OrderForm orderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, P_room_id);
            pstmt.setString(2, order_datetime);
            pstmt.setString(3, order_datetime);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                P_room_state=result.getString("P_room_state");
            }
            return P_room_state;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            return P_room_state;
        } catch (Exception e) {
            e.printStackTrace();
            return P_room_state;
        } finally {
            connect.close(con, pstmt);
        }
    }

    //查询所有外卖信息
    public List<TakeawayOrderForm> SearchAllTakeawayOrderForm(String sql,String takeaway_date,String takeaway_type)
    {
        int num = 0;
        TakeawayOrderForm takeawayOrderForm=null;
        List<TakeawayOrderForm> takeawayOrderForms = new ArrayList<TakeawayOrderForm>();
        try {
            con = Connect.reCon();
            if(takeaway_date.equals("null")&&takeaway_type.equals("null")){
                pstmt = con.prepareStatement(sql);
            }else{
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,takeaway_date);
                pstmt.setString(2,takeaway_type);
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String takeaway_id=result.getString("takeaway_id");
                takeaway_date=result.getString("takeaway_date");
                String takeaway_time=result.getString("takeaway_time");
                takeaway_type=result.getString("takeaway_type");
                float takeaway_money=result.getFloat("takeaway_money");
                String customer_nickname=result.getString("customer_nickname");
                String customer_phone=result.getString("customer_phone");
                takeawayOrderForm=new TakeawayOrderForm(takeaway_id,takeaway_type,takeaway_date,takeaway_time,takeaway_money,customer_nickname,customer_phone);

                takeawayOrderForms.add(takeawayOrderForm);
            }
            return takeawayOrderForms;
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

    //查询外卖信息是否存在
    public int QueryAllTakeawayOrderFormById(String sql,String takeaway_id)
    {
        int num = 0;                            //查询的条数
        TakeawayOrderForm takeawayOrderForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,takeaway_id);
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

    //查询账单基本信息
    public List<RestPayForm> SearchAllByRestPayForm(String sql,String pay_date)
    {
        int num = 0;                            //查询的条数
        RestPayForm restPayForm=null;
        List<RestPayForm> restPayForms = new ArrayList<RestPayForm>();
        try {
            con = Connect.reCon();
            if(pay_date.equals("null")){
                pstmt = con.prepareStatement(sql);
            }
            else {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,pay_date);
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String bill_id=result.getString("bill_id");
                String p_room_id=result.getString("p_room_id");
                String pay_time=result.getString("pay_time");
                pay_date=result.getString("pay_date");
                String is_takeaway=result.getString("is_takeaway");
                String takeaway_type=result.getString("takeaway_type");
                String pay_type=result.getString("pay_type");
                float pay_price=result.getFloat("pay_price");
                restPayForm=new RestPayForm(bill_id,p_room_id,pay_date,pay_time,is_takeaway,takeaway_type,pay_type,pay_price);
                restPayForms.add(restPayForm);
            }
            return restPayForms;
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

    //查询账单基本信息
    public ArrayList<Analyze> SearchAllByRestPayFormFromBeganToFinish(String sql,String began_date,String finish_date)
    {
        int num1 = 0;                            //查询的条数
        Analyze analyze=null;
        ArrayList<Analyze> analyzes = new ArrayList<Analyze>();
        try {
            con = Connect.reCon();
            if(began_date.equals("null")||finish_date.equals("null")){
                pstmt = con.prepareStatement(sql);
            }
            else {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,began_date);
                pstmt.setString(2,finish_date);
                System.out.println("date is not null");
            }
            result = pstmt.executeQuery();
            while (result.next()) {
                num1++;
                String name=result.getString("name");
                String num=result.getString("num");
                analyze=new Analyze(name,num);
                analyzes.add(analyze);
            }
            return analyzes;
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

    //根据菜单号查询账单基本信息
    public RestPayForm SearchRestPayFormById(String sql,String bill_id)
    {
        RestPayForm restPayForm=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,bill_id);
            result = pstmt.executeQuery();
            while (result.next()) {
                String pay_date=result.getString("pay_date");
                String p_room_id=result.getString("p_room_id");
                String pay_time=result.getString("pay_time");
                String is_takeaway=result.getString("is_takeaway");
                String takeaway_type=result.getString("takeaway_type");
                String pay_type=result.getString("pay_type");
                float pay_price=result.getFloat("pay_price");
                restPayForm=new RestPayForm(bill_id,p_room_id,pay_date,pay_time,is_takeaway,takeaway_type,pay_type,pay_price);
                //                System.out.println(restKitchenPurchase.toString());
            }
            return restPayForm;
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

//根据Id查询账单是否存在
    public int QueryAllRestPayFormById(String sql,String bill_id)
    {
        int num = 0;                            //查询的条数
        RestPayForm restPayForm =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,bill_id);
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

    public Customer QueryAllCustomerByPhone(String sql,String customer_phone)
    {
        int number = 0;
        Customer customer=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, customer_phone);
            result = pstmt.executeQuery();

            while (result.next()) {
                number++;
                String customer_nickname=result.getString("customer_nickname");
                String customer_sex=result.getString("customer_sex");
                customer_phone=result.getString("customer_phone");
                String customer_name=result.getString("customer_name");
                String birth=result.getString("birth");
                customer=new Customer(customer_nickname,customer_sex,customer_phone,customer_name,birth);
            }
            return customer;
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

    public Customer SearchCustomerByphone(String sql,String customer_phone)
    {
        int num = 0;
        Customer customer=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,customer_phone);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String customer_nickname=result.getString("customer_nickname");
                String customer_sex=result.getString("customer_sex");
                String customer_password=result.getString("customer_password");
                customer=new Customer(customer_nickname,customer_sex,customer_password,customer_phone);
                System.out.println(customer.toString());
            }
            return customer;
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

    public List<BillAll> SearchAllByBillAll(String sql)//查询菜单
    {
        int num = 0;                            //查询的条数
        BillAll billAll =null;
        List<BillAll> billAlls = new ArrayList<BillAll>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String bill_id=result.getString("bill_id");
                String bill_data=result.getString("bill_data");
                String bill_customer=result.getString("bill_customer");
                String bill_poom=result.getString("bill_poom");
                String vegetable_id=result.getString("vegetable_id");
                String vegetable_type=result.getString("vegetable_type");
                String vegetable_name=result.getString("vegetable_name");
                double vegetable_price=result.getDouble("vegetable_price");
                int vegetable_number=result.getInt("vegetable_number");
                String vegetable_state=result.getString("vegetable_state");
                billAll= new BillAll(bill_id,bill_data,bill_customer,bill_poom,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
                //                System.out.println(restBillOfFare.toString());
                billAlls.add(billAll);
            }
            return billAlls;
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

	public List<BillAll> SearchAllByBillAllOfId(String sql,String bill_id)//查询菜单
	{
		int num = 0;                            //查询的条数
		BillAll billAll =null;
		List<BillAll> billAlls = new ArrayList<BillAll>();
		try {
			con = Connect.reCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bill_id);
			result = pstmt.executeQuery();
			while (result.next()) {
				num++;
				String bill_data=result.getString("bill_data");
				String bill_customer=result.getString("bill_customer");
				String bill_proom=result.getString("bill_proom");
				String vegetable_id=result.getString("vegetable_id");
				String vegetable_type=result.getString("vegetable_type");
				String vegetable_name=result.getString("vegetable_name");
				double vegetable_price=result.getDouble("vegetable_price");
				int vegetable_number=result.getInt("vegetable_number");
				String vegetable_state=result.getString("vegetable_state");
				billAll= new BillAll(bill_id,bill_data,bill_customer,bill_proom,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
				//                System.out.println(restBillOfFare.toString());
				billAlls.add(billAll);
			}
			return billAlls;
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

    public List<BillAll> SearchBillOfOrderBycdp
            (String sql,String bill_data,String bill_custmomer,String bill_proom)
    {
        int num = 0;                            //查询的条数
        BillAll billAll =null;
        List<BillAll> billAlls = new ArrayList<BillAll>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,bill_data);
            pstmt.setString(2,bill_custmomer);
            pstmt.setString(3,bill_proom);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String bill_id=result.getString("bill_id");
                String vegetable_id=result.getString("vegetable_id");
                String vegetable_type=result.getString("vegetable_type");
                String vegetable_name=result.getString("vegetable_name");
                double vegetable_price=result.getDouble("vegetable_price");
                int vegetable_number=result.getInt("vegetable_number");
                String vegetable_state=result.getString("vegetable_state");
                billAll= new BillAll(bill_id,bill_data,bill_custmomer,bill_proom,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
                //                System.out.println(restBillOfFare.toString());
                billAlls.add(billAll);
            }
            return billAlls;
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

    //根据Id查询点菜单点的菜
    public List<BillAll> SearchBillAllById
            (String sql,String bill_id)
    {
        int num = 0;                            //查询的条数
        BillAll billAll =null;
        List<BillAll> billAlls = new ArrayList<BillAll>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,bill_id);
            result = pstmt.executeQuery();
            while (result.next()) {
                num++;
                String vegetable_id=result.getString("vegetable_id");
                String vegetable_type=result.getString("vegetable_type");
                String vegetable_name=result.getString("vegetable_name");
                double vegetable_price=result.getDouble("vegetable_price");
                int vegetable_number=result.getInt("vegetable_number");
                String vegetable_state=result.getString("vegetable_state");
                billAll= new BillAll(bill_id,vegetable_id,vegetable_type,vegetable_name,vegetable_price,vegetable_number,vegetable_state);
                //                System.out.println(restBillOfFare.toString());
                billAlls.add(billAll);
            }
            return billAlls;
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

    //根据Id查询点菜单点的菜
    public List<BillAll> SearchBillAllByData
    (String sql,String bill_data)
    {
        int num = 0;                            //查询的条数
        BillAll billAll =null;
        List<BillAll> billAlls = new ArrayList<BillAll>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            if(bill_data.equals("null")){
                result = pstmt.executeQuery();
            }else {
                pstmt.setString(1,bill_data);
                result = pstmt.executeQuery();
            }

            while (result.next()) {
                num++;
                String bill_id=result.getString("bill_id");
                bill_data=result.getString("bill_data");
                String bill_customer=result.getString("bill_customer");
                String bill_proom=result.getString("bill_proom");
                billAll= new BillAll(bill_id,bill_data,bill_customer,bill_proom);
//                                System.out.println(billAll.toString());
                billAlls.add(billAll);
            }
            return billAlls;
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

    public List<PayForm> QueryAllBillAllBydate(String sql,String bill_data,String bill_custmomer)
    {
        int number = 0;
        String bill_id=null;                         //查询点菜单号
        PayForm payForm=null;
        List<PayForm> payForms=new ArrayList<PayForm>();
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            if(bill_custmomer==null||bill_custmomer.isEmpty()){
                pstmt.setString(1, bill_data);
                result = pstmt.executeQuery();
            }
            else {
                pstmt.setString(1, bill_data);
                pstmt.setString(2, bill_custmomer);
                result = pstmt.executeQuery();
            }

            while (result.next()) {
                number++;
                bill_id=result.getString("bill_id");
                float zongjia=result.getFloat("zongjia");
                String bill_proom=result.getString("bill_proom");
                payForm=new PayForm(bill_id,bill_proom,bill_data,zongjia);
                payForms.add(payForm);
            }
            return payForms;
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

	public PayForm QueryAllBillAllById(String sql,String bill_data,String bill_custmomer)
	{
		int number = 0;
		String bill_id=null;                         //查询点菜单号
        PayForm payForm=null;
		try {
			con = Connect.reCon();
			pstmt = con.prepareStatement(sql);
			if(bill_custmomer==null||bill_custmomer.isEmpty()){
                pstmt.setString(1, bill_data);
                result = pstmt.executeQuery();
            }
            else {
                pstmt.setString(1, bill_data);
                pstmt.setString(2, bill_custmomer);
                result = pstmt.executeQuery();
            }

			while (result.next()) {
				number++;
				bill_id=result.getString("bill_id");
				float zongjia=result.getFloat("zongjia");
				String bill_proom=result.getString("bill_proom");
				payForm=new PayForm(bill_id,bill_proom,bill_data,zongjia);
			}
			return payForm;
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

	public int QueryAllBillAllByNumber(String sql,String bill_data,String bill_custmomer,String bill_proom,String vegetable_id)
	{
		int number = 0;
		int vegetable_number=0;                         //查询点的菜数

		try {
			con = Connect.reCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bill_data);
			pstmt.setString(2, bill_custmomer);
			pstmt.setString(3, bill_proom);
			pstmt.setString(4, vegetable_id);
			result = pstmt.executeQuery();
			while (result.next()) {
				number++;
				vegetable_number=result.getInt("vegetable_number");
			}
			return vegetable_number;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("错误1");
			number=-1;
			return vegetable_number;
		} catch (Exception e) {
			e.printStackTrace();
			number=-2;
			return vegetable_number;
		} finally {
			connect.close(con, pstmt, result);
		}
	}

    public int QueryAllBillOfOrderByNumber(String sql,String bill_data,String bill_custmomer,String bill_proom,String vegetable_id)
    {
        int number = 0;                            //查询的条数
        BillAll billAll =null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bill_data);
            pstmt.setString(2, bill_custmomer);
            pstmt.setString(3, bill_proom);
            pstmt.setString(4, vegetable_id);
            result = pstmt.executeQuery();
            while (result.next()) {
                number++;
            }
            return number;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            number=-1;
            return number;
        } catch (Exception e) {
            e.printStackTrace();
            number=-2;
            return number;
        } finally {
            connect.close(con, pstmt, result);
        }
    }

    public int QueryBillALlBybvId(String sql,String bill_all,String vegetable_id)
    {
        int num = 0;                            //查询的条数
        BillAll billAll=null;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,bill_all);
            pstmt.setString(2,vegetable_id);
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
