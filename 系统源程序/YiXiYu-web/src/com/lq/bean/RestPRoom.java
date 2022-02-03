package com.lq.bean;

public class RestPRoom {

  private String pRoomId;
  private String pRoomType;
  private String pRoomName;
  private String pRoomImage;
  private int pRoomNumber;
  private String pRoomState;
  private String pRoomRemark;
  private String pRoomBegan;
  private String pRoomFinish;

  @Override
  public String toString() {
    return "RestPRoom{" +
            "pRoomId='" + pRoomId + '\'' +
            ", pRoomType='" + pRoomType + '\'' +
            ", pRoomName='" + pRoomName + '\'' +
            ", pRoomImage='" + pRoomImage + '\'' +
            ", pRoomNumber=" + pRoomNumber +
            ", pRoomState='" + pRoomState + '\'' +
            ", pRoomRemark='" + pRoomRemark + '\'' +
            ", pRoomBegan='" + pRoomBegan + '\'' +
            ", pRoomFinish='" + pRoomFinish + '\'' +
            '}';
  }

  public RestPRoom(String pRoomId, String pRoomType, String pRoomName, String pRoomImage,
                   int pRoomNumber, String pRoomState, String pRoomRemark, String pRoomBegan,
                   String pRoomFinish) {
    this.pRoomId = pRoomId;
    this.pRoomType = pRoomType;
    this.pRoomName = pRoomName;
    this.pRoomImage = pRoomImage;
    this.pRoomNumber = pRoomNumber;
    this.pRoomState = pRoomState;
    this.pRoomRemark = pRoomRemark;
    this.pRoomBegan = pRoomBegan;
    this.pRoomFinish = pRoomFinish;
  }

  public RestPRoom(String pRoomId, String pRoomState, String pRoomBegan,String pRoomFinish) {
    this.pRoomId = pRoomId;
    this.pRoomState = pRoomState;
    this.pRoomBegan = pRoomBegan;
    this.pRoomFinish = pRoomFinish;
  }

  public RestPRoom(String pRoomName,  String pRoomState, String pRoomRemark, String pRoomBegan, String pRoomFinish) {
    this.pRoomName = pRoomName;
    this.pRoomState = pRoomState;
    this.pRoomRemark = pRoomRemark;
    this.pRoomBegan = pRoomBegan;
    this.pRoomFinish = pRoomFinish;
  }

  public String getPRoomId() {
    return pRoomId;
  }

  public void setPRoomId(String pRoomId) {
    this.pRoomId = pRoomId;
  }


  public String getPRoomType() {
    return pRoomType;
  }

  public void setPRoomType(String pRoomType) {
    this.pRoomType = pRoomType;
  }


  public String getPRoomName() {
    return pRoomName;
  }

  public void setPRoomName(String pRoomName) {
    this.pRoomName = pRoomName;
  }


  public String getPRoomImage() {
    return pRoomImage;
  }

  public void setPRoomImage(String pRoomImage) {
    this.pRoomImage = pRoomImage;
  }


  public int getPRoomNumber() {
    return pRoomNumber;
  }

  public void setPRoomNumber(int pRoomNumber) {
    this.pRoomNumber = pRoomNumber;
  }


  public String getPRoomState() {
    return pRoomState;
  }

  public void setPRoomState(String pRoomState) {
    this.pRoomState = pRoomState;
  }


  public String getPRoomRemark() {
    return pRoomRemark;
  }

  public void setPRoomRemark(String pRoomRemark) {
    this.pRoomRemark = pRoomRemark;
  }


  public String getPRoomBegan() {
    return pRoomBegan;
  }

  public void setPRoomBegan(String pRoomBegan) {
    this.pRoomBegan = pRoomBegan;
  }


  public String getPRoomFinish() {
    return pRoomFinish;
  }

  public void setPRoomFinish(String pRoomFinish) {
    this.pRoomFinish = pRoomFinish;
  }

}
