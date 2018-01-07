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

    #regist {
        position: absolute;
        width: 100%;
        color: #ffffff;
    }

    .regist {
        padding-top: 15px;
        padding-bottom: 15px;
        margin-top: 15px;
        background-color: #1b5a7d;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        z-index: 100;
        box-sizing: border-box;
    }

</style>

</head>
<body>
<script src="<%= basePath%>resources/js/three.min.js"></script>
<script src="<%= basePath%>resources/js/CSS3DRenderer.js"></script>
<div id="regist">

    <div class="regist col-md-4 col-md-offset-7">
        <form class="form-horizontal" id="registForm">
            <div class="text-center"><h1>欢迎注册</h1>
                <small>个人帐单管理系统</small>
            </div>
            <div class="form-group">
                <label for="username" class="col-md-3 control-label">用户名*</label>
                <div class="col-md-9">
                    <input type="number" class="form-control" id="username" name="username" placeholder="Username">
                </div>
            </div>
            <div class="form-group">

                <label for="password" class="col-md-3 control-label">密&nbsp;&nbsp;&nbsp;码*</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
            </div>
            <div class="form-group">

                <label for="confirm_password" class="col-md-3 control-label">确认密码*</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                           placeholder="Password">
                </div>
            </div>
            <div class="form-group">

                <label for="name" class="col-md-3 control-label">姓&nbsp;&nbsp;&nbsp;名*</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                </div>
            </div>
            <div class="form-group">
                <label for="sex" class="col-md-3 control-label">性&nbsp;&nbsp;&nbsp;别&nbsp;</label>
                <div class="col-md-9">
                    <select class="form-control" id="sex" name="sex">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="info" class="col-md-3 control-label">签&nbsp;&nbsp;&nbsp;名&nbsp;</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="info" name="info" placeholder="Info">
                </div>
            </div>
            <div class="form-group">

                <label for="account" class="col-md-3 control-label">总金额&nbsp;</label>
                <div class="col-md-9">
                    <input type="number" step="0.01" class="form-control" id="account" name="account"
                           placeholder="0.00">
                </div>
            </div>
            <div class="form-group">
                <label for="sid" class="col-md-3 control-label">邀请码&nbsp;</label>
                <div class="col-md-9">
                    <input type="text" step="0.01" class="form-control" id="sid" name="sid"
                           placeholder="XXXX-XXXX-XXXX-XXXX">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-md-9">
                    <label>
                        <a href="#"> 已有账号?</a>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-md-9">
                    <button type="submit" class="btn btn-default" id="registBtn">注册</button>
                </div>
            </div>
        </form>
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
                        "sex": $("#sex").find("option:selected").text(),
                        "userinfo": $("#info").val(),
                        "useramount":$("#account").val()
                    }),

                    success : function(msg) {
                        if(msg.successmsg!=null){
                            window.location.href="<%=basePath%>"
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
</body>
</html>