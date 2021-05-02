<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/4/18
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>
    <title>地图展示</title>
</head>
<body>
<style>
    body,
    html,
    #allmap {
        overflow: hidden;
        width: 100%;
        height: 100%;
        margin: 0;
        font-family: "微软雅黑";
    }
</style>
    <div id="allmap"></div>
</body>
</html>
<script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=MKmjSL6aurGZbHsmH7QZbHmU60ahLKsW"></script>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMapGL.Map('allmap');
    map.centerAndZoom(new BMapGL.Point(116.404, 39.928), 15);
    map.enableScrollWheelZoom(true);
    // 创建点标记
    var marker1 = new BMapGL.Marker(new BMapGL.Point(116.404, 39.925));
    var marker2 = new BMapGL.Marker(new BMapGL.Point(116.404, 39.915));
    var marker3 = new BMapGL.Marker(new BMapGL.Point(116.395, 39.935));
    var marker4 = new BMapGL.Marker(new BMapGL.Point(116.415, 39.931));
    // 在地图上添加点标记
    map.addOverlay(marker1);
    map.addOverlay(marker2);
    map.addOverlay(marker3);
    map.addOverlay(marker4);

</script>
<%--<script type="text/javascript">--%>
<%--    // 百度地图API功能--%>
<%--    var map = new BMap.Map("allmap");    // 创建Map实例--%>
<%--    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别--%>
<%--    //添加地图类型控件--%>
<%--    map.addControl(new BMap.MapTypeControl({--%>
<%--        mapTypes:[--%>
<%--            BMAP_NORMAL_MAP,--%>
<%--            BMAP_HYBRID_MAP--%>
<%--        ]}));--%>
<%--    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的--%>
<%--    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放--%>
<%--    --%>
<%--</script>--%>
