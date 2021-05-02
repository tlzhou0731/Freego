<%@ page import="java.util.List" %>
<%@ page import="domain.PageBean" %>
<%@ page import="domain.ScenicInfo" %>
<%@ page import="domain.ScenicCommentInfo" %>
<%@ page import="java.util.ArrayList" %>
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


</head>

<%--导入头部--%>
<%--<header id="header">--%>

<%--    <div class="freego_header clearfix" id="head_nav_warper">--%>

<%--        <div class="head_logo"><a class="freego_logo" title="FreeGo" href="http://localhost:8080/index.jsp"></a></div>--%>

<%--        <ul class="head_nav" id="_j_head_nav" role="tablist">--%>
<%--            <li id="head_nav_index_li" role="presentation"><a href="" id="head_nav_index_a">首页</a></li>--%>
<%--            <li id="head_nav_scenic_li" role="presentation"><a href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=1&rows=10"  id="head_nav_scenic_a" title="景点">景点</a></li>--%>
<%--            <li id="head_nav_gonglve_li" role="presentation"><a href="" id="head_nav_gonglve_a" title="旅游攻略">旅游攻略</a></li>--%>
<%--            <li id="head_nav_hotel_li" role="presentation"><a href="" id="head_nav_hotel_a" title="酒店">订酒店</a></li>--%>
<%--        </ul>--%>

<%--        <div class="login_status">--%>
<%--            <!-- 未登录状态  -->--%>
<%--            <div id="login_out" class="login_out">--%>
<%--                <a href="login.jsp">登录</a>--%>
<%--                <a href="register.jsp">注册</a>--%>
<%--            </div>--%>
<%--            <!-- 登录状态  -->--%>
<%--            <div id="login_in" class="login_in">--%>
<%--                <span id="span_username"></span>--%>
<%--                <a href="javascript:location.href='user/exit';">退出</a>--%>
<%--                <a id="cancelAccount">注销账号</a>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--</header>--%>


<body>
<%--接受的数据--%>
<%
    ScenicInfo scenicInfo = null;
    scenicInfo = (ScenicInfo)request.getAttribute("scenicInfo");
    List<ScenicCommentInfo> scenicCommentChild = (List<ScenicCommentInfo>)request.getAttribute("scenicCommentChild");
    PageBean<ScenicCommentInfo> scenicCommentPageBean = (PageBean<ScenicCommentInfo>)request.getAttribute("scenicCommentPageBean");
    List<ScenicCommentInfo> scenicCommentInfoList = scenicCommentPageBean.getList();
    List<ScenicInfo> nearScenicList = (List<ScenicInfo>)request.getAttribute("nearScenicList");
%>

<%--景点头部信息--%>
<div class="scenic-info-row-top">
    <div class="scenic-info-wrapper">
        <div class="extra">
            <!-- 收藏去过 S-->
            <div class="action _scenic_collect">
                <a class="btn-collect " href="" target="_blank" title="添加收藏" data-cs-p="收藏">
                    <i class="icon"></i>
                    <span class="txt">收藏</span>
                </a>
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
                    <li data-scroll="commentlist">
                        <a title="Free点评" href="javascript:void(0)" onclick="document.getElementById('commentlist').scrollIntoView();"><span>Free点评&nbsp;<%=scenicCommentPageBean.getList().size()+scenicCommentChild.size()%>&nbsp;条</span></a>
                    </li>
                    <li class="nav-right">
                        <a class="btn-comment" href="" title="我要点评" data-source="">我要点评</a>
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
                        <img src="../images/ztl/scenic/scenic_show_1.jpg" width="690" height="370">
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
        <div class="scenic-map-mod scenic-map-mod-location">
            <div class="scenic-map-mhd" style="overflow: hidden;">
                景点位置
                <p class="sub">
                    四川省成都市青羊区金河路口宽窄巷子
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
                            <li data-id="5416" data-name="成都人民公园" data-type="3" data-lat="30.657045" data-lng="104.057567">
                                    <span class="dist">
                                        800米
                                    </span>
                                <a href="/poi/5416.html" target="_blank">
                                    成都人民公园
                                </a>
                            </li>
                            <li data-id="5002" data-name="文化公园-青羊宫" data-type="3" data-lat="30.660034" data-lng="104.041137">
                                    <span class="dist">
                                        1.3公里
                                    </span>
                                <a href="/poi/5002.html" target="_blank">文化公园-青羊宫</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

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
                        <li data-type="0" data-category="2" class="">
                            <span class="divide"></span>
                            <a href="javascript:void(0);"><span>有图</span><span class="num"> (1216条)</span></a>
                        </li>
                        <li data-type="0" data-category="1" class="">
                            <span class="divide"></span>
                            <a href="javascript:void(0);"><span>金牌点评</span><span class="num"> (8条)</span></a>
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

                                        <span class="s-star s-star5"></span>
                                        <p class="scenic-comment-txt">
                                            <%=scenicCommentInfoList.get(i).getCommentText()%>
                                        </p>

                                        <div class="scenic-comment-img">
                                            <a href="/photo/poi/19779_408964428.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/E4/5E/wKgEaVx95faAfn0CAC0gZWhAtxk40.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                            <a href="/photo/poi/19779_408964432.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/E4/5F/wKgEaVx95faAC4ikAB_MhIwjMIw45.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                            <a href="/photo/poi/19779_408964436.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/E4/5F/wKgEaVx95feAMCLzACKd5j5g5Ik21.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                            <a href="/photo/poi/19779_408964440.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/E4/60/wKgEaVx95fiAd9CsADWlhSJa-B812.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                        </div>

                                        <div class="info clearfix">
                                            <a class="btn-comment _j_comment" title="添加评论">评论</a>
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
                                                            ：回复<%=String.valueOf(scenicCommentChild.get(commentChildNum.get(j)).getUserId())%>：
                                                            <%}%>
                                                            <%=scenicCommentChild.get(commentChildNum.get(j)).getCommentText()%>
                                                            <a class="_j_reply re_reply" data-id="<%=scenicCommentChild.get(commentChildNum.get(j)).getScenicCommentId()%>>" data-uid="scenicCommentChild.get(commentChildNum.get(j)).getUserId()" data-username="'林家辉" title="添加回复">回复</a>
                                                            <br><span class="time">2019-03-06 10:14:32</span>
                                                        </li>
                                                <%}}%>
                                            </ul>

                                            <div class="add-comment hide reply-form">
                                                <textarea class="comment_reply" data-comment_id="162437860" data-comment_username="太阳🌞之光" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                                <a class="btn btn_submit_reply">回复</a>
                                            </div>
                                        </div>
                                    </li>
                            <%}}%>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user">
                                    <a class="avatar" href="" target="_blank">
                                        <img src="/images/ztl/scenic/scenic_show_1.jpg" width="48" height="48">
                                    </a>
<%--                                    <span class="level">--%>
<%--                                        LV.32--%>
<%--                                    </span>--%>
                                </div>
                                <a class="name" href="" target="_blank">
                                    aaaaaaa
                                </a>

                                <span class="s-star s-star4"></span>
                                <p class="rev-txt">滇池，位于昆明坝子中央，东起呈贡区旁，西至西山之麓，北临大观公园，南入晋宁县内。全部在云南省省会昆明市境内，北大半部属于昆明市辖区。其中，西北部属西山区，面积约占三分之一。滇池为西南第一大湖，也是中国第六大的淡水湖。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_410349092.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/7A/88/wKgEaVyEuU2AX9_dADr8JNaJOyY84.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_410349096.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/7A/7D/wKgEaVyEuUmAPgxVADlrZsroxcg92.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_410349100.html" target="_blank"><img src="https://b1-q.mafengwo.net/s13/M00/7A/82/wKgEaVyEuUuAJhvbADFdGE1MEsU29.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_410349104.html" target="_blank"><img src="https://b1-q.mafengwo.net/s13/M00/7A/8D/wKgEaVyEuVCAbOa9ADKkw7UaE_I93.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-03-10 15:14:26</span>
                                    <span class="from">
                                    此条点评来自<a href="/app/intro/gonglve.php" target="_blank">马蜂窝旅游APP</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190154279" data-comment_username="无言" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/78339278.html" target="_blank"><img src="https://b1-q.mafengwo.net/s13/M00/7C/CA/wKgEaVxmfzqAFz0AAACeb-zb4Lo40.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.16</span></div>
                                <a class="name" href="/u/78339278.html" target="_blank">纤云肆卷</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">一月份的时候去的，昆明自带好天气，温度适宜，阳光灿烂，成千上万的海鸥从西伯利亚飞来这里度过寒冬，他们每年的12月初飞来，次年3月初便离开，每年的如期而至，就像是一场美好的约定。滇池边有很多人来拍婚纱照，还有各种喂海鸥的饼干面包出售，如果你喜欢这群飞来飞去的小精灵，也可以买一点来喂哦</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_408964428.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/E4/5E/wKgEaVx95faAfn0CAC0gZWhAtxk40.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_408964432.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/E4/5F/wKgEaVx95faAC4ikAB_MhIwjMIw45.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_408964436.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/E4/5F/wKgEaVx95feAMCLzACKd5j5g5Ik21.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_408964440.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/E4/60/wKgEaVx95fiAd9CsADWlhSJa-B812.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-03-05 10:59:10</span>
                                </div>

                                <div class="scenic-comment-review add-reply ">
                                    <ul class="more_reply_box comment_list">
                                        <li>
                                            <a href="/u/66502518.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s9/M00/05/17/wKgBs1bBzguAa3jrAACEXkZu-eQ06.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">'林家辉
                                            </a>
                                            ：3月11号还能看到吗？
                                            <a class="_j_reply re_reply" data-id="482512" data-uid="66502518" data-username="'林家辉" title="添加回复">回复</a>
                                            <br><span class="time">2019-03-06 10:14:32</span>
                                        </li>
                                        <li class="_j_morereply">
                                            <a title="展开全部回复">还有<span class="more_cnt">6</span>条回复</a>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/850516.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s9/M00/92/FD/wKgBs1g3hICAJkDZAACRsdbIDc442.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">KiwanChan
                                            </a>
                                            回复'林家辉：同问哈！我3.10到
                                            <a class="_j_reply re_reply" data-id="483584" data-uid="850516" data-username="KiwanChan" title="添加回复">回复</a>
                                            <br><span class="time">2019-03-06 22:58:21</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/77766139.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s12/M00/35/2C/wKgED1uqImOAAxCCAAAeJTVWYJU680.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">Z  t  🍄
                                            </a>
                                            ：3月20号还能看到吗
                                            <a class="_j_reply re_reply" data-id="484032" data-uid="77766139" data-username="Z  t  🍄" title="添加回复">回复</a>
                                            <br><span class="time">2019-03-07 13:45:40</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/66528253.html" target="_blank">
                                                <img src="https://b1-q.mafengwo.net/s12/M00/35/B7/wKgED1uqIs-AMYTwAAAX-VIKIo0071.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">Ms. Xie
                                            </a>
                                            ：11月中旬有吗
                                            <a class="_j_reply re_reply" data-id="589684" data-uid="66528253" data-username="Ms. Xie" title="添加回复">回复</a>
                                            <br><span class="time">2019-05-20 10:35:39</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/60773209.html" target="_blank">
                                                <img src="https://p1-q.mafengwo.net/s17/M00/A9/55/CoUBXl9dikOAOOfoAADKiasZ0ew93.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">二半烟雨
                                            </a>
                                            回复Ms. Xie：有了11月初到3月尾都有，中间时间比较多
                                            <a class="_j_reply re_reply" data-id="596668" data-uid="60773209" data-username="二半烟雨" title="添加回复">回复</a>
                                            <br><span class="time">2019-05-25 19:14:31</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/30876914.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s18/M00/D4/1B/CoUBYGAvai-AFfKdAACHjp4-EG870.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">得意的 🐷
                                            </a>
                                            ：国庆有吗，百度里说10月回来呀，国庆去昆明
                                            <a class="_j_reply re_reply" data-id="722523" data-uid="30876914" data-username="得意的 🐷" title="添加回复">回复</a>
                                            <br><span class="time">2019-09-16 21:24:29</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/78339278.html" target="_blank">
                                                <img src="https://b1-q.mafengwo.net/s13/M00/7C/CA/wKgEaVxmfzqAFz0AAACeb-zb4Lo40.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">纤云肆卷
                                            </a>
                                            回复得意的 🐷：我不太清楚呢，数量可能会少点
                                            <a class="_j_reply re_reply" data-id="728927" data-uid="78339278" data-username="纤云肆卷" title="添加回复">回复</a>
                                            <br><span class="time">2019-09-28 11:18:57</span>
                                        </li>
                                        <li>
                                            <a href="/u/30876914.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s18/M00/D4/1B/CoUBYGAvai-AFfKdAACHjp4-EG870.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">得意的 🐷
                                            </a>
                                            回复纤云肆卷：刚来了，今天，没有，还是12月份左右才有
                                            <a class="_j_reply re_reply" data-id="731115" data-uid="30876914" data-username="得意的 🐷" title="添加回复">回复</a>
                                            <br><span class="time">2019-10-01 23:36:12</span>
                                        </li>
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190092468" data-comment_username="纤云肆卷" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div align="right" class="scenic-comment-pagination">
                        <span class="count">共<span><%=scenicCommentPageBean.getTotalPage()%></span>页 / <span><%=scenicCommentPageBean.getTotalCount()%></span>条</span>
                        <a class="pi pg-prev" href="" title="前一页"><<</a>

                        <%if(scenicCommentInfoList != null){
                            for (int i = 1;i <= scenicCommentPageBean.getTotalPage();i++){%>
                                <%if (i==scenicCommentPageBean.getCurrentPage()){%>
                                    <span class="pg-current"><%=i%></span>
                                <%}else if(i==1){%>
                                    <a class="pi" href="#">1</a>
                                <%}else if(i==2&&i<scenicCommentPageBean.getCurrentPage()-3){%>
                                    <a class="pi" href="#">...</a>
                                <%}else if(((i>=scenicCommentPageBean.getCurrentPage()-3)&&(i<scenicCommentPageBean.getCurrentPage()))
                                        ||((i<=scenicCommentPageBean.getCurrentPage()+3)&&(i>scenicCommentPageBean.getCurrentPage()))){%>
                                    <a class="pi" href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=<%=i%>&rows=10"><%=i%></a>
                                <%}else if(i==scenicCommentPageBean.getTotalPage()-1){%>
                                    <a  class="pi" href="#">...</a>
                                <%}else if(i==scenicCommentPageBean.getTotalPage()){%>
                                    <a class="pi" href="/ScenicServlet?&methodName=queryScenicIndex&currentPage=<%=i%>&rows=10"><%=i%></a>
                                <%}%>
                            <%}
                        }else{%>
                            <span class="pg-current">0</span>
                        <%}%>
                        <a class="pi pg-next" href="" title="后一页">>></a>

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

    <!-- 门票 S -->
<%--    <div id="pagelet-block-3616610faf86ff9c6f99c912c4efe270" class="pagelet-block" data-api=":poi:pagelet:poiTicketsApi" data-params="{&quot;poi_id&quot;:&quot;19779&quot;}" data-async="1" data-controller="">    <div class="mod mod-promo" data-cs-p="热门优惠">--%>
<%--        <div class="wrapper">--%>
<%--            <div class="mhd">热门优惠</div>--%>
<%--            <div class="mbd">--%>
<%--                <table>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th class="type">类型</th>--%>
<%--                        <th class="pro">&nbsp;</th>--%>
<%--                        <th class="price">价格</th>--%>
<%--                        <th class="action">&nbsp;</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td class="type">多日游</td>--%>
<%--                        <td class="pro"><a href="" target="_blank" title="【五一早订优惠】昆明+大理+丽江6日游（赠版纳4日游+温泉酒店+大理丽江两大古城+洱海游艇+乘索道观玉龙雪山+敞篷吉普车旅拍+打卡蓝月谷）">【五一早订优惠】昆明+大理+丽江6日游（赠版纳4日游+温泉酒店...</a></td>--%>
<%--                        <td class="price">￥980起</td>--%>
<%--                        <td class="action"><a class="btn" href="http://www.mafengwo.cn/sales/6640686.html?cid=1030" target="_blank" title="预订">预订</a></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td class="type">景区/场馆</td>--%>
<%--                        <td class="pro"><a href="http://www.mafengwo.cn/sales/2670726.html?cid=1030" target="_blank" title="快速入园  云南民族村门票电子票（从滇池到民族村 当地民俗特色风情体验/多套餐选择）">快速入园  云南民族村门票电子票（从滇池到民族村 当地民俗特...</a></td>--%>
<%--                        <td class="price">￥76起</td>--%>
<%--                        <td class="action"><a class="btn" href="http://www.mafengwo.cn/sales/2670726.html?cid=1030" target="_blank" title="预订">预订</a></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td class="type">一日游</td>--%>
<%--                        <td class="pro"><a href="http://www.mafengwo.cn/sales/2869684.html?cid=1030" target="_blank" title="昆明石林+抚仙湖一日游 （ 8人高端纯玩团+穿彝裳听三弦+环仙湖赏樱花+趣享游船下午茶+半山栈道瞰湖 可选东风韵拍大片）">昆明石林+抚仙湖一日游 （ 8人高端纯玩团+穿彝裳听三弦+环仙...</a></td>--%>
<%--                        <td class="price">￥479起</td>--%>
<%--                        <td class="action"><a class="btn" href="http://www.mafengwo.cn/sales/2869684.html?cid=1030" target="_blank" title="预订">预订</a></td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </div>--%>
    <!-- 门票 E -->
    <!-- 评论界面 S -->

<%--    <div id="_j_layer_0" class="layer _scenci_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 1000; display: block;">--%>
<%--        <div class="layer_scenic_mask _scenic_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; z-index: -1;">--%>
<%--        </div>--%>
<%--        <div class="layer_scenic_content _scenic_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;">--%>
<%--            <div class="popup-scenic-box layer_dialog _scenic_dialog pop_no_margin pop-scenic-comment" style="position: absolute; opacity: 1; background: rgb(255, 255, 255); z-index: 1; left: 326.5px; top: 106.222px;">--%>
<%--                <div class="scenicComment_dialog_title" style="display:none">--%>
<%--                    <div class="_scenic_title title">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="scenic_comment_dialog_body _scenic_content">--%>
<%--                    <div class="_scenic_weng_form_cnt">--%>
<%--                        <style type="text/css">--%>
<%--                            .pop-upload-weng {--%>
<%--                                width: 300px;--%>
<%--                            }--%>

<%--                            .pop-upload-weng ._scenic_piccomment {--%>
<%--                                display: none;--%>
<%--                            }--%>
<%--                        </style>--%>
<%--                        <div class="frego-scenic-comments">--%>
<%--                            <div id="_scenic_freego_cnt_">--%>
<%--                                <h2>--%>
<%--                                    <strong>洪崖洞民俗风貌区</strong>--%>
<%--                                    <em>*</em>为必填选项--%>
<%--                                </h2>--%>
<%--                                <form action="" method="post" class="_scenic_comment_form">--%>
<%--                                    <input type="hidden" name="wengid" value="">--%>
<%--                                    <input type="hidden" name="poiid" value="6653">--%>
<%--                                    <input type="hidden" name="poitype" value="3">--%>
<%--                                    <input type="hidden" name="publish_source" value="publish.weng.pc_poi_detail.comment">--%>
<%--                                    <div class="scenic-comment-intact-item item-star">--%>
<%--                                        <div class="label">--%>
<%--                                            <em>*</em>总体评价--%>
<%--                                        </div>--%>
<%--                                        <div class="scenic-comment-star _scenic_rankblock" data-star="" data-name="rank_star">--%>
<%--                                            <input type="hidden" name="rank_star" value="" essential="1" data-inputname="总体评价">--%>
<%--                                            <span class="_scenic_starcount star"></span>--%>
<%--                                            <div class="click-star _scenic_starlist">--%>
<%--                                                <a role="button" title="不建议" rel="nofollow"></a>--%>
<%--                                                <a role="button" title="有待改善" rel="nofollow"></a>--%>
<%--                                                <a role="button" title="还可以" rel="nofollow"></a>--%>
<%--                                                <a role="button" title="值得一去" rel="nofollow"></a>--%>
<%--                                                <a role="button" title="强烈推荐" rel="nofollow"></a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <span class="txt-tips _scenic_startip">点击星星打分</span>--%>
<%--                                    </div>--%>
<%--                                    <div class="secnic-comment-group">--%>
<%--                                    </div>--%>
<%--                                    <div class="scenic-comment-intact-item item-comment">--%>
<%--                                        <div class="label"><em>*</em>内容</div>--%>
<%--                                        <div class="content">--%>
<%--                                            <textarea class="_scenic_commentarea" name="content" essential="1" data-inputname="内容" placeholder="100字+3图，有机会评为优质点评！" data-minlen="1" data-maxlen="10000">--%>

<%--                                            </textarea>--%>
<%--                                            <p class="_scenic_commentcounttip">内容不超过10000字</p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="scenic-comment-intact-item item-photo">--%>
<%--                                        <div class="label">--%>
<%--                                            上传照片--%>
<%--                                        </div>--%>
<%--                                        <div class="content">--%>
<%--                                            <dl class="upload-box _scenic_piclist">--%>
<%--                                                <dd data-wengid="" class="_scenic_picitem_btn" id="_scenic_pluplader_btn_container_1" style="position: relative;">--%>
<%--                                                    <a class="add-place"><i></i></a>--%>
<%--                                                    <div id="aaaa" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 120px; height: 120px; overflow: hidden; z-index: -1;">--%>
<%--                                                        <input id="aaa" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept="image/jpeg,image/gif,image/png,.JPEG">--%>
<%--                                                    </div>--%>
<%--                                                </dd>--%>
<%--                                                <dd class="_scenic_picitem" data-imglink="mfwStorage18/M00/5C/6E/CoUBYGCKSuyAHyJsAAAUbFWdv_k214.png" data-picid="0">--%>
<%--                                                    <div class="place">--%>
<%--                                                        <div class="img"><img class="_scenic_edit_src" src="https://b1-q.mafengwo.net/s18/M00/5C/6E/CoUBYGCKSuyAHyJsAAAUbFWdv_k214.png?imageMogr2%2Fthumbnail%2F%21290x195r%2Fgravity%2FCenter%2Fcrop%2F%21290x195%2Fquality%2F90" style="width:120px;height:120px">--%>
<%--                                                        </div>--%>
<%--                                                        <div class="title"><h4 class="_scenic_edit_title"></h4></div>--%>
<%--                                                        <div class="scenic-mask-operate"><a class="btn-remove _scenic_remove_dd"></a></div>--%>
<%--                                                    </div>--%>
<%--                                                </dd>--%>
<%--                                                <dd class="_scenic_picitem" data-imglink="mfwStorage18/M00/5C/6E/CoUBYGCKSuyAHyJsAAAUbFWdv_k214.png" data-picid="0">--%>
<%--                                                    <div class="place">--%>
<%--                                                        <div class="img"><img class="_scenic_edit_src" src="https://b1-q.mafengwo.net/s18/M00/5C/6E/CoUBYGCKSuyAHyJsAAAUbFWdv_k214.png?imageMogr2%2Fthumbnail%2F%21290x195r%2Fgravity%2FCenter%2Fcrop%2F%21290x195%2Fquality%2F90" style="width:120px;height:120px">--%>
<%--                                                        </div>--%>
<%--                                                        <div class="title"><h4 class="_scenic_edit_title"></h4></div>--%>
<%--                                                        <div class="scenic-mask-operate"><a class="btn-remove _scenic_remove_dd"></a></div>--%>
<%--                                                    </div>--%>
<%--                                                </dd>--%>
<%--                                            </dl>--%>
<%--                                            <p style="clear:both;">图片不超过20张</p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="review-item item-action">--%>
<%--                                        <a class="btn-large _scenic_submit" role="button" title="提交">提交</a>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <a id="popup_close" class="close-btn _scenic_close"><i></i></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div id="_j_layer_1" class="layer _scenci_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 2000; display: none;">--%>
<%--        <div class="layer_scenic_mask _scenic_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0; z-index: -1;">--%>

<%--        </div>--%>
<%--        <div class="layer_scenic_content _scenic_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;">--%>

<%--        </div>--%>
<%--    </div>--%>

<%--    <div id="_j_layer_2" class="layer _scenci_layer" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 10001; display: none;">--%>
<%--        <div class="layer_scenic_mask _scenic_mask" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; z-index: -1;">--%>

<%--        </div>--%>
<%--        <div class="layer_scenic_content _scenic_content" style="position: fixed; width: 100%; height: 100%; top: 0px; left: 0px; z-index: 0; overflow: hidden;">--%>
<%--            <div id="popup_container" class="popup-box new-popbox pop_no_margin" style="position: absolute; opacity: 0; background: rgb(255, 255, 255); z-index: 0; width: 420px; left: 581.5px; top: 224px; display: none;">--%>
<%--                <a class="close-btn _scenic_close">--%>
<%--                    <i></i>--%>
<%--                </a>--%>
<%--                <div class="pop-ico" id="_scenic_alertpopicon">--%>
<%--                    <i class="i1"></i>--%>
<%--                </div><div class="pop-ctn">--%>
<%--                <p class="hd _scenic_content">图片正在上传中，请稍后...</p>--%>
<%--                <p class="bd _scenic_detail"></p>--%>
<%--            </div>--%>
<%--                <div class="pop-btns"><a role="button" tabindex="0" class="popbtn popbtn-submit _scenic_close">确定</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- 评论界面 E -->--%>
<%--    百度地图单地图--%>
<%--<script type="text/javascript">--%>
<%--    // 百度地图API功能--%>
<%--    var map = new BMap.Map("allmap");    // 创建Map实例--%>
<%--    var lng = <%=scenicInfo.getLng()%>;--%>
<%--    var lat = <%=scenicInfo.getLat()%>--%>
<%--    map.centerAndZoom(new BMap.Point(lng, lat), 11);  // 初始化地图,设置中心点坐标和地图级别--%>
<%--    //添加地图类型控件--%>
<%--    map.addControl(new BMap.MapTypeControl({--%>
<%--        mapTypes:[--%>
<%--            BMAP_NORMAL_MAP,--%>
<%--            BMAP_HYBRID_MAP--%>
<%--        ]}));--%>
<%--    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的--%>
<%--    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放--%>
<%--</script>--%>

<script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>
<%--<script type="text/javascript">--%>
<%--    // 百度地图API功能--%>
<%--    var map = new BMapGL.Map('allmap');--%>
<%--    map.centerAndZoom(new BMapGL.Point(116.404, 39.928), 15);--%>
<%--    map.enableScrollWheelZoom(true);--%>
<%--    // 创建点标记--%>
<%--    var marker1 = new BMapGL.Marker(new BMapGL.Point(116.404, 39.925));--%>
<%--    var marker2 = new BMapGL.Marker(new BMapGL.Point(116.404, 39.915));--%>
<%--    var marker3 = new BMapGL.Marker(new BMapGL.Point(116.395, 39.935));--%>
<%--    var marker4 = new BMapGL.Marker(new BMapGL.Point(116.415, 39.931));--%>
<%--    // 在地图上添加点标记--%>
<%--    map.addOverlay(marker1);--%>
<%--    map.addOverlay(marker2);--%>
<%--    map.addOverlay(marker3);--%>
<%--    map.addOverlay(marker4);--%>

<%--</script>--%>
<script type="text/javascript">
    var map = new BMapGL.Map('allmap');
    var point = new BMapGL.Point(<%=scenicInfo.getLng()%>, <%=scenicInfo.getLat()%>);
    map.centerAndZoom(point, 15);
    // 创建点标记
    marker = new BMapGL.Marker(point);
    map.addOverlay(marker);
    // 创建信息窗口
    opt = {
        width: 200,
        height: 100,
        title: 'asdkjfadkaldjkflsdkfjlksj'
    };
    infoWindow = new BMapGL.InfoWindow('bjbjbjbjbjbjjbbjbjbjbjbjbjbjbjbj', opt);
    // 点标记添加点击事件
    marker.addEventListener('click', function () {
        map.openInfoWindow(infoWindow, point); // 开启信息窗口
    });

</script>

<%--导入尾部--%>
<%--<footer>--%>
<%--    <div id="footer">--%>

<%--        <div class="why_select">--%>

<%--            <dl style="margin-left: 133px">--%>
<%--                <dt class="foot-pic">--%>
<%--                    <img src="../images/li/index/foot_1.jpeg" alt="">--%>
<%--                </dt>--%>
<%--                <dd>--%>
<%--                    <h1>产品齐全</h1>--%>
<%--                    <h2>产品自主选，随心买</h2>--%>
<%--                </dd>--%>
<%--            </dl>--%>

<%--            <dl>--%>
<%--                <dt class="foot-pic">--%>
<%--                    <img src="../images/li/index/foot_2.jpeg" alt="">--%>
<%--                </dt>--%>
<%--                <dd>--%>
<%--                    <h1>便利快捷</h1>--%>
<%--                    <h2>24小时不打烊，随时买</h2>--%>
<%--                </dd>--%>
<%--            </dl>--%>

<%--            <dl>--%>
<%--                <dt class="foot-pic">--%>
<%--                    <img src="../images/li/index/foot_3.jpeg" alt="">--%>
<%--                </dt>--%>
<%--                <dd>--%>
<%--                    <h1>安全支付</h1>--%>
<%--                    <h2>知名支付工具，放心买</h2>--%>
<%--                </dd>--%>
<%--            </dl>--%>

<%--            <dl>--%>
<%--                <dt class="foot-pic">--%>
<%--                    <img src="../images/li/index/foot_4.jpeg" alt="">--%>
<%--                </dt>--%>
<%--                <dd style="margin-right: 0px">--%>
<%--                    <h1>贴心服务</h1>--%>
<%--                    <h2>客服全年无休，安心买</h2>--%>
<%--                </dd>--%>
<%--            </dl>--%>

<%--        </div>--%>
<%--        <div class="company">--%>
<%--            <p>山东工商学院 计算机科学与技术学院 软件工程专业 2017级 毕业设计</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>

<%--<script>--%>
<%--    //轮播图搜索复选框--%>
<%--    // document.getElementById("tab_all").style.background="url(../../images/li/index/check_box_check.jpeg)";--%>
<%--    //头部--%>
<%--    document.getElementById("head_nav_index_li").style.background="#ff9d00";--%>
<%--    document.getElementById("head_nav_index_a").style.color="#FFFFFF";--%>
<%--</script>--%>
<%--<script type="text/javascript">--%>
<%--    var choosesum = [];--%>
<%--    var ss = "jsSS";--%>

<%--    $(window).on('load', function () {--%>
<%--        $('#dateChoose').selectpicker({--%>
<%--            'selectedText': '1月'--%>
<%--        });--%>
<%--    });--%>
<%--    $(window).on('load', function () {--%>
<%--        $('#dateChoose1').selectpicker({--%>
<%--            'selectedText': '1月'--%>
<%--        });--%>
<%--    });--%>
<%--    $(window).on('load', function () {--%>
<%--        $('#dateChoose2').selectpicker({--%>
<%--            'selectedText': '1月'--%>
<%--        });--%>
<%--    });--%>
<%--    $(window).on('load', function () {--%>
<%--        $('#addChoose').selectpicker({--%>
<%--            'selectedText': '深圳'--%>
<%--        });--%>
<%--    });--%>
<%--    $(window).on('load', function () {--%>
<%--        $('#themeChoose').selectpicker({--%>
<%--            'selectedText': '选择主题'--%>
<%--        });--%>
<%--    });--%>

<%--    function getDates() {--%>
<%--        var val = "", staffs = [],dates = [];--%>
<%--        //循环的取出插件选择的元素(通过是否添加了selected类名判断)--%>
<%--        for (var i = 0; i < $("li.selected").length; i++) {--%>
<%--            val = $("li.selected").eq(i).find(".text").text();--%>
<%--            if (val != '') {--%>
<%--                staffs.push(val);--%>
<%--                dates.push(val);--%>
<%--            }--%>
<%--        }--%>
<%--        choosesum = staffs;--%>
<%--    }--%>

<%--    function getAdds() {--%>
<%--        var val = "", staffs = [], adds = [];--%>
<%--        //循环的取出插件选择的元素(通过是否添加了selected类名判断)--%>
<%--        for (var i = 0; i < $("li.selected").length; i++) {--%>
<%--            val = $("li.selected").eq(i).find(".text").text();--%>
<%--            if (val != '') {--%>
<%--                staffs.push(val);--%>
<%--                adds.push(val)--%>
<%--            }--%>
<%--        }--%>
<%--        choosesum = staffs;--%>
<%--    }--%>

<%--    function getThemes() {--%>
<%--        var val = "", staffs = [], themes = [];--%>
<%--        //循环的取出插件选择的元素(通过是否添加了selected类名判断)--%>
<%--        for (var i = 0; i < $("li.selected").length; i++) {--%>
<%--            val = $("li.selected").eq(i).find(".text").text();--%>
<%--            if (val != '') {--%>
<%--                staffs.push(val);--%>
<%--                themes.push(val);--%>
<%--            }--%>
<%--        }--%>
<%--        choosesum = staffs;--%>
<%--    }--%>

<%--    function showChoose(){--%>
<%--        console.log(choosesum);--%>
<%--    }--%>

<%--</script>--%>
</body>

</html>