<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/19 0019
  Time: 下午 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网关数据</title>
    <script type="text/javascript" src="../../static/js2/jquery-2.0.0.min.js"></script>
    <link rel="stylesheet" href="../../static/bootstrap-3.3.7/dist/css/bootstrap.css">
    <script type="text/javascript" src="static/bootstrap-3.3.7/dist/js2/bootstrap.min.js"></script>
    <script src="static/echarts.min.js"></script>
</head>
<body style="background-color:floralwhite">
<div class="container">
    <!--标题-->
    <div class="row" style="margin-top: 15px;">
        <div class="col-md-12">
            <div><h1 style="align-content: center"><mark style="color:red">SMC-无线气动实验平台监控系统</mark><small>@电子科技大学</small></h1></div>
            <div><span class="label label-default">工业现场</span></div>
            <hr style="color: #0D3349"/>
        </div>
        <div class="col-md-12">
            <button class="btn btn-default glyphicon glyphicon-triangle-left" onclick=location.href='http://localhost:8080/backToHome'>Back</button>
        </div>
    </div>
    <br>
    <div class="row">
        <!--<button class="btn btn-default" onclick=location.href='http://localhost:8080/tcpGateWay1ServerOpen'>网关1服务端打开(已暂停使用，请勿点击...)</button>-->
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <!--<button class="btn btn-default" onclick=location.href='http://localhost:8080/tcpGateWay1'>测试网关1(已暂停使用，请勿点击...)</button>-->
    </div>
    <div class="row">
        <div id="NodeMessageChart1" style="width: 500px;height:400px;float:left;"></div>
        <!--<div id="output"style="width:500px; height:400px;float:right;"></div>-->
        <div><textarea id="output" style=" text-align:center;width:670px; height:350px;float:right;border-color: #9933cc";></textarea></div>
    </div>

</div>
<script type="text/javascript">
    var node_webSocket = null;
    var wsUri = "ws://localhost:8080/nodeWebSocket";
    var tmpMsg = [];
    var voltageResult = [];
    var timeResult = [];

    for(var i=0;i<1;i++){
        voltageResult.push(0);
        timeResult.push(0);
    }
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        node_webSocket = new WebSocket(wsUri);
    }
    else {
        alert('当前浏览器不支持WebSocket');
    }
    //连接发生错误的回调方法
    node_webSocket.onerror = function () {
        console.log("出现错误！");
    };
    //连接成功建立的回调方法
    node_webSocket.onopen = function () {
        // writeToScreen("WebSocket连接成功！");
        // writeToScreen("Connecting to :" + wsUri);
        $("#output").append("WebSocket连接成功！")
        $("#output").append("\n");
        $("#output").append("Connecting to :" + wsUri+"......")
        $("#output").append("\n");
    }
    //接收到消息的回调方法
    node_webSocket.onmessage = function (event) {
        if(event.data=="1"){
            location.reload();
        }else{
            //event.data数据包装的格式在IndustrialMessage的toString方法中修改
            writeToScreen(event.data);
            tmpMsg = event.data.split(" ");
            voltageResult.push(parseFloat(tmpMsg[7].substring(1)));
            //alert(voltageResult);
            timeResult.push(tmpMsg[5].substring(9,17));
            showEcharts();
            //alert(timeResult);
        }
    }
    //连接关闭的回调方法
    node_webSocket.onclose = function () {
        //连接关闭时的处理代码
    }
    //监听窗口关闭事件，当窗口关闭时，主动去关闭WebSocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }
    //关闭WebSocket连接
    function closeWebSocket() {
        node_webSocket.close();
    }
    //用于显示在界面的函数
    function writeToScreen(message){
        // var pre = document.createElement("p");
        // pre.style.wordWrap = "break_word";
        // pre.innerHTML = message;
        //output.appendChild(pre);
        output.append("\n");
        output.append(message);
    }


    <!--用于画图-->
    function showEcharts(){
        var NodeMessageChart1 = echarts.init(document.getElementById('NodeMessageChart1'));
        var  option1 ={
            //color:['#DC143C','#00FF00'],
            title: {
                text: '网关采集信息展示：'
            },
            tooltip: {
                trigger: 'axis'
            },

            itemStyle : {
                normal : {
                    color:'#32CD32', //改变折线点的颜色
                    lineStyle:{
                        color:'#DC143C' //改变折线颜色
                    }
                }
            },


            legend: {
                data:['网关数据信息展示']
            },
            xAxis: {
                type: 'category',
                data:timeResult
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: voltageResult,
                type: 'line',
                smooth: true
            }]
        };
        NodeMessageChart1.setOption(option1);
    }
</script>

</body>
</html>
