<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-01-13
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />

    <title>溢香园火锅店消费管理系统用户登录</title>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function()
    {
        var code=""; //在全局 定义验证码
        function createCode()
        {
            code = "";
            var codeLength = 4;//验证码的长度
            var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
                'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i< codeLength; i++)
            {

                var charIndex = Math.floor(Math.random() * 36); //随机生成1-36的数字并且向下取整，比如取到5.99999那么则为5
                code += selectChar[charIndex]; //code = "" + 你所随机到的位置，这里charIndex就是数组的角标， 取值为字母或者数字
            }
            if (checkCode)
            {
                // $("#code").className = "code";
                $("#checkCode").html(code);
            }
        }
        createCode();
        $("#checkCode").click(createCode());

        $("#username").mouseleave(function ()
        {
            var name=$("#username").val();
            if(name.length<=0)
            {
                alert("用户名或密码为空");
                return false;
            }
            else
                return true;
        });

        $("#password").blur(function () {
            var password=$("#password").val();
            if(password.length<=0)
            {
                alert("用户名或密码为空");
                return false;
            }
            else{
                return true;
            }
        });

        $("#inputCode").focus(function () {
            $.getJSON(
                "${pageContext.request.contextPath}/rest/AdiminLoginServlet",
                {
                    "username":$("#username").val(),
                    "password":$("#password").val(),
                    "action":"doLogin"
                },
                function (status) {
                    console.log(status);
                    if(status.status=="yes"){
                        $("#msg").html("用户名和密码正确");
                        $("#msg").css("color","green");
                    }else {
                        $("#msg").html("用户名或密码错误");
                        $("#msg").css("color","red");
                    }
                }
            )
        })

        $("#inputCode").mouseleave(function ()
        {
            var codetext=$("#inputCode").val();
            if(codetext.length<=0)
            {
                alert("请输入验证码！");
                return false;
            }
            else if(codetext.toUpperCase()!=code.toUpperCase())
            {
                alert("验证码输入有误！");
                createCode();
                return false;
            }
            else
                return true;
        });

        $("#login").mouseenter(function ()
        {
            var codetext=$("#inputCode").val();
            if(codetext.length<=0)
            {
                alert("请输入验证码！");
                return false;
            }
            else if(codetext.toUpperCase()!=code.toUpperCase())
            {
                alert("验证码输入有误！");
                createCode();
                return false;
            }
            else
                return true;
        });

        $("#login").click(function () {
            var admin_ID=$("#username").val();
            window.location.href="${pageContext.request.contextPath}/index.jsp?admin="+admin_ID;
        });
    });
</script>
</head>

<body>
    <div id="container">
        <div id="bd">
            <div id="main">
                <div class="login-box">
                    <div id="logo"></div>
                    <h1></h1>

                        <div class="input username">
                            <label for="userName">管理员ID</label>
                            <span></span>
                            <input type="text" id="username" name="username" checked/>
                        </div>
                        <div class="input psw" id="psw">
                            <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                            <span></span>
                            <input type="password" id="password" name="password" checked/>&nbsp;

                        </div>
                        <div style="position: fixed;height: 30px;left: 63%;top: 280px"><span
                                id="msg"></span></div>
                        <div class="input validate" id="validate">
                            <label for="valiDate">验证码</label>
                            <input type="text" id="inputCode" name="inputCode" checked/>
                            <div class="value">
                                <div class="code" id="checkCode">1</div>
                            </div>
                        </div>
                        <div id="btn" class="loginButton">
                            <input type="submit" class="button" id="login" name="login" value="登录"  />
                        </div>


                </div>

            </div>
            <div id="ft">CopyRight&nbsp;2021&nbsp;&nbsp;版权所有&nbsp;&nbsp;</div>
        </div>
    </div>

</body>

</html>
