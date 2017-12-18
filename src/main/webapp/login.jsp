<%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2017/12/10
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.print(basePath);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toast.style.css">

</head>
<style>
    .container {
        width: 100%;
        height: 100%;
    }
    .login{
        padding-top: 15px;
        padding-bottom: 15px;
        margin-top: 20%;
        background-color: #1b5a7d;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        z-index: 100;
        box-sizing: border-box;
    }
.input-group{
    width: 100%;
}
</style>

<body>
<div class="container">
    <div class="row">
        <div class="login col-md-3 col-md-offset-6">
            <!--            <h1 class="text-center">登录</h1>-->
            <form class="form-horizontal" id="loginForm">

                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                    <input class="form-control" type="number" id="username" name="username" placeholder="Username">
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                    <input class="form-control" type="password" id="password" name="password" placeholder="Password">
                </div>

                <div class="input-group" style="width: 100%">
                    <div class="col-md-6">
                        <label>
                            <a href="#"> 忘记密码?</a>
                        </label>
                    </div>
                    <div class="col-md-6 text-right">
                        <label>
                            <a href="<%= basePath%>register.jsp"> 还没有账号?</a>
                        </label>
                    </div>
                </div>
                <div class="input-group">
                    <div class="">
                        <button type="submit" class="btn btn-default" id="loginBtn">登陆</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/toast.script.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/bootstrap-show-password.min.js"></script>
<script>
    $(function() {
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true,
                    rangelength:[6,6],
                    range:[000001,999999]
                },
                password: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {

                username: {
                    required: "请输入用户名",
                    rangelength: "请输入六位有效数字",
                    range:"范围[000001,999999]"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于六个字母"
                }
            },
            submitHandler: function(form) {
                $.ajax({
                    url : "<%= basePath%>bill/login",
                    type : "post",
                    dataType : "json",
                    contentType : "application/json",
                    data:JSON.stringify({
                        "username": $("#username").val(),
                        "password": $("#password").val()
                    }),
                    success : function(msg) {
                        if(msg.successmsg!=null){
                            window.location.href="<%= basePath%>bill/index";
                            /*alert(msg.successmsg)*/
                        }
                        else if(msg.errormsg!=null){
                            $.Toast("失败", msg.errormsg, "error", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 50,
                                sticky: false,
                                has_progress: true,
                                rtl: false
                            });
                        }
                    },
                    error:function (msg){
                        $.Toast("请求出错", "错误代码："+msg.stack(), "error", {
                            has_icon: true,
                            has_close_btn: true,
                            fullscreen: false,
                            timeout: 15,
                            sticky: false,
                            has_progress: true,
                            rtl: false
                        });
                    }
                });
            },
            invalidHandler: function(form, validator) {return false;}
        });
    });
</script>
</body>
</html>
