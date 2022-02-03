<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>我的账单</title>
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
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="../css/swiper3.07.min.css" />
    <script src="../js/swiper.jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var baseUrl="${pageContext.request.contextPath}/android/OrderServlet";
            var bill_id=$("#bill_id").text();
            $(".show").click(function () {
                window.location.href=encodeURI("${pageContext.request.contextPath}/android/Cart/Showfullpay.jsp");
            });
        });
    </script>
    <style type="text/css">
        .tab {top: 0;}
        .my-order-iphone1 {margin-top: 4%;}

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
</head>

<body>
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
    <h1>全部账单</h1>
</header>
<c:set var="restPayForms" value="${sessionScope.restPayForms}" />
<div class="swiper-container" style="margin-top: 60px;" >
    <div class="swiper-wrapper w">
        <div class="swiper-slide d">
            <div class="swiper-container2">
                <div class="swiper-wrapper">
                    <div class="swiper-slide list-group">
                        <ul>
                            <li class="bor-bottom5-f1 bg-fff padb03">
                                <div class="order-details-header">
                                    <c:forEach items="${restPayForms}" var="restPayForm">
                                        <hr>
                                        <table style="width: 99%;height: 90px;text-align: center;">
                                            <tr>
                                                <td>支付地点：溢香园火锅店</td>
                                                <td>支付时间：${restPayForm.payDate} ${restPayForm.payTime}</td>
                                            </tr>
                                            <tr>
                                                <td>包间：${restPayForm.PRoomId}</td>
                                                <td >菜单号：<em id="bill_id">${restPayForm.billId}</em></td>

                                            </tr>
                                            <tr>
                                                <td>支付方式：${restPayForm.payType}</td>
                                                <td>支付金额：${restPayForm.payPrice}人</td>
                                            </tr>
                                        </table>
                                        <div class="clearfix"></div>
                                        <div class="bg-fff pay-button-myorder">
                                            <button class="show">查看详情</button>
                                        </div>
                                        <hr>
                                    </c:forEach>

                                </div>
                            </li>

                        </ul>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../Other/footer.js"></script>
</div>
<div style="height:1.2rem;"></div>

</body>

</html>