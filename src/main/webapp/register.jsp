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
<%--<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/bootstrap.min.css">
    <style>
        html,body{
            width: 100%;
            height: 100%;
        }

        .login label{
            text-shadow: 0px 0px 15px #1b7aa4;
        }
        html,
        body {
            font-size: 19px;
            font-family: 'Verdana', 'Arial';
            color: rgba(0, 0, 0, 0.8);
            width: 100%;
            height: 100%;
        }

        .main {
            width: 100%;
            height: 100%;
            position: relative;
            background: url(<%= basePath%>/resources/img/cover.jpg) center;
            background-size: cover;
        }

        .login {
            color: ivory;
            width: 55%;
            height: 70%;
            position: absolute;
            top: 50%;
            left: 50%;
            overflow: hidden;
            margin-top: -200px;
            margin-left: -400px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            z-index: 100;
            padding: 50px;
            box-sizing: border-box;
        }

        .login::before {
            content: "";
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            z-index: -1;
            -webkit-filter: blur(20px);
            filter: blur(20px);
            margin: -30px;
            background: url(<%= basePath%>/resources/img/cover.jpg) center top;
            background-size: cover;
            background-attachment: fixed;
        }
        .login h1{
            text-align: center;
            margin-bottom: 40px;
        }
        img{
            position: absolute;
            right: 5px;
            margin: 8px 15px 8px;
        }
        span{
            z-index: 100;
            color: #d43f3a;
            position: absolute;
            right: 200px;
        }
    </style>
    <script type="text/javascript">
        function aaCheck() {
            var pwd1=document.getElementById("inputPassword3").value;
            var pwd2=document.getElementById("inputPassword31").value;
            var username = document.getElementById("inputUsername3").value;
            var sid = document.getElementById("inputSerialId3").value;
            if (username =="") {
                document.getElementById("inputUsername3s").innerText="用户名不能为空，请重新输入！";
            }
            else if (pwd1 =="") {
                document.getElementById("inputPassword3s").innerText="密码不能为空，请重新输入！";
                document.getElementById("inputPassword31s").innerText="";
                return;
            }
            else if (pwd1 != pwd2) {
                document.getElementById("inputPassword3s").innerText="";
                document.getElementById("inputPassword31s").innerText="密码不一致，请重新输入！";
            }
            else if (sid != "") {
                document.getElementById("inputSerialId3s").innerText="序列号不能为空，请重新输入！";
            }
            else {
                document.getElementById("inputUsernames").innerText="";
                document.getElementById("inputPassword3s").innerText="";
                document.getElementById("inputPassword31s").innerText="";
            }
        }
    </script>
</head>
<body background="/img/cover.jpg">
<div class="main">
    <div class="login">
        <h1>欢迎注册</h1>
        <form class="form-horizontal">
            <span id="inputUsername3s"></span>
            <div class="form-group">
                <label for="inputUsername3" class="col-md-2 control-label">用户名</label>
                <div class="col-md-10">
                    <input type="number" class="form-control" id="inputUsername3" placeholder="Username"  name="username">
                </div>
            </div>
            <div class="form-group">
                <span id="inputPassword3s"></span>
                <label for="inputPassword3" class="col-md-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                <div class="col-md-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password"  name="pwd1">
                </div>
            </div>
            <div class="form-group">
                <span id="inputPassword31s"></span>
                <label for="inputPassword31" class="col-md-2 control-label">确认密码</label>
                <div class="col-md-10">
                    <input type="password" class="form-control" id="inputPassword31"  name="pwd2"
                           placeholder="Password" onBlur="aaCheck()">
                </div>
            </div>
            <div class="form-group">
                <span id="inputSerialId3s"></span>
                <label for="inputSerialId3" class="col-md-2 control-label">注册码</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="inputSerialId3" placeholder="sid"  name="sid">
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
                    <button type="submit" class="btn btn-default" onclick="aaCheck()"></button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>--%>
<html lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/jquery.form.min.js"></script>
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
                            alert(msg.successmsg)
                        }
                        else if(msg.errormsg!=null){
                            alert(msg.errormsg)
                        }
                        else {
                            alert(msg.status)
                        }
                    },
                    error : function (msg) {
                        alert(msg.status)
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