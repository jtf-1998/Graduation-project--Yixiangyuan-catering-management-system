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
            var ServletURL="${pageContext.request.contextPath}/comsume/OrderBillServlet";
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }

            $(".select_ok").click(function () {
                var bill_data=$("#select_date").val();
                if(isEmpty(bill_data)){
                    alert("请选择日期！");
                }
                window.location.replace(location.href=ServletURL+'?action=doShow&bill_data='+bill_data);
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
                var thisTr=$(this).parent().parent();
                var bill_id=thisTr.children('td:eq(1)').text();
                window.location.replace(location.href=ServletURL+'?action=doSearchById');

            });
            $(".add").click(function () {
                var thisTr=$(this).parent().parent();
                var bill_id=thisTr.children('td:eq(1)').text();
                var bill_data=$("#select_date").val();
                if(isEmpty(bill_data)){
                    alert("请选择日期！");
                }else {
                    window.location.replace(location.href=ServletURL+'?action=doSearchById');
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 餐厅订餐消费子系统
    <span class="c-gray en">&gt;</span>菜单管理<span class="c-gray en">&gt;</span>菜单管理<a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅信息管理子系统 </p>
    <c:set var="billAlls" value="${sessionScope.billAlls}" />

    <div id="show" class="page-container">
        <table class="table table-border table-bordered table-bg" style="white-space: nowrap">
            <tbody>
                <tr>
                    <td>请选择日期</td>
                    <td>
                        <input type="date" placeholder="日期(必填)" id="select_date" value="${param.pay_date}">
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
                <th colspan="6" style="text-align: center">菜单</th>
            </tr>
            <tr class="text-c">
                <th>日期</th>
                <th>菜单编号</th>
                <th>包间名称</th>
                <th>顾客电话</th>
                <th>详情</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyXL">
            <c:forEach items="${billAlls}" var="billAll">
                    <tr>
                        <td>${billAll.billData}</td>
                        <td>${billAll.billId}</td>
                        <td>${billAll.billProom}</td>
                        <td>${billAll.billCustomer}</td>
                        <td><a href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doSearchById&&bill_id=${billAll.billId}&&bill_date=${billAll.billData}&&phone=${billAll.billCustomer}');">详细菜单</a></td>
                        <td>
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

