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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> ???????????????????????????????????? <span class="c-gray en">&gt;</span> ???????????????????????????
    <span class="c-gray en">&gt;</span>????????????<span class="c-gray en">&gt;</span>????????????<a class="btn btn-success radius r"
                                                                                     style="line-height:1.6em;margin-top:3px"
                                                                                     href="javascript:location.replace(location.href='${pageContext.request.contextPath}/comsume/OrderBillServlet?action=doShow');" title="??????" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<br>
<p class="f-20 text-success" style="text-align: center">????????????????????????????????? </p>
<table class="table table-border table-bordered table-bg"
       style="border-left:0px;border-right: 0px" id="display">
    <tbody id="display_tbody">
    <tr style="display: none ">
        <td><input type="text" value="" placeholder="??????(??????)" id="7"></td>
        <td><input type="text" value="" placeholder="??????(??????)" id="8"></td>
        <td><input type="text" value="" placeholder="??????(??????)" id="9"></td>
        <%--            <td><input type="text" value="" class="vegetable_image" id="10"></td>--%>
        <td><input type="text" value="" placeholder="??????(??????)" id="10"></td>
        <td><input type="text" value="" placeholder="??????(??????)"
                   onkeyup="value=value.replace(/[^\d]/g,'')" id="11"></td>
        <td><input type="text" value="" placeholder="??????" id="12"></td>
        <td><button name="addsave" class="addsave">??????</button>&nbsp;
            <button name="update" class="update" style="display:none">??????</button>&nbsp;&nbsp;
            <button name="delete" class="delete" >??????</button></td>
    </tr>
    </tbody>
</table>
<div id="div0">
    <form action="AddNianBaoServlet" method="post" >
        <p class="f-20 text-success" style="text-align: center">??????????????????</p>
        <div id="div1">
            <table>
                <tr>
                    <td class="labels">????????????:</td>
                    <td width="300px"><font color=red>*</font>
                        <input type="text" maxlength="30" id="bill_id"  style=" width: 200px; height: 18px" value=""/></td>
                    <td class="labels">????????????:</td>
                    <td width="300px"><font color=red>*</font>
                        <input type="datetime-local" maxlength="30" id="pay_datetime"  style="width: 200px; height: 18px" value=""/></td>
                    <td class="labels">????????????:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='takeaway_type' style="width: 200px; height: 18px">
                            <option value='?????????'>?????????</option>
                            <option value='??????'>??????</option>
                            <option value='?????????'>?????????</option>
                        </select></td>
                </tr>
            </table>
        </div>
        <div id="div3">
            <table>
                <tr>
                    <td class="labels">???&nbsp; ??? &nbsp;???:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='p_room_id' style="width: 200px; height: 18px">
                            <option value='?????????'>?????????</option>
                            <option value='??????'>??????</option>
                            <option value='?????????'>?????????</option>
                        </select></td>
                    <td class="labels">????????????:</td>
                    <td width="300px"><font color=red>*</font>
                        <select id='pay_type' style="width: 200px; height: 18px">
                            <option value='??????'>??????</option>
                            <option value='?????????'>?????????</option>
                            <option value='??????'>??????</option>
                            <option value='??????'>??????</option>
                            <option value='?????????'>?????????</option>
                        </select></td>
                    <td class="labels" >????????????:</td>
                    <td width="300px"><font color=red>*</font><input type="text" maxlength="30" id="pay_price"  style="width: 200px; height: 18px" value=""/></td>
                </tr>
            </table>
        </div>
        <hr>
        <p class="f-20 text-success" style="text-align: center">??????</p>
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
                    <td rowspan="1" width="250px" style="font-size: 16px">?????????????????????????????????</td>
                    <td width="300px"><input type="text" placeholder="?????????" name="wfhy1"  style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">&nbsp;</td>
                    <td width="300px"><input type="text" placeholder="?????????" name="wfhy2" style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">&nbsp;</td>
                    <td width="300px"><input type="text" placeholder="?????????" name="whfy3" style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
            </table>
        </div>
        <hr>
        <div id="div7">
            <table>
                <tr>
                    <td rowspan="1" width="200px" style="font-size: 16px">?????????????????????</td>
                    <td class="labels">????????????:</td>
                    <td width="200px"><input type="text" name="ssxk1"  style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">????????????:</td>
                    <td width="200px"><input type="text"  name="ssxk2" style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">??????:</td>
                    <td width="200px"><input type="text"  name="ssxk3" style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
            </table>
        </div>
        <hr>
        <div id="div8">
            <span style="color: red; heignt: 10px"><font size=2px color=red>?????????????????????</font></span>
            <br>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="labels">????????????:</td>
                    <td width="200px"><input type="text"placeholder="????????????" name="ytdw"style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">????????????:</td>
                    <td width="200px"><input type="text"placeholder="???6-8???????????????" name="ytdwdm"style="width: 100px; height: 18px" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
                    <td class="labels">??????????????????:</td>
                    <td width="200px"><input type="text"placeholder="??????????????????" name="ytdwfr"style="width: 100px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">?????????????????????????????????:</td>
                    <td width="150px"><input type="text"placeholder="???6-8???????????????" name="nsdm"style="width: 100px; height: 18px" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
                </tr>
                <tr>
                    <td style="height: 18px">&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="div10">
            <table cellpadding="1" cellspacing="0">
                <tr>
                    <td class="labels">????????????:</td>
                    <td width="300px"><input type="text" placeholder="??????+7?????????????????????" name="bgdh"style="width: 200px; height: 18px" /></td>
                    <td class="labels">??????????????????:</td>
                    <td><input type="radio" value="??????" name="ytdwlx">?????? <input
                            type="radio" value="????????????" name="ytdwlx">???????????? <input
                            type="radio" value="????????????" name="ytdwlx">???????????? <input
                            type="radio" value="????????????" name="ytdwlx">????????????</td>
                    <td><input type="radio" value="????????????" name="ytdwlx">????????????
                        <input type="radio" value="????????????" name="ytdwlx">???????????? <input
                                type="radio" value="??????" name="ytdwlx">??????</td>
                </tr>
            </table>
        </div>
        <hr>
        <div id="div11">
            <span style="color: red"><font size=2px color=red><label>????????????</label> </font></span>
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
            <span style="color: red"><font size=2px color=red>?????????????????????(????????????????????????1900???????????????????????????1970-01-01)</font></span>
            <table>
                <tr>
                    <td class="labels">??????:</td>
                    <td><font color=red>*</font>
                        <input type="text" placeholder="??????" style="width: 100px; height: 18px" name="ptzr"
                               maxlength="30" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/> &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp;
                        <label><input type="radio" value="???" name="sex">???</label>
                        <label><input type="radio" value="???" name="sex">???</label>

                    </td>
                    <td class="labels">????????????:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="date" style="width: 200px; height: 18px" name="birth"/></td>
                    <td class="labels">??????:</td>
                    <td width="220px"><font color=red>*</font>
                        <input placeholder="??????" type="text" maxlength="30"
                               style="width: 200px; height: 18px" name="zhichen" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                </tr>
                <tr>
                    <td class="labels">????????????:</td>
                    <td width="220px"><font color=red>*</font>
                        <input placeholder="????????????" maxlength="30" type="text"
                               style="width: 200px; height: 18px" name="zhuanye" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">??????:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="text" placeholder="?????????" maxlength="30"
                               style="width: 200px; height: 18px" name="xueli" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">??????:</td>
                    <td width="220px"><font color=red>*</font>
                        <input type="text" placeholder="??????" maxlength="30"
                               style="width: 200px; height: 18px" name="xuewei" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                </tr>
                <tr>
                    <td class="labels">????????????:</td>
                    <td width="360px"><font color=red>*</font>
                        <input type="text" maxlength="30" placeholder="??????+7???????????????"
                               style="width: 200px; height: 18px" name="bgphone"/></td>
                    <td class="labels">??????:</td>
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
                    <td class="labels">??????????????????:</td>
                    <td width="340px"><input type="text"  placeholder="????????????" name="ptwz"style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">??????:</td>
                    <td width="320px"><input type="text" name="wz"style="width: 200px; height: 18px"/></td>
                </tr>
                <tr>
                    <td class="labels">??????????????????:</td>
                    <td width="340px"><input type="text" placeholder="????????????" name="pttxdz"style="width: 200px; height: 18px" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"/></td>
                    <td class="labels">??????:</td>
                    <td width="340px"><input type="text" placeholder="6?????????" name="yb"style="width: 200px; height: 18px"/></td>
                </tr>
                <tr></tr>
                <tr>
                    <td></td>
                    <td style="font-size:20px">?????????????????????????????????</td>
                    <td></td>
                    <td><input type="submit" class="a_demo_two1" style='font-size: 20px' value="??????"></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</div>
</body>
</html>
