package com.yixiyu.lq.yixiyuandroid_customer.bean;

/**
 * Created by Android on 2016/6/22.
 * 常量池
 */
public interface ContantsPool {

   String[] title = new String[]{"扫一扫","菜单","预订","订单","我的"};

//   String baseUrl = "http://7xij5m.com1.z0.glb.clouddn.com/";
   String HOST = "192.168.21.244";
   String PORT = "8888";
   String Demo="/YiXiYu-web";
   String baseUrl= "http://"+ HOST +":"+PORT + Demo;
   /**猜你喜欢**/
   String spRecommendURL = baseUrl + "spRecommend.txt";


}
