$(function () {
    // 加载dialog页面
    $(".dialog").load("/static/page/dialog.html");

    // 重置按钮
    $("input[name='restart']").click(function () {
        window.location.href="/student/studentInfo";
    });
    // 保存按钮
    $("input[name='save']").click(function () {
        var num = $("input[name='studentnum']").val();
        var name = $("input[name='studentname']").val();
        var password = $("input[name='password']").val();
        var grade = $("input[name='grade']").val();
        var college = $("input[name='college']").val();
        if(num==""||password==""||grade==""||college==""||name==""){
            dialog("输入框不能为空！");
            return;
        }
        $.post("/student/updateStudentInfo",
            {
                "studentNum":num,
                "studentName":name,
                "password":password,
                "grade":grade,
                "college":college
            },function (result) {
                console.log(result)
                if(result.success){
                    dialog("修改成功");
                }else{
                    dialog("修改失败");
                }
            },"json");
    });
})