package com.lq.bean;

public class RestStaffLeaveForm {

  private String data;
  private String staffId;
  private String staffName;
  private String staffPhone;
  private String staffLeaveBegan;
  private String staffLeaveFinish;
  private String staffLeaveVerifyStage;

  public RestStaffLeaveForm(String data, String staffId, String staffName, String staffPhone, String staffLeaveBegan, String staffLeaveFinish, String staffLeaveVerifyStage) {
    this.data = data;
    this.staffId = staffId;
    this.staffName = staffName;
    this.staffPhone = staffPhone;
    this.staffLeaveBegan = staffLeaveBegan;
    this.staffLeaveFinish = staffLeaveFinish;
    this.staffLeaveVerifyStage = staffLeaveVerifyStage;
  }

  @Override
  public String toString() {
    return "RestStaffLeaveForm{" + "data='" + data + '\'' + ", staffId='" + staffId + '\'' + ", staffName='" + staffName + '\'' + ", staffPhone='" + staffPhone + '\'' + ", staffLeaveBegan=" + staffLeaveBegan + ", staffLeaveFinish=" + staffLeaveFinish + ", staffLeaveVerifyStage='" + staffLeaveVerifyStage + '\'' + '}';
  }

  public String getData() {
    return data;
  }

  public void setData(String data) {
    this.data = data;
  }


  public String getStaffId() {
    return staffId;
  }

  public void setStaffId(String staffId) {
    this.staffId = staffId;
  }


  public String getStaffName() {
    return staffName;
  }

  public void setStaffName(String staffName) {
    this.staffName = staffName;
  }


  public String getStaffPhone() {
    return staffPhone;
  }

  public void setStaffPhone(String staffPhone) {
    this.staffPhone = staffPhone;
  }


  public String getStaffLeaveBegan() {
    return staffLeaveBegan;
  }

  public void setStaffLeaveBegan(String staffLeaveBegan) {
    this.staffLeaveBegan = staffLeaveBegan;
  }


  public String getStaffLeaveFinish() {
    return staffLeaveFinish;
  }

  public void setStaffLeaveFinish(String staffLeaveFinish) {
    this.staffLeaveFinish = staffLeaveFinish;
  }


  public String getStaffLeaveVerifyStage() {
    return staffLeaveVerifyStage;
  }

  public void setStaffLeaveVerifyStage(String staffLeaveVerifyStage) {
    this.staffLeaveVerifyStage = staffLeaveVerifyStage;
  }

}
