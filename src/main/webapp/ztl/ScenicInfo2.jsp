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
            <dt>适合人数</dt>
            <dd><%=scenicInfo.getScenicViewNums()%></dd>
        </dl>
        <%--        <dl>--%>
        <%--            <dt>门票</dt>--%>
        <%--            <dd>--%>
        <%--                <div>--%>
        <%--                    <br>--%>
        <%--                    tips:<br>--%>
        <%--                    具体详情请咨询景区--%>
        <%--                </div>--%>

        <%--            </dd>--%>
        <%--        </dl>--%>
        <dl>
            <dt>开放时间</dt>
            <dd>
                全天<br>
                <br>
            </dd>
        </dl>

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
</div>


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


<%--有了景点评论列表，更新评论行为--%>