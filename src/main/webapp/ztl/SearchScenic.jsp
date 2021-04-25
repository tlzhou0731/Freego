<%@ page import="java.util.List" %>
<%@ page import="domain.PageBean" %>
<%@ page import="domain.ScenicInfo" %>
<%@page isELIgnored="false"%>
<%--
  Created by IntelliJ IDEA.
  Author: Macro
  Date: 2021/4/21
  Time: 11:06
  Describe:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>景点搜索界面</title>

    <%--导入CSS--%>
    <link rel="stylesheet" type="text/css" href="../ztl/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../ztl/css/common.css">
    <%--导入jQuery--%>
    <script src="../ztl/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../ztl/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../ztl/js/jquery-1.11.0.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../ztl/js/bootstrap.min.js"></script>

    <%--&lt;%&ndash;    bootstr select&ndash;%&gt;--%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../ztl/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="../ztl/js/bootstrap-select.min.js"></script>
    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="../ztl/js/i18n/defaults-zh_CN.js"></script>

    <script src="../ztl/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../ztl/css/index.css">

</head>

<%--导入头部--%>
<header id="header">

    <div class="freego_header clearfix" id="head_nav_warper">

        <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/index.jsp"></a></div>

        <ul class="head_nav" id="_j_head_nav" role="tablist">
            <li id="head_nav_index_li" role="presentation"><a href="" id="head_nav_index_a">首页</a></li>
            <li id="head_nav_scenic_li" role="presentation"><a href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=1&rows=10"  id="head_nav_scenic_a" title="景点">景点</a></li>
            <li id="head_nav_gonglve_li" role="presentation"><a href="" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>
            <li id="head_nav_hotel_li" role="presentation"><a href="" id="head_nav_hotel_a" title="酒店">订酒店</a></li>
        </ul>

        <div class="login_status">
            <!-- 未登录状态  -->
            <div id="login_out" class="login_out">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
            </div>
            <!-- 登录状态  -->
            <div id="login_in" class="login_in">
                <span id="span_username"></span>
                <a href="javascript:location.href='user/exit';">退出</a>
                <a id="cancelAccount">注销账号</a>
            </div>
        </div>

    </div>

</header>


<body>
<%--接受的数据--%>
<%
    List<String> scenicThemeList = null;
    scenicThemeList = (List<String>)request.getAttribute("scenicThemeList");
    PageBean<ScenicInfo> scenicInfoPageBean = (PageBean<ScenicInfo>)request.getAttribute("scenicPageBean");
    List<ScenicInfo> scenicInfoList = scenicInfoPageBean.getList();

%>
<%--引入头部--%>

<%--轮播图--%>
<section id="scenic_banner">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div id="banner_warp" class="carousel-inner" role="listbox">

            <div id="banner_1" class="item active">
                <a href="" class="show-title">
                    <div class="scenic-date">2021.4.19</div>
                    <div class="scenic-title">【自驾甘孜】仓央嘉措，无尽雪山和风</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/1.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_2" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="scenic-title">常州金坛亲子游｜撷一肩春色，跟着小念一起花样春游吧</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/2.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_3" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="scenic-title">别样东莞｜广东第四城的美食和古迹</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/3.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_4" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="scenic-title">走吧、让我们一路川西吧！</div>
                </a>
                <a href="" class="show-pic">
                    <img src="..//images/li/signup&login/4.jpeg" alt="" class="banner-picture">
                </a>
            </div>

        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <%--搜索框--%>
    <div class="index-search-container" id="index_search">
        <div class="index-search-group">
            <div class="index-search-bar" id="index_search_bar2">
                <form action="/ScenicServlet?&methodName=queryScenicBySearch&currentPage=1&rows" method="post">
                    <div class="index-search-wrapper">
                        <div class="index-search-input">
                            <input name="q" type="text" placeholder="输入搜索内容" id="scenic_search_text" autocomplete="off">
                        </div>
                    </div>
                    <div class="index-search-button" id="scenic_search_btn">
                        <button id="btn_scenic_search" type="submit" class="btn btn-default">搜索</button>
                    </div>
                </form>
            </div>

        </div>
    </div>

</section>

<%--游记部分--%>
<div class="freego-scenic">
    <%--选项表单--%>
    <div class="scenic-form" style="width: 100%">
        <form class="navbar-form navbar-left" action="/ScenicServlet?&methodName=findScenicInfo" method="post">
            <div class="scenic_form_date">
                <select id="dateChoose" name="dateChoose" class="form-control selectpicker"
                        data-width="80%" data-live-search="true"
                        multiple data-max-options="5" onchange="getDates(this)" title="选择出行日期">
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
            </div>
            <div class="scenic_form_addr">
                <select id="'addChoose" name="addChoose" class="form-control selectpicker"
                        data-width="80%" data-live-search="true"
                        multiple data-max-options="5" onchange="getAdds(this)" title="选择地点">
                    <optgroup label="广东">
                        <option value="1">广州</option>
                        <option value="2">深圳</option>
                        <option value="3">珠海</option>
                    </optgroup>
                    <optgroup label="广西">
                        <option value="1">南宁</option>
                        <option value="2">柳州</option>
                        <option value="3">桂林</option>
                    </optgroup>
                    <optgroup label="山东">
                        <option value="1">烟台</option>
                        <option value="2">青岛</option>
                        <option value="3">济南</option>
                    </optgroup>
                </select>
            </div>
            <div class="scenic_form_theme">
                <select id="'themeChoose" name="themeChoose" class="form-control selectpicker"
                        data-width="80%" data-live-search="true"
                        multiple data-max-options="5"  onchange="getThemes(this)" title="选择主题">
                    <%if(scenicThemeList != null){
                        for (int i = 0;i < scenicThemeList.size();i++){%>
                    <option value=<%=scenicThemeList.get(i)%>><%=scenicThemeList.get(i)%></option>
                    <%}}else{%>
                    <option value="空">空</option>
                    <%}%>
                </select>
            </div>

            <div class="scenic_form_search">
                <input id="searchText" name="searchText" type="text" class="form-control" placeholder="${pageContext.request.contextPath}">
                <button id="btn-show" type="button" class="btn btn-default" onclick="showChoose()">显示</button>
                <button id="btn-search" type="submit" class="btn btn-default">搜索</button>
            </div>

        </form>
    </div>
    <br>
        <input name="searchText" type="text" placeholder="${pageContext.request.contextPath}">

    <div class="index-scenic">
        <%--游记tab--%>
        <div class="scenic-tab">
            <div class="scenic-hot" id="scenic_hot">
                <a href="javascript:void(0);" rel="nofollow">热门景点</a>
            </div>
            <div class="scenic-theme" id="scenic_theme">
                <a href="javascript:void(0);" rel="nofollow">热门主题</a>
            </div>
            <div class="scenic-addr" id="scenic_addr">
                <a href="javascript:void(0);" rel="nofollow">热门地点</a>
            </div>
            <div class="scenic-near" id="scenic_near">
                <a href="javascript:void(0);" rel="nofollow">附近景点</a>
            </div>
        </div>

        <%--景点列表--%>
        <div class="page-block-scenic" id="pgae_block_scenic">
            <div class="scenic-list">
                <%if(scenicInfoList != null){
                    for (int i = 0;i < scenicInfoList.size();i++){%>
                <div class="scenic-item clearfix">
                    <div class="scenic-left">
                        <a href="" target="_blank">
                            <%if (scenicInfoList.get(i).getScenicCoverPicture()==null){%>
                            <img src="/FreegoImg/scenic_default.jpg" alt="" class="scenic-picture">
                            <%}else{%>
                            <img src=<%=scenicInfoList.get(i).getScenicCoverPicture()%> alt="" class="scenic-picture">
                            <%}%>
                        </a>
                    </div>
                    <div class="scenic-right">
                        <dl>
                            <dt>
                                <a href="" target="_blank"><%=scenicInfoList.get(i).getScenicName()%></a>
                            </dt>
                            <dd>
                                <a href="" target="_blank"><%=scenicInfoList.get(i).getScenicIntro()%></a>
                            </dd>
                        </dl>

                        <div class="scenic-extra">
                            <%--定位--%>
                            <div class="scenic-location">
                                <img class="scenic-location-pic" src="../images/li/index/icon_search.jpeg">
                                <div class="scenic-location-text"><%=scenicInfoList.get(i).getScenicAddress()%>></div>
                            </div>
<%--                            &lt;%&ndash;用户&ndash;%&gt;--%>
<%--                            <div class="scenic-user">--%>
<%--                                <div class="scenic-user-head">--%>
<%--                                    <img class="scenic-user-head-pic" src="../images/li/index/icon_search.jpeg">--%>
<%--                                </div>--%>
<%--                                <a class="scenic-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>--%>
<%--                            </div>--%>
                            <%--浏览量/收藏量--%>
                            <div class="scenic-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="scenic-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="scenic-like">
                                <div class="scenic-user-likes">34</div>
                                <img class="scenic-user-likes-pic" src="../images/li/index/icon_search.jpeg">
                            </div>
                        </div>

                    </div>
                </div>
                <%}}else{%>
                <option value="空">空</option>
                <%}%>
            </div>
        </div>
    </div>

    <%--  分页--%>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <%if(scenicInfoList != null){
                for (int i = 1;i <= scenicInfoPageBean.getTotalPage();i++){%>
            <%if (i==1){%>
            <li><a href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=<%=i%>&rows=10"><%=i%></a></li>
            <%}else if(i==2&&i<scenicInfoPageBean.getCurrentPage()-3){%>
            <li><a href="#">...</a></li>
            <%} else if(((i>=scenicInfoPageBean.getCurrentPage()-3)&&(i<scenicInfoPageBean.getCurrentPage()))
                    ||((i<=scenicInfoPageBean.getCurrentPage()+3)&&(i>scenicInfoPageBean.getCurrentPage()))){%>
            <li><a href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=<%=i%>&rows=10"><%=i%></a></li>
            <%}else if(i==scenicInfoPageBean.getTotalPage()-1){%>
            <li><a href="#">...</a></li>
            <%}else if(i==scenicInfoPageBean.getTotalPage()){%>
            <li><a href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=<%=i%>&rows=10"><%=i%></a></li>
            <%}%>
            <%}}else{%>
            <li>
                <a href="#">
                    0
                </a>
            </li>
            <%}%>

            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <span style="font-size: 25px;margin-left: 5px;">
                共<%=scenicInfoPageBean.getTotalCount()%>条，共<%=scenicInfoPageBean.getTotalPage()%>页
            </span>

        </ul>
    </nav>

</div>

<%--导入尾部--%>
<div id="footer">

    <div class="why_select">

        <dl style="margin-left: 133px">
            <dt class="foot-pic">
                <img src="../images/li/index/foot_1.jpeg" alt="">
            </dt>
            <dd>
                <h1>产品齐全</h1>
                <h2>产品自主选，随心买</h2>
            </dd>
        </dl>

        <dl>
            <dt class="foot-pic">
                <img src="../images/li/index/foot_2.jpeg" alt="">
            </dt>
            <dd>
                <h1>便利快捷</h1>
                <h2>24小时不打烊，随时买</h2>
            </dd>
        </dl>

        <dl>
            <dt class="foot-pic">
                <img src="../images/li/index/foot_3.jpeg" alt="">
            </dt>
            <dd>
                <h1>安全支付</h1>
                <h2>知名支付工具，放心买</h2>
            </dd>
        </dl>

        <dl>
            <dt class="foot-pic">
                <img src="../images/li/index/foot_4.jpeg" alt="">
            </dt>
            <dd style="margin-right: 0px">
                <h1>贴心服务</h1>
                <h2>客服全年无休，安心买</h2>
            </dd>
        </dl>

    </div>
    <div class="company">
        <p>山东工商学院 计算机科学与技术学院 软件工程专业 2017级 毕业设计</p>
    </div>
</div>


<script>
    //轮播图搜索复选框
    // document.getElementById("tab_all").style.background="url(../../images/li/index/check_box_check.jpeg)";
    //头部
    document.getElementById("head_nav_index_li").style.background="#ff9d00";
    document.getElementById("head_nav_index_a").style.color="#FFFFFF";
</script>
<script type="text/javascript">
    var choosesum = [];
    var ss = "jsSS";

    $(window).on('load', function () {
        $('#dateChoose').selectpicker({
            'selectedText': '1月'
        });
    });
    $(window).on('load', function () {
        $('#dateChoose1').selectpicker({
            'selectedText': '1月'
        });
    });
    $(window).on('load', function () {
        $('#dateChoose2').selectpicker({
            'selectedText': '1月'
        });
    });
    $(window).on('load', function () {
        $('#addChoose').selectpicker({
            'selectedText': '深圳'
        });
    });
    $(window).on('load', function () {
        $('#themeChoose').selectpicker({
            'selectedText': '选择主题'
        });
    });

    function getDates() {
        var val = "", staffs = [],dates = [];
        //循环的取出插件选择的元素(通过是否添加了selected类名判断)
        for (var i = 0; i < $("li.selected").length; i++) {
            val = $("li.selected").eq(i).find(".text").text();
            if (val != '') {
                staffs.push(val);
                dates.push(val);
            }
        }
        choosesum = staffs;
    }

    function getAdds() {
        var val = "", staffs = [], adds = [];
        //循环的取出插件选择的元素(通过是否添加了selected类名判断)
        for (var i = 0; i < $("li.selected").length; i++) {
            val = $("li.selected").eq(i).find(".text").text();
            if (val != '') {
                staffs.push(val);
                adds.push(val)
            }
        }
        choosesum = staffs;
    }

    function getThemes() {
        var val = "", staffs = [], themes = [];
        //循环的取出插件选择的元素(通过是否添加了selected类名判断)
        for (var i = 0; i < $("li.selected").length; i++) {
            val = $("li.selected").eq(i).find(".text").text();
            if (val != '') {
                staffs.push(val);
                themes.push(val);
            }
        }
        choosesum = staffs;
    }

    function showChoose(){
        console.log(choosesum);
    }

</script>
</body>

</html>