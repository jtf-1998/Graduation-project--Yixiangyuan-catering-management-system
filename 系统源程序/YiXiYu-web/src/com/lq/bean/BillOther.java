package com.lq.bean;


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
