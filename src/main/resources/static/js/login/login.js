$(function () {
    // 加载dialog页面
    $(".dialog").load("/static/page/dialog.html");
})
function checkForm() {
    var id = $("#id").val();
    var password = $("#password").val();
    if (id == null || id== "") {
        dialog("账号不能为空！");
        return false;
    }
    if (password == null || password == "") {
        dialog("密码不能为空");
        return false;
    }
    return true;
}