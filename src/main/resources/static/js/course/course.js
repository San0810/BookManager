$(function () {
    // 加载dialog页面
    $(".dialog").load("/static/page/dialog.html");
    // 上一页
    $(".pagination li a[name='font']").click(function () {
        var url = location.search;
        var page = url.split("=")[1];
        if(page==1) window.location.href="/course?page=1";
        else{
            page--;
            window.location.href="/course?page="+page;
        }
    });
    // 下一页
    $(".pagination li a[name='next']").click(function () {
        var url = location.search;
        var page = url.split("=")[1];
        var number = $(this).parent("li").parent("ul").attr("name");
        number++;
        if(page==number) window.location.href="/course?page="+number;
        else{
            page++;
            window.location.href="/course?page="+page;
        }
    });

    // 点击选课
    $("input[name='select']").click(function () {
        var coursenum = $(this).parent("td").parent("tr").children("td[name='coursenum']").text();
        var limitgrade = $(this).parent("td").parent("tr").children("td[name='limitgrade']").text();
        var college = $(this).parent("td").parent("tr").children("td[name='college']").text();
        console.log(college);
        var th =$(this);
        $.post("/student/selectCourse",
            {
                "courseNum":coursenum,
                "limitgrade":limitgrade,
                "college":college
            },function (result) {
                if(result.success){
                    th.val("已选");//这是一个坑
                    th.attr("disabled",true);
                    //$(this).next().attr("display","block");
                    dialog("选课成功");
                    //window.location.reload();
                }else{
                    dialog(result.message);
                }
            },"json");
    });
})