package com.lq.bean;


public class RestPayForm {

  private String billId;
  private String pRoomId;
  private String payDate;
  private String payTime;
  private String isTakeaway;
  private String takeawayType;
  private String payType;
  private float payPrice;

  public RestPayForm() {
  }

  @Override
  public String toString() {
    return "RestPayForm{" + "billId='" + billId + '\'' + ", pRoomId='" + pRoomId + '\'' + ", payDate='" + payDate + '\'' + ", payTime='" + payTime + '\'' + ", isTakeaway='" + isTakeaway + '\'' + ", takeawayType='" + takeawayType + '\'' + ", payType='" + payType + '\'' + ", payPrice=" + payPrice + '}';
  }

  public RestPayForm(String billId, String pRoomId, String payDate, String payTime, String isTakeaway, String takeawayType, String payType, float payPrice) {
    this.billId = billId;
    this.pRoomId = pRoomId;
    this.payDate = payDate;
    this.payTime = payTime;
    this.isTakeaway = isTakeaway;
    this.takeawayType = takeawayType;
    this.payType = payType;
    this.payPrice = payPrice;
  }

  public String getBillId() {
    return billId;
  }

  public void setBillId(String billId) {
    this.billId = billId;
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


  public String getPayTime() {
    return payTime;
  }

  public void setPayTime(String payTime) {
    this.payTime = payTime;
  }


  public String getIsTakeaway() {
    return isTakeaway;
  }

  public void setIsTakeaway(String isTakeaway) {
    this.isTakeaway = isTakeaway;
  }


  public String getTakeawayType() {
    return takeawayType;
  }

  public void setTakeawayType(String takeawayType) {
    this.takeawayType = takeawayType;
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
