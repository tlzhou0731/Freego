<%@ page import="java.util.List" %><%--
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


    <!-- Bootstrap -->
    <link href="../ztl/css/bootstrap.min.css" rel="stylesheet">
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
            <li id="head_nav_scenic_li" role="presentation"><a href="/ScenicServlet?&methodName=queryScenicIndex" id="head_nav_scenic_a" title="景点">景点</a></li>
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
                    <div class="travelnote-date">2021.4.19</div>
                    <div class="travelnote-title">【自驾甘孜】仓央嘉措，无尽雪山和风</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/1.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_2" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">常州金坛亲子游｜撷一肩春色，跟着小念一起花样春游吧</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/2.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_3" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">别样东莞｜广东第四城的美食和古迹</div>
                </a>
                <a href="" class="show-pic">
                    <img src="../images/li/signup&login/3.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_4" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">走吧、让我们一路川西吧！</div>
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
            <div class="index-search-tab" id="index_search_tab">
                <%--单选框--%>
                <ul class="clearfix">
                    <li class="tab-select">
                        <div class="tab-check" id="tab_all"></div>
                        <div class="tab-text">全部</div>
                    </li>
                    <li class="tab-select">
                        <div class="tab-check" id="tab_travelnote"></div>
                        <div class="tab-text">游记</div>
                    </li>
                    <li class="tab-select">
                        <div class="tab-check" id="tab_scenic"></div>
                        <div class="tab-text">景点</div>
                    </li>
                    <li class="tab-select">
                        <div class="tab-check" id="tab_hotel"></div>
                        <div class="tab-text">酒店</div>
                    </li>
                </ul>
            </div>
            <div class="index-search-bar" id="index_search_bar">
                <div class="index-search-wrapper">
                    <div class="index-search-input">
                        <input name="q" type="text" placeholder="搜游记/景点/酒店" id="index_search_input_all" autocomplete="off">
                    </div>
                </div>
                <div class="index-search-button" id="index_search_btn_all">
                    <a role="button" href="javascript;"></a>
                </div>
            </div>
        </div>
    </div>

</section>

<div>
    <form class="navbar-form navbar-left" action="/ScenicServlet?&methodName=findScenicInfo" method="post">
        <h1>进入form表单</h1>
        <div>
            <div>
                时间
            </div>
            <select id="dateChoose" name="dateChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getDates(this)" >
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
            <div>
                地点
            </div>
            <select id="'addChoose" name="addChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getAdds(this)" >

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

            <div>
                主题
            </div>
            <select id="'themeChoose" name="themeChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5"  onchange="getThemes(this)" >
                <%if(scenicThemeList != null){
                    for (int i = 0;i < scenicThemeList.size();i++){%>
                <option value=<%=scenicThemeList.get(i)%>><%=scenicThemeList.get(i)%></option>
                <%}}else{%>
                <option value="空">空</option>
                <%}%>
            </select>
        </div>

        <div class="form-group">
            <input id="searchText" name="searchText" type="text" class="form-control" placeholder="">
        </div>
        <button id="btn-show" type="button" class="btn btn-default" onclick="showChoose()">显示</button>
        <button id="btn-search" type="submit" class="btn btn-default">搜索</button>
    </form>
</div>

<div>
    <form class="navbar-form navbar-left" action="/ScenicServlet?&methodName=findScenicInfo" method="post">
        <h1>进入form表单</h1>
        <div>
            <div>
                时间
            </div>
            <select id="dateChoose0" name="dateChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getDates(this)" >
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
            <div>
                地点
            </div>
            <select id="'addChoose0" name="addChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getAdds(this)" >

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

            <div>
                主题
            </div>
            <select id="'themeChoose0" name="themeChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5"  onchange="getThemes(this)" >
                <%if(scenicThemeList != null){
                    for (int i = 0;i < scenicThemeList.size();i++){%>
                <option value=<%=scenicThemeList.get(i)%>><%=scenicThemeList.get(i)%></option>
                <%}}else{%>
                <option value="空">空</option>
                <%}%>
            </select>
        </div>

        <div class="form-group">
            <input id="searchText0" name="searchText" type="text" class="form-control" placeholder="">
        </div>
        <button id="btn-show0" type="button" class="btn btn-default" onclick="showChoose()">显示</button>
        <button id="btn-search0" type="submit" class="btn btn-default">搜索</button>
    </form>
</div>

<div>
    <form class="navbar-form navbar-left" action="/ScenicServlet?&methodName=findScenicInfo" method="post">
        <h1>进入form表单</h1>
        <div>
            <div>
                时间
            </div>
            <select id="dateChoose1" name="dateChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getDates(this)" >
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
            <div>
                地点
            </div>
            <select id="'addChoose1" name="addChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getAdds(this)" >

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

            <div>
                主题
            </div>
            <select id="'themeChoose1" name="themeChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5"  onchange="getThemes(this)" >
                <%if(scenicThemeList != null){
                    for (int i = 0;i < scenicThemeList.size();i++){%>
                <option value=<%=scenicThemeList.get(i)%>><%=scenicThemeList.get(i)%></option>
                <%}}else{%>
                <option value="空">空</option>
                <%}%>
            </select>
        </div>

        <div class="form-group">
            <input id="searchText1" name="searchText" type="text" class="form-control" placeholder="">
        </div>
        <button id="btn-show1" type="button" class="btn btn-default" onclick="showChoose()">显示</button>
        <button id="btn-search1" type="submit" class="btn btn-default">搜索</button>
    </form>
</div>

<div>
    <form class="navbar-form navbar-left" action="/ScenicServlet?&methodName=findScenicInfo" method="post">
        <h1>进入form表单</h1>
        <div>
            <div>
                时间
            </div>
            <select id="dateChoose2" name="dateChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getDates(this)" >
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
            <div>
                地点
            </div>
            <select id="'addChoose2" name="addChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5" onchange="getAdds(this)" >

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

            <div>
                主题
            </div>
            <select id="'themeChoose2" name="themeChoose" class="form-control selectpicker"
                    data-width="80%" data-live-search="true"
                    multiple data-max-options="5"  onchange="getThemes(this)" >
                <%if(scenicThemeList != null){
                    for (int i = 0;i < scenicThemeList.size();i++){%>
                <option value=<%=scenicThemeList.get(i)%>><%=scenicThemeList.get(i)%></option>
                <%}}else{%>
                <option value="空">空</option>
                <%}%>
            </select>
        </div>

        <div class="form-group">
            <input id="searchText2" name="searchText" type="text" class="form-control" placeholder="">
        </div>
        <button id="btn-show2" type="button" class="btn btn-default" onclick="showChoose()">显示</button>
        <button id="btn-search2" type="submit" class="btn btn-default">搜索</button>
    </form>
</div>

<%--游记部分--%>
<div class="freego-travelnote">

    <div class="index-travelnote">

        <%--游记tab--%>
        <div class="travelnote-tab">
            <div class="travelnote-hot" id="travelnoe_hot">
                <a href="javascript:void(0);" rel="nofollow">热门游记</a>
            </div>
            <div class="travelnote-new" id="travelnoe_new">
                <a href="javascript:void(0);" rel="nofollow">最新发表</a>
            </div>
            <div class="travelnote-publish" id="travelnoe_publish">
                <img class="travelnote-publish-img" src="./images/li/travelnote/write.jpeg">
                <div class="travelnote-publish-text">写游记</div>
            </div>
        </div>

        <%--游记列表--%>
        <div class="page-block-travelnote" id="pgae_block_travelnote">
            <div class="travelnote-list">

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/11.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">清明青岛，有点德味儿</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">写在前面 考虑到孕妇的行动不便，为期三天的清明假期我们选择了离北京
                                    不远的青岛作为2021年出行的第一站，也是最后一站。整体来讲， 青岛 虽与九年前的样子差别不大，
                                    能留下深刻印象的景点也不多，却是一个可以短暂放空，享受海鲜饕餮盛宴的清净之地。在清朝末年被
                                    德国人与日本人轮番殖民占领的青岛，通过一系列外资的引入与最新城市规划理念的实践，逐渐登上历史
                                    的舞台，成为当代中国北方最重要的沿海城市之一。如今的青岛继续发扬历史遗留下来的经济文化优. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">青岛</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head1.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">34</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/12.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">【彩虹帮】东欧自驾之黑山漫游，想念亚得里亚海的艳阳</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">黑山旅行预告片如果说我们在巴尔干半岛二十天的自驾旅行，就像是收获
                                    了一捧五彩缤纷的 东欧 宝石，那么 黑山 ，一定是其中最闪烁耀眼的那一颗。布德 瓦碧蓝的 地中海
                                    海滩， 科托尔 古城的红色屋顶，亚得里亚海初夏的烈日艳阳，音乐节热烈躁动的音浪，一切的景致都
                                    比想象中来得更加迷人。无敌美景的民宿带来家一般的温暖，让旅行的时光变得温情自然了许多，也让
                                    属于 黑山 的每一个日子，都闪闪地发着光亮。有遭遇过不快，也遇见了暖心。美好沉甸甸的，. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">大柴旦</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head4.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">彩虹帮的二当家</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">7.1w/</div>
                                <div class="travlenote-collection">729</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">2066</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                    计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                    实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                    不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                    为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                    的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">青海</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head6.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">2.2w/</div>
                                <div class="travlenote-collection">288</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">5034</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                    上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                    数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                    、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                    他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                    在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">圣彼得堡</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head3.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">34</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                    计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                    实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                    不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                    为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                    的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">青海</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head6.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">2.2w/</div>
                                <div class="travlenote-collection">288</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">5034</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                    上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                    数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                    、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                    他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                    在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">圣彼得堡</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head3.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">34</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/11.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">清明青岛，有点德味儿</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">写在前面 考虑到孕妇的行动不便，为期三天的清明假期我们选择了离北京
                                    不远的青岛作为2021年出行的第一站，也是最后一站。整体来讲， 青岛 虽与九年前的样子差别不大，
                                    能留下深刻印象的景点也不多，却是一个可以短暂放空，享受海鲜饕餮盛宴的清净之地。在清朝末年被
                                    德国人与日本人轮番殖民占领的青岛，通过一系列外资的引入与最新城市规划理念的实践，逐渐登上历史
                                    的舞台，成为当代中国北方最重要的沿海城市之一。如今的青岛继续发扬历史遗留下来的经济文化优. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">青岛</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head1.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">DiDi_酱</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">34</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/12.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">【彩虹帮】东欧自驾之黑山漫游，想念亚得里亚海的艳阳</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">黑山旅行预告片如果说我们在巴尔干半岛二十天的自驾旅行，就像是收获
                                    了一捧五彩缤纷的 东欧 宝石，那么 黑山 ，一定是其中最闪烁耀眼的那一颗。布德 瓦碧蓝的 地中海
                                    海滩， 科托尔 古城的红色屋顶，亚得里亚海初夏的烈日艳阳，音乐节热烈躁动的音浪，一切的景致都
                                    比想象中来得更加迷人。无敌美景的民宿带来家一般的温暖，让旅行的时光变得温情自然了许多，也让
                                    属于 黑山 的每一个日子，都闪闪地发着光亮。有遭遇过不快，也遇见了暖心。美好沉甸甸的，. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">大柴旦</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head4.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">彩虹帮的二当家</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">7.1w/</div>
                                <div class="travlenote-collection">729</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">2066</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/13.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">【西行日记｜十月浪漫】之三：走过青海——走过翡翠. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">特以此篇纪念我52岁的生日 在我若干次的自驾旅途中，行程往往都是不按
                                    计划走的，它只受心的支配。此次西部之行同样如此。按计划，10月30日，我们早已经在家中。但是，
                                    实际上，这一天我们却仍旧行驶在315国道上。这是旅行带来的意外，旅行又怎会给人带来一个个出奇
                                    不意的幸福和历久弥新的回忆呢？10月30日，我正好52岁。拜苍天所赐，在我喜欢的315国道上，特意
                                    为我准备了一块刻有“1030”字样的路碑。这是我此生过的最特别、最有意义的生日，不仅有天空、大地
                                    的豪迈，还有“在路上”的那份仪式感。为此，特在开篇写下这些话，以见证并纪念我52岁的生日。. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">青海</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head6.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">大浪汪洋</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">2.2w/</div>
                                <div class="travlenote-collection">288</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">5034</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="travelnote-item clearfix">
                    <div class="travelnote-left">
                        <a href="" target="_blank">
                            <img src="/FreegoImg/li/travelnote/14.jpeg" alt="" class="travelnote-picture">
                        </a>
                    </div>
                    <div class="travelnote-right">

                        <dl>
                            <dt>
                                <a href="" target="_blank">俄罗斯的十八天之圣彼得堡（一）~圣伊萨克大教堂、. . .</a>
                            </dt>
                            <dd>
                                <a href="" target="_blank">【出行时间：2019年9月2~3日】

                                    上海 鲁迅公园内专门有个旅游角，每周的星期六上午是喜欢旅游人士的“大聚会”，参加这类聚合的大多
                                    数是年长的老人，一般性“野路子”的旅行社也会来“混迹于中”，我就是在这个旅游角上认识了年近80的
                                    、又是坐在残疾车上的老顾，攀谈之余，聊起了 俄罗斯 旅游的事，想不到他把我登记在案；临出发前，
                                    他们为我们每一位游客买了一份保险，52元人民币，保单赔偿额是最低的，只有25万人民币，然而恰恰
                                    在我的名字上多了一个单人旁，尽管音是相同的，但字不同万一发生了什么事保险公司是不赔. . .</a>
                            </dd>
                        </dl>

                        <div class="travelnote-extra">
                            <%--定位--%>
                            <div class="travelnote-location">
                                <img class="travelnote-location-pic" src="./images/li/travelnote/location.jpeg">
                                <div class="travelnote-location-text">圣彼得堡</div>
                            </div>
                            <%--用户--%>
                            <div class="travelnote-user">
                                <div class="travelnote-user-head">
                                    <img class="travelnote-user-head-pic" src="/FreegoImg/li/user/head/head3.jpeg">
                                </div>
                                <a class="travelnote-user-nickname" href="" target="_blank" rel="nofollow">好望角</a>
                            </div>
                            <%--浏览量/收藏量--%>
                            <div class="travelnote-view-collection">
                                <img src="./images/li/travelnote/eye.jpeg">
                                <div class="travelnote-view">1207/</div>
                                <div class="travlenote-collection">6</div>
                            </div>
                            <%--点赞量--%>
                            <div class="travelnote-like">
                                <div class="travelnote-user-likes">34</div>
                                <img class="travelnote-user-likes-pic" src="./images/li/travelnote/like.jpeg">
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>
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
    document.getElementById("tab_all").style.background="url(../../images/li/index/check_box_check.jpeg)";
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
