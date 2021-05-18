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
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/ztl/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>直接嵌套显示</legend>
</fieldset>

<div class="site-demo-laydate">
    <div class="layui-inline" id="test-n1"></div>
</div>
<div>
    <button style="width: 100px;height: 50px" id="hhh" onclick="function showDate() {
        alert('123');
        }">显示value</button>
</div>


<script src="/ztl/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            ,position: 'static'
            ,min: 1
            ,max: 21
            ,theme: '#FF9D00'
            ,showBottom: true
            ,calendar: true
            ,change: function (value, date){
                alert('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
                document.getElementById('hhh').setAttribute('value',value);
            }
            ,done: function (value, date){
                alert('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
            }
        });

    });
</script>

</body>
</html>