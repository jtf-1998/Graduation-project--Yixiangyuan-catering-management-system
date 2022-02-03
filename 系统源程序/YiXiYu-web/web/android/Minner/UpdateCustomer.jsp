<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-24
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>修改个人信息</title>
    <meta name="keywords" content="KEYWORDS..." />
    <meta name="description" content="DESCRIPTION..." />
    <meta name="author" content="DeathGhost" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="icon" href="../images/icon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="../images/icon/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="../images/icon/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196" href="../images/icon/apple-touch-icon-196x196-precomposed.png">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <style type="text/css">
        button {
            background: -webkit-linear-gradient(left, #FF0B0C , #FF4837);
            /* Safari 5.1 - 6.0 */
            background: -o-linear-gradient(right, #FF0B0C , #FF4837);
            /* Opera 11.1 - 12.0 */
            background: -moz-linear-gradient(right, #FF0B0C , #FF4837);
            /* Firefox 3.6 - 15 */
            background: linear-gradient(to right, #FF0B0C , #FF4837);
            /* 标准的语法 */
            background-color: #FF0B0C;
            border-radius: 22px;
            color: #fff;
            border: none;
            font-size: 21px;
            box-shadow: 0 5px 9px #fddae1;
            padding: 10px 25px;
        }
    </style>
    <script src="../js/jquery.js"></script>
    <c:set var="order_id" value="${sessionScope.customer}" />
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            var baseUrl="${pageContext.request.contextPath}/android/RLServlet";
            $(".gender span").click(
                function() {
                    $(".gender span").removeClass("add-gender")
                    $(this).addClass("add-gender")
                    $("#sex").text($(this).text());
                }
            );

            var sex=$("#sex").text();
            if(sex=="先生"){
                $("#woman").removeClass("add-gender");
                $("#man").addClass("add-gender");
            }else if(sex=="女士"){
                $("#man").removeClass("add-gender");
                $("#woman").addClass("add-gender");
            }

            $("#ok").click(function () {
                var customer_nickname=$("#customer_nickname").val();
                var customer_sex=$("#sex").text();
                var customer_phone=$("#customer_phone").val();
                var customer_name=$("#customer_name").val();
                var birth=$("#birth").val();
                alert("nick："+customer_nickname+"sex："+customer_sex+"name："+customer_name+"birth："+birth+"phone："+customer_phone);
                $.getJSON(
                        baseUrl,
                        {
                            "action":"doUpdate",
                            "customer_nickname":customer_nickname,
                            "customer_sex":customer_sex,
                            "customer_phone":customer_phone,
                            "customer_name":customer_name,
                            "birth":birth
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyes") {
                                alert("修改成功！");

                            } else{
                                alert("修改失败！");
                            }
                        }
                    );

            }) ;
        });
    </script>
</head>

<body>
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
    <h1>修改信息</h1>
</header>
<div style="height:1rem;"></div>
<ul class="formarea">
    <li>
        <label class="lit">昵称</label>
        <input type="text" id="customer_nickname" placeholder="可以修改你的昵称" class="textbox" value="${customer.customerNickname}"/>
    </li>
    <li>
        <label class="lit">姓名</label>
        <input type="text" id="customer_name" placeholder="可以填入你的姓名" class="textbox" value="${customer.customerName}"/>
    </li>
    <h1 style="display: none;" id="sex">${customer.customerSex}</h1>
    <li>
        <label class="lit">性别</label>
        <div class="textbox gender">
            <span class="add-gender" id="man">先生</span>
            <span id="woman">女士</span>
        </div>
    </li>
    <li>
        <label class="lit">出生年月</label>
        <input type="date" id="birth" placeholder="请输入你的生日" class="textbox" value="${customer.birth}"/>
    </li>
    <li>
        <label class="lit">手机号</label>
        <input type="text" id="customer_phone" value="${customer.customerPhone}" class="textbox" readonly="readonly"/>
    </li>

</ul>
<div style="height:1.2rem;"></div>
<div class="aui-ver-button">
    <table style="width: 99%;height: 60px;text-align: center;">
        <tr>
            <td><button id="ok">确定</button></td>
        </tr>
    </table>

</div>
</body>

</html>
