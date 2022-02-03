package com.yixiyu.lq.yixiyuandroid_customer;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.yixiyu.lq.yixiyuandroid_customer.Main.MainActivity;
import com.yixiyu.lq.yixiyuandroid_customer.bean.Customer;
import com.yixiyu.lq.yixiyuandroid_customer.service.Basic;
import com.yixiyu.lq.yixiyuandroid_customer.service.MyLog;
import com.yixiyu.lq.yixiyuandroid_customer.service.RL;

import java.util.ArrayList;
import java.util.List;

public class LoginActivity extends AppCompatActivity implements RL
{
    private EditText login_phone;
    private EditText login_password;
    private TextView login_register_left;
    private TextView login_forget_password;
    private TextView title;
    private TextView tv_login;
    private String loginUrl;
    private String method;
    private String state=null;
    public static final int SHOW_RESPONSE=1;
    Gson gson=new Gson();
    Customer customer=null;
    Intent intent=null;
    Context context= LoginActivity.this;
    Basic basic=new Basic();
    MyLog myLog=new MyLog();

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        init();
        initView();
    }

    public void init()
    {
        ((TextView) findViewById(R.id.top_bar_title)).setText("用户登录");
        setBackArrows((ImageView) findViewById(R.id.top_bar_left_image));
        tv_login=(TextView) findViewById(R.id.tv_login);
        login_phone=(EditText)findViewById(R.id.login_phone);
        login_password=(EditText)findViewById(R.id.login_password);
        login_register_left=(TextView)findViewById(R.id.login_register_left);
        login_forget_password=(TextView)findViewById(R.id.login_forget_password);
        title=(TextView)findViewById(R.id.user_login_title);
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
    public void initView()
    {
        //点击登录
        tv_login.setOnClickListener(onClickListener);
        //点击注册
        login_register_left.setOnClickListener(onClickListener);
        //点击忘记密码
        login_forget_password.setOnClickListener(onClickListener);
    }

    private OnClickListener onClickListener=new OnClickListener()
    {
        @Override
        public void onClick(View v)
        {
            String phone=(login_phone).getText().toString().trim();
            String password=(login_password).getText().toString().trim();
            title.setVisibility(View.VISIBLE);
            title.setText("");
            switch (v.getId()){
                case R.id.tv_login:
                    if(basic.Isempty(phone)||basic.Isempty(password)){
                        title.setText("请输入合法的手机号和密码！");
                        return;
                    }else {
                        customer=new Customer(password,phone);
                        customer.toString();
                        method="?action=Login";
                        SendByHttpClient(customer,method);
//                        System.out.println(Arrays.toString(str.getBytes()));
//                        System.out.println(Arrays.toString(state.getBytes()));
//                        state=basic.deleteUTF8Bom(state);
                        if(state.equals("login_true")){
                            title.setVisibility(View.INVISIBLE);
                            basic.showToast(context,"登录成功！");
                            intent=new Intent(LoginActivity.this, MainActivity.class);
                            startActivity(intent);
                            LoginActivity.this.finish();
                        }else {
                            title.setVisibility(View.INVISIBLE);
                            basic.showToast(context,"登录失败！");
//                            Intent intent2=new Intent(LoginActivity.this, RegistActivity.class);
//                            startActivity(intent2);
//                            LoginActivity.this.finish();
                        }
                        title.setVisibility(View.VISIBLE);
                    }
                    break;
                case R.id.login_register_left:
                    Intent intent2 = new Intent(LoginActivity.this,RegistActivity.class);
                    startActivityForResult(intent2, 999);
                    break;
                case R.id.login_forget_password:
                    Intent intent3 = new Intent(LoginActivity.this,
                            ForgetPasswordActivity.class);
                    startActivityForResult(intent3, 1000);
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
                        System.out.println("返回结果："+response);
                        JsonObject jsonObject = (JsonObject) new JsonParser().parse(response).getAsJsonObject();
                        response=jsonObject.get("status").getAsString();
                        System.out.println("gson解析："+response);
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

    @SuppressLint("HandlerLeak")
    public Handler handler=new Handler() {
        public void handleMessage(Message msg)
        {
            switch (msg.what){
                case SHOW_RESPONSE:
                    String response=(String)msg.obj;
                    title.setText(response);
                    state=response;
//                    basic.showToast(context,response);
                    break;
                default:
                    break;
            }
        }
    };

}
