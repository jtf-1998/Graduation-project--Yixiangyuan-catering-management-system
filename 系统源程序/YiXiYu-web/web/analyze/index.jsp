<%--
  Created by IntelliJ IDEA.
  User: LQ
  Date: 2021-01-12
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="${pageContext.request.contextPath}/rest/favicon.ico" >
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/rest/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css"
          id="skin" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.js"></script>
    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
    <script type="text/javascript">
        $(function(){
            /*$("#min_title_list li").contextMenu('Huiadminmenu', {
                bindings: {
                    'closethis': function(t) {
                        console.log(t);
                        if(t.find("i")){
                            t.find("i").trigger("click");
                        }
                    },
                    'closeall': function(t) {
                        alert('Trigger was '+t.id+'\nAction was Email');
                    },
                }
            });*/
        });
        /*个人信息*/
        function myselfinfo(){
            layer.open({
                type: 1,
                area: ['300px','200px'],
                fix: false, //不固定
                maxmin: true,
                shade:0.4,
                title: '查看信息',
                content: '<div>管理员信息</div>'
            });
        }

        /*用户-添加*/
        function member_add(title,url,w,h){
            layer_show(title,url,w,h);
        }

    </script>
    <title>admin v1.0</title>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs"
                                            href="#">溢香园火锅店订餐消费子系统</a>
            <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#">H-ui</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span>
<%
    String admin_ID=null;
    request.setCharacterEncoding("utf-8");
    admin_ID=request.getParameter("admin_ID");
    if(admin_ID==null)
        out.print("<script language='javascript'>alert('请先登录');window.location.href='${pageContext.request.contextPath}/login.jsp';</script>");
%>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>老板 </li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${param.admin_ID}<i class="Hui-iconfont">&#xe6d5;
                        </i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/login.jsp">切换账户</a></li>
                            <li><a href="${pageContext.request.contextPath}/index.jsp?admin=${param.admin_ID}">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe612;</i> 营业额统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a
                            data-href="${pageContext.request.contextPath}/analyze/turnover/line_charts.jsp" data-title="折线图分析" href="javascript:void(0)">折线图分析</a></li>
                    <li><a
                            data-href="${pageContext.request.contextPath}/analyze/turnover/pie_charts.jsp" data-title="扇形图分析" href="javascript:void(0)">扇形图分析</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe613;</i> 菜品销售统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a
                            data-href="${pageContext.request.contextPath}/analyze/dishes_sales/line_charts.jsp" data-title="条形图分析" href="javascript:void(0)">条形图分析</a></li>
                    <li><a
                            data-href="${pageContext.request.contextPath}/analyze/dishes_sales/pie_charts.jsp" data-title="扇形图分析" href="javascript:void(0)">扇形图分析</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe614;</i> 顾客消费统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>

                    <li><a
                            data-href="${pageContext.request.contextPath}/analyze/cu_consumption/line_charts.jsp" data-title="条形图分析"
                            href="javascript:void(0)">条形图分析</a></li>
                </ul>
            </dd>
        </dl>

    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="analyze_main.html">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="analyze_main.html"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer
<%--作为公共模版分离出去-->--%>

</body>
</html>
