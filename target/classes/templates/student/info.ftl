<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8" />
    <title>个人信息 - 学生选课系统</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/dialog/dialog.js"></script>
    <script type="text/javascript" src="/static/js/student/info.js"></script>
    <script type="text/javascript" src="/static/js/student/menu.js"></script>
</head>
<body>
<!-- 加载菜单栏部分 -->
<div  >
    <#include "/student/menu/menu.ftl">
</div>
<!-- 右侧部分 -->
<div class="course-right">
    <!-- 加载用户栏 -->
    <div >
        <#include "/student/menu/user.ftl">
    </div>
    <!-- 界面显示栏 -->
    <div class="course-show">
        <div class="course-show-title">
            <span id="select">
                <span class="glyphicon glyphicon glyphicon-user"></span>&nbsp;&nbsp;信息修改
            </span>
        </div>
        <!-- 引入其他页面 -->
        <div name="fragment">
            <form class="form-group" style="margin-left: 28%;" >
                <div class="form-inline">
                    <label>学生编号：</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" name="studentnum" value="${Session.student.getStudentNum()}" disabled="disabled" />
                </div><br/>
                <div class="form-inline">
                    <label>学生姓名：</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" name="studentname" value="${Session.student.getStudentName()}"/>
                </div><br/>
                <div class="form-inline">
                    <label>学生密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" name="password" value="${Session.student.getPassword()}""/>
                </div><br/>
                <div class="form-inline">
                    <label>学生年级：</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" name="grade" value="${Session.student.getGrade()}""/>
                </div><br/>
                <div class="form-inline">
                    <label>学生学院：</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" name="college" value="${Session.student.getCollege()}" disabled="disabled"/>
                </div><br/>
                <div class="form-inline">
                    <input type="button" name="restart" class="btn btn-default" value="重置"/>
                    &nbsp;&nbsp;
                    <input type="button" name="save" class="btn btn-primary" value="保存"  />
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 引入提示框 -->
<div class="dialog"></div>
</body>
</html>