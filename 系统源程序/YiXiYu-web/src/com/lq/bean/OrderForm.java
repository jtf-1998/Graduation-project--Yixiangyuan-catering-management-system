package com.lq.bean;


public class OrderForm {

  private String orderId;
  private String pRoomId;
  private String orderDate;
  private String orderTime;
  private int customerNumber;
  private String orderGriddle;
  private String customerPhone;
  private String customerName;

  public OrderForm(String orderId, String pRoomId, String orderDate, String orderTime, int customerNumber, String orderGriddle, String customerPhone, String customerName) {
    this.orderId = orderId;
    this.pRoomId = pRoomId;
    this.orderDate = orderDate;
    this.orderTime = orderTime;
    this.customerNumber = customerNumber;
    this.orderGriddle = orderGriddle;
    this.customerPhone = customerPhone;
    this.customerName = customerName;
  }

  @Override
  public String toString() {
    return "OrderForm{" + "orderId='" + orderId + '\'' + ", pRoomId='" + pRoomId + '\'' + ", orderDate='" + orderDate + '\'' + ", orderTime='" + orderTime + '\'' + ", customerNumber=" + customerNumber + ", orderGriddle='" + orderGriddle + '\'' + ", customerPhone='" + customerPhone + '\'' + ", customerName='" + customerName + '\'' + '}';
  }

  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }


  public String getPRoomId() {
    return pRoomId;
  }

  public void setPRoomId(String pRoomId) {
    this.pRoomId = pRoomId;
  }


  public String getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(String orderDate) {
    this.orderDate = orderDate;
  }


  public String getOrderTime() {
    return orderTime;
  }

  public void setOrderTime(String orderTime) {
    this.orderTime = orderTime;
  }


  public int getCustomerNumber() {
    return customerNumber;
  }

  public void setCustomerNumber(int customerNumber) {
    this.customerNumber = customerNumber;
  }


  public String getOrderGriddle() {
    return orderGriddle;
  }

  public void setOrderGriddle(String orderGriddle) {
    this.orderGriddle = orderGriddle;
  }


  public String getCustomerPhone() {
    return customerPhone;
  }

  public void setCustomerPhone(String customerPhone) {
    this.customerPhone = customerPhone;
  }


  public String getCustomerName() {
    return customerName;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

}
