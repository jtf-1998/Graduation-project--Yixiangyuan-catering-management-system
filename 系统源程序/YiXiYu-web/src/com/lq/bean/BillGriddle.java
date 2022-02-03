package com.lq.bean;


public class BillGriddle {

  private long id;
  private String billId;
  private String griddleId;
  private String griddleName;
  private double griddlePrice;
  private long griddleNumber;


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


  public String getGriddleId() {
    return griddleId;
  }

  public void setGriddleId(String griddleId) {
    this.griddleId = griddleId;
  }


  public String getGriddleName() {
    return griddleName;
  }

  public void setGriddleName(String griddleName) {
    this.griddleName = griddleName;
  }


  public double getGriddlePrice() {
    return griddlePrice;
  }

  public void setGriddlePrice(double griddlePrice) {
    this.griddlePrice = griddlePrice;
  }


  public long getGriddleNumber() {
    return griddleNumber;
  }

  public void setGriddleNumber(long griddleNumber) {
    this.griddleNumber = griddleNumber;
  }

}
