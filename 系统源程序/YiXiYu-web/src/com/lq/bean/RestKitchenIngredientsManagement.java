package com.lq.bean;


public class RestKitchenIngredientsManagement {

  private String ingredientId;
  private String ingredientName;
  private String ingredientType;
  private String purchaseMes;

  public RestKitchenIngredientsManagement(String ingredientId, String ingredientName, String ingredientType, String purchaseMes) {
    this.ingredientId = ingredientId;
    this.ingredientName = ingredientName;
    this.ingredientType = ingredientType;
    this.purchaseMes = purchaseMes;
  }

  @Override
  public String toString() {
    return "RestKitchenIngredientsManagement{" + "ingredientId='" + ingredientId + '\'' + ", ingredientName='" + ingredientName + '\'' + ", ingredientType='" + ingredientType + '\'' + ", purchaseMes='" + purchaseMes + '\'' + '}';
  }

  public String getIngredientId() {
    return ingredientId;
  }

  public void setIngredientId(String ingredientId) {
    this.ingredientId = ingredientId;
  }


  public String getIngredientName() {
    return ingredientName;
  }

  public void setIngredientName(String ingredientName) {
    this.ingredientName = ingredientName;
  }


  public String getIngredientType() {
    return ingredientType;
  }

  public void setIngredientType(String ingredientType) {
    this.ingredientType = ingredientType;
  }

  public String getPurchaseMes() {
    return purchaseMes;
  }

  public void setPurchaseMes(String purchaseMes) {
    this.purchaseMes = purchaseMes;
  }
}
