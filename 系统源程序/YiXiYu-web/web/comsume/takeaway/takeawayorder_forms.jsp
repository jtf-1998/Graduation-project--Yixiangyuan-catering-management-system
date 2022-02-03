<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-01-12
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lq.bean.RestPRoom" %>
<%@ page import="com.lq.rest_servlet.PRoomServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
   <script type="text/javascript" src="${pageContext.request.contextPath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>用户预订信息</title>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {

            var ServletURL="${pageContext.request.contextPath}/comsume/TakeawyaOrderFormServlet";
            var urlinfo = window.location.href;//获取url
            var takeaway=getQueryString("takeaway_type");
            if(takeaway=='MT'){
                $("#takeaway_type").val("美团");
            }else {
                $("#takeaway_type").val("饿了么");
            }
            <%--alert(<%=new String(request.getParameter("takeaway_type").getBytes("ISO-8859-1"),"GBK")%>);--%>
            <%--$("#takeaway_type").val();--%>
            function getQueryString(key){
                var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
                var result = window.location.search.substr(1).match(reg);
                return result?decodeURIComponent(result[2]):null;
            }

            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }

            function changeValue(obj){
                $(obj).attr("value",$(obj).val());
            }

            $(".select_ok").click(function () {
                // alert("日期");
                var takeaway_date=$("#select_date").val();
                var takeaway_type=$("#takeaway_type").val();
                if(isEmpty(takeaway_date)){
                    alert("请选择进货日期！");
                }
                else if(isEmpty(takeaway_type)){
                    alert("请选择外卖平台！");
                }
                window.location.replace(location.href=ServletURL+'?action=doShow&&takeaway_date='+takeaway_date+"&&takeaway_type="+takeaway_type);
            });

            $(".delete").click(function () {
                var thisTr=$(this).parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doDelete",
                        "takeaway_id":thisTr.children('td:eq(1)').text()
                    },
                    function (status) {
                        console.log(status);
                        // alert(status);
                        if (status.status == "yes") {
                            alert("删除成功！");
                            thisTr.remove();
                        } else if(status.status=="nohave") {
                            alert("数据库内没有该记录，请重新添加！");
                        }else{
                            alert("删除失败！");
                        }
                    }
                );
            });

            $(".update").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                alert(input_num);
                if(input_num<=8){
                    var thisTr=$(this).parent().parent();
                    $("td:not('button')",thisTr).each(function(i,td){
                        if(i==3){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='time'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }else if(i==0){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='date'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else if(i==2){
                            td = $(td);
                            var html =
                                "<select id='2'> <option value=''>请选择外卖平台</option> "
                            +" <option value='美团'>美团</option> "
                            +"<option value='饿了么'>饿了么</option> </select>";
                            td.html(html);
                        }
                        else if(i==1){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text' placeholder='"+td.text()+"' readonly='readonly'>";
                            td.html(html);
                        }
                        else if(i==6){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='tel' placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else {
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text' placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                    });
                    $(this).hide();
                    $(".save",$(this).parent()).show();
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });
            var code="";

            function createCode()
            {
                code = "";
                var codeLength = 7;//验证码的长度
                var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
                    'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的
                for (var i = 0; i< codeLength; i++)
                {

                    var charIndex = Math.floor(Math.random() * 36); //随机生成1-36的数字并且向下取整，比如取到5.99999那么则为5
                    code += selectChar[charIndex]; //code = "" + 你所随机到的位置，这里charIndex就是数组的角标， 取值为字母或者数字
                }
                // alert(code);
            }
            $(".add").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=8){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var myDate = new Date();
                    var date=myDate.toLocaleDateString();
                    createCode();
                    code=code+date;
                    alert(code);
                    var takeaway_date=$("#select_date").val();
                    newTr.children('td:eq(0)').text(takeaway_date);
                    newTr.children('td:eq(1)').text(code);
                    var takeaway=$("#takeaway_type").val();
                    newTr.children('td:eq(2)').text(takeaway);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });

            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var takeaway_date=$("#0").text();
                var takeaway_id=$("#1").text();
                var takeaway_type=$("#2").text();
                var takeaway_time=$("#3").val();
                var takeaway_money=$("#4").val();
                var customer_nickname=$("#5").val();
                var customer_phone=$("#6").val();
                if(takeaway_time==""||takeaway_money==""||
                    customer_nickname==""||customer_phone==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "takeaway_id":takeaway_id,
                            "takeaway_type":takeaway_type,
                            "takeaway_date":takeaway_date,
                            "takeaway_time":takeaway_time,
                            "takeaway_money":takeaway_money,
                            "customer_nickname":customer_nickname,
                            "customer_phone":customer_phone
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }else if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }
                        }
                    );
                }
            });

            $(document).on("click","#show .addsave",function () {
                var thisTr=$("#show .addsave").parent().parent();
                var takeaway_date=thisTr.children('td:eq(0)').text();
                var takeaway_id=thisTr.children('td:eq(1)').text();
                var takeaway_type=thisTr.children('td:eq(2)').text();
                var takeaway_time=$("#show #12").val();
                var takeaway_money=$("#show #13").val();
                var customer_nickname=$("#show #14").val();
                var customer_phone=$("#show #15").val();
                if(takeaway_time==""||takeaway_money==""||
                    customer_nickname==""||customer_phone==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "takeaway_id":takeaway_id,
                            "takeaway_type":takeaway_type,
                            "takeaway_date":takeaway_date,
                            "takeaway_time":takeaway_time,
                            "takeaway_money":takeaway_money,
                            "customer_nickname":customer_nickname,
                            "customer_phone":customer_phone
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }else if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }
                        }
                    );
                }
            });
        });
    </script>
    <style type="text/css">
        button{
            width: 35%;/*设置按钮宽度*/
            height: 30px;/*设置按钮高度*/
            color:black;/*字体颜色*/
            background-color:cornflowerblue;/*按钮背景颜色*/
            border-radius: 3px;/*让按钮变得圆滑一点*/
            border-width: 0;/*消去按钮丑的边框*/
            margin: 5px 0px;
            outline: none;/*取消轮廓*/
            font-family: KaiTi;/*字体设置为楷体*/
            font-size: 15px;/*设置字体大小*/
            text-align: center;/*字体居中*/
            cursor: pointer;/*设置鼠标箭头手势*/
            white-space: nowrap;
        }
        button:hover{/*鼠标移动时的颜色变化*/
            background-color: antiquewhite;
        }
    </style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 订餐消费子系统<span class="c-gray en">&gt;</span>预订管理<span class="c-gray en">&gt;</span>预订管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderFormServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅订餐消费子系统 </p>

    <c:set var="takeawyaorderForms" value="${sessionScope.takeawyaOrderForms}" />
    <table class="table table-border table-bordered table-bg" style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="date" value="${param.takeaway_date}" placeholder="日期(必填)" id="9" readonly="readonly"></td>
            <td><input type="text" id="10" placeholder="外卖编号(必填)" value=""></td>
            <td><input type="text" value="" placeholder="外卖平台" id="11" readonly="readonly"></td>
            <td><input type="time" value="" placeholder="外卖时间(必填)" id="12"></td>
            <td><input type="text" value="" placeholder="外卖金额(必填)" id="13"></td>
            <td><input type="text" value="" placeholder="顾客昵称(必填)" id="14"></td>
            <td><input type="number" oninput="if(value.length>11)value=value.slice(0,11)"  value="" placeholder="顾客电话" maxlength="11"  id="15"></td>
            <td><button name="addsave" class="addsave">保存</button>&nbsp;
                <button name="update" class="update" style="display:none">修改</button>&nbsp;&nbsp;
                <button name="delete" class="delete" >删除</button></td>
        </tr>
        </tbody>
    </table>
    <div id="show" class="page-container">
        <table class="table table-border table-bordered table-bg" style="white-space: nowrap">
            <tbody>
            <tr>
                <td>请选择日期</td>
                <td>
                    <input type="date" placeholder="日期(必填)" id="select_date" value="${param.takeaway_date}">
                </td>
                <td>请选择平台</td>
                <td><select id='takeaway_type'>
                    <option value='美团'>美团</option>
                    <option value='饿了么'>饿了么</option>
                    </select></td>
                <td>
                    <button name="select_ok" class="select_ok">确定</button>
                </td>
            </tr>
            </tbody>
        </table>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">外卖信息</th>
            </tr>
            <tr class="text-c">
                <th>日期</th>
                <th>外卖编号</th>
                <th>外卖平台</th>
                <th>外卖时间</th>
                <th>外卖金额</th>
                <th>顾客昵称</th>
                <th>顾客电话</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyDT">
            <c:forEach items="${takeawyaorderForms}" var="takeawyaorderForm">
                    <tr>
                        <td>${takeawyaorderForm.takeawayDate}</td>
                        <td>${takeawyaorderForm.takeawayId}</td>
                        <td>${takeawyaorderForm.takeawayType}</td>
                        <td>${takeawyaorderForm.takeawayTime}</td>
                        <td>${takeawyaorderForm.takeawayMoney}</td>
                        <td>${takeawyaorderForm.customer_nickname}</td>
                        <td>${takeawyaorderForm.customer_phone}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
            </c:forEach>
            <tr>
                <td>---</td>`
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>

    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../../out/artifacts/YiXiYu_web/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../../out/artifacts/YiXiYu_web/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../../out/artifacts/YiXiYu_web/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer
<%--作为公共模版分离出去-->--%>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../../out/artifacts/YiXiYu_web/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>

</body>
</html>

