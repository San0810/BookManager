$(function () {
    // 加载dialog页面
    $(".dialog").load("/static/page/dialog.html");
    // 点击退课按钮
    $("input[name='back']").click(function () {
        var coursenum = $(this).parent("td").parent("tr").children("td[name='courseName']").text();
        console.log(coursenum);
        $.post("/student/remove",
            {
                "courseNum":coursenum
            },function (result) {
                if(result.success){
                    dialog("退课成功");
                    window.location.reload();
                }else{
                    dialog("退课失败");
                    window.location.reload();
                }
            }
            ,"json");
    });
})