package com.lq.dao;

import com.lq.bean.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class AddFromMysql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static int connt = 0;
    public static Connection con = null;
    RestBillOfFare restBillOfFare=null;

    public String AddByBillForm(String sql, RestBillOfFare restBillOfFare)  //从菜单中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String vegetable_id=restBillOfFare.getVegetableId();
            String vegetable_type=restBillOfFare.getVegetableType();
            String vegetable_name=restBillOfFare.getVegetableName();
            String vegetable_image=restBillOfFare.getVegetableImage();
            String vegetable_price=restBillOfFare.getVegetablePrice();
            String vegetable_number=restBillOfFare.getVegetableNumber();
            String vegetable_remark=restBillOfFare.getVegetableRemark();
            pstmt.setString(1, vegetable_id);
            pstmt.setString(2,vegetable_type);
            pstmt.setString(3, vegetable_name);
            pstmt.setString(4, vegetable_image);
            pstmt.setString(5, vegetable_price);
            pstmt.setString(6, vegetable_number);
            pstmt.setString(7, vegetable_remark);

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

    public String AddByPRoom(String sql, RestPRoom restPRoom)  //从包间中添加记录
    {
        int num = 0;                            //
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String P_room_id=restPRoom.getPRoomId();
            String P_room_type=restPRoom.getPRoomType();
            String P_room_name=restPRoom.getPRoomName();
            String P_room_image=restPRoom.getPRoomImage();
            int P_room_number=restPRoom.getPRoomNumber();
            String P_room_state=restPRoom.getPRoomState();
            String P_room_remark= restPRoom.getPRoomRemark();
            String P_room_began= restPRoom.getPRoomBegan();
//            Timestamp P_room_began=Timestamp.valueOf(_began);
            String P_room_finish= restPRoom.getPRoomFinish();
//            Timestamp P_room_finish=Timestamp.valueOf(_finish);
            pstmt.setString(1, P_room_id);
            pstmt.setString(2, P_room_type);
            pstmt.setString(3, P_room_name);
            pstmt.setString(4, P_room_image);
            pstmt.setInt(5, P_room_number);
            pstmt.setString(6, P_room_state);
            pstmt.setString(7, P_room_remark);
            pstmt.setString(8, P_room_began);
            pstmt.setString(9, P_room_finish);

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

    public String AddByStaffBasic(String sql, RestStaffBasicForm restStaffBasicForm)  //从包间中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String staff_id=restStaffBasicForm.getStaffId();
            String staff_password=restStaffBasicForm.getStaffPassword();
            String staff_name=restStaffBasicForm.getStaffName();
            String staff_sex=restStaffBasicForm.getStaffSex();
            String staff_phone=restStaffBasicForm.getStaffPhone();
            String staff_section= restStaffBasicForm.getStaffSection();
            float staff_salary= restStaffBasicForm.getStaffSalary();
            float staff_remuneration= restStaffBasicForm.getStaffRemuneration();
            pstmt.setString(1, staff_id);
            pstmt.setString(2, staff_password);
            pstmt.setString(3, staff_name);
            pstmt.setString(4, staff_sex);
            pstmt.setString(5, staff_phone);
            pstmt.setString(6, staff_section);
            pstmt.setFloat(7, staff_salary);
            pstmt.setFloat(8, staff_remuneration);

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

    public String AddByStaffCheck(String sql, RestStaffCheckForm restStaffCheckForm)  //从员工审核中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String date=restStaffCheckForm.getDate();
            String staff_id=restStaffCheckForm.getStaffId();
            String staff_name=restStaffCheckForm.getStaffName();
            String staff_sex=restStaffCheckForm.getStaffSex();
            String staff_check= restStaffCheckForm.getStaffCheck();
            String staff_special_matters= restStaffCheckForm.getStaffSpecialMatters();
            float staff_data_deduction= restStaffCheckForm.getStaffDataDeduction();
            pstmt.setString(1, date);
            pstmt.setString(2, staff_id);
            pstmt.setString(3, staff_name);
            pstmt.setString(4, staff_sex);
            pstmt.setString(5, staff_check);
            pstmt.setString(6, staff_special_matters);
            pstmt.setFloat(7, staff_data_deduction);

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

    public String AddByStaffLeave(String sql, RestStaffLeaveForm restStaffLeaveForm)  //从员工审核中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String date=restStaffLeaveForm.getData();
            String staff_id=restStaffLeaveForm.getStaffId();
            String staff_name=restStaffLeaveForm.getStaffName();
            String staff_phone=restStaffLeaveForm.getStaffPhone();
            String staff_leave_began=restStaffLeaveForm.getStaffLeaveBegan();
            String staff_leave_finish= restStaffLeaveForm.getStaffLeaveFinish();
            String staff_leave_verify_stage= restStaffLeaveForm.getStaffLeaveVerifyStage();
            pstmt.setString(1, date);
            pstmt.setString(2, staff_id);
            pstmt.setString(3, staff_name);
            pstmt.setString(4, staff_phone);
            pstmt.setString(5, staff_leave_began);
            pstmt.setString(6, staff_leave_finish);
            pstmt.setString(7, staff_leave_verify_stage);

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

    public String AddByKitchenPurchase(String sql, RestKitchenPurchase restKitchenPurchase)  //从进货表中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String purchase_date=restKitchenPurchase.getPurchaseDate();
            String purchase_id=restKitchenPurchase.getPurchaseId();
            String purchase_name=restKitchenPurchase.getPurchaseName();
            String purchase_type=restKitchenPurchase.getPurchaseType();
            String purchase_person=restKitchenPurchase.getPurchasePerson();
            String purchase_phone= restKitchenPurchase.getPurchasePhone();
            float vegetable_stock=restKitchenPurchase.getVegetableStock();
            float purchase_number=restKitchenPurchase.getPurchaseNumber();
            float purchase_price=restKitchenPurchase.getPurchasePrice();
            pstmt.setString(1, purchase_date);
            pstmt.setString(2, purchase_id);
            pstmt.setString(3, purchase_name);
            pstmt.setString(4, purchase_type);
            pstmt.setString(5, purchase_person);
            pstmt.setString(6, purchase_phone);
            pstmt.setFloat(7,vegetable_stock);
            pstmt.setFloat(8,purchase_number);
            pstmt.setFloat(9,purchase_price);

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

    public String AddByOrder(String sql, OrderForm orderForm)  //从预订表中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String order_id=orderForm.getOrderId();
            String P_room_id=orderForm.getPRoomId();
            String order_date=orderForm.getOrderDate();
            String order_time=orderForm.getOrderTime();
            int customer_number=orderForm.getCustomerNumber();
            String order_griddle= orderForm.getOrderGriddle();
            String customer_phone= orderForm.getCustomerPhone();
            String customer_name= orderForm.getCustomerName();
            pstmt.setString(1, order_id);
            pstmt.setString(2, P_room_id);
            pstmt.setString(3, order_date);
            pstmt.setString(4, order_time);
            pstmt.setInt(5,customer_number);
            pstmt.setString(6,order_griddle);
            pstmt.setString(7,customer_phone);
            pstmt.setString(8, customer_name);

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

    public String AddByTakeawayOrder(String sql, TakeawayOrderForm takeawayOrderForm)  //从外卖表中添加记录
    {
        int num = 0;
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String takeaway_id=takeawayOrderForm.getTakeawayId();
            String takeaway_type=takeawayOrderForm.getTakeawayType();
            String takeaway_date=takeawayOrderForm.getTakeawayDate();
            String takeaway_time=takeawayOrderForm.getTakeawayTime();
            float takeaway_money=takeawayOrderForm.getTakeawayMoney();
            String customer_nickname= takeawayOrderForm.getCustomer_nickname();
            String customer_phone= takeawayOrderForm.getCustomer_phone();
            pstmt.setString(1,takeaway_id);
            pstmt.setString(2, takeaway_type);
            pstmt.setString(3, takeaway_date);
            pstmt.setString(4, takeaway_time);
            pstmt.setFloat(5,takeaway_money);
            pstmt.setString(6,customer_nickname);
            pstmt.setString(7,customer_phone);

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

    public String AddByRestPayForm(String sql, RestPayForm restPayForm)  //从账单表中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String bill_id=restPayForm.getBillId();
            String p_room_id=restPayForm.getPRoomId();
            String pay_date=restPayForm.getPayDate();
            String pay_time=restPayForm.getPayTime();
            String is_takeaway=restPayForm.getIsTakeaway();
            String takeaway_type=restPayForm.getTakeawayType();
            String pay_type= restPayForm.getPayType();
            float pay_price=restPayForm.getPayPrice();
            pstmt.setString(1, bill_id);
            pstmt.setString(2, p_room_id);
            pstmt.setString(3, pay_date);
            pstmt.setString(4, pay_time);
            pstmt.setString(5, is_takeaway);
            pstmt.setString(6,takeaway_type);
            pstmt.setString(7,pay_type);
            pstmt.setFloat(8,pay_price);

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
                System.out.println("注册成功");
                return "注册成功";
            }
            else {
                System.out.println("注册失败");
                return "注册失败";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("错误1");
            return "错误1";
        } catch (Exception e) {
            e.printStackTrace();
            return "错误2";
        } finally {
            connect.close(con, pstmt);
        }
    }

    public String AddByBillOrder(String sql, BillAll billAll)  //从点菜单中添加记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String bill_id=billAll.getBillId();
            String bill_data=billAll.getBillData();
            String bill_customer=billAll.getBillCustomer();
            String bill_proom=billAll.getBillProom();
            String vegetable_id=billAll.getVegetableId();
            String vegetable_type=billAll.getVegetableType();
            String vegetable_name=billAll.getVegetableName();
            double vegetable_price=billAll.getVegetablePrice();
            int vegetable_number=billAll.getVegetableNumber();
            String vegetable_state=billAll.getVegetableState();
            pstmt.setString(1, bill_id);
            pstmt.setString(2, bill_data);
            pstmt.setString(3, bill_customer);
            pstmt.setString(4, bill_proom);
            pstmt.setString(5, vegetable_id);
            pstmt.setString(6,vegetable_type);
            pstmt.setString(7, vegetable_name);
            pstmt.setDouble(8, vegetable_price);
            pstmt.setInt(9, vegetable_number);
            pstmt.setString(10,vegetable_state);

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
