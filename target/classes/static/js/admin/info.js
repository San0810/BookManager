$(function () {
    // 加载dialog页面
    $(".dialog").load("/static/page/dialog.html");

    // 重置按钮
    $("input[name='restart']").click(function () {
        window.location.href="/admin/info";
    });
    // 保存按钮
    $("input[name='save']").click(function () {
        var worknum=$("input[name='worknum']").val();
        var name = $("input[name='name']").val();
        var password = $("input[name='password']").val();
        if(password==""||name==""){
            dialog("输入框不能为空！");
            return;
        }
        $.post("/admin/updateInfo",
            {
                "name":name,
                "password":password,
                "workNum":worknum
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