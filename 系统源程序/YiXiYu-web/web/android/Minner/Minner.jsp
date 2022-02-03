<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-04-10
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>溢香园餐饮Android客户端个人中心页面</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="../css/android_miner.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/android_miner.js"></script>
    <c:set var="customer" value="${sessionScope.customer}" />
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#updateCustomer").click(function () {
                window.location.replace(location.href='${pageContext.request.contextPath}/android/RLServlet?action=doShow');
            });
        });
    </script>
</head>
<body>

<section class="aui-flexView">

    <section class="aui-scrollView">
        <div class="aui-take-head">
            <div class="aui-flex aui-flex-one">
                <div class="aui-take-user">
                    <img src="../images/user.png" alt="">
                </div>
                <div class="aui-flex-box">
                    <h2>${customer.customerNickname}</h2>
                    <span>
						<i class="icon icon-phone"></i>${customer.customerPhone}
					</span>
                </div>
                <div class="aui-take-button">
                    <button style="border:1px solid #FFFFFF"><i class="icon icon-pic"></i>签到领积分</button>
                </div>
            </div>

            <img src="../images/head.png" alt="">
        </div>

        <div class="aui-take-item">
            <div class="aui-flex" style="padding-bottom:0">
                <div class="aui-flex-box">
                    <h1>我的订单</h1>
                </div>
                <div class="aui-arrow">
                    <span>查看全部订单</span>
                </div>
            </div>
            <div class="aui-palace">
                <a href="../Cart/pay.jsp" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-001.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>待支付</h2>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/android/CustomerPayServlet?action=doShow" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-002.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>已完成</h2>
                    </div>
                </a>
                <a href="javascript:;" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-003.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>待评价</h2>
                    </div>
                </a>
                <a href="javascript:;" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-004.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>客服</h2>
                    </div>
                </a>
            </div>
        </div>



        <div class="aui-take-item">
            <div class="aui-flex">
                <div class="aui-flex-box">
                    <h1>常用功能</h1>
                </div>

            </div>
            <div class="aui-palace">
                <a href="wifi.html" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(1).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>查WIFI</h2>
                    </div>
                </a>
                <a href="tableware.html" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(2).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>要餐具</h2>
                    </div>
                </a>
                <a href="zuowei.html" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(3).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>找位子</h2>
                    </div>
                </a>
                <a href="call-staff.html" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(4).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>服务员</h2>
                    </div>
                </a>
                <a href="javascript:;" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(6).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>打包</h2>
                    </div>
                </a>
                <a href="invoice.html" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/fuwu%20(5).png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>开发票</h2>
                    </div>
                </a>
                <a id="updateCustomer" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-011.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2 >修改信息</h2>
                    </div>
                </a>
                <a href="javascript:;" class="aui-palace-grid">
                    <div class="aui-palace-grid-icon">
                        <img src="../images/nav-012.png" alt="">
                    </div>
                    <div class="aui-palace-grid-text">
                        <h2>设置</h2>
                    </div>
                </a>
            </div>
        </div>
        <div style="height:50px;"></div>


    </section>
    <!--<iframe scrolling="auto" frameborder="0" height="90" width="100%" src="../Other/footer.html"></iframe>-->
    <script type="text/javascript" src="../Other/footer.js"></script>
</section>
</body>

</html>

