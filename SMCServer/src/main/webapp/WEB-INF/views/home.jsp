<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>无线通信远程监控系统</title>
    <link rel="stylesheet" href="../../static/style.css">

</head>
<body>

<div class="container">
    <div class="card">
        <div class="face face1">
            <div class="content">
                <img src="../../static/img/Lo/User.png" height="80" />
                <h3>User</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Information display of logged in users</p><br>
                <!--用户登录的历史信息按钮-->
                <a href="http://localhost:8080/loginInfoJump">用户登录信息</a>
                &nbsp;&nbsp;
                <a href="http://localhost:8080">退出监控系统</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <img src="../../static/img/Lo/chart.png" height="80"/>
                <h3>Data</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Real - time display of industrial field data and information</p><br>
                <!--Real-time Monitoring-->
                <a href="http://localhost:8080/nodeMessage">实时信息情况</a>
                &nbsp;
                <a href="http://localhost:8080/tcpGateWay1ServerOpen">网关服务端开关</a>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="face face1">
            <div class="content">
                <img src="../../static/img/Lo/App.png" height="80" />
                <h3>DownLoad</h3>
            </div>
        </div>
        <div class="face face2">
            <div class="content">
                <p>Download industrial site data information</p><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="http://localhost:8080/downloadFile">下载数据信息到本地</a>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

</script>
<script type="text/javascript" src="../../static/js2/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7/dist/js2/bootstrap.min.js"></script>
</html>