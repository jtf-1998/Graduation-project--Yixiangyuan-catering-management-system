<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-05-28
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <title>营业额分析折线统计图</title>
    </head>
    <!--_footer 作为公共模版分离出去-->
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            function isEmpty(obj) {
                if (typeof obj == "undefined" || obj == null || obj == "") {
                    return true;
                } else {
                    return false;
                }
            }
            //将数据传到图表：
            function loadData(option,date) {
                $.ajax({
                    type : 'post',    //传输类型
                    async : false,    //同步执行
                    url : '../TurnoverServlet',    //Servlet的路径
                    data : date,
                    dataType : 'json', //返回数据形式为json
                    success : function(result) {
                        if (result) {
                            //初始化xAxis[0]的data
                            option.xAxis[0].data = [];
                            for (var i=0; i<result.length; i++) {
                                option.xAxis[0].data.push(result[i].name);
                            }
                            // alert(option);
                            //初始化series[0]的data
                            option.series[0].data = [];
                            for (var i=0; i<result.length; i++) {
                                option.series[0].data.push(result[i].num);
                            }
                            // alert(option);
                        }
                    },
                    error : function(errorMsg) {
                        alert("加载数据失败");
                    }
                });//AJAX
            }//loadData()

            function opt(type) {
                var app = {};
                var option = null;
                option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    },
                    toolbox: {
                        feature: {
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    legend: {
                        data: [type]
                    },
                    xAxis: [
                        {
                            type: 'category'

                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'

                        }
                    ],
                    series: [
                        {
                            name: type,
                            type: 'bar'

                        }
                    ]
                };
                return option;
            }

            function creatChart(type,dom ,date) {
                var myChart = echarts.init(dom);
                var option=opt(type);
                loadData(option,date);
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }

            var dom = document.getElementById("container");
            //绘制图表营业额与日期关系：
            var date={
                "action":"doLine"
            };
            creatChart("营业额",dom,date);
            dom = document.getElementById("container2");
            //绘制图表账单数量与日期关系：
            date={
                "action":"doLine2"
            };
            creatChart("账单数量",dom,date);
            // dom=

            var select_ok=document.getElementById("select_ok");
            select_ok.onclick=function ()
            {
                var  began_date=document.getElementById("began_date").value;
                var  finish_date=document.getElementById("finish_date").value;
                if(isEmpty(began_date)||isEmpty(finish_date)){
                    alert("请输入日期！");
                }else {
                    dom = document.getElementById("container");
                    date={
                        "action":"doLine",
                        "began_date":began_date,
                        "finish_date":finish_date
                    };
                    creatChart("营业额",dom,date);
                    dom = document.getElementById("container2");
                    //绘制图表账单数量与日期关系：
                    date={
                        "action":"doLine2",
                        "began_date":began_date,
                        "finish_date":finish_date
                    };
                    creatChart("账单数量",dom,date);
                }

            }
            // select_ok.click();
        }
    </script>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 经营分析子系统<span class="c-gray en">&gt;</span>营业额统计<span class="c-gray en">&gt;</span>折线图分析<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <table class="table table-border table-bordered table-bg" style="white-space: nowrap">
        <tbody>
        <tr>
            <td>请选择开始日期</td>
            <td>
                <input type="date" placeholder="日期(必填)" id="began_date" value="">
            </td>
            <td>请选择结束日期</td>
            <td>
                <input type="date" placeholder="日期(必填)" id="finish_date" value="">
            </td>
            <td>
                <button name="select_ok" id="select_ok">开始分析</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div id="container" style="min-width:700px;height:400px"></div>
    <div id="container2" style="min-width:700px;height:400px"></div>
</div>
<footer class="footer mt-20">
    <div class="container">
        <p>感谢你们的使用 &copy;2021 溢香园餐饮分析<br>
            本后台系统由<a href="" target="_blank" title="">石家庄铁道大学软件工程</a>提供技术支持</p>

    </div>
</footer>
</body>
</html>
