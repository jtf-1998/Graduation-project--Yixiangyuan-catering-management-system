<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-23
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<head>
    <meta charset="utf-8" />
    <title>账单详情</title>
    <meta name="keywords" content="KEYWORDS..." />
    <meta name="description" content="DESCRIPTION..." />
    <meta name="author" content="DeathGhost" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="icon" href="../../images/icon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="../images/icon/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="../images/icon/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196" href="../images/icon/apple-touch-icon-196x196-precomposed.png">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/date.js" ></script>
    <script type="text/javascript" src="../js/iscroll.js" ></script>
    <c:set var="bill_id" value="${sessionScope.bill_id}" />
    <c:set var="pRoomName" value="${sessionScope.bill_proom}" />
    <c:set var="bill_data" value="${sessionScope.bill_data}" />
    <c:set var="zongjia" value="${sessionScope.zongjia}" />
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function (){
            var ServletURL="${pageContext.request.contextPath}/android/CustomerPayServlet";
            $(function(){
                $('#beginTime').date();
                $('#endTime').date({theme:"datetime"});
            });
            $("#btnselect").click(function () {
                var bill_id=$("#bill_id").text();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doSearch",
                        "bill_id":bill_id
                    },
                    function (status) {
                        if (status.status == "yes") {
                            alert("已支付！");
                            window.location.replace(location.href=ServletURL+'?action=doShow');
                            thisTr.remove();
                        }else{
                            alert("未支付！");
                        }
                    }
                )
            })
            $(function() {
                var all = $("#time").html();
                var m = Number(all.substring(0, all.indexOf(":")));
                var s = Number(all.substring(all.indexOf(":") + 1, all.length + 1));
                var f = setInterval(function() {
                    if(s < 10) {
                        //如果秒数少于10在前面加上0
                        $('#time').html(m + ':0' + s);
                    } else {
                        $('#time').html(m + ':' + s);
                    }
                    s--;
                    if(s < 0) {
                        //如果秒数少于0就变成59秒
                        if(m==0){
                            window.clearInterval(f);
                        }
                        m--;
                        s = 59;
                    }
                }, 1000)
            })
            /*支付标签切换*/
            $(function(){
                $(".payway").click(function(){
                    $(".fr>img").attr("src","img/check (1).png");
                    $(this).find(".fr>img").attr("src","img/check (2).png") ;
                })
            })
        });

    </script>

</head>

<body style="overflow-y: scroll;height: 100%;">
<section class="aui-flexView">
    <!--<script type="text/javascript" src="../Other/header.js"></script>-->
    <section class="aui-scrollView">
        <div class="pay-order-header">
            <ul>
                <li>支付剩余时间</li>
                <li id="time">3:00</li>
            </ul>
        </div>

        <div class="order-details-header clearfix">
            <h4 class="fl">就餐方式</h4>
            <select class="fr">
                <option>打包</option>
                <option>堂吃</option>
            </select>
        </div>
        <table width="100%" class="bg-fff order-det-cont" >
            <tbody>
            <tr>
                <td align="left" class="padl3" style="color:#999">订单号</td>
                <td align="right" width="50%" style="color:#999" id="bill_id">${bill_id}</td>
            </tr>
            <tr>
                <td align="left" class="padl3" style="color:#999">支付日期</td>
                <td align="right" width="50%" style="color:#999">${bill_data}</td>
            </tr>
            <tr>
                <td align="left" class="padl3" style="color:#999">包间：</td>
                <td align="right" width="50%" style="color:#999">${pRoomName}</td>
            </tr>
            <tr>
                <td align="left" class="padl3" style="color:#999">餐品详情</td>
                <td align="right" width="50%" style="color:#999">更多<img style="width:.3rem;" src="../images/jtx1.png" /></td>
            </tr>
            <c:set var="billAlls" value="${sessionScope.billAlls}" />
            <c:forEach items="${billAlls}" var="billAll">
                <tr>
                    <td align="left" class="padl3">${billAll.vegetableName}</td>
                    <td align="left" ><em>${billAll.vegetablePrice}</em>×<em>${billAll.vegetableNumber}</em></td>
                </tr>
            </c:forEach>

            <tr>
                <td align="left" colspan="1" class="padl3">餐品总额</td>
                <td align="right" class="padr3">￥<em>${zongjia}</em></td>
            </tr>
            <tr style="border-top: solid 8px #f1f1f1;">
                <td align="left" colspan="1" class="padl3">实付金额:</td>
                <td align="right" class="padr3">
                    <a href="#" class="padding-right23 colorf00">￥${zongjia}</a>
                </td>
            </tr>
            <tr style="border-top: solid 8px #f1f1f1;">
                <td align="left" colspan="1" class="padl3">支付方式:</td>
                <td align="right" class="padr3">
                    <a href="#" class="padding-right23 colorf00">请到前台扫码/现金支付</a>
                </td>
            </tr>
            </tbody>
        </table>

        <div style="height:1rem;"></div>
        <div class="footer">
            <div class="left" style="height: 100%;text-align: center;line-height: 40px"><a href="${pageContext.request.contextPath}/android/CustomerPayServlet?action=doShow" id="cancel">返回</a></div>
            <div class="right">
                <a id="btnselect" style="background-color:#FF0B0C;" class="xhlbtn  disable" >支付状态</a>
            </div>


        </div>
        <div style="height:1.2rem;"></div>
    </section>
    <div id="datePlugin"></div>
    <!--<iframe scrolling="auto" frameborder="0" height="90" width="100%" src="../Other/footer.html"></iframe>-->
    <script type="text/javascript" src="../Other/footer.js"></script>


</section>
</body>

</html>
