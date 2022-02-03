
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>二维码扫描</title>
    <link rel="stylesheet" type="text/css" href="../css/my.css">
</head>

<body>
<div>
    <div class="qr-btn" node-type="qr-btn">扫描二维码
        <input node-type="jsbridge" type="file" capture="camera" name="myPhoto" value="扫描二维码" />
    </div>
</div>
<img src="../images/scan1.pngs" >
<div style="width: 100%;height: 10px">
    <h4 class='result-qrcode' style='margin-left: 3px;position: absolute;top: 20%;left: 43%;'></h4>
    <h4 class='result-qrcode_display' style='margin-left: 3px;position: absolute;top: 25%;left: 30%;display: none'></h4>
    <button id="bt_ok" > 确定</button>

</div>

<script src="../js/zepto.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/qrcode.lib.min.js"></script>
<script src="../js/qrcode.js"></script>
<script>
    //初始化扫描二维码按钮，传入自定义的 node-type 属性
    $(function() {
        var baseURL="${pageContext.request.contextPath}";
        Qrcode.init($('[node-type=qr-btn]'));
        $("#bt_ok").click(function () {
            var pRoomId=$(".result-qrcode_display").text();
            var pRoomName=$(".result-qrcode").text();
            if(null!=pRoomId&&null!=pRoomName){
                window.location.href=encodeURI(baseURL+"/android/Main/order_dish.jsp?pRoomId="+pRoomId+"&&pRoomName="+pRoomName);
            }
            else {
                alert("请重新输入");
            }
        });
    });
</script>
</body>

</html>



<%--<!DOCTYPE html>--%>
<%--<html>--%>

<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width,initial-scale=1.0">--%>
    <%--<title>my-pro</title>--%>
    <%--<script src="../js/jquery.min.js"></script>--%>
    <%--<script src="../js/reqrcode.js"></script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<input type="file" id="newfile">--%>

<%--</body>--%>

<%--<script>--%>
    <%--var newfile = document.getElementById('newfile');--%>
    <%--var getObjectURL = function (file) {--%>
        <%--var url = null;--%>
        <%--if (window.createObjectURL != undefined) { // basic--%>
            <%--url = window.createObjectURL(file);--%>
        <%--} else if (window.URL != undefined) { // mozilla(firefox)--%>
            <%--url = window.URL.createObjectURL(file);--%>
        <%--} else if (window.webkitURL != undefined) { // webkit or chrome--%>
            <%--url = window.webkitURL.createObjectURL(file);--%>
        <%--}--%>
        <%--return url;--%>
    <%--}--%>


    <%--newfile.onchange = function () {--%>
        <%--//   console.log(newfile[0]);--%>
        <%--console.log(getObjectURL(this.files[0]));// newfile[0]是通过input file上传的二维码图片文件--%>
        <%--qrcode.decode(getObjectURL(this.files[0]));--%>
        <%--qrcode.callback = function (imgMsg) {--%>
            <%--alert("二维码解析：" + imgMsg)--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>

<%--</html>--%>
