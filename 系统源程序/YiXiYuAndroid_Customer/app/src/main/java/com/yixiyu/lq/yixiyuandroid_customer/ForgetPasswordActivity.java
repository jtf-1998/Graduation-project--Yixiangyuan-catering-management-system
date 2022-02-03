package com.yixiyu.lq.yixiyuandroid_customer;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yixiyu.lq.yixiyuandroid_customer.bean.Customer;
import com.yixiyu.lq.yixiyuandroid_customer.service.Basic;
import com.yixiyu.lq.yixiyuandroid_customer.service.MyLog;
import com.yixiyu.lq.yixiyuandroid_customer.service.RL;

import java.util.ArrayList;
import java.util.List;

public class ForgetPasswordActivity extends AppCompatActivity implements RL
{

    private EditText userphone, authCode, password1, password2;
    private TextView title;
    private TextView authCodeButton = null;   //发送验证码
    private Button user_forget_password_bt;
    // 验证码按钮倒计时 总时长和间隔时长
    private long totalTime = 60000, intervalTime = 1000;
    private String loginUrl;
    private String method;
    private String state=null;
    public static final int SHOW_RESPONSE=1;
    Context context=ForgetPasswordActivity.this;
    Basic basic=new Basic();
    MyLog myLog=new MyLog();
    Customer customer=null;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_forget_password);
        init();
        initView();
    }

    private void setBackArrows(ImageView back)
    {
        back.setVisibility(View.VISIBLE);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    public void init()
    {
        ((TextView) findViewById(R.id.top_bar_title)).setText("密码修改");
        setBackArrows((ImageView) findViewById(R.id.top_bar_left_image));
        setTheClick();
        title = (TextView) findViewById(R.id.user_register_again_password_title);
        authCodeButton = (TextView) findViewById(R.id.user_forget_password_auth_code_button);
        userphone=(EditText)findViewById(R.id.user_forget_password_phone);
        authCode = (EditText) findViewById(R.id.user_forget_password_auth_code_et);
        password1 = (EditText) findViewById(R.id.user_forget_password_password1);
        password2 = (EditText) findViewById(R.id.user_forget_password_password2);
        user_forget_password_bt=(Button)findViewById(R.id.user_forget_password_button);
    }

    public void initView(){
        //发送验证码
        authCodeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String phone = userphone.getText().toString().trim();
                title.setVisibility(View.VISIBLE);
                if (basic.Isempty(phone)) {
                    title.setText("请输入手机号！");
                    return;
                } else if (!phone.matches("^[1][3,5,7,8]+\\d{9}")) {
                    title.setText("请输入正确的手机号！");
                    return;
                }
                title.setVisibility(View.INVISIBLE);
                countDownTimer.start();
//                getCode(phone,2);
            }
        });

        user_forget_password_bt.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                String phone = userphone.getText().toString().trim();
                String password = password1.getText().toString().trim();
                String password_yes = password2.getText().toString().trim();
                String code = authCode.getText().toString().trim();
                title.setVisibility(View.VISIBLE);
                title.setText("");
                if (basic.Isempty(phone)) {
                    title.setText("请输入手机号！");
                    return;
                } else if (!phone.matches("^[1][3,5,7,8]+\\d{9}")) {
                    title.setText("请输入正确的手机号！");
                    return;
                } else if (basic.Isempty(code)|| code.length() != 6) {
                    title.setText("请输入6位数验证码！");
                    return;
                } else if (basic.Isempty(password) || basic.Isempty(password_yes)) {
                    title.setText("请输入密码！");
                    return;
                } else if (password.length() < 6 || password_yes.length() < 6) {
                    title.setText("密码长度不足6位");
                    return;
                } else if (!password.equals(password_yes)) {
                    title.setText("两次输入的密码不一致！");
                    return;
                } else {
                    title.setVisibility(View.INVISIBLE);
                    customer=new Customer(password_yes,phone);
                    method="?action=ForgetPassword";
                    SendByHttpClient(customer,method);
                    state=title.getText().toString().trim();
                    state=basic.deleteUTF8Bom(state);
                    System.out.println(state.equals("updateyes"));
                    if(!state.equals("updateyes")){
                        basic.showToast(context,"修改失败！");
                        return;
                    }
                    else {
                        basic.showToast(context,"修改成功！");
                        Intent intent = new Intent(ForgetPasswordActivity.this,LoginActivity.class);
                        intent.putExtra("userphone", phone);
                        intent.putExtra("password", password_yes);
                        setResult(999, intent);
                        finish();
                    }
                    title.setVisibility(View.INVISIBLE);
                }
                title.setVisibility(View.INVISIBLE);
            }
        });
    }

    private void setTheClick()
    {
        // TODO Auto-generated method stub
        ImageView iv = (ImageView) findViewById(R.id.top_bar_left_image);
        iv.setVisibility(View.VISIBLE);
        iv.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View arg0)
            {
                finish();
            }
        });

    }

    CountDownTimer countDownTimer = new CountDownTimer(totalTime, intervalTime)
    {
        @Override
        public void onFinish()
        {// 计时完毕时触发
            authCodeButton.setText("重新发送");
            authCodeButton.setEnabled(true);
            // authCodeButton.setClickable(true);
        }

        @Override
        public void onTick(long currentTime)
        {// 计时过程显示
            // authCodeButton.setClickable(false);
            authCodeButton.setEnabled(false);
            authCodeButton.setText(currentTime / 1000 + "秒");
        }
    };

    @SuppressLint("HandlerLeak")
    public Handler handler=new Handler() {
        public void handleMessage(Message msg)
        {
            switch (msg.what){
                case SHOW_RESPONSE:
                    String response=(String)msg.obj;
                    title.setText(response);
                    break;
                default:
                    break;
            }
        }
    };

    public void SendByHttpClient(Customer customer,String method)
    {
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    HttpClient httpclient=new DefaultHttpClient();
                    loginUrl=url+port+demoName+method;
                    HttpPost httpPost=new HttpPost(loginUrl);//服务器地址，指向Servlet
                    List<NameValuePair> params=new ArrayList<NameValuePair>();//将登录信息装入list
                    params.add(new BasicNameValuePair("customer_phone",customer.getCustomerPhone()));
                    params.add(new BasicNameValuePair("customer_password",customer.getCustomerPassword()));
                    final UrlEncodedFormEntity entity=new UrlEncodedFormEntity(params,"utf-8");//以UTF-8格式发送
                    httpPost.setEntity(entity);
                    HttpResponse httpResponse= httpclient.execute(httpPost);
                    if(httpResponse.getStatusLine().getStatusCode()==200)//在200毫秒之内接收到返回值
                    {
                        HttpEntity entity1=httpResponse.getEntity();
                        String response= EntityUtils.toString(entity1, "utf-8");//以UTF-8格式解析
                        JsonObject jsonObject = (JsonObject) new JsonParser().parse(response).getAsJsonObject();
                        response=jsonObject.get("status").getAsString();
                        System.out.println("返回结果："+response);
                        Message message=new Message();
                        message.what=SHOW_RESPONSE;
                        message.obj=response;
                        handler.sendMessage(message);          //使用Message传递消息给线程
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}