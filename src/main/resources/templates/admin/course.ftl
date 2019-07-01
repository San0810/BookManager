<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" />
    <title>课程中心</title>
    <link rel="icon" href="/static/img/title.png"/>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/static/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="/static/js/admin/menu.js"></script>
    <script type="text/javascript" src="/static/js/admin/adminCourse.js"></script>
    <script>
        $(function () {
            // 加载dialog页面
            $(".dialog").load("/static/page/dialog.html");
            // 上一页
            $(".pagination li a[name='font']").click(function () {
                var url = location.search;
                var page = url.split("=")[1];
                if(page==1) window.location.href="/coursee?page=1";
                else{
                    page--;
                    window.location.href="/coursee?page="+page;
                }
            });
            // 下一页
            $(".pagination li a[name='next']").click(function () {
                var url = location.search;
                var page = url.split("=")[1];
                var number = $(this).parent("li").parent("ul").attr("name");
                number++;
                if(page==number) window.location.href="/coursee?page="+number;
                else{
                    page++;
                    window.location.href="/coursee?page="+page;
                }
            });
            //删除
            $("button[name='delete']").click(function () {
                var coursenum = $(this).parent("td").parent("tr").children("td[name='coursenum']").text();
                console.log(coursenum);
                $.post("/admin/delete",
                        {
                            "courseNum":coursenum
                        },function (result) {
                            if(result.success){
                                window.location.reload();
                            }else {
                                alert("error");
                            }
                        },"json");
            });
        })
    </script>
</head>
<body>
<!-- 加载菜单栏部分 -->
<div  >
    <#include "/admin/menu/menu.ftl">
</div>
<!-- 右侧部分 -->
<div class="course-right">
    <!-- 加载用户栏 -->
    <div >
        <#include "/admin/menu/user.ftl">
    </div>
    <!-- 界面显示栏 -->
    <div class="course-show">
        <div class="course-show-title">
            <span id="select">
                <span class="glyphicon glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;课程中心
            </span>
        </div>
        <div class="row">
            <form action="/coursee/listByPagee?page=1" method="post">
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
                        <td><button type="button" class="btn btn-primary" name="update">修改</button>&nbsp;
                            <button type="button"  class="btn btn-danger" name="delete" >删除</button>
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
                    <#if list==0>
                        <#list 1..total as i>
                        <li ><a href="${'coursee?page='+(i)}">${i}</a> </li>
                        </#list>
                    <#else >
                        <#list 1..total as i>
                        <li ><a href="${'coursee/listByPagee?page='+(i)}">${i}</a> </li>
                        </#list>
                    </#if>

                    <li>
                        <a href="#" aria-label="Next" name="next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
                <div style="float: right">
                    <button type="button" class="btn btn-primary" name="add" id="add">添加课程</button>
                </div>
            </nav>

        </div>
    </div>
</div>
<!-- 引入提示框 -->
<#--<div class="dialog"></div>-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
            </div>
            <div class="modal-body">
                <input id="id" type="hidden" value="" name="id">
                <div class="form-inline">
                    <label>课程编号:</label><input type="text" class="form-control" value="" id="coursenum" disabled="disabled">
                </div><br>
                <div class="form-inline">
                    <label>课程名:</label><input type="text" class="form-control" id="coursename" value="">
                </div><br>
                <div class="form-inline">
                    <label>任课老师:</label><input type="text" class="form-control" id="teacher" value="">
                </div><br>
                <div class="form-inline">
                    <label>选课总量:</label><input type="text" class="form-control" id="sum" value="">
                </div><br>
                <div class="form-inline">
                    <label>余量:</label><input type="text" class="form-control" id="res" value="">
                </div><br>
                <div class="form-inline">
                    <label>年级限制:</label><input type="text" class="form-control" id="limitgrade" value="">
                </div><br>
                <div class="form-inline">
                    <label>上课时间:</label><input type="text" class="form-control" id="time" value="">
                </div><br>
                <div class="form-inline">
                    <label>学院限制:</label>
                            <label class="checkbox-inline">
                                <input type="checkbox"  id="checkbox1" value="信息学院"  > 信息学院
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox"  id="checkbox2" value="数统学院" > 数统学院
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox"  id="checkbox3" value="外国语学院"  > 外国语学院
                            </label>
                </div><br>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close">Close</button>
                <button type="button" class="btn btn-primary" id="save">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
</body>
</html>