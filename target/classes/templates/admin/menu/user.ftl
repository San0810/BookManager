<!DOCTYPE html>
<html lang="en" >
<header>
    <!-- 用户栏 -->
    <div class="course-user">
        <img name="menu" src="/static/img/menu.png" width="30" height="30"/>
        <img name="user" src="/static/img/user.png"/>
        <span name="name" >
            <#if Session["admin"]?exists>
                ${Session["admin"].getName()}
            </#if>
        </span>
    </div>
</header>
</html>