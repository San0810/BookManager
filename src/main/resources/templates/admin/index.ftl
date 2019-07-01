<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8" />
    <title>首页 - 管理员系统</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/admin/menu.js"></script>
</head>
<body>
<!-- 加载菜单栏部分 -->
<div  >
    <#include "/admin/menu/menu.ftl">
</div>
<!-- 右侧部分 -->
<div class="course-right ">
    <!-- 加载用户栏 -->
    <div >
        <#include "/admin/menu/user.ftl">
    </div>
    <!-- 界面显示栏 -->
    <div class="course-show">
        <div class="course-show-title">
            <span id="select">
                <span class="glyphicon glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页
            </span>
        </div>
        <div name="fragment">
            <div class="course-userInfo">
                <table class="table">
                    <thead class="">
                    <tr>
                        <th>个人信息</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>工作号：<span >${Session.admin.getWorkNum()}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>姓名：<span >${Session.admin.getName()}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="course-indexInfo">
                <div class="course-indexInfo-title">
                    <img src="/static/img/title2.png" width="20" height="20"/>&nbsp;&nbsp;Tips:
                </div>
                <ul>
                    <li>点击信息修改更改管理员基本信息</li>
                    <li>在课程中心进行课程操作</li>
                    <li>点击选课情况查看课程选课情况</li>
                </ul>
            </div>
            <div class="course-indexInfo">
                <div class="course-indexInfo-title">
                    <img src="/static/img/title3.png" width="20" height="20"/>&nbsp;&nbsp;选课情况:
                </div>
                <table class="table table-bordered">
                    <tr>
                        <td>选课模式：正选</td>
                        <td>选课策略：可选可退</td>
                    </tr>
                    <tr>
                        <td>开始时间：2018/7/1</td>
                        <td>结束时间：2018/8/1</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>