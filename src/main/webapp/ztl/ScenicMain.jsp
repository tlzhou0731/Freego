<%@ page import="domain.ScenicInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Macro
  Date: 2021/4/18
  Time: 14:29
  Describe:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="../ztl/js/jquery-3.3.1.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 500px;
        }
    </style>

    lww的jsp
    <script type="text/javascript" src="../lww/js/include.js"></script>


    <title> 景点主界面 </title>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <%
        List<ScenicInfo> scenicInfoList = null;
        scenicInfoList = (List<ScenicInfo>)request.getAttribute("scenicInfoList");%>

    <%--轮播图--%>
    <section id="freego_banner">

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
                        <img src="images/ztl/scenic/scenic_show_1.jpg" alt="" class="banner-picture">
                    </a>
                </div>

                <div id="banner_2" class="item">
                    <a href="" class="show-title">
                        <div class="show-date">2021.4.19</div>
                        <div class="travelnote-title">常州金坛亲子游｜撷一肩春色，跟着小念一起花样春游吧</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="images/ztl/scenic/scenic_show_3.jpg" alt="" class="banner-picture">
                    </a>
                </div>

                <div id="banner_3" class="item">
                    <a href="" class="show-title">
                        <div class="show-date">2021.4.19</div>
                        <div class="travelnote-title">别样东莞｜广东第四城的美食和古迹</div>
                    </a>
                    <a href="" class="show-pic">
                        <img src="images/ztl/scenic/scenic_show_3.jpg" alt="" class="banner-picture">
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


<%--    <div id="scenicCarousel1" class="carousel slide" data-ride="carousel">--%>
<%--        <ol class="carousel-indicators">--%>
<%--            <li data-target="#scenicCarousel1" data-slide-to="0" class="active"></li>--%>
<%--            <li data-target="#scenicCarousel1" data-slide-to="1"></li>--%>
<%--            <li data-target="#scenicCarousel1" data-slide-to="2"></li>--%>
<%--        </ol>--%>
<%--        <div class="carousel-inner">--%>
<%--            <div class="carousel-item active">--%>
<%--                <img src="images/ztl/scenic/scenic_show_1.jpg" class="d-block w-100" alt="First slide">--%>
<%--            </div>--%>
<%--            <div class="carousel-item">--%>
<%--                <img src="images/ztl/scenic/scenic_show_2.jpg" class="d-block w-100" alt="second slide">--%>
<%--            </div>--%>
<%--            <div class="carousel-item">--%>
<%--                <img src="images/ztl/scenic/scenic_show_3.jpg" class="d-block w-100" alt="third slide">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <a class="carousel-control-prev" href="#scenicCarousel1" role="button" data-slide="prev">--%>
<%--            <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--            <span class="sr-only">Previous</span>--%>
<%--        </a>--%>
<%--        <a class="carousel-control-next" href="#scenicCarousel1" role="button" data-slide="next">--%>
<%--            <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--            <span class="sr-only">Next</span>--%>
<%--        </a>--%>
<%--    </div>--%>


    <div>
        <%if(scenicInfoList != null){
            for (int i = 0;i < scenicInfoList.size();i++){%>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><%=scenicInfoList.get(i).getProvince()%></td>
                    <td><%=scenicInfoList.get(i).getScenicAddress()%></td>
                    <br>
                </tr>
        <%}}else{%>
        <h1>没值</h1>
        <%}%>
    </div>

</body>

</html>
