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
    <link rel="stylesheet" type="text/css" href="ztl/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="ztl/css/common.css">
    <link rel="stylesheet" type="text/css" href="ztl/css/index.css">
    <%--导入jQuery--%>
    <script src="ztl/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="ztl/js/bootstrap.min.js"></script>


    <!-- Bootstrap -->
    <link href="ztl/css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="ztl/js/jquery-1.11.0.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="ztl/js/bootstrap.min.js"></script>

    <%--&lt;%&ndash;    bootstr select&ndash;%&gt;--%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="ztl/css/bootstrap-select.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="ztl/js/bootstrap-select.min.js"></script>
    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="ztl/js/i18n/defaults-zh_CN.js"></script>

    <script src="ztl/js/bootstrap.min.js"></script>

</head>

<body>

<%--引入头部--%>


<%--轮播图--%>
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
                    <img src="/images/li/signup&login/1.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_2" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">常州金坛亲子游｜撷一肩春色，跟着小念一起花样春游吧</div>
                </a>
                <a href="" class="show-pic">
                    <img src="/images/li/signup&login/2.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_3" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">别样东莞｜广东第四城的美食和古迹</div>
                </a>
                <a href="" class="show-pic">
                    <img src="/images/li/signup&login/3.jpeg" alt="" class="banner-picture">
                </a>
            </div>

            <div id="banner_4" class="item">
                <a href="" class="show-title">
                    <div class="show-date">2021.4.19</div>
                    <div class="travelnote-title">走吧、让我们一路川西吧！</div>
                </a>
                <a href="" class="show-pic">
                    <img src="/images/li/signup&login/4.jpeg" alt="" class="banner-picture">
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

<h1>多选框</h1>
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

<%--接受的数据--%>
<%
    List<String> scenicThemeList = null;
    scenicThemeList = (List<String>)request.getAttribute("scenicThemeList");%>

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

<%--引入底部--%>


</body>

</html>
