<%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2018/1/8
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2018/1/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String username1 = session.getAttribute("username").toString();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toast.style.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/sweetalert2.min.css">

    <script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/moment.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/toast.script.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/echarts/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/echarts/theme/infographic.js"></script>
    <style>

        element.style {
        }

        myerror {
            background: #0f0f0f;
        }

        body {
            font-family: "思源宋体 CN";
            height: 100%;
            width: 100%;
        }

        .container {
            width: 100%;
        }

        img.logo {
            width: 40px;
            height: 40px;
            background-color: #e1e1e1;
        }

        img.png {
            width: 20px;
            height: 20px;
        }

        header div h3 {

            margin-top: 15px;
            margin-left: 50px;
            color: #ffffff;
            text-shadow: -1px -1px 0 #fff;
        }

        header div h3 a {
            color: #ffffff;
        }

        header div h3 a:hover {
            color: #ed3400;
            text-decoration: none;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
        }

        header div ul {
            margin-top: 10px;
        }

        header div ul li a {
            color: white;
        }

        .menu {
            background-color: #F7F7F7;
            /*height: 100%;*/
        }

        .menu .link-item {
            width: 100%;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        .menu .link-item .link-title-a {
            background-color: #1b5a7d;
            color: white;
            font-weight: bold;
            padding: 5px;
            text-shadow: 0 0 20px #ed3400;
        }

        .menu .link-item .link-title-b ul {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .menu .link-item .link-title-b ul li {
            text-shadow: 0 0 20px #1b5a7d;
            border-bottom: 2px dotted #ffffff;
            margin: 5px;
        }

        .menu .link-item .link-title-b a {
            color: #1b5a7d;
        }

        .menu .link-title-b a:hover {
            color: #ffffff;
            text-decoration: none;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
        }

        header .head-info {
            height: 30px;
            border-bottom: 1px solid #153C53;
            padding-left: 20px;
            padding-right: 20px
        }

        footer {
            height: 70px;
            margin-top: 156px;
        }

        .main {
            width: 100%;
            padding-left: 5px;
            margin-top: 5px;
        }

        .main .main-title {
            padding: 5px 0px 4px 40px;
            color: white;
            font-weight: bold;
            text-shadow: 0 0 20px #ed3400;
            height: 30px;
            background-color: #1b5a7d
        }

        table thead th, table tbody td {
            text-align: center;
            vertical-align: middle;
        }


    </style>

</head>
<body>
<header style="background-color: #1b5a7d;color: white">
    <div class="container">
        <div class="row head-info">
            <div class="col-md-2"><span>欢迎：</span><span id="user"><%= username1%></span></div>
            <div class="col-md-10 text-right"><p id="time1"></p></div>
        </div>
    </div>
    <div class="container">
        <div class="row" style="height: 50px">
            <div class="col-md-4"><h3><a href="<%= basePath%>bill/index"><img class="logo"
                                                                              src="<%= basePath%>resources/img/284843.png"/>
                个人帐务管理系统</a></h3>
            </div>
            <div class="col-md-4 pull-right">
                <ul class="nav nav-pills">
                    <li role="presentation"><a href="<%=basePath%>bill/index">首页</a></li>
                    <li role="presentation" id="userinfo"><a href="javascript:void(0)">个人资料</a></li>
                    <li role="presentation"><a href="#">安全设置</a></li>
                    <li role="presentation"><a href="#">关于</a></li>
                    <li role="presentation" id="logout"><a href="javascript:void(0)">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!--主-->
<div class="container">
    <div class="row">
        <!--菜单-->
        <div class="col-md-2   text-center">
            <div class="menu">
                <div class="link-item">
                    <div class="link-title-a">&#9733; 账单管理</div>
                    <div class="link-title-b">
                        <ul>
                            <li id="index-li"><a href="<%=basePath%>bill/select"><img class="png"
                                                                                      src="<%= basePath%>resources/img/284868.png">&nbsp;账单查询</a>
                            </li>
                            <li id="insertbill-li"><a href="<%=basePath%>bill/insert"><img class="png"
                                                                                           src="<%= basePath%>resources/img/123397.png">&nbsp;添加账单</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/123405.png">&nbsp;删除账单</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284863.png">&nbsp;修改账单</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="link-item">
                    <div class="link-title-a">&#9733; 图表信息</div>
                    <div class="link-title-b">
                        <ul>
                            <li><a href="<%=basePath%>bill/ta"><img class="png" src="<%= basePath%>resources/img/284871.png">&nbsp;收支总计</a>
                            </li>
                            <li><a href="<%=basePath%>bill/tb"><img class="png" src="<%= basePath%>resources/img/284859.png">&nbsp;花费去向</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284861.png">&nbsp;收入来源</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284858.png">&nbsp;资金变化</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/186244.png">&nbsp;图表赏析</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <footer class="panel-footer">
                    <div>
                        <p class="text-center text-info">版权所有 | GitHub </p>
                        <p class="text-info text-center"><a href="#">www.welab.com</a></p>
                    </div>
                </footer>
            </div>
        </div>

        <!--main面板-->
        <div class="col-md-10">
            <div class="main">
                <div class="main-title">欢迎/首页</div>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 100%;height: 540px">

                </div>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel1">个人资料</h4>
            </div>
            <div class="modal-body" id="modal-body1">


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban"
                                                                                      aria-hidden="true"></i>关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!--main char-->
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'), 'roma');

    myChart.setOption({
        title: {
            text: '收支总计'
        },
        tooltip: {
            trigger: 'axis'
        },
        toolbox: {
            feature: {
                magicType: {
                    type: ['line', 'bar', 'stack', 'tiled']
                },
                dataView: {},
                saveAsImage: {
                    pixelRatio: 2
                },
                brush: {
                    type: ['rect', 'polygon', 'lineX', 'lineY', 'keep', 'clear']
                },
                restore: {},
                dataZoom: {},
            }
        },
        grid: {
            containLabel: true
        },

        xAxis: {
            type: "category",
            data: ['收入', '支出', '净剩'],
            axisTick: {
                alignWithLabel: true
            }
        },
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '金额',
                type: 'bar',
                data: [],
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['rgb(164,205,238)', 'rgb(42,170,227)', 'rgb(25,46,94)', 'rgb(195,229,235)'];
                            return colorList[params.dataIndex];
                        }
                    },
                    //鼠标悬停时：
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            },

        ]
    })
    $.ajax({
        url: "<%= basePath%>bill/a",
        type: "post",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify({
            "username": <%=username1%>,
            "startDate": moment("2017-12-7").format("YYYY-MM-DD"),
            "endDate": moment("2018-01-08").format("YYYY-MM-DD"),
        }),
        success: function (data) {
            var dataJson = data.data
            var a = [];
            for(var i in dataJson){
                a.push(dataJson[i].drawAmount);
                a.push(dataJson[i].depositAmount);
                a.push(dataJson[i].netBalance)

            }
            myChart.setOption({

                series: [{
                    data: a
                }]

            })
        },
        error: function (msg) {
            alert(msg.status)
        }
    })
</script>
<script type="text/javascript">
    $(function () {

        $("#logout").click(function () {
            $.ajax({
                url: "<%=basePath%>bill/logout",
                type: "post",
                success: function () {
                    window.location.href = "<%=basePath%>login.jsp"
                }
            })

        });
        $("#userinfo").click(function () {
            $("#myModal1").modal(Option);
        });
        $("#modal-body1").html(
            '<form>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-user fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="username" name="username" placeholder="billid" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-user-secret fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="name" name="name" placeholder="billid" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-birthday-cake fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="birthday" name="birthday" placeholder="billid" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-users fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="sex" name="sex" placeholder="billid" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-info fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="userinfo1" name="userinfo1" placeholder="签名" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-money fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="useramount" name="useramount" placeholder="余额"disabled>' +
            '</div>' +
            '</form>'
        );
        $("#myModal1").on('show.bs.modal', function () {
            $.ajax({
                url: "<%= basePath%>bill/getuserinfo",
                type: "post",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    "username": <%=username1%>
                }),
                success: function (data) {
                    $.Toast("请求成功", "查询完成", "success", {
                        has_icon: true,
                        has_close_btn: true,
                        fullscreen: false,
                        timeout: 2000,
                        sticky: false,
                        has_progress: true,
                        rtl: false
                    });
                    var dataJson = data.data;
                    var transTime = new Date(dataJson.birthday);
                    $("#username").val(dataJson.username);
                    $("#name").val(dataJson.name);
                    $("#birthday").val(transTime.toLocaleDateString());
                    $("#sex").val(dataJson.sex);
                    $("#userinfo1").val(dataJson.billinfo);
                    $("#useramount").val(dataJson.useramount);
                },
                error: function (msg) {
                    $.Toast("请求失败", "错误代码" + msg.status, "success", {
                        has_icon: true,
                        has_close_btn: true,
                        fullscreen: false,
                        timeout: 2000,
                        sticky: false,
                        has_progress: true,
                        rtl: false
                    });
                }
            });
        });
    });


    function mytime() {
        var a = new Date();
        var b = a.toLocaleTimeString();
        var c = a.toLocaleDateString();
        document.getElementById("time1").innerHTML = "当前时间：" + c + "&nbsp" + b;
    }

    setInterval(function () {
        mytime()
    }, 1000);
</script>
</body>
</html>

