package com.lq.bean;


public class RestKitchenPurchase {

  private String purchaseDate;
  private String purchaseId;
  private String purchaseName;
  private String purchaseType;
  private String purchasePerson;
  private String purchasePhone;
  private float vegetableStock;
  private float purchaseNumber;
  private float purchasePrice;

  public RestKitchenPurchase(String purchaseDate,String purchaseId, String purchaseName, String purchaseType, String purchasePerson, String purchasePhone, float vegetableStock, float purchaseNumber, float purchasePrice) {
    this.purchaseDate=purchaseDate;
    this.purchaseId = purchaseId;
    this.purchaseName = purchaseName;
    this.purchaseType = purchaseType;
    this.purchasePerson = purchasePerson;
    this.purchasePhone = purchasePhone;
    this.vegetableStock = vegetableStock;
    this.purchaseNumber = purchaseNumber;
    this.purchasePrice = purchasePrice;
  }

  @Override
  public String toString() {
    return "RestKitchenPurchase{" +"purchaseDate='" + purchaseDate + '\'' + ",purchaseId='" + purchaseId + '\'' + ", purchaseName='" + purchaseName + '\'' + ", purchaseType='" + purchaseType + '\'' + ", purchasePerson='" + purchasePerson + '\'' + ", purchasePhone='" + purchasePhone + '\'' + ", vegetableStock=" + vegetableStock + ", purchaseNumber=" + purchaseNumber + ", purchasePrice=" + purchasePrice + '}';
  }

  public void setPurchaseDate(String purchaseDate) {
    this.purchaseDate = purchaseDate;
  }
  public String getPurchaseDate() {
    return purchaseDate;
  }

  public String getPurchaseId() {
    return purchaseId;
  }

  public void setPurchaseId(String purchaseId) {
    this.purchaseId = purchaseId;
  }


  public String getPurchaseName() {
    return purchaseName;
  }

  public void setPurchaseName(String purchaseName) {
    this.purchaseName = purchaseName;
  }


  public String getPurchaseType() {
    return purchaseType;
  }

  public void setPurchaseType(String purchaseType) {
    this.purchaseType = purchaseType;
  }


  public String getPurchasePerson() {
    return purchasePerson;
  }

  public void setPurchasePerson(String purchasePerson) {
    this.purchasePerson = purchasePerson;
  }


  public String getPurchasePhone() {
    return purchasePhone;
  }

  public void setPurchasePhone(String purchasePhone) {
    this.purchasePhone = purchasePhone;
  }


  public float getVegetableStock() {
    return vegetableStock;
  }

  public void setVegetableStock(float vegetableStock) {
    this.vegetableStock = vegetableStock;
  }


  public float getPurchaseNumber() {
    return purchaseNumber;
  }

  public void setPurchaseNumber(float purchaseNumber) {
    this.purchaseNumber = purchaseNumber;
  }


  public float getPurchasePrice() {
    return purchasePrice;
  }

  public void setPurchasePrice(float purchasePrice) {
    this.purchasePrice = purchasePrice;
  }

}
