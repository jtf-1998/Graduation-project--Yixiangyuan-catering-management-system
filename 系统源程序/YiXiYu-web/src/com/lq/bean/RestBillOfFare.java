package com.lq.bean;


public class RestBillOfFare {

  private String vegetableId;
  private String vegetableType;
  private String vegetableName;
  private String vegetableImage;
  private String vegetablePrice;
  private String vegetableNumber;
  private String vegetableRemark;

  public RestBillOfFare(String vegetableId, String vegetableType, String vegetableName,
                        String vegetableImage, String vegetablePrice, String vegetableNumber,
                        String vegetableRemark) {
    this.vegetableId = vegetableId;
    this.vegetableType = vegetableType;
    this.vegetableName = vegetableName;
    this.vegetableImage = vegetableImage;
    this.vegetablePrice = vegetablePrice;
    this.vegetableNumber = vegetableNumber;
    this.vegetableRemark = vegetableRemark;
  }

  @Override
  public String toString() {
    return "RestBillOfFare{" +
            "vegetableId='" + vegetableId + '\'' +
            ", vegetableType='" + vegetableType + '\'' +
            ", vegetableName='" + vegetableName + '\'' +
            ", vegetableImage='" + vegetableImage + '\'' +
            ", vegetablePrice=" + vegetablePrice +
            ", vegetableNumber='" + vegetableNumber + '\'' +
            ", vegetableRemark='" + vegetableRemark + '\'' +
            '}';
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


  public String getVegetableImage() {
    return vegetableImage;
  }

  public void setVegetableImage(String vegetableImage) {
    this.vegetableImage = vegetableImage;
  }


  public String getVegetablePrice() {
    return vegetablePrice;
  }

  public void setVegetablePrice(String vegetablePrice) {
    this.vegetablePrice = vegetablePrice;
  }


  public String getVegetableNumber() {
    return vegetableNumber;
  }

  public void setVegetableNumber(String vegetableNumber) {
    this.vegetableNumber = vegetableNumber;
  }


  public String getVegetableRemark() {
    return vegetableRemark;
  }

  public void setVegetableRemark(String vegetableRemark) {
    this.vegetableRemark = vegetableRemark;
  }

}
