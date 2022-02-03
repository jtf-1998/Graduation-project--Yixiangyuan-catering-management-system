package com.yixiyu.lq.yixiyuandroid_customer.bean;


import java.util.List;

public class RestBillOfFare {

  private String vegetableId;
  private String vegetableType;
  private String vegetableName;
//  private List<ImagesBean> vegetableImage;
  private String vegetablePrice;
  private String vegetableNumber;
  private String vegetableRemark;

  public RestBillOfFare(String vegetableId, String vegetableType, String vegetableName, String vegetablePrice, String vegetableNumber,
                        String vegetableRemark) {
    this.vegetableId = vegetableId;
    this.vegetableType = vegetableType;
    this.vegetableName = vegetableName;
//    this.vegetableImage = vegetableImage;
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
//            ", vegetableImage='" + vegetableImage + '\'' +
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


//  public List<ImagesBean> getVegetableImage() {
//    return vegetableImage;
//  }

//  public void setVegetableImage(List<ImagesBean> vegetableImage) {
//    this.vegetableImage = vegetableImage;
//  }


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

  public static class ImagesBean {
    private int width;
    private String image;

    public int getWidth() {
      return width;
    }

    public void setWidth(int width) {
      this.width = width;
    }

    public String getImage() {
      return image;
    }

    public void setImage(String image) {
      this.image = image;
    }
  }
}
