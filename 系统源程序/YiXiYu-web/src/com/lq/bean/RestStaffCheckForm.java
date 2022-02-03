package com.lq.bean;


public class RestStaffCheckForm {

  private String date;
  private String staffId;
  private String staffName;
  private String staffSex;
  private String staffCheck;
  private String staffSpecialMatters;
  private float staffDataDeduction;

  public RestStaffCheckForm(String date, String staffId, String staffName, String staffSex, String staffCheck, String staffSpecialMatters, float staffDataDeduction) {
    this.date = date;
    this.staffId = staffId;
    this.staffName = staffName;
    this.staffSex = staffSex;
    this.staffCheck = staffCheck;
    this.staffSpecialMatters = staffSpecialMatters;
    this.staffDataDeduction = staffDataDeduction;
  }

  @Override
  public String toString() {
    return "RestStaffCheckForm{" + "date='" + date + '\'' + ", staffId='" + staffId + '\'' + ", staffName='" + staffName + '\'' + ", staffSex='" + staffSex + '\'' + ", staffCheck='" + staffCheck + '\'' + ", staffSpecialMatters='" + staffSpecialMatters + '\'' + ", staffDataDeduction=" + staffDataDeduction + '}';
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
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


  public String getStaffSex() {
    return staffSex;
  }

  public void setStaffSex(String staffSex) {
    this.staffSex = staffSex;
  }


  public String getStaffCheck() {
    return staffCheck;
  }

  public void setStaffCheck(String staffCheck) {
    this.staffCheck = staffCheck;
  }


  public String getStaffSpecialMatters() {
    return staffSpecialMatters;
  }

  public void setStaffSpecialMatters(String staffSpecialMatters) {
    this.staffSpecialMatters = staffSpecialMatters;
  }


  public float getStaffDataDeduction() {
    return staffDataDeduction;
  }

  public void setStaffDataDeduction(float staffDataDeduction) {
    this.staffDataDeduction = staffDataDeduction;
  }

}
