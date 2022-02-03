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
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yixiyu.lq.yixiyuandroid_customer.bean.Customer;
import com.yixiyu.lq.yixiyuandroid_customer.service.Basic;
import com.yixiyu.lq.yixiyuandroid_customer.service.RL;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.util.ArrayList;
import java.util.List;

public class RegistActivity extends AppCompatActivity implements RL
{
    private Button bt_regist;
    private EditText register_nickname;   //注册昵称
    private RadioGroup register_rg_sex;            //注册性别
    private RadioButton register_rb_sex1,register_rb_sex2;
    private EditText register_phone;    //注册手机号
    private EditText user_register_auth_code_et;    //验证码
    private EditText register_password1;     //第一次输入密码
    private EditText register_password2;     //确定输入密码
    private TextView tv_login,title,user_register_auth_code_tv;
    private long totalTime = 60000, intervalTime = 1000;
    public static final int SHOW_RESPONSE=1;
    private String loginUrl;
    private String method;
    private String sex;
    private String state=null;
    private Customer customer;
    Intent intent=null;
    Context context=RegistActivity.this;
    Basic basic=new Basic();
    Gson gson=new Gson();

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_regist);
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

    public void init()
    {
        ((TextView) findViewById(R.id.top_bar_title)).setText("用户注册");
        setBackArrows((ImageView) findViewById(R.id.top_bar_left_image));
        setTheClick();
        register_nickname=(EditText)findViewById(R.id.register_nickname);
        register_rg_sex=(RadioGroup)findViewById(R.id.register_rg_sex);
        register_rb_sex1=(RadioButton)findViewById(R.id.sex1);
        register_rb_sex2=(RadioButton)findViewById(R.id.sex2);
        register_rg_sex.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener()
        {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId)
            {
                switch (checkedId){
                    case R.id.sex1:
                        sex = register_rb_sex1.getText().toString().trim();
                        break;
                    case R.id.sex2:
                        sex = register_rb_sex2.getText().toString().trim();
                        break;
                }
            }
        });
        register_phone=(EditText)findViewById(R.id.register_phone);
        user_register_auth_code_tv=(TextView)findViewById(R.id.user_register_auth_code_tv);
        user_register_auth_code_et=(EditText)findViewById(R.id.user_register_auth_code_et);
        register_password1=(EditText)findViewById(R.id.register_password1);
        register_password2=(EditText)findViewById(R.id.register_password2);
        title = (TextView) findViewById(R.id.user_register_title);
        bt_regist=(Button)findViewById(R.id.bt_regist);
    }

    public void initView()
    {
        //发送验证码
        user_register_auth_code_tv.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                String name = register_nickname.getText().toString().trim();
                String phone = register_phone.getText().toString().trim();
                String password = register_password1.getText().toString().trim();
                String password_yes = register_password2.getText().toString().trim();
                title.setVisibility(View.VISIBLE);
                title.setText("");
                if (name.equals(""))
                {
                    title.setText("请输入昵称！");
                } else if (phone.equals(""))
                {
                    title.setText("请输入手机号！");
                } else if (!phone.matches("^[1][3,5,7,8]+\\d{9}"))
                {
                    title.setText("请输入正确的手机号！");
                    title.setVisibility(View.INVISIBLE);
                    countDownTimer.start();
//                getCode(phone,2);
                }
                title.setVisibility(View.VISIBLE);
            }
        });

        //注册
        bt_regist.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                String nick_name=(register_nickname).getText().toString().trim();
                String phone=(register_phone).getText().toString().trim();
                String code=user_register_auth_code_et.getText().toString().trim();
                String password=(register_password1).getText().toString().trim();
                String password_yes=(register_password2).getText().toString().trim();
                title.setVisibility(View.VISIBLE);
                title.setText("");
                if(basic.Isempty(nick_name)){
                    title.setText("请输入昵称！");
                    return;
                }else if (basic.Isempty(sex)) {
                    title.setText("请选择性别！");
                    return;
                } else if (basic.Isempty(phone)) {
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
                }else {
                        title.setVisibility(View.VISIBLE);
                        customer=new Customer(nick_name,sex,password_yes,phone);
                        customer.toString();
                        method="?action=Regist";
                        SendByHttpClient(customer,method);
                        state=title.getText().toString().trim();
                        state=basic.deleteUTF8Bom(state);
                        System.out.println(state);
                        if(state.equals("exists")){
                            basic.showToast(context,"账号已存在！");
                            intent = new Intent(RegistActivity.this,LoginActivity.class);
                            intent.putExtra("userphone", phone);
                            intent.putExtra("password", password_yes);
                            setResult(999, intent);
                            finish();
                        }else if(state.equals("addyes")){
                            basic.showToast(context,"注册成功！");
                            intent = new Intent(RegistActivity.this,LoginActivity.class);
                            intent.putExtra("userphone", phone);
                            intent.putExtra("password", password_yes);
                            setResult(999, intent);
                            finish();
                        }
                        else {
                            basic.showToast(context,"注册失败！");
                        }
                }
                title.setVisibility(View.INVISIBLE);
            }
        });

    };

    CountDownTimer countDownTimer = new CountDownTimer(totalTime, intervalTime) {
        @Override
        public void onFinish() {// 计时完毕时触发
            user_register_auth_code_tv.setText("重新发送");
            user_register_auth_code_tv.setEnabled(true);
            // authCodeButton.setClickable(true);
        }

        @Override
        public void onTick(long currentTime) {// 计时过程显示
            // authCodeButton.setClickable(false);
            user_register_auth_code_tv.setEnabled(false);
            user_register_auth_code_tv.setText(currentTime / 1000 + "秒");
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
                    params.add(new BasicNameValuePair("customer_nickname",customer.getCustomerNickname()));
                    params.add(new BasicNameValuePair("customer_sex",customer.getCustomerSex()));
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
}