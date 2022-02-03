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
    <title>包间信息</title>
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
                    "${pageContext.request.contextPath}/rest/PRoomServlet",
                    {
                        "action":"doDelete",
                        "P_room_id":thisTr.children('td:eq(0)').text()
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
                if(input_num<=10){
                    var thisTr=$(this).parent().parent();
                    $("td:not('button')",thisTr).each(function(i,td){
                        if(i>=0&&i<6&&i!=1&&i!=4){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else if(i>=6&&i<8&&i!=1&&i!=4){
                            td = $(td);
                            var html =
                                "<input value='"+td.text()+"' id='"+i+"' type='datetime-local'  placeholder='"+td.text()+"'>";
                            td.html(html);
                        }
                        else if(i==4){
                            td=$(td);
                            var html="<select id='"+i+"'>\n" +
                                "                <option value='空闲'>空闲</option>\n" +
                                "                <option value='使用中'>使用中</option>\n" +
                                "                <option value='已预订'>已预订</option>\n" +
                                "                </select>";
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
                if(input_num<=8){
                    var tbody=$(this).parent().parent().parent();
                    var hidTr=$("#display_tbody").children().first();
                    var newTr=hidTr.clone().show();
                    var P_room_type=tbody.parent().find("th").first().text();
                    var td_num=tbody.find("tr").eq("-2").find("td").first().text();
                    td_num=td_num.replace(/[^0-9]/ig,"");
                    // alert(isEmpty(td_num));
                    if(isEmpty(td_num)){
                        td_num=0;
                    }
                    td_num=parseInt(td_num)+1;
                    // alert(td_num);
                    var P_room_id="";
                    if(P_room_type=="大厅"){
                        P_room_id="DT"+td_num;
                    }
                    else if(P_room_type=="雅座"){
                        P_room_id="YZ"+td_num;
                    }
                    else{
                        P_room_id="BJ"+td_num;
                    }
                    newTr.children('td:eq(0)').text(P_room_id);
                    newTr.children('td:eq(1)').text(P_room_type);
                    $(this).parent().parent().before(newTr);
                }
                else{
                    alert("一次只可以修改或添加一次！")
                }
            });
            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                // var re=/^(DT|YZ|BJ)\d$/;
                var P_room_id=$("#0").val();
                var P_room_type=thisTr.children('td:eq(1)').text();
                var P_room_name=$("#2").val();
                // var P_room_image="";
                var P_room_number=$("#3").val();
                var P_room_state=$("#4").val();
                var P_room_remark=$("#5").val();
                var P_room_began=$("#6").val();
                var P_room_finish=$("#7").val();
                alert(P_room_name);
                // if(!re.test(P_room_id))
                // {
                //     alert("请修改为正确的编号");
                // }
                // else
                if(P_room_name==""||P_room_number==""||P_room_state==""){
                    alert("请输入必填项！");
                }
                else if(P_room_state!="空闲"&&P_room_state!="使用中"&&P_room_state!="已预订"){
                    alert('使用状态请填入"空闲/使用中/已预订" ');
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/rest/PRoomServlet",
                        {
                            "action":"doUpdateOrAdd",
                            "P_room_id":P_room_id,
                            "P_room_type":P_room_type,
                            "P_room_name":P_room_name,
                            // "P_room_image":P_room_image,
                            "P_room_number":P_room_number,
                            "P_room_state":P_room_state,
                            "P_room_remark":P_room_remark,
                            "P_room_began":P_room_began,
                            "P_room_finish":P_room_finish
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }else if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }
                        }
                    );
                }
            });
            $(document).on("click","#show .addsave",function () {
                var thisTr=$("#show .addsave").parent().parent();
                // var re=/^(DT|YZ|BJ)\d$/;
                // alert(thisTr.html());
                var P_room_id=thisTr.children('td:eq(0)').text();
                var P_room_type=thisTr.children('td:eq(1)').text();
                var P_room_name=$("#show #12").val();
                // var P_room_image="";
                var P_room_number=$("#show #14").val();
                var P_room_state=$("#show #15").val();
                var P_room_remark=$("#show #16").val();
                var P_room_began=$("#show #17").val();
                var P_room_finish=$("#show #18").val();
                // alert(P_room_began);
                // alert(P_room_name+P_room_number+P_room_state);
                // if(!re.test(P_room_id))
                // {
                //     alert("请修改为正确的编号");
                // }
                // else
                if(P_room_name==""||P_room_number==""||P_room_state==""){
                    alert("请输入必填项！");
                }
                else if(P_room_state!="空闲"&&P_room_state!="使用中"&&P_room_state!="已预订"){
                    alert('使用状态请填入"空闲/使用中/已预订" ');
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/rest/PRoomServlet",
                        {
                            "action":"doUpdateOrAdd",
                            "P_room_id":P_room_id,
                            "P_room_type":P_room_type,
                            "P_room_name":P_room_name,
                            // "P_room_image":P_room_image,
                            "P_room_number":P_room_number,
                            "P_room_state":P_room_state,
                            "P_room_remark":P_room_remark,
                            "P_room_began":P_room_began,
                            "P_room_finish":P_room_finish
                        },
                        function (status) {
                            console.log(status);
                            // alert(status);
                            if(status.status=="addyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }else if (status.status == "updateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');
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
    <span class="c-gray en">&gt;</span>包间信息管理<a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href='${pageContext.request.contextPath}/rest/PRoomServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <p class="f-20 text-success" style="text-align: center">欢迎使用餐厅信息管理子系统 </p>
    <c:set var="pRooms" value="${sessionScope.restPRooms}" />
    <table class="table table-border table-bordered table-bg"
           style="border-left:0px;border-right: 0px" id="display">
        <tbody id="display_tbody">
        <tr style="display: none ">
            <td><input type="text" value="" placeholder="编号(必填)" id="10"></td>
            <td><input type="text" value="" placeholder="类别(必填)" id="11"></td>
            <td><input type="text" value="" placeholder="名称(必填)" id="12"></td>
            <%--              <td><input type="text" value="" class="p_room_image" id="13"></td>--%>
            <td><input type="text" value="" placeholder="可坐人数最多(必填)"
                       onkeyup="value=value.replace(/[^\d]/g,'')" id="14"></td>
            <td><select id='15'>
                <option value='空闲'>空闲</option>
                <option value='使用中'>使用中</option>
                <option value='已预订'>已预订</option>
                </select></td>
            <td><input type="text" value="" placeholder="备注" id="16"></td>
            <td><input type="datetime-local" value="" placeholder="开始使用时间" id="17"></td>
            <td><input type="datetime-local" value="" placeholder="结束使用时间" id="18"></td>
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
                <th colspan="9" style="text-align: center">大厅</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
                <%--                <th>图片</th>--%>
                <th>可坐人数最多</th>
                <th>使用状态</th>
                <th>备注</th>
                <th>开始使用时间</th>
                <th>结束使用时间</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyDT">
            <c:forEach items="${pRooms}" var="pRoom">
                <c:if test="${pRoom.PRoomType=='大厅'}">
                    <tr>
                        <td>${pRoom.PRoomId}</td>
                        <td>${pRoom.PRoomType}</td>
                        <td>${pRoom.PRoomName}</td>
                            <%--                        <td>${pRoom.PRoomImage}</td>--%>
                        <td>${pRoom.PRoomNumber}</td>
                        <td>${pRoom.PRoomState}</td>
                        <td>${pRoom.PRoomRemark}</td>
                        <td>${pRoom.PRoomBegan}</td>
                        <td>${pRoom.PRoomFinish}</td>
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
                <%--                <td>---</td>--%>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg"
               style="white-space: nowrap">
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">雅座</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
                <%--                <th>图片</th>--%>
                <th>可坐人数最多</th>
                <th>使用状态</th>
                <th>备注</th>
                <th>开始使用时间</th>
                <th>结束使用时间</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyYZ">
            <c:forEach items="${pRooms}" var="pRoom">
                <c:if test="${pRoom.PRoomType=='雅座'}">
                    <tr>
                        <td>${pRoom.PRoomId}</td>
                        <td>${pRoom.PRoomType}</td>
                        <td>${pRoom.PRoomName}</td>
                            <%--                        <td>${pRoom.PRoomImage}</td>--%>
                        <td>${pRoom.PRoomNumber}</td>
                        <td>${pRoom.PRoomState}</td>
                        <td>${pRoom.PRoomRemark}</td>
                        <td>${pRoom.PRoomBegan}</td>
                        <td>${pRoom.PRoomFinish}</td>
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
                <%--                <td>---</td>--%>
                <td><button name="add" class="add" >添加</button></td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="table table-border table-bordered table-bg">
            <thead>
            <tr>
                <th colspan="9" style="text-align: center">包间</th>
            </tr>
            <tr class="text-c">
                <th>编号</th>
                <th>类别</th>
                <th>名称</th>
                <%--                <th>图片</th>--%>
                <th>可坐人数最多</th>
                <th>使用状态</th>
                <th>备注</th>
                <th>开始使用时间</th>
                <th>结束使用时间</th>
                <th>具体操作</th>
            </tr>
            </thead>
            <tbody id="tbodyBJ">
            <c:forEach items="${pRooms}" var="pRoom">
                <c:if test="${pRoom.PRoomType=='包间'}">
                    <tr>
                        <td>${pRoom.PRoomId}</td>
                        <td>${pRoom.PRoomType}</td>
                        <td>${pRoom.PRoomName}</td>
                            <%--                        <td>${pRoom.PRoomImage}</td>--%>
                        <td>${pRoom.PRoomNumber}</td>
                        <td>${pRoom.PRoomState}</td>
                        <td>${pRoom.PRoomRemark}</td>
                        <td>${pRoom.PRoomBegan}</td>
                        <td>${pRoom.PRoomFinish}</td>
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
                <%--                <td>---</td>--%>
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

