<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-03
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.lq.bean.RestPRoom" %>
<%@ page import="com.lq.rest_servlet.PRoomServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8"> 。
    <title>溢香园餐饮Android客户端登录/注册</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="${pageContext.request.contextPath}/android/css/android_login.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            var baseURL="${pageContext.request.contextPath}";
            var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
            var count = 60;
            var InterValObj1;
            var curCount1;
            var sms="";
            function SetRemainTime1() {
                if (curCount1 == 0) {
                    window.clearInterval(InterValObj1);
                    $("#btnSendCode1").removeAttr("disabled");
                    $("#btnSendCode1").val("重新发送");
                }
                else {
                    curCount1--;
                    $("#btnSendCode1").val( + curCount1 + "秒再获取");
                }
            }
            $("#btnSendCode1").click(function () {

                curCount1 = count;
                var phone = $.trim($('#phone1').val());
                if (!phoneReg.test(phone)) {
                    alert(" 请输入有效的手机号码");
                    return false;
                }
                else{
                    alert("已发送验证码");
                    $.getJSON(
                        baseURL+"/android/RLServlet",
                        {
                            "phone":phone,
                            "action":"SendSMS"
                        },
                        function (status) {
                            console.log(status);
                            sms=status.code;
                        }
                    );
                    $("#btnSendCode1").attr("disabled", "true");
                    $("#btnSendCode1").val( + curCount1 + "秒再获取");
                    InterValObj1 = window.setInterval(SetRemainTime1, 1000);
                }

            });
            $("#login_regist").click(function () {
                var phone = $.trim($('#phone1').val());
                var code = $.trim($("#code1").val());
                var password=$.trim($("#password").val());
                if (code == "") {
                    alert("请输入验证码");
                } else {
                    if (sms == code) {
                        $.getJSON(
                            baseURL+"/android/RLServlet",
                            {
                                "phone":phone,
                                "password":password,
                                "sex":"",
                                "action":"Regist"
                            },
                            function (status) {
                                var result=status.status;
                                alert(result);
                                if(result=="登录成功"||result=="注册成功"){
                                    window.location.href=baseURL+"/android/BillOfFareServlet?action=doShow&&phone="+phone;
                                }
                                else {
                                    alert("请重新输入");
                                }
                            }
                        );

                    } else {
                        alert("验证码错误");
                    }

                }
            });
        });
    </script>
</head>
<body>

<section class="aui-flexView">
    <header class="aui-navBar aui-navBar-fixed">
        <a href="javascript:;" class="aui-navBar-item">
            <i class="icon icon-return"></i>
        </a>
        <div class="aui-center">
            <span class="aui-center-title"></span>
        </div>

    </header>
    <section class="aui-scrollView">
        <div class="aui-ver-head">
            <img src="images/login_head.png" alt="">
        </div>
        <div class="aui-ver-form">
            <h2>短信快捷登录</h2>
            <div class="aui-flex">
                <div class="aui-flex-box">
                    <i class="icon icon-phone"></i>
                    <input id="phone1" type="text" autocomplete="off" placeholder="手机号码" >
                </div>
            </div>
            <div class="aui-flex">
                <div class="aui-flex-box">
                    <i class="icon icon-code"></i>
                    <input id="password" type="text" autocomplete="off" placeholder="密  码" >
                </div>
            </div>

            <div class="aui-flex">
                <div class="aui-flex-box">
                    <i class="icon icon-code"></i>
                    <input id="code1" type="text" autocomplete="off" placeholder="验证码">
                </div>
                <div class="aui-button-code">
                    <input id="btnSendCode1" type="button" class="btn btn-default" value="获取验证码"/>
                </div>
            </div>
            <div class="aui-ver-button">
                <button id="login_regist">立即登录</button>
            </div>
            <div class="aui-cell-box">
                <label class="cell-right">
                    <input type="checkbox" value="1" name="checkbox" checked="checked">
                    <i class="cell-checkbox-icon"></i>
                    <em>同意溢香园餐饮注册协议</em>
                </label>
            </div>

        </div>
        <div class="aui-login-box">
            <h2>其它登录方式</h2>
        </div>
        <div class="aui-palace">
            <a href="javascript:;" class="aui-palace-grid">
                <div class="aui-palace-grid-icon">
                    <img src="images/weixin_login.png" alt="">
                </div>
                <div class="aui-palace-grid-text">
                    <h2>微信</h2>
                </div>
            </a>
            <a href="javascript:;" class="aui-palace-grid">
                <div class="aui-palace-grid-icon">
                    <img src="images/taobao_login.png" alt="">
                </div>
                <div class="aui-palace-grid-text">
                    <h2>淘宝</h2>
                </div>
            </a>
            <a href="javascript:;" class="aui-palace-grid">
                <div class="aui-palace-grid-icon">
                    <img src="images/qq_login.png" alt="">
                </div>
                <div class="aui-palace-grid-text">
                    <h2>腾讯</h2>
                </div>
            </a>
            <a href="javascript:;" class="aui-palace-grid">
                <div class="aui-palace-grid-icon">
                    <img src="images/weibo_login.png" alt="">
                </div>
                <div class="aui-palace-grid-text">
                    <h2>微博</h2>
                </div>
            </a>
        </div>

    </section>
</section>
</body>

</html>
