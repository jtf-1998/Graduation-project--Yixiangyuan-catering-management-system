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
    <title>进货信息</title>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            var ServletURL="${pageContext.request.contextPath}/rest/KitchenPurchaseServlet";
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }

            $(".select_ok").click(function () {
                var purchase_date=$("#select_date").val();
                if(isEmpty(purchase_date)){
                    alert("请选择进货日期！");
                }
                window.location.replace(location.href=ServletURL+'?action=doShow&purchase_date='+purchase_date);
            })

            $(".delete").click(function () {
                var thisTr=$(this).parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doDelete",
                        "purchase_date":thisTr.children('td:eq(0)').text(),
                        "purchase_id":thisTr.children('td:eq(1)').text()
                    },
                    function (status) {
                        console.log(status);
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
            function changeValue(obj){
                $(obj).attr("value",$(obj).val());
            }
            $(".update").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=10){
                    var thisTr=$(this).parent().parent();
                    $("td:not('button')",thisTr).each(function(i,td){
                        if(i>=0&&i<4&&i!=2){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text' readonly='readonly'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else if(i<=8){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else {}
                    });
                    $(this).hide();
                    $(".save",$(this).parent()).show();
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });
            $(".add").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=10){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var purchase_type=tbody.parent().find("th").first().text();
                    var td_num=tbody.find("tr").eq("-2").find("td").first().text();
                    td_num=td_num.replace(/[^0-9]/ig,"");
                    // alert(isEmpty(td_num));
                    if(isEmpty(td_num)){
                        td_num=0;
                    }
                    td_num=parseInt(td_num)+1;
                    // alert(td_num);
                    var purchase_id="";
                    if(purchase_type=="香料"){
                        purchase_id="XL"+td_num;
                    }
                    else if(purchase_type=="荤菜"){
                        purchase_id="HC"+td_num;
                    }
                    else if(purchase_type=="素菜"){
                        purchase_id="SC"+td_num;
                    }
                    else if(purchase_type=="主食"){
                        purchase_id="ZS"+td_num;
                    }else if(purchase_type=="酒水"){
                        purchase_id="JS"+td_num;
                    }
                    else{
                        P_room_id="QT"+td_num;
                    }
                    newTr.children('td:eq(1)').text(purchase_id);
                    newTr.children('td:eq(3)').text(purchase_type);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });
            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var re=/^(XL|HC|SC|ZS|JS|QT)\d$/;
                var purchase_date=$("#0").val();
                var purchase_id=$("#1").val();
                var purchase_name=$("#2").val();
                var purchase_type=$("#3").val();
                var purchase_person=$("#4").val();
                var purchase_phone=$("#5").val();
                var vegetable_stock=$("#6").val();
                var purchase_number=$("#7").val();
                var purchase_price=$("#8").val();
                alert(purchase_name);
                if(!re.test(purchase_id))
                {
                    alert("请修改为正确的编号");
                }
                else if(purchase_name==""||purchase_person==""||purchase_phone==""||vegetable_stock==""||purchase_number==""||purchase_price==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "purchase_date":purchase_date,
                            "purchase_id":purchase_id,
                            "purchase_name":purchase_name,
                            "purchase_type":purchase_type,
                            "purchase_person":purchase_person,
                            "purchase_phone":purchase_phone,
                            "vegetable_stock":vegetable_stock,
                            "purchase_number":purchase_number,
                            "purchase_price":purchase_price
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
                 var re=/^(XL|HC|SC|ZS|JS|QT)\d$/;
                // alert(thisTr.html());
                var purchase_date=$("#show #9").val()
                var purchase_id=thisTr.children('td:eq(1)').text();
                var purchase_name=$("#show #11").val();
                var purchase_type=thisTr.children('td:eq(3)').text();
                var purchase_person=$("#show #13").val();
                var purchase_phone=$("#show #14").val();
                var vegetable_stock=$("#show #15").val();
                var purchase_number=$("#show #16").val();
                var purchase_price=$("#show #17").val();
                if(!re.test(purchase_id))
                {
                    alert("请修改为正确的编号");
                }
                else if(purchase_name==""||purchase_person==""||purchase_phone==""||vegetable_stock==""||purchase_number==""||purchase_price==""){
                    alert("请输入必填项！");
                }
                else
                {
                    alert(purchase_name);
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "purchase_date":purchase_date,
                            "purchase_id":purchase_id,
                            "purchase_name":purchase_name,
                            "purchase_type":purchase_type,
                            "purchase_person":purchase_person,
                            "purchase_phone":purchase_phone,
                            "vegetable_stock":vegetable_stock,
                            "purchase_number":purchase_number,
                            "purchase_price":purchase_price
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 餐厅信息管理子系统
    <span class="c-gray en">&gt;</span>后厨信息<span class="c-gray en">&gt;</span>进货管理<a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href='${pageContext.request.contextPath}/rest/KitchenPurchaseServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅信息管理子系统 </p>
    <c:set var="restKitchenPurchases" value="${sessionScope.restKitchenPurchases}" />
    <table class="table table-border table-bordered table-bg"
           style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="date" value="${param.purchase_date}" placeholder="日期(必填)" id="9" readonly="readonly"></td>
            <td><input type="text" value="" placeholder="编号(必填)" id="10"></td>
            <td><input type="text" value="" placeholder="名称(必填)" id="11"></td>
            <td><input type="text" value="" placeholder="类别(必填)" id="12"></td>
            <td><input type="text" value="" placeholder="进货方(必填)"id="13"></td>
            <td><input type="text" value="" placeholder="进货方联系方式" id="14"></td>
            <td><input type="text" value="" placeholder="库存" id="15"></td>
            <td><input type="text" value="" placeholder="进货数量" id="16"></td>
            <td><input type="text" value="" placeholder="进货数量" id="17"></td>
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
                    <td>请选择进货日期</td>
                    <td>
                        <input type="date" placeholder="日期(必填)" id="select_date" value="${param.purchase_date}">
                    </td>
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
                <th colspan="10" style="text-align: center">香料</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyXL">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='香料'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>`
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
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">荤菜</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyHC">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='荤菜'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
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
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">素菜</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>·
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodySC">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='素菜'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
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
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">主食</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyZS">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='主食'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>`
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
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">酒水</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyJS">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='酒水'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
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
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="10" style="text-align: center">其他</th>
            </tr>
            <tr class="text-c">
                <th>进货日期</th>
                <th>编号</th>
                <th>名称</th>
                <th>类别</th>
                <th>进货方</th>
                <th>进货方联系方式</th>
                <th>库存</th>
                <th>进货数量</th>
                <th>进货单价</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyQT">
            <c:forEach items="${restKitchenPurchases}" var="restKitchenPurchase">
                <c:if test="${restKitchenPurchase.purchaseType=='其他'}">
                    <tr>
                        <td>${restKitchenPurchase.purchaseDate}</td>
                        <td>${restKitchenPurchase.purchaseId}</td>
                        <td>${restKitchenPurchase.purchaseName}</td>
                        <td>${restKitchenPurchase.purchaseType}</td>
                        <td>${restKitchenPurchase.purchasePerson}</td>
                        <td>${restKitchenPurchase.purchasePhone}</td>
                        <td>${restKitchenPurchase.vegetableStock}</td>
                        <td>${restKitchenPurchase.purchaseNumber}</td>
                        <td>${restKitchenPurchase.purchasePrice}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
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
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>

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

