package com.lq.dao;

import com.lq.bean.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateFromMysql
{
    public static Connect connect = new Connect();
    public static PreparedStatement pstmt = null;
    public static int connt = 0;
    public static Connection con = null;
    RestBillOfFare restBillOfFare=null;
    RestPRoom restPRoom=null;

    public String UpdateByBillForm(String sql, RestBillOfFare restBillOfFare)  //从菜单中删除记录
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
            pstmt.setString(1, vegetable_name);
            pstmt.setString(2, vegetable_image);
            pstmt.setString(3, vegetable_price);
            pstmt.setString(4, vegetable_number);
            pstmt.setString(5, vegetable_remark);
            pstmt.setString(6, vegetable_id);
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

    public String UpdateByPRoom(String sql, RestPRoom restPRoom)  //从菜单中删除记录
    {
        int num = 0;                            //
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
            pstmt.setString(1, P_room_name);
            pstmt.setString(2, P_room_image);
            pstmt.setInt(3, P_room_number);
            pstmt.setString(4, P_room_state);
            pstmt.setString(5, P_room_remark);
            pstmt.setString(6, P_room_began);
            pstmt.setString(7, P_room_finish);
            pstmt.setString(8, P_room_id);
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

    public String UpdatePRoomByOrder(String sql, RestPRoom restPRoom)  //从包间中修改记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String P_room_name=restPRoom.getPRoomName();
            String P_room_state=restPRoom.getPRoomState();
            String P_room_began= restPRoom.getPRoomBegan();
            String P_room_finish= restPRoom.getPRoomFinish();
            pstmt.setString(1, P_room_state);
            pstmt.setString(2, P_room_began);
            pstmt.setString(3, P_room_finish);
            pstmt.setString(4, P_room_name);
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

    public String UpdateByStaffBasic(String sql, RestStaffBasicForm restStaffBasicForm)  //从菜单中删除记录
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
            pstmt.setString(1, staff_password);
            pstmt.setString(2, staff_name);
            pstmt.setString(3, staff_sex);
            pstmt.setString(4, staff_phone);
            pstmt.setString(5, staff_section);
            pstmt.setFloat(6, staff_salary);
            pstmt.setFloat(7, staff_remuneration);
            pstmt.setString(8, staff_id);
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

    public String UpdateByStaffBasicRem(String sql, float staff_remuneration,String staff_id)  //从菜单中删除记录
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            pstmt.setFloat(1, staff_remuneration);
            pstmt.setString(2, staff_id);
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

    public String UpdateByStaffCheck(String sql, RestStaffCheckForm restStaffCheckForm)  //
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String date=restStaffCheckForm.getDate();
            String staff_id=restStaffCheckForm.getStaffId();
            String staff_name=restStaffCheckForm.getStaffName();
            String staff_sex=restStaffCheckForm.getStaffSex();
            String staff_check=restStaffCheckForm.getStaffCheck();
            String staff_special_matters= restStaffCheckForm.getStaffSpecialMatters();
            float staff_data_deduction= restStaffCheckForm.getStaffDataDeduction();
            pstmt.setString(1, staff_check);
            pstmt.setString(2, staff_special_matters);
            pstmt.setFloat(3, staff_data_deduction);
            pstmt.setString(4, date);
            pstmt.setString(5, staff_id);
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

    public String UpdateByStaffLeave(String sql, RestStaffLeaveForm restStaffLeaveForm)  //
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
            pstmt.setString(1, staff_leave_began);
            pstmt.setString(2, staff_leave_finish);
            pstmt.setString(3, staff_leave_verify_stage);
            pstmt.setString(4, date);
            pstmt.setString(5, staff_id);
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

    public String UpdateByKitchenPurchase(String sql, RestKitchenPurchase restKitchenPurchase)  //
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
            pstmt.setString(1, purchase_name);
            pstmt.setString(2, purchase_type);
            pstmt.setString(3, purchase_person);
            pstmt.setString(4, purchase_phone);
            pstmt.setFloat(5,vegetable_stock);
            pstmt.setFloat(6,purchase_number);
            pstmt.setFloat(7,purchase_price);
            pstmt.setString(8, purchase_date);
            pstmt.setString(9, purchase_id);
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

    //修改预订信息
    public String UpdateByOrder(String sql, OrderForm orderForm)  //
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
            pstmt.setString(1, P_room_id);
            pstmt.setString(2, order_date);
            pstmt.setString(3, order_time);
            pstmt.setInt(4,customer_number);
            pstmt.setString(5,order_griddle);
            pstmt.setString(6,customer_phone);
            pstmt.setString(7, customer_name);
            pstmt.setString(8, order_id);
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

    public String UpdateByTakeawayOrder(String sql, TakeawayOrderForm takeawayOrderForm)  //
    {
        int num = 0;                            //
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
            pstmt.setString(1, takeaway_type);
            pstmt.setString(2, takeaway_date);
            pstmt.setString(3, takeaway_time);
            pstmt.setFloat(4,takeaway_money);
            pstmt.setString(5,customer_nickname);
            pstmt.setString(6,customer_phone);
            pstmt.setString(7,takeaway_id);
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

    public String UpdateByRestPayForm(String sql, RestPayForm restPayForm)  //根据bill_id修改支付表
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
            pstmt.setString(1, p_room_id);
            pstmt.setString(2, pay_date);
            pstmt.setString(3, pay_time);
            pstmt.setString(4, is_takeaway);
            pstmt.setString(5,takeaway_type);
            pstmt.setString(6,pay_type);
            pstmt.setFloat(7,pay_price);
            pstmt.setString(8, bill_id);
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

    public String UpdateNumByBillOrder(String sql, BillAll billAll)  //从点菜单中修改信息
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
            pstmt.setInt(1, vegetable_number);
            pstmt.setString(2, bill_data);
            pstmt.setString(3, bill_customer);
            pstmt.setString(4, bill_proom);
            pstmt.setString(5, vegetable_id);
            System.out.println(sql);
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

    public String UpdateBillAllByBillOrder(String sql, BillAll billAll,String vegetable_id_old)  //从点菜单中修改信息
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

            pstmt.setString(1, vegetable_id);
            pstmt.setString(2, vegetable_type);
            pstmt.setString(3, vegetable_name);
            pstmt.setDouble(4, vegetable_price);
            pstmt.setInt(5, vegetable_number);
            pstmt.setString(6, vegetable_state);
            pstmt.setString(7, bill_id);
            pstmt.setString(8, vegetable_id_old);
            System.out.println(sql);
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

    public String UpdateByCustomer(String sql, Customer customer)  //从顾客表中修改信息
    {
        int num = 0;                            //
        try {
            con = Connect.reCon();
            pstmt = con.prepareStatement(sql);
            String customer_nickname=customer.getCustomerNickname();
            String customer_sex=customer.getCustomerSex();
            String customer_phone=customer.getCustomerPhone();
            String customer_name=customer.getCustomerName();
            String birth=customer.getBirth();
            pstmt.setString(1, customer_nickname);
            pstmt.setString(2, customer_sex);
            pstmt.setString(3, customer_name);
            pstmt.setString(4, birth);
            pstmt.setString(5, customer_phone);
            System.out.println(sql);
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
