$(function () {
    $("#getIn").click(function () {
        var date = $("#start").html();
        console.log("1111111");
        console.log(date);
        // $.post("/student/check",
        //     {
        //         "date":date
        //     },function (result) {
        //         if(result.success){
        //             window.location.href="/course?page=1";
        //         }else {
        //             dialog("选课未开始");
        //         }
        //     },"json");
    });
})