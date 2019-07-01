<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>学生选课系统</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/login.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/dialog/dialog.js"></script>
    <script type="text/javascript" src="/static/js/login/login.js"></script>
</head>
<body>
    <div >
        <div   class="panel panel-default course-login" >
            <div class="panel-body">
                <img src="/static/img/course2.png" width="30" height="30" style="float: left;" />
                <h4>选课系统</h4>
            <hr/>
            <form  action="/login/login.do" method="post" onsubmit="return checkForm()">
                <input type="text"class="form-control" id="id" name="id"  placeholder="学号:"><br/>
                <input type="password" class="form-control" id="password" name="password"  placeholder="密码:"><br/>
                <input type="submit"class="btn-primary" name="submit"  value="登录">
                <br>
                <span><font color="red" id="error">${errorInfo }</font></span>
            </form>
            </div>
            <br>

        </div>
    </div>
    <!-- 引入提示框 -->
    <div class="dialog"></div>
</body>
</html>