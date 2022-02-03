package com.yixiyu.lq.yixiyuandroid_customer.service.nohttp;

import com.yolanda.nohttp.rest.Response;

public interface HttpListner<T> {
    void OnSucceed(int what, Response<T> response);
    void onFailed(int what, String url, Object tag, CharSequence message,
                  int responseCode, long networkMillis);
}
