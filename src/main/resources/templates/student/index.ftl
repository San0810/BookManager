<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8" />
    <title>首页 - 学生选课系统</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/dialog/dialog.js"></script>
    <script type="text/javascript" src="/static/js/student/menu.js"></script>
    <script>
        $(function () {
            $(".dialog").load("/static/page/dialog.html");
            $("#getIn").click(function () {
                var date = $("#start").html();
                console.log("1111111");
                console.log(date)
                $.post("/student/check",
                        {
                            "date":date
                        },function (result) {
                            if(result.success){
                                window.location.href="/course?page=1";
                            }else {
                                //alert("选课未开始");
                                dialog("选课未开始");
                            }
                        },"json");
            });
        })
    </script>
</head>
<body>
<div class="dialog"></div>
<!-- 加载菜单栏部分 -->
<div  >
    <#include "/student/menu/menu.ftl">
</div>
<!-- 右侧部分 -->
<div class="course-right ">
    <!-- 加载用户栏 -->
    <div >
        <#include "/student/menu/user.ftl">
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
                        <td>学号：<span >${Session.student.getStudentNum()}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>姓名：<span >${Session.student.getStudentName()}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>年级：<span >${Session.student.getGrade()}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>学院：<span >${Session.student.getCollege()}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="course-indexInfo">
                <div class="course-indexInfo-title">
                    <img src="/static/img/title2.png" width="20" height="20"/>&nbsp;&nbsp;选课说明:
                </div>
                <ul>
                    <li>点击信息修改更改学生基本信息</li>
                    <li>在选课中心进行选课操作</li>
                    <li>点击已选课程能查看所选课程以及退课操作</li>
                    <li>点击生成课表来查看课程表</li>
                </ul>
            </div>
            <div class="course-indexInfo">
                <div class="course-indexInfo-title">
                    <img src="/static/img/title3.png" width="20" height="20"/>&nbsp;&nbsp;选课开发情况:
                </div>
                <table class="table table-bordered">
                    <tr>
                        <td>选课模式：正选</td>
                        <td>选课策略：可选可退</td>
                    </tr>
                    <tr>
                        <td>开始时间：<span id="start" >2019-06-21 20:07:00</span>
                            <input type="button" class="btn btn-danger btn-xs"  id="getIn" value="进入选课"/>
                        </td>
                        <td>结束时间：<span >2018/8/1 23:00:00</span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>