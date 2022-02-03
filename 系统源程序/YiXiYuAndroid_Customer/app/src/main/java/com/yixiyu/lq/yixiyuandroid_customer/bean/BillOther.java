package com.yixiyu.lq.yixiyuandroid_customer.bean;

//顾客酒水菜单
/*
 * id:自增ID
 * billId：菜单ID
 * otherId:其他ID
 * otherName：其他名称
 * otherPrice：其他单价
 * otherNumber：点的其他数量
 * */
public class BillOther {

  private long id;
  private String billId;
  private String otherId;
  private String otherName;
  private double otherPrice;
  private long otherNumber;


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


  public String getOtherId() {
    return otherId;
  }

  public void setOtherId(String otherId) {
    this.otherId = otherId;
  }


  public String getOtherName() {
    return otherName;
  }

  public void setOtherName(String otherName) {
    this.otherName = otherName;
  }


  public double getOtherPrice() {
    return otherPrice;
  }

  public void setOtherPrice(double otherPrice) {
    this.otherPrice = otherPrice;
  }


  public long getOtherNumber() {
    return otherNumber;
  }

  public void setOtherNumber(long otherNumber) {
    this.otherNumber = otherNumber;
  }

}
