<%--
  Created by IntelliJ IDEA.
  Author: Macro
  Date: 2021/5/5
  Time: 10:57
  Describe:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>
    <title>父窗体</title>

</head>
<body>
    <form id="form1" name="form1" method="post" action="">
        <label>
            <input type="text" name="txt_Value" id="txt_Value" />
        </label>
        <label>
            <input type="button" name="btn_ShowClose" id="btn_ShowClose" value="打开一个窗口" onclick="OpenWindow()"/>
        </label>
    </form>
</body>
<script language="JavaScript" type="text/javascript">
    function OpenWindow() {
        window.open(
            "CommentScenic.jsp",
            "newwindow",
            "height=600, width=1000, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")
    }
    function setValue(value) {
        document.getElementById("txt_Value").value = value;
    }
</script>
</html>
