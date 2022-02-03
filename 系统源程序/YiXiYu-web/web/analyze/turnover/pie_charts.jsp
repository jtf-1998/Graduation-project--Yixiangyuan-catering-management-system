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
        <title>营业额分析扇形统计图</title>
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
            function loadData(option,date,myChart) {

                //调用设置函数
                myChart.setOption(option);

                $.ajax({    //用Ajax将上面servlet转换的json数据导入数据设置中
                    async : true,
                    url : "../TurnoverServlet",
                    type:"POST",
                    data : date,
                    dataType:"json",

                    success:function(result) {
                        // alert(result.selected);
                        if(result)
                        {
                            var d=result;
                            var leblist = [];
                            var valuelist2 = [];

                            for(var i=0;i<d.length;i++){

                                var m={};

                                m["value"]=d[i].num;
                                m["name"]=d[i].name;

                                valuelist2.push(m);   //扇形显示的数据
                                leblist.push(d[i].name);  //扇形旁边显示的小格子的数据

                            }

                            // 将数据添加到数据图表中
                            myChart.setOption({
                                legend: {
                                    data:leblist
                                },
                                series: [
                                    {
                                        data: valuelist2
                                    }]
                            });

                        }
                    },
                    error : function(errorMsg) {
                        //请求失败时执行该函数
                        alert("请求数据失败!");
                        // myChart.hideLoading();
                    }
                });
                //获取和处理数据
            }//loadData()

            function opt(type) {
                var app = {};
                var option = null;
                option = {
                    title : {   //图表显示的标题
                        text: type,
                        subtext: '真实数据',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {   //图表中显示的一个个小格子
                        orient: 'vertical',
                        left:20,
                        data:[]
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                // type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [    //扇形的设置
                        {
                            name:type,
                            type:'pie',
                            radius: ['20%', '75%'],
                            center : ['50%', '60%'],
                            x: '50%',               // for funnel
                            max: 40,                // for funnel
                            sort : 'ascending',     // for funnel
                            data:[]
                        }
                    ]
                };
                return option;
            }

            function creatChart(type,dom ,date) {
                var myChart = echarts.init(dom);
                var option= opt(type);
                loadData(option,date,myChart);
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }

            var dom = document.getElementById("container");
            //绘制图表营业额与日期关系：
            var date={
                "action":"doPie"
            };
            creatChart("营业额",dom,date);
            dom = document.getElementById("container2");
            //绘制图表账单数量与日期关系：
            date={
                "action":"doPie2"
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 溢香园火锅店消费管理系统 <span class="c-gray en">&gt;</span> 经营分析子系统<span class="c-gray en">&gt;</span>营业额统计<span class="c-gray en">&gt;</span>扇形图分析<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

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
