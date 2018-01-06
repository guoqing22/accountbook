<%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2017/12/10
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.print(basePath);
%>

<html lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<script type="text/javascript" src="<%= basePath%>resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/jquery.validate.min.js"></script>
<style>
    html, body {
        width: 100%;
        height: 100%;
    }

    img {
        weith: 40px;
        height: 40px;
        right: 5px;

    }
</style>
<style>

    html, body {
        width: 100%;
        height: 100%;
    }

    img {
        weith: 40px;
        height: 40px;
        right: 5px;

    }
</style>
<script type="text/javascript">
    $(function () {
        $("#registForm").validate({
            focusInvalid : true,
            rules: {
                username: {
                    required: true,
                    rangelength: [6, 6],
                    range: [000001, 999999]
                },
                password: {
                    required: true,
                    rangelength: [6, 16]
                },
                confirm_password: {
                    required: true,
                    rangelength: [6, 16],
                    equalTo: "#password"
                },
                name:{
                    required: true,
                },
                account: {
                    required: false,
                    range: [0.00, 999999999.99]
                }
            },
            messages: {

                username: {
                    required: "请输入用户名",
                    rangelength: "请输入六位有效数字",
                    range: "范围[000001,999999]"
                },
                password: {
                    required: "请输入密码",
                    rangelength: "请输入6~16位有效密码"
                },
                confirm_password: {
                    required: "请输入密码",
                    rangelength: "请输入6~16位有效密码",
                    equalTo: "两次输入密码不一致"
                },
                name:{
                    required: "姓名不为空"
                },
                account: {
                    range: "范围[0.00,999999999.99]"
                }
            },
            submitHandler: function(form) {
                $.ajax({
                    url : "<%= basePath%>bill/register",
                    type : "post",
                    dataType : "json",
                    contentType : "application/json",
                    data:JSON.stringify({
                        "username": $("#username").val(),
                        "password": $("#password").val(),
                        "name":$("#name").val(),
                        "sex": $("#sex").val(),
                        "userinfo": $("#info").val(),
                        "useramount":$("#account").val()
                    }),

                    success : function(msg) {
                        if(msg.successmsg!=null){
                            $.Toast("请求成功", msg.successmsg, "error", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 500,
                                sticky: false,
                                has_progress: true,
                                rtl: false
                            });
                        }
                        else if(msg.errormsg!=null){
                            $.Toast("请求成功", msg.errormsg, "error", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 500,
                                sticky: false,
                                has_progress: true,
                                rtl: false
                            });
                        }

                    },
                    error : function (msg) {
                        $.Toast("请求出错", "错误代码：" + msg.status, "error", {
                            has_icon: true,
                            has_close_btn: true,
                            fullscreen: false,
                            timeout: 500,
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
</head>
<body background="resources/img/cover.jpg">
<form class="form-horizontal" id="registForm">
    <div class="text-center"><h1>欢迎注册</h1>
        <small>个人帐单管理系统</small>
    </div>
    <div class="form-group">
        <label for="username" class="col-md-2 control-label">用户名*</label>
        <div class="col-md-8">
            <input type="number" class="form-control" id="username" name="username" placeholder="Username">
        </div>
    </div>
    <div class="form-group">

        <label for="password" class="col-md-2 control-label">密&nbsp;&nbsp;&nbsp;码*</label>
        <div class="col-md-8">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>
    </div>
    <div class="form-group">

        <label for="confirm_password" class="col-md-2 control-label">确认密码*</label>
        <div class="col-md-8">
            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Password">
        </div>
    </div>
    <div class="form-group">

        <label for="name" class="col-md-2 control-label">姓&nbsp;&nbsp;&nbsp;名*</label>
        <div class="col-md-8">
            <input type="text" class="form-control" id="name" name="name" placeholder="Name">
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-md-2 control-label">性&nbsp;&nbsp;&nbsp;别&nbsp;</label>
        <div class="col-md-8" >
            <select class="form-control" id="sex" name="sex">
                <option>男</option>
                <option>女</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="info" class="col-md-2 control-label">签&nbsp;&nbsp;&nbsp;名&nbsp;</label>
        <div class="col-md-8">
            <input type="text" class="form-control" id="info" name="info" placeholder="Info">
        </div>
    </div>
    <div class="form-group">

        <label for="account" class="col-md-2 control-label">总金额&nbsp;</label>
        <div class="col-md-8">
            <input type="number" step="0.01" class="form-control" id="account" name="account" placeholder="0.00">
        </div>
    </div>
    <div class="form-group">
        <label for="sid" class="col-md-2 control-label">邀请码&nbsp;</label>
        <div class="col-md-8">
            <input type="text" step="0.01" class="form-control" id="sid" name="sid" placeholder="XXXX-XXXX-XXXX-XXXX">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-md-10">
            <label>
                <a href="#"> 已有账号?</a>
            </label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-md-10">
            <button type="submit" class="btn btn-default" id="registBtn">注册</button>
        </div>
    </div>
</form>
</body>
</html>