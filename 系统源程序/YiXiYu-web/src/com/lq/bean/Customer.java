package com.lq.bean;


public class Customer {

  private String customerNickname;
  private String customerSex;
  private String customerPassword;
  private String customerPhone;
  private String customerName;
  private String birth;

  public Customer(String customerNickname, String customerSex, String customerPhone, String customerName, String birth) {
    this.customerNickname = customerNickname;
    this.customerSex = customerSex;
    this.customerPhone = customerPhone;
    this.customerName = customerName;
    this.birth = birth;
  }

  public String getCustomerName() {
    return customerName;
  }

  public void setCustomerName(String customerName) {
    this.customerName = customerName;
  }

  public String getBirth() {
    return birth;
  }

  public void setBirth(String birth) {
    this.birth = birth;
  }

  public Customer(String customerNickname, String customerSex, String customerPassword, String customerPhone)
  {
    this.customerNickname = customerNickname;
    this.customerSex = customerSex;
    this.customerPassword = customerPassword;
    this.customerPhone = customerPhone;
  }

  public Customer(String customerPassword, String customerPhone)
  {
    this.customerPassword = customerPassword;
    this.customerPhone = customerPhone;
  }

  @Override
  public String toString()
  {
    return "Customer{" +
            "customerNickname='" + customerNickname + '\'' +
            ", customerSex='" + customerSex + '\'' +
            ", customerPassword='" + customerPassword + '\'' +
            ", customerPhone='" + customerPhone + '\'' +
            '}';
  }


  public String getCustomerNickname() {
    return customerNickname;
  }

  public void setCustomerNickname(String customerNickname) {
    this.customerNickname = customerNickname;
  }


  public String getCustomerSex() {
    return customerSex;
  }

  public void setCustomerSex(String customerSex) {
    this.customerSex = customerSex;
  }


  public String getCustomerPassword() {
    return customerPassword;
  }

  public void setCustomerPassword(String customerPassword) {
    this.customerPassword = customerPassword;
  }


  public String getCustomerPhone() {
    return customerPhone;
  }

  public void setCustomerPhone(String customerPhone) {
    this.customerPhone = customerPhone;
  }

}
