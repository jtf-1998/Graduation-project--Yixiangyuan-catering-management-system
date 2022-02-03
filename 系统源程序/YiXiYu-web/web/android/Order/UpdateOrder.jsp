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
    <title>预订</title>
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
    <c:set var="orderForms" value="${sessionScope.orderForms}" />
    <c:set var="restBillOfFares" value="${sessionScope.restBillOfFares}" />
    <c:set var="restPRooms" value="${sessionScope.restPRooms}" />
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            var baseUrl="${pageContext.request.contextPath}/android/OrderServlet";

            var order_date="";
            var order_time="";
            function Split(s){
                var ss;
                // 在每个字符T处进行分解。
                ss = s.split("T");
                return(ss);
            }

            $("#select_p_room").change(function () {
                var order_datetime=$("#order_datetime").val();
                if(order_datetime==""){
                    alert("请选择预订日期");
                }else {
                    //    2021-05-24T18:07
                    order_date=Split(order_datetime)[0];
                    order_time=Split(order_datetime)[1];

                }
                order_datetime=order_date+" "+order_time;
                var P_room_id=$("#select_p_room").val();
                var p_room=$("#p_room").text();
                if(P_room_id=="BJ0"||customer_number==""){
                    alert("请输入必填项！");
                }
                else if(P_room_id==p_room){
                    alert("请选择新的包间");
                }
                else {
                    $.getJSON(
                        baseUrl,
                        {
                            "action":"doJudgePRoom",
                            "P_room_id":P_room_id,
                            "order_datetime":order_datetime
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "no") {
                                alert("该包间已被预订，请重新选择包间!");
                                $("#select_p_room").val("BJ0");

                            }
                        }
                    );
                }

            });

            $("#ok").click(function () {
                var order_id=$("#order_id").text();
                var P_room_id=$("#select_p_room").val();
                var p_room=$("#p_room").text();
                var order_datetime=$("#order_datetime").val();
                if(order_datetime==""){
                    alert("请选择预订日期");
                }else {
                    //    2021-05-24T18:07
                    order_date=Split(order_datetime)[0];
                    order_time=Split(order_datetime)[1];
                }
                alert(order_time);
                var customer_number=$("#customer_number").val();
                var customer_phone=$("#customer_phone").text();
                var customer_name=$("#customer_name").text();
                var order_griddle=$("#select_griddle").val();
                if(P_room_id=="BJ0"||customer_number==""){
                    alert("请输入必填项！");
                }
                else {
                    $.getJSON(
                        baseUrl,
                        {
                            "action":"doUpdateOrAdd2",
                            "order_id":order_id,
                            "P_room_id":P_room_id,
                            "old_p_room":p_room,
                            "order_date":order_date,
                            "order_time":order_time,
                            "customer_number":customer_number,
                            "order_griddle":order_griddle,
                            "customer_phone":customer_phone,
                            "customer_name":customer_name
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyesupdateyesupdateyes") {
                                alert("修改成功！");
                                window.location.href=encodeURI("${pageContext.request.contextPath}/android/OrderServlet?action=doShowOrder");

                            } else{
                                alert("修改失败！");
                            }
                        }
                    );
                }

            }) ;
        });
    </script>
</head>

<body>
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
    <h1>预订</h1>
</header>
<div style="height:1rem;"></div>
<ul class="formarea">
    <li>
        <label class="lit">饭店</label>
        <input type="text" value="溢香园火锅店(白银市平川区长征东路公铁立交桥北侧兴东佳苑以东60米)" class="textbox" readonly="readonly"/>
    </li>
    <h1 style="display: none;" id="order_id">${param.order_id}</h1>
    <c:forEach items="${orderForms}" var="orderForm1">
        <c:if test="${orderForm1.orderId==param.order_id}">
            <c:set var="orderForm" value="${orderForm1}" />
        </c:if>
    </c:forEach>
    <h1 style="display: none;" id="customer_phone">${orderForm.customerPhone}</h1>
    <h1 style="display: none;" id="customer_name">${orderForm.customerName}</h1>
    <li>
        <label class="lit">预订时间</label>
        <input type="datetime-local" id="order_datetime" value="${orderForm.orderDate}T${orderForm.orderTime}" class="textbox" />
    </li>
    <li>
        <label class="lit">包间</label>
        <h1 style="display: none;" id="p_room">${orderForm.PRoomId}</h1>
        <select id="select_p_room"  >
            <option value="BJ0">请选择预订包间</option>
            <c:forEach items="${restPRooms}" var="restPRoom">
                <option value="${restPRoom.PRoomName}"> ${restPRoom.PRoomName}(可坐人数：${restPRoom.PRoomNumber})</option>
            </c:forEach>
        </select>
    </li>
    <li>
        <label class="lit">大概人数</label>
        <input type="number" id="customer_number" value="${orderForm.customerNumber}" class="textbox" />
    </li>
    <li>
        <label class="lit">预订干锅</label>
        <select id="select_griddle"  >
            <option value="GG0">请选择预订干锅(可选)</option>
            <c:forEach items="${restBillOfFares}" var="restBillOfFare">
                <option value="${restBillOfFare.vegetableName}"> ${restBillOfFare.vegetableName}(￥${restBillOfFare.vegetablePrice})</option>
            </c:forEach>
        </select>
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
