<%--
  Created by IntelliJ IDEA.
  Author: Macro
  Date: 2021/5/5
  Time: 10:52
  Describe:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>评论景点界面</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="/ztl/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="/ztl/js/jquery-1.11.0.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="/ztl/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/ztl/layui/css/layui.css" type="text/css" media="all">
    <link rel="stylesheet" href="/ztl/css/scenicComment.css" type="text/css" media="all">

</head>
<body>
<%
    int scenicId = (Integer)request.getAttribute("scenicId");
    int userId = (Integer)request.getAttribute("userId");
    int parentId = (Integer)request.getAttribute("parentId");
    int parentCommentId = (Integer)request.getAttribute("parentCommentId");
    String scenicName = (String)request.getAttribute("scenicName");
//    scenicId=609;
//    userId=1014;
//    parentId=-1;
//    parentCommentId=-1;
%>

<div style="width: 1000px;margin: auto;margin-top: 60px" class="mfw-reviews">
    <div id="_j_wengform_cnt_20210505133118_857">
        <h2>
            <strong><%=scenicName%>></strong>
            <em>*</em>为必填选项
        </h2>
        <form action="${pageContext.request.contextPath}/ScenicServlet?methodName=addScenicComment&scenicId=<%=scenicId%>&userId=<%=userId%>&parentId=<%=parentId%>&parentCommentId=<%=parentCommentId%>&currentPage=1&rows=2" method="post" class="_j_commentdialogform">
            <div class="review-item item-star">
                <div class="label"><em>*</em>总体评价</div>
                <div class="review-star _j_rankblock" data-star="" data-name="rank_star">
                    <div id="scenicStar"></div>
                    <input id="scenicStarId" name="scenicStar" value="" style="display: none">
                </div>
            </div>

            <div class="review-item item-comment">
                <div class="label"><em>*</em>内容</div>
                <div class="content">
                    <textarea class="_j_commentarea" name="commentText" essential="1" data-inputname="内容" placeholder="100字+3图，有机会评为优质点评！" data-minlen="1" data-maxlen="10000"></textarea>
                    <p class="_j_commentcounttip">内容不超过10000字</p>
                </div>
            </div>
            <div class="review-item item-photo">
                <div class="label">上传照片</div>
                <div class="content">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="test2">添加图片</button>
                        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                            预览图：
                            <div class="layui-upload-list" id="demo2" name="commentPictures"></div>
                        </blockquote>
                    </div>
                    <p style="clear:both;">图片不超过20张</p>
                </div>
            </div>
            <div class="review-item item-action">
                <button style="border: none" id="submitComment" class="btn-large _j_submit" role="button" title="提交">提交</button>
            </div>
        </form>
    </div>


</div>

<script src="/ztl/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use(['rate'], function(){
        var rate = layui.rate;
        //自定义文本
        rate.render({
            elem: '#scenicStar'
            ,value: 3
            ,text: true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '不建议'
                    ,'2': '有待改善'
                    ,'3': '还可以'
                    ,'4': '值得一去'
                    ,'5': '强烈推荐'
                };
                this.span.text(arrs[value]);
                document.getElementById('scenicStarId').value=value;
            }

        })
    });

</script>


<script>
    layui.use(['upload', 'element', 'layer'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;

        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: 'https://httpbin.org/post' //改成您自己的上传接口
            // ,url: '/ScenicServlet' //改成您自己的上传接口
            ,multiple: true
            ,auto:false
            ,accept: 'file' //普通文件
            ,exts: 'jpg|jpeg|png' //只允许上传压缩文件
            // ,bindAction: '#submitComment'
            ,choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">');
                    alert(index);
                    var picPathURL = window.URL.createObjectURL(file);
                    alert("picPathURL = "+picPathURL);
                });
            }
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">');
                    alert(index);
                    alert(result);
                    alert(file.name);
                    alert(result.data.src)

                });
            }
            ,done: function(res){

            }
        });


    });


</script>

</body>
</html>
