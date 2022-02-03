
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>预订包间</title>
    <script src="../js/mui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link href="../css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/order.css" />
</head>
<script type="text/javascript" charset="utf-8">
    mui.init();
    mui('body').on('tap', 'a', function() {
        document.location.href = this.href;
    });
    //获得slider插件对象
    var gallery = mui('.mui-slider');
    gallery.slider({
        interval: 1500 //自动轮播周期，若为0则不自动播放，默认为0；
    });
    mui.ready(function() {
        var slider = document.getElementById('Gallery');
        var group = slider.querySelector('.mui-slider-group');
        var items = mui('.mui-slider-item', group);
        //克隆第一个节点
        var first = items[0].cloneNode(true);
        first.classList.add('mui-slider-item-duplicate');
        //克隆最后一个节点
        var last = items[items.length - 1].cloneNode(true);
        last.classList.add('mui-slider-item-duplicate');
        //处理是否循环逻辑，若支持循环，需支持两点：
        //1、在.mui-slider-group节点上增加.mui-slid er-loop类
        //2、重复增加2个循环节点，图片顺序变为：N、1、2...N、1
        var sliderApi = mui(slider).slider();

        function toggleLoop(loop) {
            if(loop) {
                group.classList.add('mui-slider-loop');
                group.insertBefore(last, group.firstChild);
                group.appendChild(first);
                sliderApi.refresh();
                sliderApi.gotoItem(0);
            } else {
                group.classList.remove('mui-slider-loop');
                group.removeChild(first);
                group.removeChild(last);
                sliderApi.refresh();
                sliderApi.gotoItem(0);
            }
        }
        //按下“循环”按钮的处理逻辑；
        document.getElementById('Gallery_Toggle').addEventListener('toggle', function(e) {
            var loop = e.detail.isActive;
            toggleLoop(loop);
        });
    });
</script>
<body>
<!--<header id="header" class="mui-bar mui-bar-transparent">
    <input type="search" class="mui-input-clear" placeholder="">
</header>-->
<section class="aui-flexView">
    <!--<script type="text/javascript" s
    rc="../Other/header.js"></script>-->
    <iframe scrolling="auto" frameborder="0" height="90" width="100%" src="../Other/header.html"></iframe>
    <section class="aui-scrollView">

        <!--轮播-->
        <div class="mui-content">
            <div class="index_hot">
                <ul class="mui-table-view mui-grid-view mui-grid-9">
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <a href="../../android/OrderServlet?action=doShowOrder">
                            <div class="mui-media-body">预订</div>
                            <span class="mui-icon icon iconfont icon-phone"></span>

                        </a>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <a href="classify.html">
                            <div class="mui-media-body">配送</div>
                            <span class="mui-icon icon iconfont icon-waimai1"></span>

                        </a>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4">
                        <a href="https://by.meituan.com/">
                            <div class="mui-media-body">外卖</div>
                            <span class="mui-icon icon iconfont icon-gifts"></span>

                        </a>
                    </li>
                </ul>
            </div>
            <!--热门-->
            <h5 class="mui-text-center" style="margin: 10px 0;">大概介绍</h5>

            <div class="mui-row i_recommend">
                <dvi class="mui-col-xs-6" style="width: 49%">
                    <a href="">
                        <h4>溢香园火锅店</h4>
                        <p>本店驻足甘肃白银市<br>平川区二十年，<br>见证着平川的发展<br><br><br><br></p>
                        <img src="../images/mengdian.png" /></a>
                </dvi>
                <dvi class="mui-col-xs-6" style="width: 49%">
                    <a href="">
                        <h4>用餐环境</h4>
                        <p>店内以都市时尚风格<br>为主题，为您提供<br>休闲、聚会、购物小憩<br>、情侣约会等快捷舒适的<br>用餐场所<br><br></p>
                        <img src="../images/diannei.png" /></a>
                </dvi>
            </div>
                <div class="mui-row i_recommend">
                    <dvi class="mui-col-xs-6" style="width: 49%">
                        <a href="">
                            <h4>炝锅鱼</h4>
                            <p >锅底经过不断探索、改良、刻苦钻研，<br>从一百三十余种中草药中精选八十余种<br>上等药材和香料，再结合现代营养学，<br>应用最新烹饪技术精心熬制而成。<br></p>
                            <img src="../images/qgy.png"/></a>
                    </dvi>
                    <dvi class="mui-col-xs-6" style="width: 49%">
                        <a href="">
                            <h4>仔姜鱼</h4>
                            <p>汤锅富含维生素、蛋白质、锌、钙等多种营养成分。<br>具有开胃、养颜、食后不上火<br>等特点。<br><br><br><br><br></p>
                            <img src="../images/zjy.png" /></a>
                    </dvi>

            </div>

            <h5 class="mui-text-center" style="margin: 10px 0;">猜你喜欢</h5>
            <div class="index_list">
                <ul class="mui-table-view">
                    <li class="mui-table-view-cell mui-media">
                        <a href="particulars.html">
                            <img class="mui-media-object mui-pull-left" src="../images/1.jpg">
                            <div class="mui-media-body">
                                炝锅鱼<small class="mui-pull-right"></small>
                                <p class='mui-ellipsis'></p>
                                <p class='mui-ellipsis'>￥：<span>138</span><span class="mui-pull-right"><span>4584</span></span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li class="mui-table-view-cell mui-media">
                        <a href="particulars.html">
                            <img class="mui-media-object mui-pull-left" src="../images/2.jpg">
                            <div class="mui-media-body">
                                梭边鱼<small class="mui-pull-right">4.9km</small>
                                <p class='mui-ellipsis'></p>
                                <p class='mui-ellipsis'>￥：<span>128</span><span class="mui-pull-right"><span></span></span>
                                </p>

                            </div>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </section>
    <script src="${pageContext.request.contextPath}/android/js/jquery.min.js"></script>
    <script type="text/javascript" src="../Other/footer.js"></script>
</section>

</body>

</html>
