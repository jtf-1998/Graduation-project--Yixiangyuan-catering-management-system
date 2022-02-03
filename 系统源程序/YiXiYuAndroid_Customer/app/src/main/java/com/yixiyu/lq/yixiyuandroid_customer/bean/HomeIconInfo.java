package com.yixiyu.lq.yixiyuandroid_customer.bean;

/**
 * 菜单页的 GridView点击的图标和信息
 */
public class HomeIconInfo
{
    public String iconName;
    public int iconID;

    public HomeIconInfo(String iconName, int iconID) {
        this.iconName = iconName;
        this.iconID = iconID;
    }

    public String getIconName() {
        return iconName;
    }

    public void setIconName(String iconName) {
        this.iconName = iconName;
    }

    public int getIconID() {
        return iconID;
    }

    public void setIconID(int iconID) {
        this.iconID = iconID;
    }
}
