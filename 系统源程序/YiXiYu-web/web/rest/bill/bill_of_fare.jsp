<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-01-12
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lq.bean.RestBillOfFare" %>
<%@ page import="com.lq.rest_servlet.ShowBillOfFareServlet" %>
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
    <title>菜品信息</title>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }
            $(".delete").click(function () {
                var thisTr=$(this).parent().parent();
                $.getJSON(
                    "${pageContext.request.contextPath}/rest/ShowBillOfFareServlet",
                    {
                        "action":"doDelete",
                        "vegetableId":thisTr.children('td:eq(0)').text()
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
            function changeValue(obj){
                $(obj).attr("value",$(obj).val());
            }
            $(".update").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=7){
                    var thisTr=$(this).parent().parent();
                    $("td:not('button')",thisTr).each(function(i,td){
                        if(i>=0&&i<6&&i!=1){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
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
            $(".add").click(function () {
                var input_num=document.getElementsByTagName("input").length;
                // alert(input_num);
                if(input_num<=7){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var vegetable_type=tbody.parent().find("th").first().text();
                    var td_num=tbody.find("tr").eq("-2").find("td").first().text();
                    // alert(td_num);
                    td_num=td_num.replace(/[^0-9]/ig,"");
                    if(isEmpty(td_num)){
                        td_num=0;
                    }
                    td_num=parseInt(td_num)+1;
                    var vegetable_id="";
                    if(vegetable_type=="干锅类"){
                        vegetable_id="GG"+td_num;
                    }
                    else if(vegetable_type=="汤锅类"){
                        vegetable_id="TG"+td_num;
                    }
                    else if(vegetable_type=="荤菜类"){
                        vegetable_id="HC"+td_num;
                    }
                    else if(vegetable_type=="素菜类"){
                        vegetable_id="TSC"+td_num;
                    }
                    else if(vegetable_type=="料碗类"){
                        vegetable_id="LW"+td_num;
                    }
                    else if(vegetable_type=="主食类"){
                        vegetable_id="ZS"+td_num;
                    }
                    else if(vegetable_type=="酒水类"){
                        vegetable_id="JS"+td_num;
                    }
                    else{
                        vegetable_id="QT"+td_num;
                    }
                    newTr.children('td:eq(0)').text(vegetable_id);
                    newTr.children('td:eq(1)').text(vegetable_type);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });
            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var re=/^(GG|TG|HC|SC|LW|ZS|JS|QT)\d$/;
                var vegetable_id=$("#0").val();
                var vegetable_type=thisTr.children('td:eq(1)').text();
                var vegetable_name=$("#2").val();
                // var vegetable_image="";
                var vegetable_price=$("#3").val();
                var vegetable_number=$("#4").val();
                var vegetable_remark=$("#5").val();
                alert(vegetable_id);
                if(!re.test(vegetable_id))
                {
                    alert("请修改为正确的编号");
                }
                if(vegetable_name==""||vegetable_price==""||vegetable_number==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/rest/ShowBillOfFareServlet",
                        {
                            "action":"doUpdateOrAdd",
                            "vegetable_id":vegetable_id,
                            "vegetable_type":vegetable_type,
                            "vegetable_name":vegetable_name,
                            // "vegetable_image":vegetable_image,
                            "vegetable_price":vegetable_price,
                            "vegetable_number":vegetable_number,
                            "vegetable_remark":vegetable_remark
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }else if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }
                        }
                    );
                    // $("td:not('button')",thisTr).each(function(i,td){
                    //     if(i>1&&i<7){
                    //         td = $(td);
                    //         td.text($("#"+i+"").val());
                    //     }
                    // });
                    // $(this).hide();
                    // $(".update",$(this).parent()).show();
                }
            });
            $(document).on("click","#show .addsave",function () {
                var thisTr=$("#show .addsave").parent().parent();
                // alert(thisTr.html());
                var vegetable_id=thisTr.children('td:eq(0)').text();
                var vegetable_type=thisTr.children('td:eq(1)').text();
                var vegetable_name=$("#show #9").val();
                // var vegetable_image="";
                var vegetable_price=$("#show #10").val();
                var vegetable_number=$("#show #11").val();
                var vegetable_remark=$("#show #12").val();
                // alert(vegetable_id);
                alert(vegetable_name);
                if(vegetable_name==""||vegetable_price==""||vegetable_number==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/rest/ShowBillOfFareServlet",
                        {
                            "action":"doUpdateOrAdd",
                            "vegetable_id":vegetable_id,
                            "vegetable_type":vegetable_type,
                            "vegetable_name":vegetable_name,
                            // "vegetable_image":vegetable_image,
                            "vegetable_price":vegetable_price,
                            "vegetable_number":vegetable_number,
                            "vegetable_remark":vegetable_remark
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }else if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');
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
    <span class="c-gray en">&gt;</span>菜品信息管理<a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href='${pageContext.request.contextPath}/rest/ShowBillOfFareServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅信息管理子系统 </p>
    <c:set var="bills" value="${sessionScope.restBillOfFares}" />
    <table class="table table-border table-bordered table-bg"
           style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="text" value="" placeholder="编号(必填)" id="7"></td>
            <td><input type="text" value="" placeholder="类别(必填)" id="8"></td>
            <td><input type="text" value="" placeholder="名称(必填)" id="9"></td>
<%--            <td><input type="text" value="" class="vegetable_image" id="10"></td>--%>
            <td><input type="text" value="" placeholder="价格(必填)" id="10"></td>
            <td><input type="text" value="" placeholder="数量(必填)"
                       onkeyup="value=value.replace(/[^\d]/g,'')" id="11"></td>
            <td><input type="text" value="" placeholder="备注" id="12"></td>
            <td><button name="addsave" class="addsave">保存</button>&nbsp;
                <button name="update" class="update" style="display:none">修改</button>&nbsp;&nbsp;
                <button name="delete" class="delete" >删除</button></td>
        </tr>
        </tbody>
    </table>
    <div id="show" class="page-container">
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="8" style="text-align: center">干锅类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyGG">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='干锅类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="8" scope="col">汤锅类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyTG">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='汤锅类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">荤菜类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyHC">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='荤菜类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">素菜类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodySC">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='素菜类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">料碗类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyLW">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='料碗类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">主食类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyZS">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='主食类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">酒水类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyJS">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='酒水类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="8" scope="col">其他类</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
<%--                <th>图片</th>--%>
                <th>价格</th>
                <th>数量</th>
                <th>备注</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyQT">
            </tbody>
            <c:forEach items="${bills}" var="bill">
                <c:if test="${bill.vegetableType=='其他类'}">
                    <tr>
                        <td>${bill.vegetableId}</td>
                        <td>${bill.vegetableType}</td>
                        <td>${bill.vegetableName}</td>
<%--                        <td>${bill.vegetableImage}</td>--%>
                        <td style="white-space: nowrap">${bill.vegetablePrice}</td>
                        <td>${bill.vegetableNumber}</td>
                        <td>${bill.vegetableRemark}</td>
                        <td><button name="save" class="save" style="display: none">保存</button>
                            <button name="update" class="update">修改</button>&nbsp;&nbsp;
                            <button name="delete" class="delete" >删除</button></td>
                    </tr>
                </c:if>
            </c:forEach>
            <tr>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
                <td>---</td>
<%--                <td>---</td>--%>
                <td>---</td>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
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
