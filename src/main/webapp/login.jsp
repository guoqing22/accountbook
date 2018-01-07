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
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toast.style.css">
    <script type="text/javascript" src="<%= basePath%>resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/moment.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/toast.script.js"></script>
    <style>
        body {
            background-color: #000000;
            margin: 0;
            cursor: move;
            overflow: hidden;
        }

        #login {
            position: absolute;
            width: 100%;
            color: #ffffff;
        }

        .login {
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
            padding-top: 5px;
            padding-bottom: 5px;
        }
    </style>

</head>
<body>
<script src="<%= basePath%>resources/js/three.min.js"></script>
<script src="<%= basePath%>resources/js/CSS3DRenderer.js"></script>
<div class="container">
    <div class="row">
        <div id="login">
            <div class="login col-md-3 col-md-offset-6">
                <form class="form-horizontal" id="loginForm">
                    <div class="text-center"><h1>欢迎登陆</h1>
                        <small>个人帐单管理系统</small>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                        <input class="form-control" type="number" id="username" name="username" placeholder="Username">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                        <input class="form-control" type="password" id="password" name="password"
                               placeholder="Password">
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
</div>
<script>
    var camera, scene, renderer;
    var geometry, material, mesh;
    var target = new THREE.Vector3();

    var lon = 90, lat = 0;
    var phi = 0, theta = 0;

    var touchX, touchY;

    init();
    animate();

    function init() {

        camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 1000);

        scene = new THREE.Scene();

        var sides = [
            {
                url: '<%=basePath%>resources/img/Bridge2/posx.jpg',
                position: [-512, 0, 0],
                rotation: [0, Math.PI / 2, 0]
            },
            {
                url: '<%=basePath%>resources/img/Bridge2/negx.jpg',
                position: [512, 0, 0],
                rotation: [0, -Math.PI / 2, 0]
            },
            {
                url: '<%=basePath%>resources/img/Bridge2/posy.jpg',
                position: [0, 512, 0],
                rotation: [Math.PI / 2, 0, Math.PI]
            },
            {
                url: '<%=basePath%>resources/img/Bridge2/negy.jpg',
                position: [0, -512, 0],
                rotation: [-Math.PI / 2, 0, Math.PI]
            },
            {
                url: '<%=basePath%>resources/img/Bridge2/posz.jpg',
                position: [0, 0, 512],
                rotation: [0, Math.PI, 0]
            },
            {
                url: '<%=basePath%>resources/img/Bridge2/negz.jpg',
                position: [0, 0, -512],
                rotation: [0, 0, 0]
            }
        ];

        for (var i = 0; i < sides.length; i++) {

            var side = sides[i];

            var element = document.createElement('img');
            element.width = 1026; // 2 pixels extra to close the gap.
            element.src = side.url;

            var object = new THREE.CSS3DObject(element);
            object.position.fromArray(side.position);
            object.rotation.fromArray(side.rotation);
            scene.add(object);

        }

        renderer = new THREE.CSS3DRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);
        document.body.appendChild(renderer.domElement);

        //

        //document.addEventListener('mousedown', onDocumentMouseDown, false);
        document.addEventListener('wheel', onDocumentMouseWheel, false);

        document.addEventListener('touchstart', onDocumentTouchStart, false);
        document.addEventListener('touchmove', onDocumentTouchMove, false);

        window.addEventListener('resize', onWindowResize, false);

    }

    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        renderer.setSize(window.innerWidth, window.innerHeight);

    }

    function onDocumentMouseDown(event) {

        event.preventDefault();

        document.addEventListener('mousemove', onDocumentMouseMove, false);
        document.addEventListener('mouseup', onDocumentMouseUp, false);

    }

    function onDocumentMouseMove(event) {

        var movementX = event.movementX || event.mozMovementX || event.webkitMovementX || 0;
        var movementY = event.movementY || event.mozMovementY || event.webkitMovementY || 0;

        lon -= movementX * 0.1;
        lat += movementY * 0.1;

    }

    function onDocumentMouseUp(event) {

        document.removeEventListener('mousemove', onDocumentMouseMove);
        document.removeEventListener('mouseup', onDocumentMouseUp);

    }

    function onDocumentMouseWheel(event) {

        var fov = camera.fov + event.deltaY * 0.05;

        camera.fov = THREE.Math.clamp(fov, 10, 75);

        camera.updateProjectionMatrix();

    }

    function onDocumentTouchStart(event) {

        event.preventDefault();

        var touch = event.touches[0];

        touchX = touch.screenX;
        touchY = touch.screenY;

    }

    function onDocumentTouchMove(event) {

        event.preventDefault();

        var touch = event.touches[0];

        lon -= (touch.screenX - touchX) * 0.1;
        lat += (touch.screenY - touchY) * 0.1;

        touchX = touch.screenX;
        touchY = touch.screenY;

    }

    function animate() {

        requestAnimationFrame(animate);

        lon += 0.1;
        lat = Math.max(-85, Math.min(85, lat));
        phi = THREE.Math.degToRad(90 - lat);
        theta = THREE.Math.degToRad(lon);

        target.x = Math.sin(phi) * Math.cos(theta);
        target.y = Math.cos(phi);
        target.z = Math.sin(phi) * Math.sin(theta);

        camera.lookAt(target);

        renderer.render(scene, camera);

    }
</script>
<script>
    $(function () {
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true,
                    rangelength: [6, 6],
                    range: [000001, 999999]
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
                    range: "范围[000001,999999]"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于六个字母"
                }
            },
            submitHandler: function (form) {
                $.ajax({
                    url: "<%= basePath%>bill/login",
                    type: "post",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        "username": $("#username").val(),
                        "password": $("#password").val()
                    }),
                    success: function (msg) {
                        if (msg.successmsg != null) {
                            window.location.href = "<%= basePath%>bill/index";
                            /*alert(msg.successmsg)*/
                        }
                        else if (msg.errormsg != null) {
                            $.Toast("失败", msg.errormsg, "error", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 0,
                                sticky: false,
                                has_progress: true,
                                rtl: false
                            });
                        }
                    },
                    error: function (msg) {
                        $.Toast("请求出错", "错误代码：" + msg.stack(), "error", {
                            has_icon: true,
                            has_close_btn: true,
                            fullscreen: false,
                            timeout: 0,
                            sticky: false,
                            has_progress: true,
                            rtl: false
                        });
                    }
                });
            },
            invalidHandler: function (form, validator) {
                return false;
            }
        });
    });
</script>
</body>
</html>
