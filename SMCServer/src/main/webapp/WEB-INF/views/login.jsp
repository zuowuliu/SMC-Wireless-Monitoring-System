<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome气动现场远程监控系统</title>
    <script type="text/javascript" src="../../static/js2/jquery-2.0.0.min.js"></script>
    <link rel="stylesheet" href="../../static/bootstrap-3.3.7/dist/css/bootstrap.css">
    <script type="text/javascript" src="../../static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        html{height: 100%;}
        body{
            background-image: url("../../static/img/cool-background.svg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<!--表头-->
<div class="jumbotron" style="text-align: center">
    <h1>SMC无线监控系统</h1>
    <p>Industrial Fields</p>
</div>
<!--表单-->

<div class="row">
    <div class="col-md-6" id="login_div" style="text-align:center; margin-left: 350px;">
        <form class="form-horizontal" action="/loginVerify" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">userName</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="userName" id="userName_input" placeholder="用户名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">passWord</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="passWord" id="passWord_input" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="reset" class="reset btn btn-default"  value="重置" style="margin-right: 10px;"/>
                    <input class="submit btn btn-default" type="submit" value="登录" style="margin-left: 10px;"/>
                </div>
            </div>
        </form>
    </div>
</div>
<!--表尾-->
<div style="position: fixed;bottom: 10px;margin-left: 600px;">

    <div class="container">
        <p class="text-nowrap"><small><i>Copyright &copy;2019 UESTC&SMC</i></small>
            <a href="https://www.uestc.edu.cn/">电子科技大学</a></p>
    </div>

</div>
</body>
</html>