<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-09
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lq.bean.RestBillOfFare" %>
<%@ page import="com.lq.android_servlet.BillOfFareServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>购物车</title>
    <%--<meta http-equiv="Refresh" content="2;URL=${pageContext.request.contextPath}/android/CartServlet?action=doShowCart">--%>
    <meta name="keywords" content="KEYWORDS..." />
    <meta name="description" content="DESCRIPTION..." />
    <meta name="author" content="DeathGhost" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <!--导航栏渐变开始-->
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../css/swiper3.07.min.css" />
    <link rel="stylesheet" href="../css/index.css">
    <link href="../css/android_miner.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js"></script>
    <script src="../js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script src="../js/zepto.js"></script>
    <script src="../js/qrcode.lib.min.js"></script>
    <script src="../js/qrcode.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }
            var baseURL="${pageContext.request.contextPath}";
            //菜单ID
            <c:set var="bill_id" value="${sessionScope.bill_id}" />
            <c:set var="pRoomName" value="${sessionScope.bill_proom}" />
            <c:set var="bill_data" value="${sessionScope.bill_data}" />
            <c:set var="zongjia" value="${sessionScope.zongjia}" />
            <c:set var="billAlls" value="${sessionScope.billAlls}" />
            var bill_id=$("#bill_id").text();
            var pRoomName=$("#pRoomName").text();
            function getQueryString(key){
                var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
                var result = window.location.search.substr(1).match(reg);
                return result?decodeURIComponent(result[2]):null;
            }

            function RemoveCh(strValue) {
                if(strValue!= null && strValue != ""){
                    var reg = /[\u4e00-\u9fa5]/g;
                    return strValue.replace(reg, "");
                }
                else
                    return "";
            }
            var mySwiper = new Swiper('#slide', {
                autoplay: 5000,
                visibilityFullFit: true,
                loop: true,
                pagination: '.pagination'
            });

            function jss() {
                var m = $("#totalcountshow").html();
                if (m > 0) {
                    $(".right").find("a").removeClass("disable");
                } else {
                    $(".right").find("a").addClass("disable");
                }
            }
            //选项卡
            $(".con>div").hide();
            $(".con>div:eq(0)").show();

            $(".left-menu li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                var n = $(".left-menu li").index(this);
                var li_name=$(".left-menu li").index(this);
                $(".con>div").hide();
                $(".con>div:eq("+n+")").show();

            });

            $("#btnselect").click(function () {
                var bill_id="${bill_id}";
                var pay_date="${bill_data}";
                var pay_time="";
                var p_room_id="${pRoomName}";
                var is_takeaway="否";
                var takeaway_type="";
                var pay_type="未支付";
                var pay_price="${zongjia}";
                if(isEmpty(pay_date)||isEmpty(p_room_id)||isEmpty(bill_id)||isEmpty(pay_price)){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/comsume/PayServlet",
                        {
                            "action":"doUpdateOrAdd",
                            "bill_id":bill_id,
                            "p_room_id":p_room_id,
                            "pay_date":pay_date,
                            "pay_time":pay_time,
                            "is_takeaway":is_takeaway,
                            "takeaway_type":takeaway_type,
                            "pay_type":pay_type,
                            "pay_price":pay_price
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href="${pageContext.request.contextPath}/android/Cart/pay.jsp");
                            } else if(status.status=="updateno") {
                                alert("操作失败！");

                            }else if(status.status=="addyesupdateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href="${pageContext.request.contextPath}/android/Cart/pay.jsp");
                            }else if(status.status=="addno") {
                                alert("操作失败！");

                            }
                            else{
                                alert("错误");

                            }
                        }
                    );
                }
            });

            var timer=null;   //定时器
            timer=setInterval(function () {
                $.getJSON(
                    "${pageContext.request.contextPath}/android/CartServlet",
                    {
                        "action":"doUpdateCart",
                        "bill_id":bill_id
                    },
                    function (status) {
                        console.log(status);
                        var json=eval(status);
                        // alert(json[0].vegetableName);
                        $.each(json, function (index, item) {
                            //循环获取数据
                            var tmpJson=eval(json[index]);
                            $.each(tmpJson, function (index, item) {
                                //循环获取数据
                                var vegetableName = tmpJson[index].vegetableName;
                                var vegetablePrice = tmpJson[index].vegetablePrice;
                                var vegetableNumber = tmpJson[index].vegetableNumber;
                                var vegetableState = tmpJson[index].vegetableState;

                                var li=$(".menu-txt");
                                var i=index;
                                var vegetableName2=li[i].getElementsByClassName("vegetableName")[0];
                                var vegetablePrice2=li[i].getElementsByClassName("vegetablePrice")[0];
                                var vegetableNumber2=li[i].getElementsByClassName("vegetableNumber")[0];
                                var vegetableState2=li[i].getElementsByClassName("vegetableState")[0];

                                vegetableName2.innerText=vegetableName;
                                vegetablePrice2.innerText=vegetablePrice;
                                vegetableNumber2.innerText=vegetableNumber;
                                vegetableState2.innerText=vegetableState;
                                    // alert(vegetableName.innerText+vegetablePrice.innerText+vegetableNumber.innerText+vegetableState.innerText);
                            });
                        });
                    }
                );
            },2000);

        });
    </script>

    <style>
        nav a {
            display: block;
            -webkit-box-flex: 1;
            -moz-box-flex: 1;
            text-align: center;
            color: grey;
            line-height: 1.2;
            color: #666;
            text-shadow: 0 1px 1px white;
        }
        .addclasstruenav{color: #3acd17;}

        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=88);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 55%;
            height: 55%;
            padding: 20px;
            border: 10px solid orange;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
        header {
            height: 50px;
            line-height: 50px;
            background-color: #FF0B0C;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 99;
        }
        header .location {
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            color: white;
            padding: 12.5px;
            margin-left: 3%;
        }
        img {
            width: 100%;
            height: auto;
            display: block;
            border: 0;
        }
        header .location img {
            width: 25px;
        }
        .flex-col {
            display: block;
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            flex: 1;
            width: 62%;
            margin-left: 21%;
            background-color: #fff;
            margin: 10px auto 0 auto;
            overflow: hidden;
            position: relative;
        }
        .top-sch-box {
            height: 0.6rem;
            padding: 0 .8rem;
            font-size: .36rem;
            color: #999999;
            -webkit-border-radius: 3px;
            border-radius: 3px;
        }
        .index-searchArea .input-text-searchArea {
            width: 90%;
            height: 2rem;
            outline: none;
            border: none;
            float: left;
            font-size: 0.4rem;
            line-height: 0.5rem;
            padding-left: .3rem;
        }
        input {
            color: inherit;
            font: inherit;
            font-size: inherit;
            line-height: inherit;
            margin: 0;
        }
        .input-searchBtn[type='button'] {
            font-family: 'freshregular';
            background: none;
            border: none;
            color: grey;
            position: absolute;
            left: -30px;
            top: -9px;
            outline: none;
            font-size: .45rem;
        }
        .index-searchArea .input-searchBtn {
            width: 9%;
            color: #000;
            float: right;
            position: absolute;
            right: 3%;
        }
        body{
            margin: 0;
            padding: 0;
        }
        * {
            font-family: '微软雅黑';
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        @font-face {
            font-family:'freshregular';
            src:url('../css/fonts/fresh-webfont.woff') format('woff'),
            url('../css/fonts/fresh-webfont.ttf') format('truetype'),
            url('../css/fonts/fresh-webfont.svg#freshregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }


    </style>
    <!--地区参数传值-->

</head>

<body>
<section class="aui-flexView">
    <section class="aui-scrollView">
        <br>
        <div style="text-align: center">
            <h1 style="font-weight: bold">菜单</h1>
        </div>
        <hr>
        <div>
            <table style="width: 99%;height:99%;">
                <tr>
                    <td>&nbsp;</td>
                    <td><h3 id="pRoomName">${pRoomName}</h3></td>
                    <td style="text-align:right"><h3>菜单号：${bill_id}</h3></td>
                    <td>&nbsp;</td>
                    <td style="display: none;"><h3 id="bill_id">${bill_id}</h3></td>
                </tr>
            </table>
        </div>
        <hr>
        <!--分类商品-->

        <div class="main">
            <div class="left-menu">
                <ul>
                    <li class="active" id="ganguo">干锅<span class="num-price"></span></li>
                    <li id="tangguo">汤锅</li>
                    <li id="huncai">荤菜</li>
                    <li id="sucai">素菜</li>
                    <li id="zhushi">主食</li>
                    <li id="liaowan">料碗</li>
                    <li id="jiushui">酒水</li>
                    <li id="qita">其他</li>
                </ul>
            </div>
            <div class="con">
                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='干锅类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='汤锅类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='荤菜类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='素菜类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>


                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='主食类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='料碗类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='酒水类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                <div class="right-con con-active">
                    <ul>
                        <c:forEach items="${billAlls}" var="billAll">
                            <c:if test="${billAll.vegetableType=='其他类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4 class="vegetableName">${billAll.vegetableName}</h4>
                                        <h2 class="vegetablePrice">${billAll.vegetablePrice}</h2>
                                        <p class="list1">共点<em class="vegetableNumber">${billAll.vegetableNumber}</em>份</p>
                                        <p class="list1">上菜状态：<em class="vegetableState">${billAll.vegetableState}</em></p>
                                        <p class="list2">
                                        <div class="btn">

                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

            </div>
        </div>
        <div class="footer">
            <div class="left">
		<span id="cartN">

			<img src="../images/shop_03.png"/>
			<span id="totalcountshow">0</span>
			<span class="totalpriceshow">￥<em id="totalpriceshow">${zongjia}</em></span>
		</span>
            </div>
            <div class="right">
                <a id="btnselect" style="background-color:#FF0B0C;" class="xhlbtn  disable" >点菜完成</a>
            </div>
        </div>
        <div style="height:1.2rem;"></div>

        <%--<iframe scrolling="auto" frameborder="0" height="90" width="100%" src="${pageContext.request.contextPath}/android/Other/footer.jsp"></iframe>--%>
    </section>
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Other/footer.js"></script>
</section>

</body>

</html>