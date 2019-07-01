<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" />
    <title>选课中心 - 学生选课系统</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/dialog/dialog.js"></script>
    <script type="text/javascript" src="/static/js/course/course.js"></script>
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
                <span class="glyphicon glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;选课中心
            </span>
        </div>
        <div class="row">
            <form action="/course/listByPage?page=1" method="post">
                <div class="col-md-4" >
                    <div class="col-md-3" style="height: 34px">
                        <div  style= "margin-top: 5px" ><label >教师姓名：</label></div>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="teacher" >
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="col-md-3" style="height: 34px">
                        <div  style= "margin-top: 5px" ><label>学院名称:</label></div>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="college">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-3" style="height: 34px">
                            <div  style= "margin-top: 5px" ><label>课程编号:</label></div>
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="coursenum">
                        </div>
                        <div class="col-md-3">
                            <input type="submit" class="btn btn-primary "  value="搜索">
                        </div>
                    </div>
                </div>

            </form>
        </div>
        <div name="fragment">
            <table class="table table-bordered table-hover table-striped" style="color: #8692a1;">
                <thead>
                <tr>
                    <th>课程编号</th>
                    <th>课程名</th>
                    <th>任课老师</th>
                    <th>选课总量</th>
                    <th>选课余量</th>
                    <th>年级限制</th>
                    <th>上课时间</th>
                    <th>学院限制</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list courseList as item>
                    <tr>
                        <td name="coursenum">${item.courseNum}</td>
                        <td>${item.courseName}</td>
                        <td>${item.teacher}</td>
                        <td>${item.sum}</td>
                        <td>${item.res}</td>
                        <td name="limitgrade">${item.limitGrade}</td>
                        <td>${item.time}</td>
                        <td name="college">
                        <#if item.list?exists><#list item.list as college >&nbsp;${college.collegeName}</#list></#if>
                        </td>
                        <td><input type="button" value="选课" class="btn btn-success" id="select" name="select" />&nbsp;
                            <#--<input type="button" value="退课" class="btn btn-success" name="back" id="back" style="display: none"/>-->
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li >
                        <a href="#" aria-label="Previous" name="font">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <#if list=="0">
                        <#list 1..total as i>
                        <li ><a href="${'course?page='+(i)}">${i}</a> </li>
                        </#list>
                    <#else >
                        <#list 1..total as i>
                        <li ><a href="${'course/listByPage?page='+(i)}">${i}</a> </li>
                        </#list>
                    </#if>

                    <li>
                        <a href="#" aria-label="Next" name="next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>

        </div>
    </div>
</div>
<!-- 引入提示框 -->
<div class="dialog"></div>
</body>
</html>