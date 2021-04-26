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
    List<String> scenicThemeList = null;
    scenicThemeList = (List<String>)request.getAttribute("scenicThemeList");
    PageBean<ScenicInfo> scenicInfoPageBean = (PageBean<ScenicInfo>)request.getAttribute("scenicPageBean");
    List<ScenicInfo> scenicInfoList;
    if(scenicInfoPageBean!=null){
        scenicInfoList = scenicInfoPageBean.getList();
    }else{
        scenicInfoList = null;
    }

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
            <h1 style="">滇池</h1>
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
                        <a title="蜂蜂点评" href="">蜂蜂点评<span>（3310条）</span></a>
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
            ·滇池风光秀丽，为中国国家级旅游度假区，是云南最大的淡水湖。<br>
            ·紧邻大观公园，与西山森林公园、云南民族村隔水相望。<br>
            ·可沿东岸在湖边漫步，或乘船游览，冬季的时候可投喂红嘴鸥。<br>
            ·还可顺路到云南民族村游玩一番，感受云南省多民族的风情。
        </div>

        <ul class="baseinfo clearfix">
            <li class="tel">
                <div class="label">电话</div>
                <div class="content">0871-64310175;0871-64311056</div>
            </li>
            <li class="item-time">
                <div class="label">用时参考</div>
                <div class="content">1-3小时</div>
            </li>
        </ul>

        <dl>
            <dt>交通</dt>
            <dd>乘坐24、44、73路公交车至海埂公园下车，另外云南民族村有缆车往返于海埂公园与西山。</dd>
        </dl>
        <dl>
            <dt>门票</dt>
            <dd>
                <div> <br>
                    tips:<br>
                    具体详情请咨询景区</div>

            </dd>
        </dl>
        <dl>
            <dt>开放时间</dt>
            <dd>全天<br>
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
                    蜂蜂点评
                    <span>
                        （共有<em>3310</em>条真实评价）
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
                        <li data-type="1" data-category="13" class="">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>好评</span>
                                <span class="num">（2572条）</span>
                            </a>
                        </li>
                        <li data-type="1" data-category="12" class="">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>中评</span>
                                <span class="num">（588条）</span>
                            </a>
                        </li>
                        <li data-type="1" data-category="11" class="">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>差评</span>
                                <span class="num">（150条）</span>
                            </a>
                        </li>
                        <li data-type="2" data-category="182065167" class="">
                            <span class="filter-word divide"></span>
                            <a href="javascript:void(0);">值得去<span class="num">（101人提及）</span></a>
                        </li>
                        <li data-type="2" data-category="191887328" class="">
                            <span class="filter-word divide"></span>
                            <a href="javascript:void(0);">注意保暖<span class="num">（78人提及）</span></a>
                        </li>
                        <li data-type="2" data-category="187837742" class="">
                            <span class="filter-word divide"></span>
                            <a href="javascript:void(0);">人很多<span class="num">（73人提及）</span></a>
                        </li>
                        <li data-type="2" data-category="188839572" class="">
                            <span class="filter-word divide"></span>
                            <a href="javascript:void(0);">交通方便<span class="num">（60人提及）</span></a>
                        </li>
                        <li data-type="2" data-category="144602261" class="">
                            <span class="filter-word divide"></span>
                            <a href="javascript:void(0);">适合拍照<span class="num">（42人提及）</span></a>
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
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user">
                                    <a class="avatar" href="" target="_blank">
                                        <img src="" width="48" height="48">
                                    </a>
                                    <span class="level">
                                        LV.32
                                    </span>
                                </div>
                                <a class="name" href="" target="_blank">
                                    无言
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
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/63402597.html" target="_blank"><img src="https://n1-q.mafengwo.net/s11/M00/ED/15/wKgBEFteiteAX8g-AAZKCePmXyQ30.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.10</span></div>
                                <a class="name" href="/u/63402597.html" target="_blank">太阳🌞之光</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">滇池，亦称昆明湖、昆明池、滇南泽、滇海。在昆明市西南，有盘龙江等河流注入，湖面海拔1886米，面积330平方千米，云南省最大的淡水湖，有高原明珠之称。平均水深5米，最深8米。湖水在西南海口洩出，称螳螂川，为长江上游干流金沙江支流普渡河上源。<br>
                                    滇池风光秀丽，为中国国家级旅游度假区。四周有云南民族村、云南民族博物馆、西山华亭寺、太华寺、三清阁、龙门、筇竹寺、大观楼及晋宁盘龙寺、郑和公园等风景区。度假区占地面积18平方公里。<br>
                                    滇池，位于昆明坝子中央，东起呈贡区旁，西至西山之麓，北临大观公园，南入晋宁县内  。全部在云南省省会昆明市境内，北大半部属于昆明市辖区。其中，西北部属西山区，面积约占三分之一，沿岸有前卫街道、福海街道、碧鸡镇、海口镇等地；东北上部分属官渡区，面积约占六分之一，沿岸有六甲街道、官渡街道、矣六街道等地；东北下半部呈贡区，沿岸有斗南街道、龙城街道、大渔乡、马金铺乡等街道或乡镇。南部约三之分一属晋宁县，沿岸有新街乡、晋城镇、上蒜乡、晋宁县城昆阳镇、二街乡等。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_405562856.html" target="_blank"><img src="https://b1-q.mafengwo.net/s13/M00/20/8E/wKgEaVxqcEuAYDQkACB-QwQx3Y052.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562860.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/20/7A/wKgEaVxqcEKAHIIpAA8kBtQkUDA26.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562864.html" target="_blank"><img src="https://n1-q.mafengwo.net/s10/M00/43/46/wKgBZ1n4YkCAdM09AAGWc77HgE477.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562868.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/20/7B/wKgEaVxqcEOANFBeAAPDSFZfI-M57.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-02-18 16:43:59</span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="162437860" data-comment_username="太阳🌞之光" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/479199.html" target="_blank"><img src="https://p1-q.mafengwo.net/s2/M00/EE/EB/wKgBpU5sfHaN_RE1AAAjKA_AcOA61.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.35</span></div>
                                <a class="name" href="/u/479199.html" target="_blank">竹子</a>

                                <span class="s-star s-star4"></span>
                                <p class="scenic-comment-txt">滇池位于西山区滇池路，乘坐公交车44路;24路;73路;94路;135路;172路;233路，到海埂公园站下车即到。<br>
                                    滇池是免费游览的。滇池水域非常辽阔，在西山脚下那大浪花拍打悬崖峭壁的感觉，真有点像大海。滇池周围的环境也很棒，虽然是冬天，但依旧有很多绿树，而且还有鲜花盛开，空气非常清新，跟北方的雾霾天真是天壤之别啊。<br>
                                    我们是冬季去的，正是观赏红嘴鸥的最佳季节。乘坐索道去西山时，从滇池上空穿过，看到水面上浮标上有一个个小白点，仔细一看，原来是红嘴鸥。后来我们又去了海埂大坝，发现这里才是观看红嘴鸥的最佳地点，可以零距离地欣赏。岸边和水面上密密麻麻的都是红嘴鸥，真是太壮观了。海鸥也不怕人，有的就在地上溜达，看到有人想摸它时才会飞走。游客也非常多，很多人喂食海鸥，场景非常和谐。大坝上有专门售卖鸥粮的，也有面包，不过鸥粮营养更全面，海鸥能长得更结实，更能适应长途迁徙。我们喂食时，本来挺害怕被鸟叼到手，但其实很安全。大坝上有滇池码头，船票80元，可以乘坐游船畅游滇池，并在水上喂食海鸥。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_405562000.html" target="_blank"><img src="https://n1-q.mafengwo.net/s13/M00/1E/53/wKgEaVxqbz6AW8noAAE3G3pkP_o71.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562004.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/1E/54/wKgEaVxqbz6Aa7GJAADV1OIe4yw37.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562008.html" target="_blank"><img src="https://b1-q.mafengwo.net/s13/M00/1E/54/wKgEaVxqbz6AcbE1AAERMkNnvjA50.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_405562012.html" target="_blank"><img src="https://p1-q.mafengwo.net/s13/M00/1E/55/wKgEaVxqbz6ARlZrAADpQewKgZ008.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-02-18 16:39:42</span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="47309013" data-comment_username="竹子" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/19315792.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/9E/46/wKgED1uOke2AKw-zAAP-brtxDmo67.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.40</span></div>
                                <a class="name" href="/u/19315792.html" target="_blank">巅巅兔崽</a>

                                <span class="s-star s-star4"></span>
                                <p class="scenic-comment-txt">位于云南省昆明市的西南，古名滇南泽，又称昆明湖。滇池因周围居住着"滇"部落或有水似倒流、"滇者，颠也"之说，故曰"滇池"。滇池为地震断层陷落型的湖泊，其外形似一弯新月。湖面的海拔高度为1886米，南北长39公里，东西最宽为13公里。湖岸线长163.2公里，面积为306.3平方公里，容水量为15.7亿立方米，素称"五百里滇池"。主要河流有盘龙江、金汁河、宝象河、海源河、马料河、落龙河、捞鱼河等，出水口为螳螂江。滇池水由海口注入普渡河.汇入金沙江.属长江水系，流域面积2855公里，为我国的第六大淡水湖，是一颗璀璨的高原明珠。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_404001224.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/86/BF/wKgED1xhRm2AXmTwAAPrN68jHjg21.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_404001228.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/86/BE/wKgED1xhRmyAaRFNAAM13SlZUbs70.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_404001232.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/86/BE/wKgED1xhRmqAFfiPAAgAwIGb2ds28.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_404001236.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/86/BC/wKgED1xhRmiAIAaoAAfrlFIErhQ46.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-02-12 23:51:49</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11825462.html" target="_blank">《在彩云之南迎接2019己亥金猪年的第一缕阳光》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="163348876" data-comment_username="巅巅兔崽" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/88556548.html" target="_blank"><img src="https://p1-q.mafengwo.net/s10/M00/44/68/wKgBZ1mEXCKAKG6DAAj4rXbDKJ430.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.17</span></div>
                                <a class="name" href="/u/88556548.html" target="_blank">黄小丘爱旅行</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">没有选择坐游览车，和妈妈一起沿着滇池走，一路上有卖面包的，可以买来喂喂海鸥，当然，实际上也没有走很远。<br>
                                    看到此时此景，突然想到了一部弗洛伊德的作品《孤独的守望者》。<br>
                                    在走路的过程中，总感觉太阳会露出一丝光线，让我看到佛光，不过这种美景真的是可遇而不可求，就在我返回的途中，远远得看到了，不过我也懒得再跑回池子旁边了。<br>
                                    快走到尽头，地面上好多海鸥，立马放下提包，把相机交给妈妈，坐在一个石凳上，摆拍走起来，嗯，凳子上还有拍打残留的浪花，还有点凉，我不说你肯定不知道。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_430650904.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/8B/7B/wKgED1xAIYmAM_JIAA2Yoh_96T819.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_430650908.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/8B/6B/wKgED1xAIYOAWKtCAAreNcJSP3465.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_430650912.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/8B/95/wKgED1xAIZOAfaDIAA9myu2GdN890.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-01-24 22:03:36</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11704330.html" target="_blank">《带着妈妈寻找彩云之南——昆明，丽江，大理...》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply ">
                                    <ul class="more_reply_box comment_list">
                                        <li>
                                            <a href="/u/83552536.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s12/M00/35/98/wKgED1uqIreAU9QZAAAXHQMBZ74008.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">后跟
                                            </a>
                                            ：哈哈，语言可爱
                                            <a class="_j_reply re_reply" data-id="649496" data-uid="83552536" data-username="后跟" title="添加回复">回复</a>
                                            <br><span class="time">2019-07-08 14:41:42</span>
                                        </li>
                                        <li>
                                            <a href="/u/88556548.html" target="_blank">
                                                <img src="https://p1-q.mafengwo.net/s10/M00/44/68/wKgBZ1mEXCKAKG6DAAj4rXbDKJ430.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">黄小丘爱旅行
                                            </a>
                                            回复后跟：✌✌✌
                                            <a class="_j_reply re_reply" data-id="652835" data-uid="88556548" data-username="黄小丘爱旅行" title="添加回复">回复</a>
                                            <br><span class="time">2019-07-10 16:04:48</span>
                                        </li>
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190467647" data-comment_username="黄小丘爱旅行" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/88062055.html" target="_blank"><img src="https://p1-q.mafengwo.net/s14/M00/2C/C8/wKgE2l0wCcSAUegdAAThRHpiUFA24.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.33</span></div>
                                <a class="name" href="/u/88062055.html" target="_blank">小白叉</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">滇池的名气很大，对于我们来说滇池就是昆明的名片。一个大晴天，天空湛蓝湛蓝的，湖水也蓝的让人心醉，这张照片像极了法国阿维尼翁的湖泊，清晨的滇池湖面非常平静。大批的红嘴鸥也在睡懒觉。栗子第一次和小鸟这么近距离接触，本来以为他会害怕，结果完全是我们瞎担心，他一点也不害怕，在红嘴鸥旁边跑来跑去，追赶他们，开心得不行。这些红嘴鸥有时全部停在湖面上休憩，有时又会突然一起起飞，场面非常壮观。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_412142172.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/D0/4E/wKgED1wZuICAbGnBABbYcdPckvE56.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_412142176.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/27/7C/wKgED1v_51OAKzdFACFCU64iVB483.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_412142180.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/27/8B/wKgED1v_51qAd4K0AA-MaUsrf4E71.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_412142184.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/27/78/wKgED1v_51GAeoBBABcMy1LKyDQ48.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2018-12-25 19:00:35</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11477350.html" target="_blank">《#我的2018# 云南抚仙湖|灿烂千阳，环湖亲子...》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190224314" data-comment_username="小白叉" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/76905933.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/D0/4E/wKgED1wnlDmAbaVtAA_OzmKlWUA79.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.45</span></div>
                                <a class="name" href="/u/76905933.html" target="_blank">享受生活</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">当我来到滇池的海埂大坝时，眼睛为之一亮。因为，不是滇池太大了，而是红嘴鸥太多了！目之所及，一大片一大片的，它们有的在湖面上下起伏，随波逐流；有的在空中左右盘旋、展翅飞舞......尤其当你手中有它们喜爱的食物时，这些个精灵没有丝毫的胆怯，争先恐后的围绕在你的身边翩翩起舞。甚至会站在你的手上、肩膀上和头顶上，充分展示着人与自然的和谐。此时的你，和这些飞舞的精灵玩耍嬉戏，心情肯定会愉悦的一塌糊涂。<br>
                                    更多的红嘴鸥围绕在人们周围，与之共舞，唱响人与自然的和谐之歌。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_412037052.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/FA/5B/wKgED1wUToCAeK9vAAvKLhDXioM20.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_412037056.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/FA/5D/wKgED1wUToGAaDuyAAqRuHkC51I23.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_412037060.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/92/F3/wKgED1wNFUSAXS4VABccERkwMQQ11.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2018-12-23 15:52:54</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11459462.html" target="_blank">《云之南东南，滇之美中美。》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190218903" data-comment_username="享受生活" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/43703253.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/76/7A/wKgED1wTkkyAUOCIAADwCdTbT2Y09.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.12</span></div>
                                <a class="name" href="/u/43703253.html" target="_blank">black rose</a>

                                <span class="s-star s-star4"></span>
                                <p class="scenic-comment-txt">本以为就是就是一个湖看看而已，一到大坝，还是蛮让人兴奋的，整个一排一排的海鸥和游人互动，经常变换队形飞我们2⃣️兴奋的不停拍视频<br>
                                    慢悠悠逛啦两个小时，随便在大坝边上吃啦点小吃！（不建议在附近吃小吃，味道一般。）</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_409638432.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/59/A2/wKgED1wRzgOAXQ09AAmqORS2oSc74.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_409638436.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/59/9C/wKgED1wRzgKAdPi_AAbVAzXwtY429.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_409638440.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/5B/71/wKgED1wRzseAJgm3AAnSQz6JdAI98.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_409638444.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/5B/BF/wKgED1wRzw6AE8V6AAjRL9NeEhc30.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2018-12-14 19:18:53</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11394422.html" target="_blank">《体验云南不一样的魅力-腾冲.瑞丽.芒市》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="190128644" data-comment_username="black rose" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/42019021.html" target="_blank"><img src="https://n1-q.mafengwo.net/s12/M00/F0/B9/wKgED1v5VWKADk5tAABeBgb1oME31.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.6</span></div>
                                <a class="name" href="/u/42019021.html" target="_blank">暢暢-暢小懒</a>

                                <span class="s-star s-star4"></span>
                                <p class="scenic-comment-txt">哎..怎么说呢&nbsp;我是有点选后悔了、虽然作为云南省最大的淡水湖的确震撼.还有一群一群的红嘴海鸥.BUT我是个在海边长大的孩纸..这些.给我心灵的撞击确实是小。<br>
                                    我建议你们带点面包或者饼干去喂海鸥、那里卖的海鸥食是十元一份、但太多了.我就是没用完拎了一路、自己还不能吃</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_404183200.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/08/4E/wKgED1vyJtyAXAt9AAorLPIWBLs95.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_404183204.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/08/69/wKgED1vyJvCAFTTwAA8KJYK-P1w91.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_404183208.html" target="_blank"><img src="https://p1-q.mafengwo.net/s12/M00/63/AE/wKgED1vyclGAHj9VAAhrVtpa9XI55.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2018-11-24 20:58:25</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/11249602.html" target="_blank">《你好👋云南》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply ">
                                    <ul class="more_reply_box comment_list">
                                        <li>
                                            <a href="/u/51706977.html" target="_blank">
                                                <img src="https://b1-q.mafengwo.net/s12/M00/35/52/wKgED1uqInuAITIBAAAiWI3ZI5o530.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">马蜂窝用户
                                            </a>
                                            ：自己还不能吃 你是魔鬼吗
                                            <a class="_j_reply re_reply" data-id="480332" data-uid="51706977" data-username="马蜂窝用户" title="添加回复">回复</a>
                                            <br><span class="time">2019-03-04 14:33:44</span>
                                        </li>
                                        <li class="_j_morereply">
                                            <a title="展开全部回复">还有<span class="more_cnt">5</span>条回复</a>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/42019021.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s12/M00/F0/B9/wKgED1v5VWKADk5tAABeBgb1oME31.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">暢暢-暢小懒
                                            </a>
                                            回复马蜂窝用户：哈哈哈哈哈 好浪费的
                                            <a class="_j_reply re_reply" data-id="490168" data-uid="42019021" data-username="暢暢-暢小懒" title="添加回复">回复</a>
                                            <br><span class="time">2019-03-13 10:48:50</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/30336332.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s17/M00/33/D8/CoUBXl-FMGaAOMlmAAtLdgaZGtI55.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">小叶.走走瞧
                                            </a>
                                            ：自己还不能吃``戳中笑点
                                            <a class="_j_reply re_reply" data-id="716227" data-uid="30336332" data-username="小叶.走走瞧" title="添加回复">回复</a>
                                            <br><span class="time">2019-09-03 16:46:59</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/30876914.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s18/M00/D4/1B/CoUBYGAvai-AFfKdAACHjp4-EG870.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">得意的 🐷
                                            </a>
                                            ：10月份有海鸥吗，国庆去
                                            <a class="_j_reply re_reply" data-id="722527" data-uid="30876914" data-username="得意的 🐷" title="添加回复">回复</a>
                                            <br><span class="time">2019-09-16 21:25:42</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/42019021.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s12/M00/F0/B9/wKgED1v5VWKADk5tAABeBgb1oME31.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">暢暢-暢小懒
                                            </a>
                                            回复得意的 🐷：sorry刚看到  应该是有海鸥的  我十一月份去的天气也很暖和 全是海鸥
                                            <a class="_j_reply re_reply" data-id="740583" data-uid="42019021" data-username="暢暢-暢小懒" title="添加回复">回复</a>
                                            <br><span class="time">2019-10-14 13:27:20</span>
                                        </li>
                                        <li class="reply_more hide">
                                            <a href="/u/30876914.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s18/M00/D4/1B/CoUBYGAvai-AFfKdAACHjp4-EG870.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">得意的 🐷
                                            </a>
                                            回复暢暢-暢小懒：好吧，去回来了，国庆没有海鸥
                                            <a class="_j_reply re_reply" data-id="740623" data-uid="30876914" data-username="得意的 🐷" title="添加回复">回复</a>
                                            <br><span class="time">2019-10-14 14:42:41</span>
                                        </li>
                                        <li>
                                            <a href="/u/42019021.html" target="_blank">
                                                <img src="https://n1-q.mafengwo.net/s12/M00/F0/B9/wKgED1v5VWKADk5tAABeBgb1oME31.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90" width="16" height="16">暢暢-暢小懒
                                            </a>
                                            回复得意的 🐷：那可能海鸥去看大阅兵了😅
                                            <a class="_j_reply re_reply" data-id="750179" data-uid="42019021" data-username="暢暢-暢小懒" title="添加回复">回复</a>
                                            <br><span class="time">2019-11-10 19:29:50</span>
                                        </li>
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="163407752" data-comment_username="暢暢-暢小懒" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/82782110.html" target="_blank"><img src="https://p1-q.mafengwo.net/s11/M00/DE/F3/wKgBEFt1QDiAIVhvAAAQvt31nd831.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.9</span></div>
                                <a class="name" href="/u/82782110.html" target="_blank">滢滢་</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">景观：<br>
                                    风景还不错，适合这个季节出游，沿池边步行，慢慢体会这自然风光，心情无限惬意。<br>
                                    每年11月至次年3月，是红嘴鸥翱翔池面的时节，一只只都好可爱的凌驾于水上，岸边有卖面包、饼干的小铺，专门哄喂它们的，不过你要是想他来你的手边吃，就要“放长线，钓大鱼”了，因为它们很害怕，会小心翼翼并飞速跑“掉头逃跑”的！<br>
                                    <br>
                                    设备：<br>
                                    附近设置有自行车租赁点，双人（可带孩子座椅）的自行车30元/时，单人自行车20元/时，押金是300元或者身份证都可以，可以慢慢骑着自行车从租赁点骑到西山脚下再骑到海埂村，席间可以把车停靠路边，跟自然植物、景观合影留念，或者带着家人找一处阴凉地方，静静感受～<br>
                                    <br>
                                    饮品：<br>
                                    园内有一处卖酸奶的地方，是当地酸奶，推荐黑色盖子和蓝色盖子的！黑色盖子是无添加，蓝色盖子蛋白质高一些，都是5元一瓶，不可错过！<br>
                                    <br>
                                    乘车：<br>
                                    从市内打车过去，如果用滴滴叫快车，大概45元左右，大概25分钟左右。公交只需4元（需要倒一次车），大概1个小时左右，骑自行车，用手机扫一扫二维码（滴滴绿色小青桔、支付宝蓝色哈罗/小黄车、摩拜橘黄色）都有，而且很多，大概需要2个小时左右。<br>
                                    推荐去的时候打车，回来的时候在乘公交和骑车二选一，因为途中可以慢慢欣赏这四季花城带来的别样景色。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_327867520.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/AE/A7/wKgED1vo-9-AJWnDAANxA0HQRJs30.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_327867524.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/AE/A8/wKgED1vo--CAW1HUAAVNIhoLobE72.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_327867528.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/AE/A9/wKgED1vo--CAFIVQAAQd9uaO35Y38.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_327867532.html" target="_blank"><img src="https://b1-q.mafengwo.net/s12/M00/AE/AB/wKgED1vo--GAJYBKAAjuUgsYNmw42.jpeg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2018-11-12 12:04:50</span>
                                    <span class="from">
                                    此条点评来自<a href="/app/intro/gonglve.php" target="_blank">马蜂窝旅游APP</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="157660404" data-comment_username="滢滢་" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/93929288.html" target="_blank"><img src="https://n1-q.mafengwo.net/s11/M00/BC/A3/wKgBEFp8j46AFZQZACcU9YnDWPk10.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.40</span></div>
                                <a class="name" href="/u/93929288.html" target="_blank">长脸张少侠</a>

                                <span class="s-star s-star3"></span>
                                <p class="scenic-comment-txt">【滇池】<br>
                                    <br>
                                    滇池，亦称 昆明 湖、 昆明 池、滇南泽、滇海。在 昆明 市西南，有盘龙江等河流注入，湖面海拔1886米，面积330平方千米，是 中国 第六大的 淡水 湖，有高原明珠之称。平均水深5米，最深8米。<br>
                                    湖面的海拔高度为1886米，南北长39公里，东西最宽为13公里。湖岸线长163.2公里，面积为306.3平方公里，容水量为15.7亿立方米，素称"五百里滇池"。<br>
                                    交通：<br>
                                    乘坐24、44、73路公交车至海埂公园下车，另外 云南 民族村有缆车往返于海埂公园与西山。<br>
                                    门票免费</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_528903195.html" target="_blank"><img src="https://p1-q.mafengwo.net/s17/M00/57/69/CoUBXl_oWECAXBiwAC_w7CK2V34524.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_528903199.html" target="_blank"><img src="https://b1-q.mafengwo.net/s17/M00/57/73/CoUBXl_oWEOAVjv0AD7-OU2r7io958.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_528903203.html" target="_blank"><img src="https://p1-q.mafengwo.net/s17/M00/57/7C/CoUBXl_oWEWARgHpADXZMCP1-gk104.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_528903207.html" target="_blank"><img src="https://n1-q.mafengwo.net/s17/M00/57/84/CoUBXl_oWEiAUGpTADBt39QAVcY817.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2020-12-27 17:48:32</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/21331876.html" target="_blank">《玉龙飞舞 彩云之南｜独行川贵云藏【三】》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="194977933" data-comment_username="长脸张少侠" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/667293.html" target="_blank"><img src="https://b1-q.mafengwo.net/s8/M00/9D/11/wKgBpVVsZQmAaK7FAAIAZgvPcVc85.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.32</span></div>
                                <a class="name" href="/u/667293.html" target="_blank">欣喜</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">5年前我们路过滇池，在还没竣工的高架桥上看到成百只的红嘴鸥或成排站在栏杆上或在半空盘旋飞舞，那时起就一直念念不忘滇池，这次总算如愿了</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_496642731.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/9D/72/CoUBGV4IoRSAH_4HAAuJsMC3vog311.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_496642735.html" target="_blank"><img src="https://n1-q.mafengwo.net/s15/M00/9D/66/CoUBGV4IoQ6AJ821ABZqVMeO2j0088.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_496642739.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/9D/9B/CoUBGV4IoSWARaVlAAe_WZRipTc250.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_496642743.html" target="_blank"><img src="https://n1-q.mafengwo.net/s15/M00/9D/51/CoUBGV4IoQSAP_LKAAUqyXz42iU984.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2020-02-17 17:08:10</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/18638275.html" target="_blank">《带着梦想去旅行》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="194103538" data-comment_username="欣喜" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/89520277.html" target="_blank"><img src="https://p1-q.mafengwo.net/s6/M00/72/19/wKgB4lMnqu6AVKlLAAEVt1w9G4c44.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.28</span></div>
                                <a class="name" href="/u/89520277.html" target="_blank">闲庭信步</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">滇池，位于西山脚下，方圆五百里，从昆明火车站可乘44路公交直达滇池畔海埂公园。<br>
                                    海埂，原是一条由东向西横插入滇池中的长堤，东面从金家河起，徐徐向西延伸，止于距西山脚一里许的滇池中，隔水与西山、大观楼等名胜遥相呼应，成为浑然一体的游览区。堤长约四公里半，宽处从四五十米至二三百米不等。<br>
                                    从这里遥望西山，能真切地看到睡美人山的容姿，面容清淅，曲线婀娜，秀发流转，四季景色各有不同。<br>
                                    每年冬季飞来过冬的红嘴鸥，吸引着无数的游人前往，面包10元一袋，我们恰好有荷叶饼，手起食落，红嘴鸥们前呼后拥，争先恐后，精准接食，人与动物们皆大欢喜！</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_494627919.html" target="_blank"><img src="https://b1-q.mafengwo.net/s15/M00/E5/FF/CoUBGV4w_gmAEaAbAAGWfcSzOBc378.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_494627923.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/E5/7C/CoUBGV4w_ZeASxTSAAEVf_QKNrA806.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_494627927.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/C8/FC/CoUBGV4T_WOATsDVAAsuLJhyFNs295.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_494627931.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/CA/A1/CoUBGV4T_hqAIh-4AALAaHWBfO0474.jpg?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2020-01-29 11:38:48</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/18541153.html" target="_blank">《追逐阳光——昆明大理十日自助游》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="194014269" data-comment_username="闲庭信步" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                            <li class="scenic-comment-item scenic-review-list-item clearfix">
                                <div class="user"><a class="avatar" href="/u/90489627.html" target="_blank"><img src="https://p1-q.mafengwo.net/s8/M00/59/B6/wKgBpVVgldaAXEzSAAFJ24Ssdx005.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90" width="48" height="48"></a><span class="level">LV.32</span></div>
                                <a class="name" href="/u/90489627.html" target="_blank">生命线</a>

                                <span class="s-star s-star5"></span>
                                <p class="scenic-comment-txt">这个地方景色真的不错，美如画卷。不过十月份的时候看到的海鸥数量很少，要到十一月份，才会有大量的海鸥出现。这个地方可以说是昆明旅游必到一个地方。也是观赏海鸥的最佳场所。来滇池游玩，不妨留多些时间，这里附近也有些景点值得去游玩的。</p>



                                <div class="scenic-comment-img">
                                    <a href="/photo/poi/19779_482190383.html" target="_blank"><img src="https://b1-q.mafengwo.net/s15/M00/51/5B/CoUBGV267VqAGeKtAA-fcrh3qtU641.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_482190387.html" target="_blank"><img src="https://n1-q.mafengwo.net/s15/M00/51/64/CoUBGV267V6ARHQsABHhfJV1skk017.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_482190391.html" target="_blank"><img src="https://b1-q.mafengwo.net/s15/M00/51/68/CoUBGV267V-AGvYLABKLwoMj8i4826.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                    <a href="/photo/poi/19779_482190395.html" target="_blank"><img src="https://p1-q.mafengwo.net/s15/M00/51/6C/CoUBGV267WCAJjqdABNL9mrVBnY448.JPG?imageMogr2%2Fthumbnail%2F%21200x120r%2Fgravity%2FCenter%2Fcrop%2F%21200x120%2Fquality%2F100" width="200" height="120"></a>
                                </div>

                                <div class="info clearfix">
                                    <a class="btn-comment _j_comment" title="添加评论">评论</a>
                                    <span class="time">2019-11-21 12:46:06</span>
                                    <span class="from">
                                    此条点评来自游记<a href="/i/17884513.html" target="_blank">《【致曾经的你】从昆明到大理 ~ 动车四天双城记》</a>
                                </span>
                                </div>

                                <div class="scenic-comment-review add-reply hide">
                                    <ul class="more_reply_box comment_list">
                                    </ul>

                                    <div class="add-comment hide reply-form">
                                        <textarea class="comment_reply" data-comment_id="193643410" data-comment_username="生命线" data-poi_id="19779" data-poi_name="滇池" data-parent_id="" data-parent_uid="" data-parent_username="" style="overflow: hidden; color: rgb(204, 204, 204);"></textarea>
                                        <a class="btn btn_submit_reply">回复</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div align="right" class="scenic-comment-pagination">
                        <span class="count">共<span>5</span>页 / <span>3310</span>条</span>

                        <span class="pg-current">1</span>
                        <a class="pi" title="第2页" href="">2</a>
                        <a class="pi" title="第3页" href="">3</a>
                        <a class="pi" title="第4页" href="">4</a>
                        <a class="pi" title="第5页" href="">5</a>

                        <a class="pi pg-next" href="" title="后一页">后一页</a>
                        <a class="pi pg-last" href="" title="末页">末页</a>
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