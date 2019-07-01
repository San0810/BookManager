$(function () {
    $("button[name='update']").click(function () {
        var coursenum = $(this).parent("td").parent("tr").children("td[name='coursenum']").text();
        // var limitgrade = $(this).parent("td").parent("tr").children("td[name='limitgrade']").text();
        // var college = $(this).parent("td").parent("tr").children("td[name='college']").text();
        console.log(coursenum);
        $.post("/course/findByCourseNum",
            {
                "coursenum":coursenum
            },function (data) {
                if(data!=null){
                    showQuery(data);
                }else{
                    alert("222");
                }
            },"json");
    });
    function showQuery(data) {
        $("#coursenum").val(data.courseNum);
        $("#coursename").val(data.courseName);
        $("#teacher").val(data.teacher);
        $("#sum").val(data.sum);
        $("#res").val(data.res);
        $("#limitgrade").val(data.limitGrade);
        $("#time").val(data.time);
        var list = data.list;
        for(var i = 0;i<list.length;i++){
            console.log(list[i].collegeName);
            if(list[i].collegeName=="信息学院"){
                console.log("11111111111111111111");
                $("#checkbox1").attr("checked",'checked');
            }else
            if(list[i].collegeName=="数统学院"){
                console.log("22222222");
                $("#checkbox2").attr("checked",'checked');
            }else
            if(list[i].collegeName=="外国语学院"){
                $("#checkbox3").attr("checked",'checked');
            }
        }
        // 显示模态框
        $('#myModal').modal('show');
    }

    $("#close").click(function () {
       clear();
        console.log("4444444444");
    });
    $("#save").click(function () {
        var flag = "修改";
        console.log("$(\"#myModalLabel\").html()"+$("#myModalLabel").html());
        if($("#myModalLabel").html()=="添加课程"){
            flag="添加";
        }
       updateoradd(flag);
    });
    $("#add").click(function () {
        $("#myModalLabel").html("添加课程");
        $("#coursenum").removeAttr("disabled");
        clear();
        $('#myModal').modal('show');

    });
    function clear() {
        $("#coursenum").val("");
        $("#coursename").val("");
        $("#teacher").val("");
        $("#sum").val(0);
        $("#res").val(0);
        $("#limitgrade").val("");
        $("#time").val("");
        $("#checkbox1").removeAttr("checked");
        $("#checkbox2").removeAttr("checked");
        $("#checkbox3").removeAttr("checked");
    }
    function updateoradd(flag) {
        var coursenum=$("#coursenum").val();
        var coursename=$("#coursename").val();
        var teacher=$("#teacher").val();
        var sum=$("#sum").val();
        var res=$("#res").val();
        var limitgrade=$("#limitgrade").val();
        var time=$("#time").val();
        var college = [];
        if($("#checkbox1").prop('checked')){
            college.push($("#checkbox1").val());
        }
        if($("#checkbox2").prop('checked')){
            college.push($("#checkbox2").val());
        }
        if($("#checkbox3").prop('checked')){
            college.push($("#checkbox3").val());
        }
        console.log(college);
        $.post("/admin/updateCourse",
            {
                "courseNum":coursenum,
                "courseName":coursename,
                "teacher":teacher,
                "sum":sum,
                "res":res,
                "limitGrade":limitgrade,
                "time":time,
                "college":JSON.stringify(college),
                "flag":flag
            },function (result) {
                if(result.success){
                    //关闭模态框
                    $('#myModal').modal("hide");
                    window.location.reload();
                }else{
                    console.log("1111111111");
                }

            },"json");
    }
});
