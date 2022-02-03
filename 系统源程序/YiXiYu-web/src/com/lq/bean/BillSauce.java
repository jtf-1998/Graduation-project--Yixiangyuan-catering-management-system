package com.lq.bean;


public class BillSauce {

  private long id;
  private String billId;
  private String sauceId;
  private String sauceName;
  private double saucePrice;
  private long sauceNumber;


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


  public String getSauceId() {
    return sauceId;
  }

  public void setSauceId(String sauceId) {
    this.sauceId = sauceId;
  }


  public String getSauceName() {
    return sauceName;
  }

  public void setSauceName(String sauceName) {
    this.sauceName = sauceName;
  }


  public double getSaucePrice() {
    return saucePrice;
  }

  public void setSaucePrice(double saucePrice) {
    this.saucePrice = saucePrice;
  }


  public long getSauceNumber() {
    return sauceNumber;
  }

  public void setSauceNumber(long sauceNumber) {
    this.sauceNumber = sauceNumber;
  }

}
