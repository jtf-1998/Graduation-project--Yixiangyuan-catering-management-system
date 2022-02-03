<%@ page language="java" contentType="text/html; charset=UTF-8" import="servlet.*" import="java.util.*"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
    <style type="text/css">
        .a_demo_two1 {
            background-color:#fff;
            padding:10px;
            position:relative;
            font-family: 'Open Sans', sans-serif;
            font-size:18px;
            text-decoration:none;
            color:#fff;
            background-image: linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
            background-image: -o-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
            background-image: -moz-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
            background-image: -webkit-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
            background-image: -ms-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
            background-image: -webkit-gradient(
                    linear,
                    left bottom,
                    left top,
                    color-stop(0, rgb(14,160,202)),
                    color-stop(1, rgb(62,184,229))
            );
            -webkit-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 6px 0px #156785;
            -moz-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 6px 0px #156785;
            -o-box-shadow: inset 0px 1px 0px #7fd2f1, 0px 6px 0px #156785;
            box-shadow: inset 0px 1px 0px #7fd2f1, 0px 6px 0px #156785;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -o-border-radius: 5px;
            border-radius: 5px;
        }
        body {
            margin: 0px;
            padding: 0px;
        }

        #div0 {
            position: absolute; //
        top: 50%;
            left: 20%;
            margin: 12px 0 0 -200px;
            width: 1200px;
            border: 1px solid #008800;
        }


        a:visited {
            color: #0cc;
            text-decoration: underline;
        }

        a:hover {
            color: red;
            text-decoration: none;
            font-size: 20px;
        }

        a:active {
            color: #00f;
            text-decoration: none;
        }
    </style>
    <script type="text/javascript" src="lhgcore.js"></script>
    <script type="text/javascript" src="lhgcalendar.js"></script>
</head>
<body style="background-color: #685a5a29">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 餐厅订餐消费子系统
    <span class="c-gray en">&gt;</span>菜单管理<span class="c-gray en">&gt;</span>菜单管理<a class="btn btn-success radius r"
                                                                                     style="line-height:1.6em;margin-top:3px"
                                                                                     href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<br>
<p class="f-20 text-success" style="text-align: center">欢迎使用溢香园餐厅菜单 </p>
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
<div id="div0">
    <form action="AddNianBaoServlet" method="post" >
        <p class="f-20 text-success" style="text-align: center">菜单基本信息</p>
        <div id="div1">
            <table>
                <tr>
                    <td class="labels">订单编号:</td>
                    <td width="300px"><font color=red>*</font>
                        <input type="text" maxlength="30" id="bill_id"  style=" width: 200px; height: 18px" value=""/></td>
                    <td class="labels">消费时间:</td>
                    <td width="300px"><font color=red>*</font>
                        <input type="datetime-local" maxlength="30" id="pay_datetime"  style="width: 200px; height: 18px" value=""/></td>
                    <td class="labels">外卖类型:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='takeaway_type' style="width: 200px; height: 18px">
                            <option value='非外卖'>非外卖</option>
                            <option value='美团'>美团</option>
                            <option value='饿了么'>饿了么</option>
                        </select></td>
                </tr>
            </table>
        </div>
        <div id="div3">
            <table>
                <tr>
                    <td class="labels">包&nbsp; 间 &nbsp;号:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='p_room_id' style="width: 200px; height: 18px">
                            <option value='非外卖'>非外卖</option>
                            <option value='美团'>美团</option>
                            <option value='饿了么'>饿了么</option>
                        </select></td>
                    <td class="labels">支付类型:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='pay_type' style="width: 200px; height: 18px">
                            <option value='现金'>现金</option>
                            <option value='支付宝'>支付宝</option>
                            <option value='微信'>微信</option>
                            <option value='美团'>美团</option>
                            <option value='饿了么'>饿了么</option>
                        </select></td>
                    <td class="labels" >支付金额:</td>
                    <td width="300px"><font color=red>*</font><input type="text" maxlength="30" id="pay_price"  style="width: 200px; height: 18px" value=""/></td>
                </tr>
            </table>
        </div>
        <hr>
        <p class="f-20 text-success" style="text-align: center">锅类</p>
        <div id="div5">
            <table>
                <tr>

                </tr>
            </table>
        </div>
        <hr>

        <div id="div6">
            <table>
                <tr>
                    <td rowspan="1" width="250px" style="font-size: 16px">服务的主要国民经济行业</td>
                    <td width="300px"><input type="text" placeholder="行业一" name="wfhy1"  style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">&nbsp;</td>
                    <td width="300px"><input type="text" placeholder="行业二" name="wfhy2" style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">&nbsp;</td>
                    <td width="300px"><input type="text" placeholder="行业三" name="whfy3" style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
            </table>
        </div>
        <hr>
        <div id="div7">
            <table>
                <tr>
                    <td rowspan="1" width="200px" style="font-size: 16px">服务的主要学科</td>
                    <td class="labels">学科门类:</td>
                    <td width="200px"><input type="text" name="ssxk1"  style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">学科大类:</td>
                    <td width="200px"><input type="text"  name="ssxk2" style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">专业:</td>
                    <td width="200px"><input type="text"  name="ssxk3" style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
            </table>
        </div>
        <hr>
        <div id="div8">
            <span style="color: red; heignt: 10px"><font size=2px color=red>依托单位的信息</font></span>
            <br>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="labels">单位名称:</td>
                    <td width="200px"><input type="text"placeholder="填写中文" name="ytdw"style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">机构代码:</td>
                    <td width="200px"><input type="text"placeholder="由6-8位数字组成" name="ytdwdm"style="width: 100px; height: 18px" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
                    <td class="labels">法人代表姓名:</td>
                    <td width="200px"><input type="text"placeholder="填写中文姓名" name="ytdwfr"style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">依托单位纳税地区划代码:</td>
                    <td width="150px"><input type="text"placeholder="由6-8位数字组成" name="nsdm"style="width: 100px; height: 18px" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
                </tr>
                <tr>
                    <td style="height: 18px">&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="div10">
            <table cellpadding="1" cellspacing="0">
                <tr>
                    <td class="labels">办公电话:</td>
                    <td width="300px"><input type="text" placeholder="区号+7位座机电话号码" name="bgdh"style="width: 200px; height: 18px" /></td>
                    <td class="labels">依托单位类型:</td>
                    <td><input type="radio" value="企业" name="ytdwlx">企业 <input
                            type="radio" value="科研机构" name="ytdwlx">科研机构 <input
                            type="radio" value="高等院校" name="ytdwlx">高等院校 <input
                            type="radio" value="医疗机构" name="ytdwlx">医疗机构</td>
                    <td><input type="radio" value="政府机构" name="ytdwlx">政府机构
                        <input type="radio" value="社团组织" name="ytdwlx">社团组织 <input
                                type="radio" value="其他" name="ytdwlx">其他</td>
                </tr>
            </table>
        </div>
        <hr>
        <div id="div11">
            <span style="color: red"><font size=2px color=red><label>共建单位</label> </font></span>
            <div id="InputsWrapper">
                <table>
                    <tr>
                        <td width="50px">&nbsp;</td>
                        <td width="250px"><input type="text" name="gjdw1"style="width: 200px; height: 18px"/></td> &nbsp;&nbsp;
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                        <td width="300px"><input type="text" name="gjdw2"style="width: 200px; height: 18px"/></td> &nbsp;&nbsp;
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                        <td width="300px"><input type="text" name="gjdw3"style="width: 200px; height: 18px"/></td> &nbsp;&nbsp;
                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                        <td width="300px"><input type="text" name="gjdw4"style="width: 200px; height: 18px"/></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
        <div id="div12">
            <span style="color: red"><font size=2px color=red>平台主任的信息(出生年月只能填写1900以后的时间，默认是1970-01-01)</font></span>
            <table>
                <tr>
                    <td class="labels">姓名:</td>
                    <td><font color=red>*</font>
                        <input type="text" placeholder="张三" style="width: 100px; height: 18px" name="ptzr"
                               maxlength="30" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/> &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp;
                        <label><input type="radio" value="男" name="sex">男</label>
                        <label><input type="radio" value="女" name="sex">女</label>

                    </td>
                    <td class="labels">出生年月:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="date" style="width: 200px; height: 18px" name="birth"/></td>
                    <td class="labels">职称:</td>
                    <td width="220px"><font color=red>*</font>
                        <input placeholder="教授" type="text" maxlength="30"
                               style="width: 200px; height: 18px" name="zhichen" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                </tr>
                <tr>
                    <td class="labels">所学专业:</td>
                    <td width="220px"><font color=red>*</font>
                        <input placeholder="软件工程" maxlength="30" type="text"
                               style="width: 200px; height: 18px" name="zhuanye" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">学历:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="text" placeholder="研究生" maxlength="30"
                               style="width: 200px; height: 18px" name="xueli" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">学位:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="text" placeholder="博士" maxlength="30"
                               style="width: 200px; height: 18px" name="xuewei" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                </tr>
                <tr>
                    <td class="labels">办公电话:</td>
                    <td width="360px"><font color=red>*</font>
                        <input type="text" maxlength="30" placeholder="区号+7位座机号码"
                               style="width: 200px; height: 18px" name="bgphone"/></td>
                    <td class="labels">手机:</td>
                    <td width="340px"><font color=red>*</font>
                        <input type="text" placeholder="15176107456" maxlength="30"
                               style="width: 200px; height: 18px" name="phone" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
                    <td class="labels">E-mail:</td>
                    <td width="340px"><font color=red>*</font>
                        <input type="email" maxlength="30" placeholder="5566696644@qq.com"
                               style="width: 200px; height: 18px" name="e-mail" /></td>
                </tr>
            </table>
        </div>
        <hr>
        <div id="div13">
            <table>
                <tr>
                    <td class="labels">平台网站名称:</td>
                    <td width="340px"><input type="text"  placeholder="填写汉字" name="ptwz"style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">网址:</td>
                    <td width="320px"><input type="text" name="wz"style="width: 200px; height: 18px"/></td>
                </tr>
                <tr>
                    <td class="labels">平台通讯地址:</td>
                    <td width="340px"><input type="text" placeholder="填写汉字" name="pttxdz"style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">邮编:</td>
                    <td width="340px"><input type="text" placeholder="6位数字" name="yb"style="width: 200px; height: 18px"/></td>
                </tr>
                <tr></tr>
                <tr>
                    <td></td>
                    <td style="font-size:20px">确定填写信息准确请提交</td>
                    <td></td>
                    <td><input type="submit" class="a_demo_two1" style='font-size: 20px' value="提交"></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>
