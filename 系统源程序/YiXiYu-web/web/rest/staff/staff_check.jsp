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
    <title>员工考核信息</title>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            var ServletURL="${pageContext.request.contextPath}/rest/StaffCheckServlet";

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

            $(".delete").click(function () {
                var thisTr=$(this).parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doDelete",
                        "staff_id":thisTr.children('td:eq(1)').text(),
                        "date":thisTr.children('td:eq(0)').text()
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
                // alert(input_num);
                if(input_num<=5){
                    var thisTr=$(this).parent().parent();
                    $("td:not('button')",thisTr).each(function(i,td){
                        if(i>=5&&i<7){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }else if(i>=0&&i<4&&i!=1){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' " +
                                "type='text' readonly='readonly' placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else if(i==1){
                            td = $(td);
                            var html =
                                "<select id='1'> <option value='YG0'>请选择员工编号</option> "
                                +"<c:forEach items='${restStaffBasicForms}' var='restStaffBasicForm'>"
                            +" <option value='${restStaffBasicForm.staffId}'>"
                                +" ${restStaffBasicForm.staffId}</option></c:forEach> </select>";
                            td.html(html);
                        }
                        else if(i==4){
                            td = $(td);
                            var html =
                                "<select id='"+i+"'  > <option value='已到'>已到</option> <option value='迟到'>迟到</option> <option value='缺勤'>缺勤</option></select>";
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
                if(input_num<=4){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var myDate = new Date();
                    var date=myDate.toLocaleDateString();
                    newTr.children('td:eq(0)').text(date);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });

            $(document).on("change","#show #9",function (){
                var staff_id=this.value;
                if(staff_id=="YG0"){
                    alert("员工编号不能为空！");
                }
                var thisTr=$("#show #9").parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doSearch",
                        "staff_id":staff_id
                    },
                    function (resultJson) {
                        thisTr.children('td:eq(2)').text(resultJson.staff_name);
                        thisTr.children('td:eq(3)').text(resultJson.staff_sex);
                    }
                )
            });

            $(document).on("change","#1",function (){
                var staff_id=this.value;
                if(staff_id=="YG0"){
                    alert("员工编号不能为空！");
                }
                var thisTr=$("#1").parent().parent();
                $.getJSON(
                    ServletURL,
                    {
                        "action":"doSearch",
                        "staff_id":staff_id
                    },
                    function (resultJson) {
                        var html2 =
                            "<input value='"+resultJson.staff_name+"' id=2 " +
                            "type='text' readonly='readonly' placeholder='"+resultJson.staff_name+"'>";
                        var html3 =
                            "<input value='"+resultJson.staff_sex+"' id=3 " +
                            "type='text' readonly='readonly' placeholder='"+resultJson.staff_sex+"'>";
                        thisTr.children('td:eq(2)').html(html2);
                        thisTr.children('td:eq(3)').html(html3);
                    }
                )
            });

            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var date=$("#0").val();
                var staff_id=$("#1").val();
                var staff_name=$("#2").val();
                var staff_sex=$("#3").val();
                var staff_check=$("#4").val();
                var staff_special_matters=$("#5").val();
                var staff_data_deduction=$("#6").val();
                alert(staff_name);
                if(staff_id==""||staff_name==""||staff_sex==""||staff_check==""||
                    staff_data_deduction==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "date":date,
                            "staff_id":staff_id,
                            "staff_name":staff_name,
                            "staff_sex":staff_sex,
                            "staff_check":staff_check,
                            "staff_special_matters":staff_special_matters,
                            "staff_data_deduction":staff_data_deduction
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
                var date=thisTr.children('td:eq(0)').text();
                var staff_id=$("#show #9").val();
                var staff_name=thisTr.children('td:eq(2)').text();
                var staff_sex=thisTr.children('td:eq(3)').text();
                var staff_check=$("#show #12").val();
                var staff_special_matters=$("#show #13").val();
                var staff_data_deduction=$("#show #14").val();
                alert(staff_name);
                if(staff_id==""||staff_name==""||staff_sex==""||staff_check==""||
                    staff_data_deduction==""){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        ServletURL,
                        {
                            "action":"doUpdateOrAdd",
                            "date":date,
                            "staff_id":staff_id,
                            "staff_name":staff_name,
                            "staff_sex":staff_sex,
                            "staff_check":staff_check,
                            "staff_special_matters":staff_special_matters,
                            "staff_data_deduction":staff_data_deduction
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 餐厅信息管理子系统<span class="c-gray en">&gt;</span>员工信息<span class="c-gray en">&gt;</span>员工绩效考核管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href='${pageContext.request.contextPath}/rest/StaffCheckServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅信息管理子系统 </p>
    <c:set var="restStaffCheckForms" value="${sessionScope.restStaffCheckForms}" />
    <table class="table table-border table-bordered table-bg" style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="date" value="" placeholder="日期(必填)" id="8"></td>
            <%--<td><input type="text" value="" placeholder="员工编号(必填)" id="9"></td>--%>
            <td><select id="9"  >
                <option value="YG0">请选择员工编号</option>
                <c:forEach items="${restStaffBasicForms}" var="restStaffBasicForm">
                    <option value="${restStaffBasicForm.staffId}"> ${restStaffBasicForm.staffId}</option>
                </c:forEach>
            </select></td>
            <td><input type="text" value="" placeholder="员工姓名(必填)"
                       onkeyup="value=value.match(/([\u4e00-\u9fa5]+)/g)" id="10"></td>
            <td><select id="11"  >
                <option value='男'>男</option>
                <option value='女'>女</option>
            </select></td>
            <td><select id="12"  >
                <option value="已到">已到</option>
                <option value="迟到">迟到</option>
                <option value="缺勤">缺勤</option>
            </select></td>
            <td><input type="text" value="" placeholder="特殊事项(必填)" id="13"></td>
            <td><input type="text" value="" placeholder="日扣除金额(必填)"
                       onkeyup="value=value.match(/^([1-9]\d{0,9}|0)([.]?|(\.\d{1,2})?)$/g)" id="14"></td>
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
                <th colspan="8" style="text-align: center">员工考核信息</th>
            </tr>
            <tr class="text-c">
                <th>日期</th>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>员工性别</th>
                <th>考勤情况</th>
                <th>特殊事项</th>
                <th>日扣除金额</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyDT">
            <c:forEach items="${restStaffCheckForms}" var="restStaffCheckForm">
                    <tr>
                        <td>${restStaffCheckForm.date}</td>
                        <td>${restStaffCheckForm.staffId}</td>
                        <td>${restStaffCheckForm.staffName}</td>
                        <td>${restStaffCheckForm.staffSex}</td>
                        <td>${restStaffCheckForm.staffCheck}</td>
                        <td>${restStaffCheckForm.staffSpecialMatters}</td>
                        <td>${restStaffCheckForm.staffDataDeduction}</td>
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
                <%--<td>---</td>--%>
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

