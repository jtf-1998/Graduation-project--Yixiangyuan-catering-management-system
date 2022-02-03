<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-09
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lq.bean.RestBillOfFare" %>
<%@ page import="com.lq.android_servlet.BillOfFareServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>点餐</title>
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
            Qrcode.init($('[node-type=qr-btn]'));
            var baseURL="${pageContext.request.contextPath}";
            // var mySwiper = new Swiper('.swiper-container',{
            //     prevButton:'.swiper-button-prev',
            //     nextButton:'.swiper-button-next',
            // })
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
                pagination: '.pagination',
            });
            //加的效果
            $(".add").click(function () {
                $(this).prevAll().css("display", "inline-block");
                var n = $(this).prev().text();
                var num = parseInt(n) + 1;
                if (num == 0) { return; }
                $(this).prev().text(num);
                var vegetableId = $(this).next();//获取编号
                var vegetableType = vegetableId.next();//获取类型
                var vegetableName = vegetableType.next();//获取名称
                var vegetablePrice = vegetableName.next();//获取价格

                var danjia=RemoveCh(vegetablePrice.text());
                var a = $("#totalpriceshow").html();//获取当前所选总价
                $("#totalpriceshow").html((a * 1 + danjia * 1).toFixed(2));//计算当前所选总价

                var nm = $("#totalcountshow").html();//获取数量
                $("#totalcountshow").html(nm*1+1);
                jss();//<span style='font-family: Arial, Helvetica, sans-serif;'></span>   改变按钮样式
            });
            //减的效果
            $(".minus").click(function () {
                var n = $(this).next().text();
                var num = parseInt(n) - 1;

                $(this).next().text(num);//减1

                var vegetableId = $(this).nextAll(".id");//获取编号
                var vegetableType = $(this).nextAll(".type");//获取类型
                var vegetableName = $(this).nextAll(".name");//获取名称
                var vegetablePrice = $(this).nextAll(".price");//获取价格
                var danjia=RemoveCh(vegetablePrice.text());
                var a = $("#totalpriceshow").html();//获取当前所选总价
                $("#totalpriceshow").html((a * 1 - danjia * 1).toFixed(2));//计算当前所选总价

                var nm = $("#totalcountshow").html();//获取数量
                $("#totalcountshow").html(nm * 1 - 1);
                //如果数量小于或等于0则隐藏减号和数量
                if (num <= 0) {
                    $(this).next().css("display", "none");
                    $(this).css("display", "none");
                    jss();//改变按钮样式
                    return
                }
            });
            function jss() {
                var m = $("#totalcountshow").html();
                if (m > 0) {
                    $(".right").find("a").removeClass("disable");
                } else {
                    $(".right").find("a").addClass("disable");
                }
            };
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
<%--<script src="../Other/header.js"></script>--%>
<section class="aui-flexView">
    <script type="text/javascript" src="../Other/header.js" ></script>
    <section class="aui-scrollView">

        <!--header-->
        <div id="slide" class="public-banner">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="#">
                        <img src="../images/upload/banner1.jpg" />
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="#">
                        <img src="../images/upload/banner2.jpg" />
                    </a>
                </div>
            </div>
            <div class="pagination"></div>
        </div>
        <hr>
        <!--分类商品-->
        <c:set var="bills" value="${sessionScope.restBillOfFares}" />
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
                                <c:forEach items="${bills}" var="bill">
                                    <c:if test="${bill.vegetableType=='干锅类'}">
                                    <li class="clearfix">
                                        <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                        <div class="menu-txt">
                                            <h4>${bill.vegetableName}</h4>
                                            <h2>${bill.vegetablePrice}</h2>
                                            <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                            <p class="list2">
                                            <div class="btn">
                                                <button class="minus">
                                                    <strong>-</strong>
                                                </button>
                                                <i>0</i>
                                                <button class="add">
                                                    <strong>+</strong>
                                                </button>
                                                <i class="id">${bill.vegetableId}</i>
                                                <i class="type">${bill.vegetableType}</i>
                                                <i class="name">${bill.vegetableName}</i>
                                                <i class="price">${bill.vegetablePrice}</i>
                                            </div>
                                            </p>
                                        </div>
                                    </li>
                                </c:if>
                                </c:forEach>
                            </ul>
                        </div>

                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='汤锅类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='荤菜类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='素菜类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>


                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='主食类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                <div class="right-con">
                    <ul>
                        <c:forEach items="${bills}" var="bill">
                            <c:if test="${bill.vegetableType=='料碗类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                            <i class="id">${bill.vegetableId}</i>
                                            <i class="type">${bill.vegetableType}</i>
                                            <i class="name">${bill.vegetableName}</i>
                                            <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>

                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='酒水类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
                                        </div>
                                        </p>
                                    </div>
                                </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="right-con">
                        <ul>
                            <c:forEach items="${bills}" var="bill">
                                <c:if test="${bill.vegetableType=='其他类'}">
                                <li class="clearfix">
                                    <div class="menu-img"><img src="../images/qgy.png" width="55" height="55" /></div>
                                    <div class="menu-txt">
                                        <h4>${bill.vegetableName}</h4>
                                        <h2>${bill.vegetablePrice}</h2>
                                        <p class="list1">剩余<em>${bill.vegetableNumber}</em>份</p>
                                        <p class="list2">
                                        <div class="btn">
                                            <button class="minus">
                                                <strong>-</strong>
                                            </button>
                                            <i>0</i>
                                            <button class="add">
                                                <strong>+</strong>
                                            </button>
                                        <i class="id">${bill.vegetableId}</i>
                                        <i class="type">${bill.vegetableType}</i>
                                        <i class="name">${bill.vegetableName}</i>
                                        <i class="price">${bill.vegetablePrice}</i>
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
			<span class="totalpriceshow">￥<em id="totalpriceshow">0</em></span>
		</span>
            </div>
            <div class="right">
                <%--<a id="btnselect" style="background-color:#FF0B0C;" class="xhlbtn  disable" href="${pageContext.request.contextPath}/android/Cart/cart-settlement.html&&phone="+phone>去结算</a>--%>
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