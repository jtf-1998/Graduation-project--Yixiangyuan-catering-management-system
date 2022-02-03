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
    <c:set var="payForms" value="${sessionScope.payForms}" />
    <c:set var="bill_ct_id" value="${sessionScope.bill_ct_id}" />
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {

            var ServletURL="${pageContext.request.contextPath}/comsume/PayServlet";
            var urlinfo = window.location.href;//获取url
            var eat_type=getQueryString("eat_type");
            if(eat_type=='CT'){
                $("#eat_type").val("传统");
            }else {
                $("#eat_type").val("手机");
            }
            var pay_date=getQueryString("pay_date");
            $("#select_date").val(pay_date);
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
                var pay_date=$("#select_date").val();
                var eat_type=$("#eat_type").val();
                if(isEmpty(pay_date)){
                    alert("请选择支付日期！");
                }
                else if(isEmpty(eat_type)){
                    alert("请选择点菜方式！");
                }
                window.location.replace(location.href=ServletURL+'?action=doShow&&pay_date='+pay_date+"&&eat_type="+eat_type);
            });

            $(".delete").click(function () {
                var thisTr=$(this).parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doDelete",
                        "bill_id":thisTr.children('td:eq(1)').text()
                    },
                    function (status) {
                        console.log(status);
                        // alert(status);
                        if (status.status == "yes") {
                            alert("删除成功！");
                            thisTr.remove();
                        }else{
                            alert("删除失败！");
                        }
                    }
                );
            });

            $(".update").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                alert(input_num);
                if(input_num<=5){
                    var thisTr=$(this).parent().parent();

                        $("td:not('button')",thisTr).each(function(i,td){
                            if(i==1){
                            td = $(td);
                            var html =
                                "<select id='1'> <option value='CD0'>请选择菜单编号</option> "
                                +"<c:forEach items='${payForms}' var='payForm'>"
                                +" <option value='${payForm.billId}'>"
                                +" ${payForm.billId}</option></c:forEach>"
                                +" <option value='${bill_ct_id}'>${bill_ct_id}</option>"
                                +"</select>";
                            td.html(html);

                            }else if(i==3){
                                td = $(td);
                                var html =
                                    "<input value='"+td.text()+"' id='"+i+"' type='time'  placeholder='"+td.text()+"'>";
                                td.html(html);
                            }
                            else if(i==4){
                                td = $(td);
                                var html =
                                    "<select id='"+i+"'>"+
                                    "<option value=''>是否为外卖</option>" +
                                    "<option value='是'>是</option><option value='否'>否</option>"+
                                    "</select>";
                                td.html(html);
                            }
                            else if(i==5){
                                td = $(td);
                                var html =
                                    "<select id='"+i+"'>"+
                                    "<option value=''>外卖类型</option>"+
                                    "<option value='美团'>美团</option>"+
                                    "<option value='饿了么'>饿了么</option>"+
                                    "<option value='自送'>自送</option>"+
                                    "</select>";
                                td.html(html);
                            }
                            else if(i==7){
                                td = $(td);
                                var html =
                                    "<select id='"+i+"'>"+
                                    "<option value=''>支付方式</option>"+
                                    "<option value='支付宝'>支付宝</option>"+
                                    "<option value='微信'>微信</option>"+
                                    "<option value='美团'>美团</option>"+
                                    "<option value='现金'>现金</option>"+
                                    "</select>";
                                td.html(html);
                            }
                            else if(i==2||i==6){
                                td = $(td);
                                var html =
                                    "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
                                td.html(html);
                            }
                            else if(i==0){
                                td = $(td);
                                var html =
                                    "<input value='"+td.text()+"' id='"+i+"' type='date'  value='"+td.text()+"' readonly='readonly'>";
                                td.html(html);
                            }
                        });


                    $(this).hide();
                    $(".save",$(this).parent()).show();
                }
                else{
                    alert("一次只可以修改或添加一次！");
                }
            });

            $(".add").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=6){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var pay_date=$("#select_date").val();
                    newTr.children('td:eq(0)').text(pay_date);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });

            $(document).on("change","#show #11",function (){
                var bill_id=this.value;
                if(bill_id=="CD0"){
                    alert("菜单编号不能为空！");
                }
                var thisTr=$("#show #11").parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doSearch",
                        "bill_id":bill_id
                    },
                    function (resultJson) {
                        $("#show #12").val(resultJson.p_room);
                        $("#show #16").val(resultJson.pay_price);
                    }
                )
            });

            $(document).on("change","#1",function (){
                var bill_id=this.value;
                if(bill_id=="CD0"){
                    alert("菜单编号不能为空！");
                }
                var thisTr=$("#1").parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doSearch",
                        "bill_id":bill_id
                    },
                    function (resultJson) {
                        $("#2").val(resultJson.p_room);
                        $("#6").val(resultJson.pay_price);
                    }
                )
            });

            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var pay_date=$("#0").val();
                var type=$("#eat_type").val();
                var bill_id=$("#1").val();
                var p_room_id=$("#2").val();
                var pay_time=$("#3").val();
                var is_takeaway=$("#4").val();
                var takeaway_type=$("#5").val();
                var pay_price=$("#6").val();
                var pay_type=$("#7").val();
                if(bill_id==""||pay_time==""||
                    is_takeaway==""||pay_type==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
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
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href=ServletURL+'?action=doShow');
                            }else if(status.status=="addyesupdateyes") {
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
                var pay_date=thisTr.children('td:eq(0)').text();
                var type=$("#eat_type").val();
                var bill_id=$("#show  #11").val();
                var p_room_id=$("#show  #12").val();
                var pay_time=$("#show  #13").val();
                var is_takeaway=$("#show  #14").val();
                var takeaway_type=$("#show  #15").val();
                var pay_price=$("#show #16").val();
                var pay_type=$("#show  #17").val();
                if(bill_id==""||pay_time==""||
                    is_takeaway==""||pay_type==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
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
                            if(status.status=="addyesupdateyes") {
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 订餐消费子系统<span class="c-gray en">&gt;</span>支付管理<span class="c-gray en">&gt;</span>支付管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderFormServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅订餐消费子系统 </p>

    <c:set var="restPayForms" value="${sessionScope.restPayForms}" />
    <c:set var="bill_ct_id" value="${sessionScope.bill_ct_id}" />
    <table class="table table-border table-bordered table-bg" style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="date" value="${param.pay_date}" placeholder="支付日期" id="10" readonly="readonly"></td>
            <td><select id="11">
                <option value="CD0">菜单编号</option>
                <c:forEach items='${payForms}' var='payForm'>
                    <option value='${payForm.billId}'>
                    ${payForm.billId}</option>
                </c:forEach>
                <option value='${bill_ct_id}'>
                    ${bill_ct_id}</option>
            </select>
            </td>
            <td><input type="text" value="" placeholder="包间名称" id="12" ></td>
            <td><input type="time" value="" placeholder="支付时间(必填)" id="13"></td>
            <td><select id="14">
                <option value="">是否为外卖</option>
                <option value="是">是</option>
                <option value="否">否</option>
                </select>
            </td>
            <td><select id='15'>
                    <option value="">外卖类型</option>
                    <option value="美团">美团</option>
                    <option value="饿了么">饿了么</option>
                    <option value="自送">自送</option>
                </select>
            </td>
            <td><input type="text" value="" placeholder="支付金额(必填)" id="16"></td>
            <td><select id='17'>
                    <option >支付方式</option>
                    <option value="支付宝">支付宝</option>
                    <option value="微信">微信</option>
                    <option value="美团">美团</option>
                    <option value="现金">现金</option>
                </select>
            </td>
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
                    <input type="date" placeholder="日期(必填)" id="select_date" value="${param.pay_date}">
                </td>
                <td>请选择点菜方式</td>
                <td><select id='eat_type'>
                    <option value='传统'>传统</option>
                    <option value='手机'>手机</option>
                    </select></td>
                <td>
                    <button name="select_ok" class="select_ok">确定</button>
                </td>
            </tr>
            </tbody>
        </table>
        <h4 id="bill_ct_id" style="display: none;">${bill_ct_id}</h4>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">外卖信息</th>
            </tr>
            <tr class="text-c">
                <th>支付日期</th>
                <th>菜单编号</th>
                <th>包间名称</th>
                <th>支付时间</th>
                <th>是否为外卖</th>
                <th>外卖类型</th>
                <th>支付金额</th>
                <th>支付方式</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyDT">
            <c:forEach items="${restPayForms}" var="restPayForm">
                    <tr>
                        <td>${restPayForm.payDate}</td>
                        <td>${restPayForm.billId}</td>
                        <td>${restPayForm.PRoomId}</td>
                        <td>${restPayForm.payTime}</td>
                        <td>${restPayForm.isTakeaway}</td>
                        <td>${restPayForm.takeawayType}</td>
                        <td>${restPayForm.payPrice}</td>
                        <td>${restPayForm.payType}</td>
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

