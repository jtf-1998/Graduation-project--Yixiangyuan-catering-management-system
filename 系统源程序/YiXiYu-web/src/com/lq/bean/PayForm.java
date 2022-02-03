package com.lq.bean;


public class PayForm {

  private String billId;
  private String pRoomId;
  private String pRoom;
  private String payDate;
  private String payType;
  private float payPrice;

  public PayForm() {
  }

  public PayForm(String billId, String pRoom, String payDate, float payPrice) {
    this.billId = billId;
    this.pRoom = pRoom;
    this.payDate = payDate;
    this.payPrice = payPrice;
  }

  public PayForm(String billId, String pRoomId, String pRoom, String payDate, String payType, float payPrice) {
    this.billId = billId;
    this.pRoomId = pRoomId;
    this.pRoom = pRoom;
    this.payDate = payDate;
    this.payType = payType;
    this.payPrice = payPrice;
  }

  public String getBillId() {
    return billId;
  }

  public void setBillId(String billId) {
    this.billId = billId;
  }

  public String getpRoom() {
    return pRoom;
  }

  public void setpRoom(String pRoom) {
    this.pRoom = pRoom;
  }

  public String getPRoomId() {
    return pRoomId;
  }

  public void setPRoomId(String pRoomId) {
    this.pRoomId = pRoomId;
  }


  public String getPayDate() {
    return payDate;
  }

  public void setPayDate(String payDate) {
    this.payDate = payDate;
  }


  public String getPayType() {
    return payType;
  }

  public void setPayType(String payType) {
    this.payType = payType;
  }


  public float getPayPrice() {
    return payPrice;
  }

  public void setPayPrice(float payPrice) {
    this.payPrice = payPrice;
  }

}
