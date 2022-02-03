package com.lq.bean;

import java.lang.System;
public class Admin
{

  private String adminId;
  private String adminPassword;

  public Admin() {
  }

  public Admin(String adminId, String adminPassword) {
    this.adminId = adminId;
    this.adminPassword = adminPassword;
  }

  @Override
  public String toString() {
    return "Admin{" +
            "adminId='" + adminId + '\'' +
            ", adminPassword='" + adminPassword + '\'' +
            '}';
  }

  public String getAdminId() {
    return adminId;
  }

  public void setAdminId(String adminId) {
    this.adminId = adminId;
  }


  public String getAdminPassword() {
    return adminPassword;
  }

  public void setAdminPassword(String adminPassword) {
    this.adminPassword = adminPassword;
  }

}
