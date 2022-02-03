package com.lq.bean;


public class BillVegetable {

  private long id;
  private String billId;
  private String vegetableId;
  private String vegetableName;
  private double vegetablePrice;
  private long vegetableNumber;


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


  public String getVegetableId() {
    return vegetableId;
  }

  public void setVegetableId(String vegetableId) {
    this.vegetableId = vegetableId;
  }


  public String getVegetableName() {
    return vegetableName;
  }

  public void setVegetableName(String vegetableName) {
    this.vegetableName = vegetableName;
  }


  public double getVegetablePrice() {
    return vegetablePrice;
  }

  public void setVegetablePrice(double vegetablePrice) {
    this.vegetablePrice = vegetablePrice;
  }


  public long getVegetableNumber() {
    return vegetableNumber;
  }

  public void setVegetableNumber(long vegetableNumber) {
    this.vegetableNumber = vegetableNumber;
  }

}
