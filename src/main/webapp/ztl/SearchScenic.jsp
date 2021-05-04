<%@ page import="java.util.List" %>
<%@ page import="domain.PageBean" %>
<%@ page import="domain.ScenicInfo" %>
<%@ page import="java.util.Map" %>
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


    <script src="https://hm.baidu.com/hm.js?8288b2ed37e5bc9b4c9f7008798d2de0"></script>
    <script type="text/javascript">
        window.Env = {"shortcut_mdds":[{"id":"","name":"\u4e2d\u56fd","mdds":[{"id":10819,"name":"\u53f0\u5317"},{"id":10189,"name":"\u9999\u6e2f"},{"id":10065,"name":"\u5317\u4eac"},{"id":10156,"name":"\u676d\u5dde"},{"id":10099,"name":"\u4e0a\u6d77"},{"id":10035,"name":"\u6210\u90fd"},{"id":21434,"name":"\u57a6\u4e01"},{"id":15325,"name":"\u82b1\u83b2"},{"id":10208,"name":"\u91cd\u5e86"},{"id":10132,"name":"\u53a6\u95e8"},{"id":10487,"name":"\u5927\u7406"},{"id":10030,"name":"\u4e09\u4e9a"}]},{"id":"","name":"\u4e9a\u6d32","mdds":[{"id":10222,"name":"\u4e1c\u4eac"},{"id":10765,"name":"\u5927\u962a"},{"id":11042,"name":"\u4eac\u90fd"},{"id":11045,"name":"\u66fc\u8c37"},{"id":15284,"name":"\u6e05\u8fc8"},{"id":11047,"name":"\u666e\u5409\u5c9b"},{"id":10130,"name":"\u9996\u5c14"},{"id":10754,"name":"\u65b0\u52a0\u5761"},{"id":16980,"name":"\u7532\u7c73"},{"id":11046,"name":"\u82ad\u63d0\u96c5"},{"id":11049,"name":"\u5409\u9686\u5761"},{"id":14210,"name":"\u82cf\u6885\u5c9b"}]},{"id":"","name":"\u6b27\u6d32","mdds":[{"id":10573,"name":"\u5df4\u9ece"},{"id":11124,"name":"\u4f26\u6566"},{"id":10063,"name":"\u7f57\u9a6c"},{"id":11087,"name":"\u4f5b\u7f57\u4f26\u8428"},{"id":10102,"name":"\u5df4\u585e\u7f57\u90a3"},{"id":11100,"name":"\u963f\u59c6\u65af\u7279\u4e39"},{"id":11081,"name":"\u6155\u5c3c\u9ed1"},{"id":10755,"name":"\u67cf\u6797"},{"id":11159,"name":"\u65af\u5fb7\u54e5\u5c14\u6469"},{"id":16095,"name":"\u5723\u6258\u91cc\u5c3c"},{"id":10761,"name":"\u5e03\u62c9\u683c"},{"id":11091,"name":"\u7ef4\u4e5f\u7eb3"}]},{"id":"","name":"\u5317\u7f8e","mdds":[{"id":10579,"name":"\u7ebd\u7ea6"},{"id":10926,"name":"\u6d1b\u6749\u77f6"},{"id":10923,"name":"\u62c9\u65af\u7ef4\u52a0\u65af"},{"id":10742,"name":"\u65e7\u91d1\u5c71"},{"id":10077,"name":"\u585e\u73ed\u5c9b"},{"id":10959,"name":"\u9ec4\u77f3\u56fd\u5bb6\u516c\u56ed"}]},{"id":"","name":"\u5927\u6d0b\u6d32","mdds":[{"id":10855,"name":"\u6089\u5c3c"},{"id":10856,"name":"\u58a8\u5c14\u672c"},{"id":30164,"name":"\u5927\u6d0b\u8def"},{"id":17339,"name":"\u9ec4\u91d1\u6d77\u5cb8"},{"id":10885,"name":"\u7687\u540e\u9547"},{"id":15920,"name":"\u57fa\u7763\u57ce"}]}],"hotel_activity_type":0,"WWW_HOST":"www.mafengwo.cn","IMG_HOST":"images.mafengwo.net","W_HTTP":"https:\/\/w.mafengwo.cn","P_HOST":"passport.mafengwo.cn","P_HTTP":"https:\/\/passport.mafengwo.cn","PAGELET_HTTP":"https:\/\/pagelet.mafengwo.cn","JS_HOST":"js.mafengwo.net","TONGJI_HOST":"tongji.mafengwo.cn","UID":86068029,"CSTK":"cebcac1c47d37b2c7a02d89302b977a8_d5f7ccb6dbe036d12e63a3eae46ffb80","GOOGLE_MAP_KEY":"AIzaSyD-Su0x_rPy1xehlMBcMyTqWkU49Bk53nQ","MOBILE_BINDED":true};
    </script>

    <link href="${pageContext.request.contextPath}/ztl/css/freego-searchScenic.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/ztl/css/freego-searchScenic2.css" rel="stylesheet" type="text/css">
<%--    <link href="https://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+mfw-header.2015^YlVS^1578479974.css" rel="stylesheet" type="text/css">--%>
<%--    <link href="https://css.mafengwo.net/css/cv/css+hotel+hotel_index:css+jquery-ui-1.11.0.min:css+hotel+datepicker-range:css+hotel+number_guests_picker^YlVX^1552035728.css" rel="stylesheet" type="text/css">--%>

    <script language="javascript" src="${pageContext.request.contextPath}/ztl/js/freego-searchScenic.js" type="text/javascript" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/ztl/js/freego-searchScenic2.js" crossorigin="anonymous"></script>
    <script async="" src="${pageContext.request.contextPath}/ztl/js/freego-searchScenic3.js" crossorigin="anonymous"></script>




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
    PageBean<ScenicInfo> searchScenicPage = (PageBean<ScenicInfo>)request.getAttribute("searchScenicPageBean");
    List<ScenicInfo> searchScenicList = searchScenicPage.getList();
    List<Integer> travelMonthList = (List<Integer>)request.getAttribute("travelMonthList");
    List<String> travelAddrList = (List<String>)request.getAttribute("travelAddrList");
    List<Integer> travelTagList = (List<Integer>)request.getAttribute("travelTagList");
    Map<Integer,String> totalTag = (Map<Integer, String>)request.getAttribute("totalTag");
    List<String> downtownInlandList = (List<String>)request.getAttribute("downtownInlandList");
    List<String> downtownAbroadList = (List<String>)request.getAttribute("downtownAbroadList");

    if(travelMonthList==null){
        System.out.println("travelMonthList IS NULL");
    }else{
        System.out.println(travelMonthList);
    }
    if(travelAddrList==null){
        System.out.println("travelAddrList IS NULL");
    }else{
        System.out.println(travelAddrList);
    }
    if(travelTagList==null){
        System.out.println("travelTagList IS NULL");
    }else{
        System.out.println(travelTagList);
    }

%>
<%--游记部分--%>
<div class="freego-scenic">
    <%--选项表单--%>
    <div class="scenic-form" style="width: 100%">
            <form class="navbar-form navbar-left" action="/ScenicServlet?methodName=queryScenicBySearch&currentPage=1&rows=5" method="post">
                <div class="scenic_form_date">
                    <select id="dateChoose" name="dateChoose" class="form-control selectpicker"
                            data-width="95%" data-live-search="true"
                            multiple data-max-options="5" onchange="getTravelMonth(this)"
                            title="选择出行日期">
                            <%for(int tmi = 0;tmi<12;tmi++){%>
                                <%if(travelMonthList==null){%>
                                    <option value="<%=tmi+1%>"><%=tmi+1%>月</option>
                                <%}else{%>
                                    <%int jd=0;%>
                                    <%for(int tmb = 0;tmb<travelMonthList.size();tmb++){
                                        if((tmi+1)==travelMonthList.get(tmb)){
                                            jd=1;
                                        }
                                    }%>
                                    <%if(jd==1){%>
                                        <option value="<%=tmi+1%>" selected><%=tmi+1%>月</option>
                                    <%}else{%>
                                        <option value="<%=tmi+1%>"><%=tmi+1%>月</option>
                                    <%}%>
                                <%}
                            }%>
<%--                        }%>--%>
                    </select>
                </div>
                <div class="scenic_form_addr">
                    <select id="'addrChoose" name="addrChoose" class="form-control selectpicker"
                            data-width="95%" data-live-search="true"
                            multiple data-max-options="5" onchange="getAddr(this)" title="选择地点">
                        <optgroup label="国内">
                            <%for(int i=0;i<downtownInlandList.size();i++){%>
                                <%if(travelAddrList==null){%>
                                    <option value="<%=downtownInlandList.get(i)%>"><%=downtownInlandList.get(i)%></option>
                                <%}else{%>
                                    <%int jd=0;%>
                                    <%for(int tadb = 0;tadb<travelAddrList.size();tadb++){
                                        if((downtownInlandList.get(i)).equals(travelAddrList.get(tadb))){
                                            jd=1;
                                        }
                                    }%>
                                    <%if(jd==1){%>
                                        <option value="<%=downtownInlandList.get(i)%>" selected><%=downtownInlandList.get(i)%></option>
                                    <%}else{%>
                                        <option value="<%=downtownInlandList.get(i)%>"><%=downtownInlandList.get(i)%></option>
                                    <%}%>
                            <%}}%>
                        </optgroup>
                        <optgroup label="国外">
                            <%for(int i=0;i<downtownAbroadList.size();i++){%>
                                <%if(travelAddrList==null){%>
                                    <option value="<%=downtownAbroadList.get(i)%>"><%=downtownAbroadList.get(i)%></option>
                                <%}else{%>
                                <%int jd=0;%>
                                <%for(int tadb = 0;tadb<travelAddrList.size();tadb++){
                                    if((downtownAbroadList.get(i)).equals(travelAddrList.get(tadb))){
                                        jd=1;
                                    }
                                }%>
                                <%if(jd==1){%>
                                    <option value="<%=downtownAbroadList.get(i)%>" selected><%=downtownAbroadList.get(i)%></option>
                                <%}else{%>
                                    <option value="<%=downtownAbroadList.get(i)%>"><%=downtownAbroadList.get(i)%></option>
                                <%}%>
                            <%}}%>
                        </optgroup>
                    </select>
                </div>
                <div class="scenic_form_tag">
                    <select id="'tagChoose" name="tagChoose" class="form-control selectpicker"
                            data-width="95%" data-live-search="true"
                            multiple data-max-options="5"  onchange="getTag(this)" title="选择主题">
                        <%if(totalTag != null){%>
                            <%for(Integer key:totalTag.keySet()){%>
                                <%if(travelTagList==null){%>
                                    <option value="<%=key%>"><%=totalTag.get(key)%></option>
                                <%}else{%>
                                <%int jd=0;%>
                                <%for(int ttb = 0;ttb<travelTagList.size();ttb++){
                                    if((key)==travelTagList.get(ttb)){
                                        jd=1;
                                    }
                                }%>
                                <%if(jd==1){%>
                                    <option value="<%=key%>" selected><%=totalTag.get(key)%></option>
                                <%}else{%>
                                    <option value="<%=key%>"><%=totalTag.get(key)%></option>
                                <%}%>
                            <%}}%>
                        <%}else{%>
                            <option value="空">空</option>
                        <%}%>
                    </select>
                </div>

                <div class="scenic_form_search">
<%--                    <input id="searchText" name="searchText" style="width: 80%" type="text" class="form-control" placeholder="${pageContext.request.contextPath}">--%>
                    <button id="btn-search" type="submit" class="btn btn-default">搜索</button>
                </div>

            </form>
        </div>

    <style type="text/css">
        ._j_tab_content img {
            opacity: 0;
            -webkit-transition: opacity ease-in 1s;
            -moz-transition: opacity ease-in 1s;
            transition: opacity ease-in 1s;
        }
        ._j_tab_content .img-show {
            opacity: 1;
        }

        .hotel-new-icon {
            position: absolute;
            display: block;
            width: 238px;
            height: 210px;
            bottom: -1px;
            left: 5px;
            z-index: -1;
            background-image: url('http://css.mafengwo.net/images/hotel/new-customer-icon.gif');
            background-size: 100% 100%;
        }

        .hotel-new-icon:hover {
            z-index: 0;
            background-image: url('http://css.mafengwo.net/images/hotel/new-customer-hover-icon.png');
        }

        .hotel-new-icon .close {
            position: absolute;
            display: block;
            width: 25px;
            height: 25px;
            right: 0;
            bottom: 83px;
            border-radius: 50%;
        }

        .toolbar-item-top, .toolbar-item-feedback, .toolbar-item-code {
            padding-left: 40px;
        }

    </style>

    <div class="index-scenic" style="margin-top: 50px">
        <%--景点列表--%>
        <div class="page-block-scenic" id="pgae_block_scenic">
            <div class="scenic-list">
                <%if(searchScenicList.size()!=0){
                    for (int i = 0;i < searchScenicList.size();i++){%>
                <div class="scenic-item clearfix">
                    <div class="scenic-left">
                        <a href="" target="_blank">
                            <%if (searchScenicList.get(i).getScenicCoverPicture()==null){%>
                            <img src="/FreegoImg/scenic_default.jpg" alt="" class="scenic-picture">
                            <%}else{%>
                            <img src=<%=searchScenicList.get(i).getScenicCoverPicture()%> alt="" class="scenic-picture">
                            <%}%>
                        </a>
                    </div>
                    <div class="scenic-right">
                        <dl>
                            <dt>
                                <a href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=searchScenicList.get(i).getScenicId()%>&currentPage=1&rows=2" target="_blank"><%=searchScenicList.get(i).getScenicName()%></a>
                            </dt>
                            <dd>
                                <a href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=searchScenicList.get(i).getScenicId()%>&currentPage=1&rows=2" target="_blank"><%=searchScenicList.get(i).getScenicIntro()%></a>
                            </dd>
                        </dl>

                        <div class="scenic-extra">
                            <%--定位--%>
                            <div class="scenic-location">
                                <img class="scenic-location-pic" src="../images/li/index/icon_search.jpeg">
                                <div class="scenic-location-text"><%=searchScenicList.get(i).getScenicAddress()%></div>
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
            <span style="font-size: 25px;margin-left: 5px;">
                第<%=searchScenicPage.getCurrentPage()%>页
            </span>
            <%if(searchScenicPage.getCurrentPage()!=1){%>
            <li>
                <a href="/ScenicServlet?methodName=queryScenicBySearch&currentPage=<%=searchScenicPage.getCurrentPage()-1%>&rows=5" onclick="sendSearchIndex()"  aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <%}%>
            <%if(searchScenicList != null){
                for (int i = 1;i <= searchScenicPage.getTotalPage();i++){%>
            <%if (i==1){%>
            <li><a href="/ScenicServlet?methodName=queryScenicBySearch&currentPage=<%=i%>&rows=5" onclick="sendSearchIndex()" ><%=i%></a></li>
            <%}else if(i==2&&i<searchScenicPage.getCurrentPage()-3){%>
            <li><a href="#">...</a></li>
            <%} else if(((i>=searchScenicPage.getCurrentPage()-3)&&(i<searchScenicPage.getCurrentPage()))
                    ||((i<=searchScenicPage.getCurrentPage()+3)&&(i>searchScenicPage.getCurrentPage()))){%>
            <li><a href="/ScenicServlet?methodName=queryScenicBySearch&currentPage=<%=i%>&rows=5" onclick="sendSearchIndex()" ><%=i%></a></li>
            <%}else if(i==searchScenicPage.getTotalPage()-1){%>
            <li><a href="#">...</a></li>
            <%}else if(i==searchScenicPage.getTotalPage()){%>
            <li><a href="/ScenicServlet?methodName=queryScenicBySearch&currentPage=<%=i%>&rows=5" onclick="sendSearchIndex()" ><%=i%></a></li>
            <%}%>
            <%}}else{%>
            <li>
                <a href="#">
                    0
                </a>
            </li>
            <%}%>
            <%if(searchScenicPage.getTotalPage()!=searchScenicPage.getCurrentPage()){%>
            <li>
                <a href="/ScenicServlet?methodName=queryScenicBySearch&currentPage=<%=searchScenicPage.getCurrentPage()+1%>&rows=5" onclick="sendSearchIndex()" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <%}%>
            <span style="font-size: 25px;margin-left: 5px;">
                共<%=searchScenicPage.getTotalCount()%>条，共<%=searchScenicPage.getTotalPage()%>页
            </span>

        </ul>
    </nav>

</div>

</body>
<%--导入尾部--%>
<footer>
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
</footer>

<script>
    function sendSearchIndex() {
        <%request.getSession().setAttribute("dateChoose",travelMonthList);%>
        <%request.getSession().setAttribute("addrChoose",travelAddrList);%>
        <%request.getSession().setAttribute("tagChoose",travelTagList);%>
    }
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

</html>