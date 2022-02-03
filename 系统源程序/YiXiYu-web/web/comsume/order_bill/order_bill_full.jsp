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
            var ServletUrl="${pageContext.request.contextPath}/comsume/OrderBillServlet";
            <c:set var="bills" value="${sessionScope.restBillOfFares}" />
            <c:set var="restPayForm" value="${sessionScope.restPayForm}" />

            <c:set var="billAlls" value="${sessionScope.billAlls}" />
            <c:set var="bill_id" value="${sessionScope.bill_id}" />
            <c:set var="phone" value="${sessionScope.phone}" />
            <c:set var="zongjia" value="${sessionScope.zongjia}" />
            <c:set var="restPRooms" value="${sessionScope.restPRooms}" />
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }
            function Split(s){
                var ss;
                // 在每个字符T处进行分解。
                ss = s.split("T");
                return(ss);
            }
            function RemoveCh(strValue) {
                if(strValue!= null && strValue != ""){
                    var reg = /[\u4e00-\u9fa5]/g;
                    return strValue.replace(reg, "");
                }
                else
                    return "";
            }
            var room_id=$("#room_id").text();
            alert(room_id);
            $("#p_room_id").val(room_id);
            var bill_id=$("#bill_id").val();
            var vegetable_id_old="";
            var pay_type=$("#pay_type");

            var p_type=$("#p_type").text();
            pay_type.val(p_type);
            $(".delete").click(function () {
                if(bill_id.indexOf("C")==-1){
                    alert("只允许顾客操作！")
                }else {
                    var thisTr=$(this).parent().parent();
                    $.getJSON(
                        ServletUrl,
                        {
                            "action":"doDeleteForBillAll",
                            "bill_id":bill_id,
                            "vegetable_id":thisTr.children('td:eq(0)').text()
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
				}

            });
            function changeValue(obj){
                $(obj).attr("value",$(obj).val());
            }
            $(".update").click(function () {
                // if(bill_id.indexOf("C")==-1){
                //     alert("只允许顾客操作！")
                // }else {
                    var input_num=document.getElementsByTagName("input").length;
                    // alert(input_num);
                    if(input_num<=9){
                        var thisTr=$(this).parent().parent();
                        vegetable_id_old=thisTr.children('td:eq(0)').text();
                        $("td:not('button')",thisTr).each(function(i,td){
                            if(i>=0&&i<4&&i!=2){
                                td = $(td);
                                var html =
                                    "<input value='"+td.text()+"' id='"+i+"' type='text'  placeholder='"+td.text()+"'>";
                                td.html(html);
                            }
                            else if(i==2){
                                td = $(td);
                                var dmp=td.text();
                                var html =
                                    "<select id='"+i+"'  >" +
                                    "<option value='VG0'>请选择菜品名称</option>" +
                                    "<c:forEach items='${bills}' var='bill'>" +
                                    "<option value='${bill.vegetableName}'> ${bill.vegetableName}</option>" +
                                    "</c:forEach>" +
                                    "</select>";
                                td.html(html);
                                td.children(':first').val(dmp);
                            }
                            else if(i==4){
                                td = $(td);
                                var html =
                                    "<input value='"+td.text()+"' id='"+i+"' type='number'  placeholder='"+td.text()+"'>";
                                td.html(html);
                            }
                            else if(i==5){
                                td = $(td);
                                var dmp=td.text();
                                var html =
                                    "<select id='"+i+"' style='width: 200px; height: 18px'>"+
                                    "<option value='已上'>已上</option>"+
									"<option value='未上'>未上</option>"+
                                    "</select>";
                                td.html(html);
                                td.children(':first').val(dmp);
                            }
                        });
                        $(this).hide();
                        $(".save",$(this).parent()).show();
                    }
                    else{
                        alert("一次只可以修改或添加一次！")
                    }
				// }

            });
            $(".add").click(function () {
                if(bill_id.indexOf("C")==-1){
                    alert("只允许顾客操作！")
				}else {
                    var input_num=document.getElementsByTagName("input").length;
                    alert(input_num);
                    if(input_num<=9) {
                        var tbody = $(this).parent().parent().parent();
                        var hidTr = $("#display_tbody").children().first();
                        var newTr = hidTr.clone().show();
                        $(this).parent().parent().before(newTr);
                    }
                    else{
                        alert("一次只可以修改或添加一次！")
                    }
				}

            });
            $(document).on("change","#show #9",function (){
                var vegetable_name=this.value;
                if(vegetable_name=="VG0"){
                    alert("菜品名称不能为空！");
                }
                var thisTr=$("#show #9").parent().parent();
                $.getJSON(
                    "${pageContext.request.contextPath}/rest/ShowBillOfFareServlet",
                    {
                        "action":"doSearchByName",
                        "vegetable_name":vegetable_name
                    },
                    function (resultJson) {
                        thisTr.children('td:eq(1)').text(resultJson.vegetable_type);
                        thisTr.children('td:eq(0)').text(resultJson.vegetable_id);
                        thisTr.children('td:eq(3)').text(resultJson.vegetable_price);
                    }
                )
            });

            $(document).on("change","#9",function (){
                var vegetable_name=this.value;
                if(vegetable_name=="VG0"){
                    alert("菜品名称不能为空！");
                }
                var thisTr=$("#2").parent().parent();
                $.getJSON(
                    "${pageContext.request.contextPath}/rest/ShowBillOfFareServlet",
                    {
                        "action":"doSearchByName",
                        "vegetable_name":vegetable_name
                    },
                    function (resultJson) {
                        var html0 =
                            "<input value='"+resultJson.staff_name+"' id=0 " +
                            "type='text' readonly='readonly' placeholder='"+resultJson.vegetable_id+"'>";
                        var html1 =
                            "<input value='"+resultJson.staff_sex+"' id=1 " +
                            "type='text' readonly='readonly' placeholder='"+resultJson.vegetable_type+"'>";
                        var html3 =
                            "<input value='"+resultJson.staff_sex+"' id=3 " +
                            "type='text' readonly='readonly' placeholder='"+resultJson.vegetable_price+"'>";
                        thisTr.children('td:eq(0)').html(html0);
                        thisTr.children('td:eq(1)').html(html1);
                        thisTr.children('td:eq(3)').html(html3);
                    }
                )
            });
            $(".save").click(function () {
                var thisTr=$(this).parent().parent();
                // alert(thisTr.html());
                var re=/^(GG|TG|HC|SC|LW|ZS|JS|QT)\d$/;

                var pay_datetime=$("#pay_datetime").val();
                var pay_date=Split(pay_datetime)[0];
                var bill_customer=$("#bill_customer").val();
                var p_room_id=$("#p_room_id").val();
                var vegetable_id=$("#0").text();
                if(isEmpty(vegetable_id)){
                    vegetable_id = $("#0").val();
                }
                var vegetable_type=$("#1").text();
                if(isEmpty(vegetable_type)){
                    vegetable_type = $("#1").val();
                }
                var vegetable_name=$("#2").val();
                // var vegetable_image="";
                var vegetable_price=$("#3").text();
                if(isEmpty(vegetable_price)){
                    vegetable_price = $("#3").val();
				}
                var vegetable_number=$("#4").val();
                var vegetable_state=$("#5").val();
                if(isEmpty(pay_date)||isEmpty(bill_customer)||isEmpty(p_room_id)||p_room_id=="BJ0"){
					alert("请输入消费时间/包间名称/顾客联系方式！");
					alert(pay_date+bill_customer+p_room_id);
				}else {
                    // alert(vegetable_name+vegetable_price+vegetable_number+vegetable_state);
                    if(vegetable_name=="VG0"||isEmpty(vegetable_price)||isEmpty(vegetable_number)||isEmpty(vegetable_state)){
                        alert("请输入必填项！");
                    }else
                    {
                        alert(vegetable_id_old+vegetable_name);
                        $.getJSON(
                            ServletUrl,
                            {
                                "action":"doUpdateOrAddBillAll",
                                "bill_id":bill_id,
                                "vegetable_id_old":vegetable_id_old,
                                "bill_data":pay_date,
                                "bill_customer":bill_customer,
                                "bill_proom":p_room_id,
                                "vegetable_id":vegetable_id,
                                "vegetable_type":vegetable_type,
                                "vegetable_name":vegetable_name,
                                // "vegetable_image":vegetable_image,
                                "vegetable_price":RemoveCh(vegetable_price),
                                "vegetable_number":vegetable_number,
								"vegetable_state":vegetable_state
                            },
                            function (status) {
                                console.log(status);
                                // alert(status);
                                if (status.status == "updateyes") {
                                    alert("操作成功！");
                                    thisTr.children('td:eq(0)').text(vegetable_id);
                                    thisTr.children('td:eq(1)').text(vegetable_type);
                                    thisTr.children('td:eq(2)').text(vegetable_name);
                                    thisTr.children('td:eq(3)').text(vegetable_price);
                                    thisTr.children('td:eq(4)').text(vegetable_number);
                                    thisTr.children('td:eq(5)').text(vegetable_state);
                                    $("#addsave").css("display","none");
                                    $("#update").css("display","no");
                                } else if(status.status=="updateno") {
                                    alert("操作失败！");
                                }else if(status.status=="addyes") {
                                    alert("操作成功！");
                                    thisTr.children('td:eq(2)').text(vegetable_name);
                                    thisTr.children('td:eq(4)').text(vegetable_number);
                                    $("#addsave").css("display","none");
                                    $("#update").css("display","no");
                                }else if(status.status=="addno") {
                                    alert("操作失败！");
                                }
                                else{
                                    alert("错误");
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
				}


            });
            $(document).on("click","#show .addsave",function () {
                var thisTr=$("#show .addsave").parent().parent();
                // alert(thisTr.html());

                var pay_datetime=$("#pay_datetime").val();
                var pay_date=Split(pay_datetime)[0];
                var bill_customer=$("#bill_customer").val();
                var p_room_id=$("#p_room_id").val();
                var vegetable_id=thisTr.children('td:eq(0)').text();
                var vegetable_type=thisTr.children('td:eq(1)').text();
                var vegetable_name=$("#show #9").val();
                // var vegetable_image="";
                var vegetable_price=thisTr.children('td:eq(3)').text();
                if(isEmpty(vegetable_price)){
                    vegetable_price = $("#3").val();
                }
                var vegetable_number=$("#show #11").val();
                var vegetable_state=$("#show #12").val();
                // alert(vegetable_id);
                if(isEmpty(pay_date)||isEmpty(bill_customer)||isEmpty(p_room_id)||p_room_id=="BJ0"){
                    alert("请输入消费时间/包间名称/顾客联系方式！");
                }else {
                    // alert(vegetable_name+vegetable_price+vegetable_number+vegetable_state);
                    if(vegetable_name=="VG0"||isEmpty(vegetable_price)||isEmpty(vegetable_number)||isEmpty(vegetable_state)){
                        alert("请输入必填项！");
                    }
                    else
                    {
                        alert(vegetable_id_old+vegetable_name);

                        $.getJSON(
                            ServletUrl,
                            {
                                "action":"doUpdateOrAddBillAll",
                                "bill_id":bill_id,
                                "vegetable_id_old":vegetable_id_old,
                                "bill_data":pay_date,
                                "bill_customer":bill_customer,
                                "bill_proom":p_room_id,
                                "vegetable_id":vegetable_id,
                                "vegetable_type":vegetable_type,
                                "vegetable_name":vegetable_name,
                                // "vegetable_image":vegetable_image,
                                "vegetable_price":RemoveCh(vegetable_price),
                                "vegetable_number":vegetable_number,
								"vegetable_state":vegetable_state
                            },
                            function (status) {
                                console.log(status);
                                // alert(status);
                                if(status.status=="addyes") {
                                    alert("操作成功！");
                                    thisTr.children('td:eq(2)').text(vegetable_name);
                                    thisTr.children('td:eq(4)').text(vegetable_number);
                                    $("#addsave").css("display","none");
                                    $("#update").css("display","no");
                                }else if(status.status=="addno") {
                                    alert("操作失败！");

                                }else if (status.status == "updateyes") {
                                    alert("操作成功！");
                                    thisTr.children('td:eq(0)').text(vegetable_id);
                                    thisTr.children('td:eq(1)').text(vegetable_type);
                                    thisTr.children('td:eq(2)').text(vegetable_name);
                                    thisTr.children('td:eq(3)').text(vegetable_price);
                                    thisTr.children('td:eq(4)').text(vegetable_number);
                                    thisTr.children('td:eq(5)').text(vegetable_state);
                                    $("#addsave").css("display","none");
                                    $("#update").css("display","no");
                                } else if(status.status=="updateno") {
                                    alert("操作失败！");

                                }
                                else{
                                    alert("错误");

                                }
                            }
                        );
                    }
				}

            });
            
            $("#add_pay_form").click(function () {
                var pay_datetime=$("#pay_datetime").val();
                var pay_date=Split(pay_datetime)[0];
                var pay_time=Split(pay_datetime)[1];
                var p_room_id=$("#p_room_id").val();
                var is_takeaway="否";
                var takeaway_type="";
                var pay_type=$("#pay_type").val();
                var pay_price=$("#pay_price").val();
                if(pay_time==""||p_room_id=="BJ0"||pay_type=="ZF0"||isEmpty(pay_price)){
                    alert("请输入必填项！");
                }
                else
                {
                    $.getJSON(
                        "${pageContext.request.contextPath}/comsume/PayServlet",
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
                                window.location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');
                            } else if(status.status=="updateno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');
                            }else if(status.status=="addyesupdateyes") {
                                alert("操作成功！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');
                            }else if(status.status=="addno") {
                                alert("操作失败！");
                                window.location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');
                            }
                            else{
                                alert("错误");
                                window.location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 餐厅订餐消费子系统
	<span class="c-gray en">&gt;</span>菜单管理<a class="btn btn-success radius r"
												style="line-height:1.6em;margin-top:3px"
												href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<p class="f-20 text-success" style="text-align: center">欢迎使用餐厅订餐消费子系统 </p>

	<table class="table table-border table-bordered table-bg"
		   style="border-left:0px;border-right: 0px" id="display">
		<tbody id="display_tbody">
		<tr style="display: none ">
			<td><input type="text" value="" placeholder="编号(必填)" id="7"></td>
			<td><input type="text" value="" placeholder="类别(必填)" id="8"></td>
			<td><select id="9"  >
				<option value="VG0">请选择菜品名称</option>
				<c:forEach items="${bills}" var="bill">
						<option value="${bill.vegetableName}"> ${bill.vegetableName}</option>
				</c:forEach>
			</select></td>
			<td><input type="text" value="" placeholder="价格(必填)" id="10"></td>
			<td><input type="number" value="" placeholder="数量(必填)" id="11"></td>
			<td><select id='12' style="width: 200px; height: 18px">
				<option value='已上'>已上</option>
				<option value='未上'>未上</option>
			</select></td>
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
				<th colspan="8" style="text-align: center">点菜单基本信息</th>
			</tr>
			</thead>
			<tr>
				<td class="labels">订单编号:</td>
				<td width="300px"><font color=red>*</font>
					<input type="text" maxlength="30" id="bill_id"  style=" width: 200px; height: 18px" value="${bill_id}" readonly="readonly"/></td>
				<td class="labels">消费时间:</td>
				<td width="300px"><font color=red>*</font>
					<input type="datetime-local" maxlength="30" id="pay_datetime"  style="width: 200px; height: 18px" value="${restPayForm.payDate}T${restPayForm.payTime}"/></td>
				<h1 style="display: none;" id="datetime">${restPayForm.payDate} ${restPayForm.payTime}</h1>
				<td class="labels">外卖类型:</td>
				<td width="300px"><font color=red>*</font>
					<select id='takeaway_type' style="width: 200px; height: 18px">
						<option value='非外卖'>非外卖</option>
						<option value='美团'>美团</option>
						<option value='饿了么'>饿了么</option>
					</select></td>
			</tr>
			<tr>
				<td class="labels">包间名称:</td>
				<td width="300px"><font color=red>*</font>
					<select id="p_room_id"   style="width: 200px; height: 18px">
						<option value="BJ0">包间名称:</option>
						<c:forEach items="${restPRooms}" var="restPRoom">
							<option value="${restPRoom.PRoomName}"> ${restPRoom.PRoomName}</option>
						</c:forEach>
					</select></td>
				<td class="labels">支付类型:</td>
				<h1 style="display: none;" id="room_id">${restPayForm.PRoomId}</h1>
				<td width="300px"><font color=red>*</font>
					<select id='pay_type'  style="width: 200px; height: 18px">
						<option value="ZF0">支付方式</option>
						<option value="未支付">未支付</option>
						<option value="支付宝">支付宝</option>
						<option value="微信">微信</option>
						<option value="美团">美团</option>
						<option value="现金">现金</option>
					</select></td>
				<h1 style="display: none;" id="p_type">${restPayForm.payType}</h1>
				<td class="labels" >支付金额:</td>
				<td width="300px"><font color=red>*</font><input type="text" maxlength="30" id="pay_price"  style="width: 200px; height: 18px" value="${zongjia}" /></td>
			</tr>

		</table>
		<hr>
		<table class="table table-border table-bordered table-bg"
			   style="white-space: nowrap">
			<thead>
			<tr>
				<th colspan="9" style="text-align: center">干锅类</th>
			</tr>
			<tr class="text-c">
				<th>编号</th>
				<th>类别</th>
				<th>名称</th>
				<%--                <th>图片</th>--%>
				<th>价格</th>
				<th>数量</th>
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyGG">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='干锅类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th colspan="9" scope="col">汤锅类</th>
			</tr>
			<tr class="text-c">
				<th>编号</th>
				<th>类别</th>
				<th>名称</th>
				<%--                <th>图片</th>--%>
				<th>价格</th>
				<th>数量</th>
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyTG">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='汤锅类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th colspan="9" scope="col">荤菜类</th>
			</tr>
			<tr class="text-c">
				<th>编号</th>
				<th>类别</th>
				<th>名称</th>
				<%--                <th>图片</th>--%>
				<th>价格</th>
				<th>数量</th>
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyHC">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='荤菜类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th colspan="9" scope="col">素菜类</th>
			</tr>
			<tr class="text-c">
				<th>编号</th>
				<th>类别</th>
				<th>名称</th>
				<%--                <th>图片</th>--%>
				<th>价格</th>
				<th>数量</th>
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodySC">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='素菜类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyLW">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='料碗类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyZS">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='主食类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th colspan="9" scope="col">酒水类</th>
			</tr>
			<tr class="text-c">
				<th>编号</th>
				<th>类别</th>
				<th>名称</th>
				<%--                <th>图片</th>--%>
				<th>价格</th>
				<th>数量</th>
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyJS">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='酒水类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
				<th>上菜状态</th>
				<th>具体操作</th>
			</tr>
			</thead>
			<tbody id="tbodyQT">
			</tbody>
			<c:forEach items="${billAlls}" var="billAll">
				<c:if test="${billAll.vegetableType=='其他类'}">
					<tr>
						<td>${billAll.vegetableId}</td>
						<td>${billAll.vegetableType}</td>
						<td>${billAll.vegetableName}</td>
							<%--                        <td>${bill.vegetableImage}</td>--%>
						<td style="white-space: nowrap">${billAll.vegetablePrice}</td>
						<td>${billAll.vegetableNumber}</td>
						<td>${billAll.vegetableState}</td>
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
		<table class="table table-border table-bordered table-bg"
			   style="white-space: nowrap">
			<thead>
			<tr>
				<th colspan="9" style="text-align: center">点菜单基本信息</th>
			</tr>
			</thead>
			<tr>
				<td class="labels">顾客联系方式:</td>
				<td width="300px"><font color=red>*</font>
					<input type="tel" maxlength="30" id="bill_customer"  style=" width: 200px; height: 18px" value="${phone}"/></td>
				<td class="labels">溢香园餐饮联系方式:</td>
				<td width="300px"><font color=red>*</font>
					<input type="text" maxlength="30" id=""  style="width: 200px; height: 18px" value="5977888" readonly="readonly"/></td>
			</tr>

		</table>
		<hr>
		<table class="table table-border table-bordered table-bg"
			   style="white-space: nowrap">
			<tr>
				<td><button id="add_pay_form" class="add_pay_form" style="height: 60px;font-size: 25px">添加到点菜单</button></td>
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
