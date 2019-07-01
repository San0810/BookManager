<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8" />
    <title>已选课程 - 学生选课系统</title>
    <<link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/dialog/dialog.js"></script>
    <script type="text/javascript"src="/static/js/student/selected.js"></script>
    <script type="text/javascript" src="/static/js/student/menu.js"></script>
</head>
<body>
<!-- 加载菜单栏部分 -->
<<div  >
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
            <span name="select">
                <span class="glyphicon glyphicon glyphicon-check"></span>
                &nbsp;&nbsp;已选课程
            </span>
        </div>
        <div name="fragment">
            <table class="table table-bordered table-hover table-striped" style="color: #8692a1;">
                <thead>
                <tr>
                    <th >课程编号</th>
                    <th>课程名</th>
                    <th>任课老师</th>
                    <th>上课时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list selectList as item>
                    <tr>
                        <td name="courseName">${item.courseNum}</td>
                        <td>${item.courseName}</td>
                        <td>${item.teacher}</td>
                        <td>${item.time}</td>
                        <td>&nbsp;
                        <input type="button" value="退课" class="btn btn-success" name="back" id="back" />
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 引入提示框 -->
<div class="dialog"></div>
</body>
</html>