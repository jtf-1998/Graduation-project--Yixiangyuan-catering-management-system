package com.lq.bean;

//顾客酒水菜单
/*
* id:自增ID
* billId：菜单ID
* drinkId:酒水ID
* drinkName：酒水名称
* drinkPrice：酒水单价
* drinkNumber：点的酒水数量
* */
public class BillDrink {

  private long id;
  private String billId;
  private String drinkId;
  private String drinkName;
  private double drinkPrice;
  private long drinkNumber;

  public BillDrink() {
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getBillId() {
    return billId;
  }

  public void setBillId(String billId) {
    this.billId = billId;
  }


  public String getDrinkId() {
    return drinkId;
  }

  public void setDrinkId(String drinkId) {
    this.drinkId = drinkId;
  }


  public String getDrinkName() {
    return drinkName;
  }

  public void setDrinkName(String drinkName) {
    this.drinkName = drinkName;
  }


  public double getDrinkPrice() {
    return drinkPrice;
  }

  public void setDrinkPrice(double drinkPrice) {
    this.drinkPrice = drinkPrice;
  }


  public long getDrinkNumber() {
    return drinkNumber;
  }

  public void setDrinkNumber(long drinkNumber) {
    this.drinkNumber = drinkNumber;
  }

}
