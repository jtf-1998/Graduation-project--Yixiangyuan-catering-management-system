package com.lq.bean;


public class BillForm {

  private String billId;
  private java.sql.Date billDate;
  private String pRoomId;
  private long customerNumber;
  private long dinnerServiceNumber;
  private String payType;
  private double payPrice;


  public String getBillId() {
    return billId;
  }

  public void setBillId(String billId) {
    this.billId = billId;
  }


  public java.sql.Date getBillDate() {
    return billDate;
  }

  public void setBillDate(java.sql.Date billDate) {
    this.billDate = billDate;
  }


  public String getPRoomId() {
    return pRoomId;
  }

  public void setPRoomId(String pRoomId) {
    this.pRoomId = pRoomId;
  }


  public long getCustomerNumber() {
    return customerNumber;
  }

  public void setCustomerNumber(long customerNumber) {
    this.customerNumber = customerNumber;
  }


  public long getDinnerServiceNumber() {
    return dinnerServiceNumber;
  }

  public void setDinnerServiceNumber(long dinnerServiceNumber) {
    this.dinnerServiceNumber = dinnerServiceNumber;
  }


  public String getPayType() {
    return payType;
  }

  public void setPayType(String payType) {
    this.payType = payType;
  }


  public double getPayPrice() {
    return payPrice;
  }

  public void setPayPrice(double payPrice) {
    this.payPrice = payPrice;
  }

}
