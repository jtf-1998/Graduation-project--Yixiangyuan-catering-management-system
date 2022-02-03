package com.lq.bean;


public class TakeawayOrderForm {

  private String takeawayId;
  private String takeawayType;
  private String takeawayDate;
  private String takeawayTime;
  private float takeawayMoney;
  private String customer_nickname;
  private String customer_phone;

  public TakeawayOrderForm() {
  }

  public TakeawayOrderForm(String takeawayId, String takeawayType, String takeawayDate, String takeawayTime, float takeawayMoney, String customer_nickname, String customer_phone) {
    this.takeawayId = takeawayId;
    this.takeawayType = takeawayType;
    this.takeawayDate = takeawayDate;
    this.takeawayTime = takeawayTime;
    this.takeawayMoney = takeawayMoney;
    this.customer_nickname = customer_nickname;
    this.customer_phone = customer_phone;
  }

  @Override
  public String toString() {
    return "TakeawayOrderForm{" + "takeawayId='" + takeawayId + '\'' + ", takeawayType='" + takeawayType + '\'' + ", takeawayDate='" + takeawayDate + '\'' + ", takeawayTime='" + takeawayTime + '\'' + ", takeawayMoney=" + takeawayMoney + ", customer_nickname='" + customer_nickname + '\'' + ", customer_phone='" + customer_phone + '\'' + '}';
  }

  public String getCustomer_nickname() {
    return customer_nickname;
  }

  public void setCustomer_nickname(String customer_nickname) {
    this.customer_nickname = customer_nickname;
  }

  public String getCustomer_phone() {
    return customer_phone;
  }

  public void setCustomer_phone(String customer_phone) {
    this.customer_phone = customer_phone;
  }

  public String getTakeawayId() {
    return takeawayId;
  }

  public void setTakeawayId(String takeawayId) {
    this.takeawayId = takeawayId;
  }


  public String getTakeawayType() {
    return takeawayType;
  }

  public void setTakeawayType(String takeawayType) {
    this.takeawayType = takeawayType;
  }


  public String getTakeawayDate() {
    return takeawayDate;
  }

  public void setTakeawayDate(String takeawayDate) {
    this.takeawayDate = takeawayDate;
  }


  public String getTakeawayTime() {
    return takeawayTime;
  }

  public void setTakeawayTime(String takeawayTime) {
    this.takeawayTime = takeawayTime;
  }


  public float getTakeawayMoney() {
    return takeawayMoney;
  }

  public void setTakeawayMoney(float takeawayMoney) {
    this.takeawayMoney = takeawayMoney;
  }

}
