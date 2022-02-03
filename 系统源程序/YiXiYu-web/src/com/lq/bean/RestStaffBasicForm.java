package com.lq.bean;


public class RestStaffBasicForm {

  private String staffId;
  private String staffName;
  private String staffPassword;
  private String staffSex;
  private String staffPhone;
  private String staffSection;
  private float staffSalary;
  private float staffRemuneration;

  public RestStaffBasicForm(String staffId, String staffName, String staffPassword, String staffSex,
                            String staffPhone, String staffSection, float staffSalary, float staffRemuneration) {
    this.staffId = staffId;
    this.staffName = staffName;
    this.staffPassword = staffPassword;
    this.staffSex = staffSex;
    this.staffPhone = staffPhone;
    this.staffSection = staffSection;
    this.staffSalary = staffSalary;
    this.staffRemuneration = staffRemuneration;
  }

  @Override
  public String toString() {
    return "RestStaffBasicForm{" + "staffId='" + staffId + '\'' + ", staffName='" + staffName + '\'' + ", staffPassword='" + staffPassword + '\'' + ", staffSex='" + staffSex + '\'' + ", staffPhone='" + staffPhone + '\'' + ", staffSection='" + staffSection + '\'' + ", staffSalary=" + staffSalary + ", staffRemuneration=" + staffRemuneration + '}';
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

  public String getStaffPassword() {
    return staffPassword;
  }

  public void setStaffPassword(String staffPassword) {
    this.staffPassword = staffPassword;
  }

  public String getStaffSex() {
    return staffSex;
  }

  public void setStaffSex(String staffSex) {
    this.staffSex = staffSex;
  }


  public String getStaffPhone() {
    return staffPhone;
  }

  public void setStaffPhone(String staffPhone) {
    this.staffPhone = staffPhone;
  }


  public String getStaffSection() {
    return staffSection;
  }

  public void setStaffSection(String staffSection) {
    this.staffSection = staffSection;
  }


  public float getStaffSalary() {
    return staffSalary;
  }

  public void setStaffSalary(float staffSalary) {
    this.staffSalary = staffSalary;
  }


  public float getStaffRemuneration() {
    return staffRemuneration;
  }

  public void setStaffRemuneration(float staffRemuneration) {
    this.staffRemuneration = staffRemuneration;
  }

}
