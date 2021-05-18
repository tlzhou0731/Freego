<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.*" %>
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

    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>

    <script src="../ztl/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../ztl/css/index.css">
<%--    <link rel="stylesheet" type="text/css" href="../ztl/css/scenicInfo.css">--%>
    <style>
        #container {
            overflow: hidden;
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
    </style>


</head>

<%--导入头部--%>
<%--<header id="header">

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

</header>--%>


<body>
<%--接受的数据--%>
<%
    ScenicInfo scenicInfo = null;
    scenicInfo = (ScenicInfo)request.getSession().getAttribute("scenicInfo");
    List<ScenicCommentInfo> scenicCommentChild = (List<ScenicCommentInfo>)request.getSession().getAttribute("scenicCommentChild");
    PageBean<ScenicCommentInfo> scenicCommentPageBean = (PageBean<ScenicCommentInfo>)request.getSession().getAttribute("scenicCommentPageBean");
    List<ScenicCommentInfo> scenicCommentInfoList = scenicCommentPageBean.getList();
    List<ScenicInfo> nearScenicList = (List<ScenicInfo>)request.getSession().getAttribute("nearScenicList");
    List<TicketInfo> ticketInfoList = (List<TicketInfo>)request.getSession().getAttribute("ticketInfoList");
    String orderFlag = (String)request.getSession().getAttribute("orderFlag");
    if(orderFlag!=null){
        System.out.println("lkjjjjjjjjjjjlkjlkjljlkjlkj");
    }
%>

<%--景点头部信息--%>
<div class="scenic-info-row-top">
    <div class="scenic-info-wrapper">
        <div class="extra">
            <!-- 收藏去过 S-->
            <div class="action _scenic_collect" style="float:right;">
                <li class="nav-right" style="list-style: none">
                    <button id="collected-button" class="btn-comment" style="border: none" title="收藏" data-source="" onclick="changeCollectedState(1)">收藏</button>
                </li>
                <li class="nav-right" style="list-style: none">
                    <button id="un-collected-button" class="btn-comment" style="display: none;border: none" title="已收藏" data-source="" onclick="changeCollectedState(0)">已收藏</button>
                </li>
            </div>
            <!-- 收藏去过 E-->
        </div>
        <!-- POI名称 S-->
        <div class="title">
            <h1 style=""><%=scenicInfo.getScenicName()%></h1>
        </div>
        <!-- POI名称 E-->

        <!-- 快捷导航 S-->
        <div style="height: 60px;">
            <div class="scenic-info-r-nav" id="poi-navbar" data-cs-p="快捷导航">
                <ul class="clearfix">
                    <li data-scroll="overview" class="on">
                        <a title="概况">概况</a>
                    </li>
                    <li data-scroll="commentlist" style="list-style: none">
                        <a title="Free点评" href="javascript:void(0)" onclick="document.getElementById('commentlist').scrollIntoView();"><span>Free点评&nbsp;<%=scenicCommentPageBean.getList().size()+scenicCommentChild.size()%>&nbsp;条</span></a>
                    </li>
                    <li class="nav-right" style="list-style: none">
                        <a class="btn-comment" href="/ScenicServlet?methodName=commentScenic&parentId=-1&parentCommentId=-1" title="我要点评" data-source="">我要点评</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 快捷导航 E-->
    </div>
</div>

<%--景点详细信息--%>
<div data-anchor="overview">
    <!-- 图片 S -->
    <div class="scenic-info-row scenic-info-row-picture scenic-info-row-bg">
        <div class="scenic-info-wrapper">
            <a class="photo" data-cs-p="相册" href="" target="_blank">
                <div class="bd">
                    <div class="pic-big">
                        <img src="/FreegoImg/ztl/<%=scenicInfo.getScenicCoverPicture()%>" width="690" height="370">
                    </div>
                    <div class="pic-small">
                        <img src="../images/ztl/scenic/scenic_show_2.jpg" width="305" height="183">
                    </div>
                    <div class="pic-small">
                        <img src="../images/ztl/scenic/scenic_show_3.jpg" width="305" height="183">
                    </div>
                    <span>37136张图片</span>
                </div>
            </a>
        </div>
    </div>
    <!-- 图片 E -->

    <!-- 简介 S -->
    <div class="scenic-info-mod scenic-info-mod-detail">
        <div class="summary">
            <%=scenicInfo.getSenicDetail()%><br>
        </div>

        <ul class="baseinfo clearfix">
            <li class="tel">
                <div class="label">电话</div>
                <div class="content"><%=scenicInfo.getScenicTele()%></div>
            </li>
            <li class="item-time">
                <div class="label">用时参考</div>
                <div class="content"><%=scenicInfo.getScenicSuitableTravelDays()%>小时</div>
            </li>
        </ul>

        <dl>
            <dt>门票</dt>
            <dd>
                <div>
                    tips:<br>
                    具体详情请咨询景区
                </div>
            </dd>
        </dl>
        <dl>
            <dt>适合人数</dt>
            <dd><%=scenicInfo.getScenicViewNums()%></dd>
        </dl>
        <dl>
            <dt>开放时间</dt>
            <dd>
                全天<br>
                <br>
            </dd>
        </dl>

        <!-- 地图 S -->
        <div class="scenic-map-mod scenic-map-mod-location">
            <div class="scenic-map-mhd" style="overflow: hidden;">
                景点位置
                <p class="sub">
                    <%=scenicInfo.getScenicAddress()%>
                </p>
            </div>
            <div class="scenic-map-mbd clearfix">
                <div id="pagelet-block-9ab4f398fdf9b0887afe7cae7416b086" class="pagelet-block" data-api=":poi:pagelet:poiLocationApi" data-params="{&quot;poi_id&quot;:&quot;87950&quot;}" data-async="1" data-controller="/js/poi/ControllerPoiLocation">
                    <div class="maps map-container" id="map-box" style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
                        <div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 111px;">
                            <div id="allmap" class="BMap_mask" style="position: absolute; left: 0px; top: -111px; z-index: 9; overflow: hidden; user-select: none; width: 500px; height: 270px;">
                            </div>
                        </div>
                    </div>
                    <div class="m-poi" data-cs-p="位置-附近景点">
                        <div class="mtitle">附近景点</div>
                        <ul class="mlist">
                            <%for(int nearTemp = 0;nearTemp<nearScenicList.size();nearTemp++){%>
                            <li data-id="<%=nearScenicList.get(nearTemp).getScenicId()%>"
                                data-name="<%=nearScenicList.get(nearTemp).getScenicName()%>"
                                data-type="3"
                                data-lat="<%=nearScenicList.get(nearTemp).getLat()%>"
                                data-lng="<%=nearScenicList.get(nearTemp).getLng()%>">
                                <a href="${pageContext.request.contextPath}/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=nearScenicList.get(nearTemp).getScenicId()%>&currentPage=1&rows=2" target="_blank">
                                    <%=nearScenicList.get(nearTemp).getScenicName()%>
                                </a>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 地图 E -->

        <!-- 门票 S -->
        <div id="" class="pagelet-block" data-api=":poi:pagelet:poiTicketsApi" data-params="{&quot;poi_id&quot;:&quot;19779&quot;}" data-async="1" data-controller="">
            <div class="mod mod-promo" data-cs-p="热门优惠">
                <div class="wrapper">
                    <div class="mhd">热门优惠</div>
                    <div class="mbd">
                        <table>
                            <thead>
                            <tr>
                                <th class="pro">门票类型</th>
                                <th class="price">&nbsp;</th>
                                <th class="action">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%if(ticketInfoList!=null&&ticketInfoList.size()!=0){%>
                                <%for(int i = 0;i<ticketInfoList.size();i++){%>
                                    <tr>
                                        <td class="pro"><a href="${pageContext.request.contextPath}/ScenicServlet?methodName=queryTicketInfo" target="_blank" title=<%=ticketInfoList.get(i).getTicketName()%>><%=ticketInfoList.get(i).getTicketName()%></a></td>
                                        <td class="action"><a class="btn" href="${pageContext.request.contextPath}/ScenicServlet?methodName=queryTicketInfo" target="_blank" title="预订">预订</a></td>
                                    </tr>
                                <%}%>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- 门票 E -->




    </div>
    <!-- 简介 E -->

    <!-- 评论 S -->
    <div class="scenic-commentList" id="commentlist">
        <div id="pagelet_scenic" class="pagelet-scenic-comment">
            <div class="scenic-info-mod scenic-info-mod-comment">
                <div class="scenic-comment-mhd scenic-comment-mhd-large">
                    Free点评
                    <span>
                        （共有&nbsp;<%=scenicCommentPageBean.getList().size()+scenicCommentChild.size()%>&nbsp;条真实评价）
                    </span>
                </div>
                <div class="scenic-comment-nav">
                    <ul class="clearfix">
                        <li data-type="0" data-category="0" class="on">
                            <span class="divide">

                            </span>
                            <a href="javascript:void(0);">
                                <span>
                                    全部
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="loading-img" style="display: none;">
                    <img src="../images/ztl/scenic/scenic_show_1.jpg"> Loading...
                </div>
                <div class="_scenic_comment_list">
                    <div class="scenic-comment-list">
                        <ul>
                            <%if(scenicCommentPageBean != null){
                                //这一页有多少个景点
                                for (int i = 0;i < scenicCommentInfoList.size();i++){%>
                                    <li class="scenic-comment-item scenic-review-list-item clearfix">
                                        <div class="user">
                                            <a class="avatar" href="/u/78339278.html" target="_blank">
                                                <img src="https://b1-q.mafengwo.net/s13/M00/7C/CA/wKgEaVxmfzqAFz0AAACeb-zb4Lo40.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48">
                                            </a>
                                        </div>
                                        <a class="name" href="" target="_blank">
                                            <%=String.valueOf(scenicCommentInfoList.get(i).getUserId())%>
                                        </a>

                                        <img src="/FreegoImg/ztl/commentstar-<%=scenicCommentInfoList.get(i).getScenicGrade()%>.jpeg" style="width: 80px;height: 20px">
                                        <p class="scenic-comment-txt">
                                            <%=scenicCommentInfoList.get(i).getCommentText()%>
                                        </p>

                                        <div class="info clearfix">
                                            <a class="btn-comment _j_comment" title="添加评论" href="/ScenicServlet?methodName=commentScenic&parentId=<%=scenicCommentInfoList.get(i).getScenicCommentId()%>&parentCommentId=<%=scenicCommentInfoList.get(i).getScenicCommentId()%>">评论</a>
                                            <span class="time">2019-03-05 10:59:10</span>
                                        </div>

                                        <div class="scenic-comment-review add-reply">
                                            <ul class="more_reply_box comment_list">
                                                <%  int countj = 0;
                                                    List<Integer> commentChildNum = new ArrayList<Integer>();
                                                    System.out.println("AFTER COUNTJ");
                                                    for (int j = 0;j < scenicCommentChild.size();j++){
                                                        if(scenicCommentChild.get(j).getParentCommentId()==scenicCommentInfoList.get(i).getScenicCommentId()){
                                                            commentChildNum.add(j);
                                                            countj++;
                                                            System.out.println("COUNTJ="+j);
                                                        }
                                                    }
                                                    if(countj!=0){%>
                                                <%  for(int j=0;j<countj;j++){%>
                                                        <li >
                                                            <a href="" target="_blank">
                                                                <img src="https://n1-q.mafengwo.net/s9/M00/05/17/wKgBs1bBzguAa3jrAACEXkZu-eQ06.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">
                                                                <%=String.valueOf(scenicCommentChild.get(commentChildNum.get(j)).getUserId())%>
                                                            </a>
                                                            <%if(scenicCommentChild.get(commentChildNum.get(j)).getParentId()!=scenicCommentChild.get(commentChildNum.get(j)).getParentCommentId()){%>
                                                            <%for(int itemp = 0 ;itemp <commentChildNum.size();itemp++){%>
                                                                <%if(scenicCommentChild.get(itemp).getScenicCommentId()==scenicCommentChild.get(commentChildNum.get(j)).getParentId()){%>
                                                                    ：回复<%=String.valueOf(scenicCommentChild.get(itemp).getUserId())%>：
                                                                <%}%>
                                                            <%}%>
                                                            <%}%>
                                                            <%=scenicCommentChild.get(commentChildNum.get(j)).getCommentText()%>
                                                            <a class="_j_reply re_reply" data-id="<%=scenicCommentChild.get(commentChildNum.get(j)).getScenicCommentId()%>" data-uid="scenicCommentChild.get(commentChildNum.get(j)).getUserId()" data-username="'林家辉" title="添加回复" href="/ScenicServlet?methodName=commentScenic&parentId=<%=scenicCommentChild.get(commentChildNum.get(j)).getScenicCommentId()%>&parentCommentId=<%=scenicCommentInfoList.get(i).getScenicCommentId()%>">回复</a>
                                                            <br><span class="time">2019-03-06 10:14:32</span>
                                                        </li>
                                                <%}}%>
                                            </ul>
                                        </div>
                                    </li>
                            <%}}%>

                        </ul>
                    </div>

                    <div align="right" class="scenic-comment-pagination">
                        <span class="count">共<span><%=scenicCommentPageBean.getTotalPage()%></span>页 / <span><%=scenicCommentPageBean.getTotalCount()%></span>条</span>
                        <a class="pi pg-prev" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=<%=scenicCommentPageBean.getCurrentPage()-1%>&rows=2" title="前一页"><<</a>

                        <%if(scenicCommentInfoList != null){
                            for (int i = 1;i <= scenicCommentPageBean.getTotalPage();i++){%>
                                <%if (i==scenicCommentPageBean.getCurrentPage()){%>
                                    <span class="pg-current" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=<%=i%>&rows=2"><%=i%></span>
                                <%}else if(i==1){%>
                                    <a class="pi" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=1&rows=2">1</a>
                                <%}else if(i==2&&i<scenicCommentPageBean.getCurrentPage()-3){%>
                                    <a class="pi" href="#">...</a>
                                <%}else if(((i>=scenicCommentPageBean.getCurrentPage()-3)&&(i<scenicCommentPageBean.getCurrentPage()))
                                        ||((i<=scenicCommentPageBean.getCurrentPage()+3)&&(i>scenicCommentPageBean.getCurrentPage()))){%>
                                    <a class="pi" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=<%=i%>&rows=2"><%=i%></a>
                                <%}else if(i==scenicCommentPageBean.getTotalPage()-1){%>
                                    <a  class="pi" href="#">...</a>
                                <%}else if(i==scenicCommentPageBean.getTotalPage()){%>
                                    <a class="pi" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=<%=i%>&rows=2"><%=i%></a>
                                <%}%>
                            <%}
                        }else{%>
                            <span class="pg-current">0</span>
                        <%}%>
                        <a class="pi pg-next" href="/ScenicServlet?methodName=findScenicInfoByScenicId&scenicId=<%=scenicInfo.getScenicId()%>&currentPage=<%=scenicCommentPageBean.getCurrentPage()+1%>&rows=2" title="后一页">>></a>

<%--                        <span class="pg-current">1</span>--%>
<%--                        <a class="pi" href="">2</a>--%>
<%--                        <a class="pi" href="">3</a>--%>
<%--                        <a class="pi" href="">4</a>--%>
<%--                        <a class="pi" href="">5</a>--%>

<%--                        <a class="pi pg-next" href="" title="后一页">后一页</a>--%>
                    </div>

                </div>

            <div class="more">
                <a href="" target="_blank">查看相关游记</a>
            </div>
        </div>

            <script type="text/x-jquery-tmpl" class="reply_tmpl">
                <li>
                    <a href="/u/${reply_uid}.html" target="_blank">
                        <img src="${reply_user_logo}" width="16" height="16"/>${reply_name}
                    </a>
                    {{if to_name}}回复${to_name}{{/if}}：${content}
                    <br><span class="time">${ctime}</span>
                </li>
            </script>
        </div>
    </div>
    <!-- 评论 E -->

    <!-- 评论界面 S -->




    <!-- 评论界面 E -->







<script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>

<script type="text/javascript">
    var map = new BMapGL.Map('allmap');
    //附近点
    var nearScenicCount = <%=nearScenicList.size()%>;
    var points = new Array(nearScenicCount);
    var markers = new Array(nearScenicCount);
    var opts = new Array(nearScenicCount);
    var infoWindows = new Array(nearScenicCount);
    //中心点
    var point = new BMapGL.Point(<%=scenicInfo.getLng()%>, <%=scenicInfo.getLat()%>);
    map.centerAndZoom(point, 15);
    // 创建点标记
    marker = new BMapGL.Marker(point);
    map.addOverlay(marker);
    // 创建信息窗口
    opt = {
        width: 200,
        height: 100,
        title: '<%=scenicInfo.getScenicName()%>'
    };
    infoWindow = new BMapGL.InfoWindow('<%=scenicInfo.getScenicAddress()%>', opt);
    // 点标记添加点击事件
    marker.addEventListener('click', function () {
        map.openInfoWindow(infoWindow, point); // 开启信息窗口
    });

    <%for(int nearI = 0 ; nearI < nearScenicList.size();nearI++){%>
        points[<%=nearI%>] = new BMapGL.Point(<%=nearScenicList.get(nearI).getLng()%>, <%=nearScenicList.get(nearI).getLat()%>);
        markers[<%=nearI%>] = new BMapGL.Marker(points[<%=nearI%>]);
        map.addOverlay(markers[<%=nearI%>]);
        // 创建信息窗口
        opts[<%=nearI%>] = {
            width: 200,
            height: 100,
            title: '<%=nearScenicList.get(nearI).getScenicName()%>'
        };
        infoWindows[<%=nearI%>] = new BMapGL.InfoWindow('<%=nearScenicList.get(nearI).getScenicAddress()%>', opts[<%=nearI%>]);
        // 点标记添加点击事件
        markers[<%=nearI%>].addEventListener('click', function () {
            map.openInfoWindow(infoWindows[<%=nearI%>], points[<%=nearI%>]); // 开启信息窗口
        });

    <%}%>
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放


</script>


<%--导入尾部
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
</footer>--%>

</body>

<script>
    function changeCollectedState(state) {
        if(state==1){
            document.getElementById("collected-button").style.display = 'none';
            document.getElementById("un-collected-button").style.display = 'block';
        }else{
            document.getElementById("collected-button").style.display = 'block';
            document.getElementById("un-collected-button").style.display = 'none';
        }
    }
</script>
<script>
    $(function () {
        if(<%=orderFlag!=null&&("yes".equals(orderFlag))%>){
            alert("购票成功");
            <%request.getSession().setAttribute("orderFlag","no");%>
        }
    });
</script>

</html>