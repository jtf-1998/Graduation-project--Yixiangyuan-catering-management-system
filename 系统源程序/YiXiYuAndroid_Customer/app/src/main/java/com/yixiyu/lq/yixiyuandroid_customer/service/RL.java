package com.yixiyu.lq.yixiyuandroid_customer.service;

import com.yixiyu.lq.yixiyuandroid_customer.bean.Customer;

public interface RL
{
    String url="http://192.168.137.1:";
    String port="8888";
    String demoName="/YiXiYu-web/RLServlet";
    void SendByHttpClient(Customer customer, String method);
}
