package com.lq.bean;


public class BillAll {

  private String billId;
  private String billData;
  private String billCustomer;
  private String billProom;
  private String vegetableId;
  private String vegetableType;
  private String vegetableName;
  private double vegetablePrice;
  private int vegetableNumber;
  private String vegetableState;

  public BillAll(String billId) {
    this.billId = billId;
  }

  public BillAll(String billId, String billData, String billCustomer, String billProom) {
    this.billId = billId;
    this.billData = billData;
    this.billCustomer = billCustomer;
    this.billProom = billProom;
  }

  public BillAll(String billData, String billCustomer) {
    this.billData = billData;
    this.billCustomer = billCustomer;
  }

  public BillAll(String billId, String vegetableId, String vegetableType, String vegetableName, double vegetablePrice, int vegetableNumber,String vegetableState) {
    this.billId = billId;
    this.vegetableId = vegetableId;
    this.vegetableType = vegetableType;
    this.vegetableName = vegetableName;
    this.vegetablePrice = vegetablePrice;
    this.vegetableNumber = vegetableNumber;
    this.vegetableState=vegetableState;
  }

  public BillAll(String billId, String billData, String billCustomer, String billProom, String vegetableId, String vegetableType, String vegetableName, double vegetablePrice, int vegetableNumber,String vegetableState) {
    this.billId = billId;
    this.billData = billData;
    this.billCustomer = billCustomer;
    this.billProom = billProom;
    this.vegetableId = vegetableId;
    this.vegetableType = vegetableType;
    this.vegetableName = vegetableName;
    this.vegetablePrice = vegetablePrice;
    this.vegetableNumber = vegetableNumber;
    this.vegetableState=vegetableState;
  }

  @Override
  public String toString() {
    return "BillAll{" + "billId='" + billId + '\'' + ", billData='" + billData + '\'' + ", billCustomer='" + billCustomer + '\'' + ", billProom='" + billProom + '\'' + ", vegetableId='" + vegetableId + '\'' + ", vegetableType='" + vegetableType + '\'' + ", vegetableName='" + vegetableName + '\'' + ", vegetablePrice=" + vegetablePrice + ", vegetableNumber=" + vegetableNumber + '}';
  }

  public String getBillId() {
    return billId;
  }

  public void setBillId(String billId) {
    this.billId = billId;
  }


  public String getBillData() {
    return billData;
  }

  public void setBillData(String billData) {
    this.billData = billData;
  }


  public String getBillCustomer() {
    return billCustomer;
  }

  public void setBillCustomer(String billCustomer) {
    this.billCustomer = billCustomer;
  }


  public String getBillProom() {
    return billProom;
  }

  public void setBillProom(String billProom) {
    this.billProom = billProom;
  }


  public String getVegetableId() {
    return vegetableId;
  }

  public void setVegetableId(String vegetableId) {
    this.vegetableId = vegetableId;
  }


  public String getVegetableType() {
    return vegetableType;
  }

  public void setVegetableType(String vegetableType) {
    this.vegetableType = vegetableType;
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


  public int getVegetableNumber() {
    return vegetableNumber;
  }

  public void setVegetableNumber(int vegetableNumber) {
    this.vegetableNumber = vegetableNumber;
  }

  public String getVegetableState() {
    return vegetableState;
  }

  public void setVegetableState(String vegetableState) {
    this.vegetableState = vegetableState;
  }


}
