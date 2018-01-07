<%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2017/12/16
  Time: 19:04
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
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toast.style.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/sweetalert2.min.css">

    <script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/moment.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/daterangepicker.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/toast.script.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/sweetalert2.all.min.js"></script>

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

        #index-li {
            text-shadow: 0 0 20px #17ddbd;
            border-bottom: 2px dotted #ffffff;
            margin: 5px;
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
            <div class="col-md-4"><h3><a href="<%= basePath%>bill.jsp"><img class="logo"
                                                                            src="<%= basePath%>resources/img/284843.png"/>
                个人帐务管理系统</a></h3>
            </div>
            <div class="col-md-4 pull-right">
                <ul class="nav nav-pills">
                    <li role="presentation"><a href="#">首页</a></li>
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
                            <li id="`"><a href="<%=basePath%>bill/index"><img class="png"
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
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284871.png">&nbsp;收支对比</a>
                            </li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284859.png">&nbsp;花费去向</a>
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
                <div class="main-title">账单管理/账单查询</div>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 100%;height: 540px">
                    <table id="tabledata"
                           class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>账单号</th>
                            <th>日期</th>
                            <th>存/取</th>
                            <th>一级</th>
                            <th>二级</th>
                            <th>金额</th>
                            <th>用户名</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">修改</h4>
            </div>
            <div class="modal-body" id="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban"
                                                                                      aria-hidden="true"></i>取消
                </button>
                <button type="button" id="btn_sublimt" class="btn btn-primary"><i class="fa fa-check-circle-o"
                                                                                  aria-hidden="true"></i>提交更改
                </button>
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
<%--<script>

    var myChart = echarts.init(document.getElementById('main'), 'infographic');

    option = {
        title: {
            //text: '2000-2016年中国汽车销量及增长率'
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
        legend: {
            data: ['增速', '销量']
        },
        xAxis: [{
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            data: ['2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016']
        }],
        yAxis: [{
            type: 'value',
            name: '增速',
            min: 0,
            max: 50,
            position: 'right',
            axisLabel: {
                formatter: '{value} %'
            }
        }, {
            type: 'value',
            name: '销量',
            min: 0,
            max: 3000,
            position: 'left'
        }],
        series: [{
            name: '增速',
            type: 'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            lineStyle: {
                normal: {
                    width: 3,
                    shadowColor: 'rgba(0,0,0,0.4)',
                    shadowBlur: 10,
                    shadowOffsetY: 10
                }
            },
            data: [1, 13, 37, 35, 15, 13, 25, 21, 6, 45, 32, 2, 4, 13, 6, 4, 11]
        }, {
            name: '销量',
            type: 'bar',
            yAxisIndex: 1,
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data: [209, 236, 325, 439, 507, 576, 722, 879, 938, 1364, 1806, 1851, 1931, 2198, 2349, 2460, 2735]
        }]
    };

    myChart.setOption(option);
</script>--%>
<!--时间输入框设置-->
<script type="text/javascript">
    var table;
    var start_date = moment().subtract('days', 30).format('YYYY-MM-DD HH:mm:ss');
    var end_date = moment().format('YYYY-MM-DD HH:mm:ss');
    var billid;
    $(function () {

        table = $('#tabledata').DataTable({
            "ajax": {
                "url": "<%=basePath%>bill/selectbill",
                "dataType": "json",
                /*"data": {
                    //添加额外的参数传给服务器
                    "start_date":start_date,
                    "end_date":end_date
                }*/
                "data": function (d) {
                    //添加额外的参数传给服务器
                    d.start_date = start_date;
                    d.end_date = end_date
                }
            },
            "columns": [
                {"data": "billid"},
                {"data": "billdate"},
                {
                    "data": "typeid",
                    render: function (data, type, row, meta) {
                        return (data == 1 ? "存储" : "支出");
                    }
                },
                {"data": "classa"},
                {"data": "billinfo"},
                {"data": "billamount"},
                {"data": "username"},
                {"data": "billid"},
            ],
            "columnDefs": [{
                "targets": 7,

                "searchable": false,
                render: function (data, type, full) {
                    return "<button id='edit' class='btn btn-info btn-xs' onclick='edit(\"" + data + "\")'><i class=\"fa fa-pencil\"></i>修改</button>"
                        + "<button class='btn btn-danger btn-xs' onclick='deleteById(\"" + data + "\")'><i class='fa fa-remove'></i> 删除</button>"
                }
            }],
            "language": {
                "sUrl": "<%= basePath%>resources/language/dt_zh_CN.json"
            },
            "processing": true,
            "serverSide": false,
            "ordering": true,
            "searching": true,
            "bStateSave": true,
            "bPaginate": true, //翻页功能
            "bLengthChange": true, //改变每页显示数据数量
            "bFilter": true, //过滤功能
            "renderer": "bootstrap",
            "bInfo": true,//页脚信息
            "bAutoWidth": true,//自动宽度
            "scrollY": "420px",
            "scrollCollapse": "true",
            "dom": "<'row'<'col-md-2'l><'#mytoolbox.col-md-4'><'col-md-6'f>r>" + "t" + "<'row'<'col-md-6'i><'col-md-6'p>>",
            initComplete: initComplete
        });


        $("#modal-body").html(
            '<form>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-list-ol fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="billid" name="billid" placeholder="billid" disabled>' +
            '</div>' +
            ' <div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="billdate" name="billdate" placeholder="billdate" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-bars fa-fw"></i></span>' +
            '<input class="form-control" type="text" id="billtype" name="billtype" placeholder="billtype" disabled>' +
            '</div>' +
            '<div class="input-group" id="spy">' +
            '<span class="input-group-addon"><i class="fa fa-cube fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="classa" name="classa" placeholder="classa" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-cubes fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="text" id="classb" name="classb" placeholder="classb" disabled>' +
            '</div>' +
            '<div class="input-group">' +
            '<span class="input-group-addon"><i class="fa fa-money fa-fw" aria-hidden="true"></i></span>' +
            '<input class="form-control" type="number" id="billamount" name="billamount" placeholder="billamount">' +
            '</div>' +
            '</form>'
        );

        $("#myModal").on('show.bs.modal', function (obj) {
            $.ajax({
                url: "<%= basePath%>bill/selectbillbyid",
                type: "post",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    "billid": billid
                }),
                success: function (data) {
                    var dataJson = data.data;
                    var type = dataJson.typeid;
                    var type1;
                    if (type == 1) {
                        $("#spy").hide();
                        type1 = "收入";
                    }
                    else if (type == 0) {
                        $("#spy").show();
                        type1 = "支出";
                    }
                    $("#billid").val(billid);
                    $("#billdate").val(dataJson.billdate);
                    $("#billtype").val(type1);
                    $("#classa").val(dataJson.classa);
                    $("#classb").val(dataJson.billinfo);
                    $("#billamount").val(dataJson.billamount);
                },
                error: function (msg) {
                    alert(msg.status)
                }
            });
        });

        $("#btn_sublimt").click(function () {
            var billamount = document.getElementById("billamount").value;
            $.ajax({
                url: "<%= basePath%>bill/editbill",
                type: "post",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({
                    "billid": billid,
                    "billamount": billamount
                }),
                success: function (msg) {
                    if (msg.successmsg != null) {
                        $("#myModal").modal("hide");
                        table.ajax.reload();
                        $.Toast("请求成功", msg.successmsg, "success", {
                            has_icon: true,
                            has_close_btn: true,
                            fullscreen: false,
                            timeout: 2000,
                            sticky: false,
                            has_progress: true,
                            rtl: false
                        });
                    }
                    else if (msg.errormsg != null) {
                        $.Toast("请求成功", msg.errormsg, "warn", {
                            has_icon: true,
                            has_close_btn: true,
                            fullscreen: false,
                            timeout: 2000,
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
                        timeout: 500,
                        sticky: false,
                        has_progress: true,
                        rtl: false
                    });
                }
            })

        });
        $("#logout").click(function () {
            $.ajax({
                url: "<%=basePath%>bill/logout",
                type: "post",
                success:function () {
                    window.location.href="<%=basePath%>login.jsp"
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

    /**
     * 表格加载渲染完毕后执行的方法
     * @param data
     */
    function initComplete(data) {

        var dataPlugin =
            '<div id="reportrange" class="pull-left dateRange" style="width:400px;margin-left: 10px"> ' +
            '日期：<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> ' +
            '<span id="searchStartDateRange"></span>  ' +
            ' - ' +
            '<span id="searchEndDateRange"></span>  ' +
            '<b class="caret"></b></div> ';
        $('#mytoolbox').append(dataPlugin);
        //时间插件
        $("#searchStartDateRange").html(start_date);
        $("#searchEndDateRange").html(end_date);
        $('#reportrange').daterangepicker(
            {
                // startDate: moment().startOf('day'),
                //endDate: moment(),
                //minDate: '01/01/2012',    //最小时间
                maxDate: moment(), //最大时间
                dateLimit: {
                    days: 365
                }, //起止时间的最大间隔
                showDropdowns: true,
                showWeekNumbers: false, //是否显示第几周
                timePicker: true, //是否显示小时和分钟
                timePickerIncrement: 60, //时间的增量，单位为分钟
                timePicker12Hour: false, //是否使用12小时制来显示时间
                ranges: {
                    //'最近1小时': [moment().subtract('hours',1), moment()],
                    '今日': [moment().startOf('day'), moment()],
                    '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
                    '最近7日': [moment().subtract('days', 6), moment()],
                    '最近30日': [moment().subtract('days', 29), moment()]
                },
                opens: 'right', //日期选择框的弹出位置
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary blue',
                cancelClass: 'btn-small',
                format: 'YYYY-MM-DD HH:mm:ss', //控件中from和to 显示的日期格式
                separator: ' to ',
                locale: {
                    applyLabel: '确定',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                        '七月', '八月', '九月', '十月', '十一月', '十二月'],
                    firstDay: 1
                }
            }, function (start, end, label) {//格式化日期显示框

                $("#searchStartDateRange").html(start.format("YYYY-MM-DD HH-mm:ss"));
                $("#searchEndDateRange").html(end.format("YYYY-MM-DD HH-mm:ss"));
                start_date = start.format('YYYY-MM-DD HH:mm:ss');
                end_date = end.format('YYYY-MM-DD HH:mm:ss')
            });

        //设置日期菜单被选项  --开始--
        var dateOption;
        if ("${riqi}" == 'day') {
            dateOption = "今日";
        } else if ("${riqi}" == 'yday') {
            dateOption = "昨日";
        } else if ("${riqi}" == 'week') {
            dateOption = "最近7日";
        } else if ("${riqi}" == 'month') {
            dateOption = "最近30日";
        } else if ("${riqi}" == 'year') {
            dateOption = "最近一年";
        } else {
            dateOption = "自定义";
        }
        $(".daterangepicker").find("li").each(function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            }
            if (dateOption == $(this).html()) {
                $(this).addClass("active");
            }
        });
        //设置日期菜单被选项  --结束--


        //选择时间后触发重新加载的方法
        $("#reportrange").on('apply.daterangepicker', function () {
            //当选择时间后，出发dt的重新加载数据的方法
            table.ajax.reload();
            //获取dt请求参数
            var args = table.ajax.params();
            console.log("额外传到后台的参数值extra_search为：" + args.extra_search);
        });
    }

    function edit(id) {
        billid = id;
        $("#myModal").modal(Option);
    };

    function deleteById(id) {
        swal({
            title: '确定要删除此条账单么?',
            text: "删除之后无法恢复，请谨慎操作!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '确定删除',
            cancelButtonText: '取消',
            confirmButtonClass: 'btn btn-success',
            cancelButtonClass: 'btn btn-danger',
            buttonsStyling: false,
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: "<%= basePath%>bill/deletebill",
                    type: "post",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        "billid": id
                    }),
                    success: function (msg) {
                        if (msg.successmsg != null) {
                            table.ajax.reload();
                            $.Toast("请求成功", msg.successmsg, "success", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 2000,
                                sticky: false,
                                has_progress: true,
                                rtl: false
                            });
                        }
                        else if (msg.errormsg != null) {
                            $.Toast("请求成功", msg.errormsg, "warn", {
                                has_icon: true,
                                has_close_btn: true,
                                fullscreen: false,
                                timeout: 2000,
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
                            timeout: 500,
                            sticky: false,
                            has_progress: true,
                            rtl: false
                        });
                    }
                })
            } else if (result.dismiss === 'cancel') {
            }
        })
    }

    function ChangeDateFormat(cellval) {
        var date2 = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
        var month2 = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate2 = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        return date2.getFullYear() + "-" + month2 + "-" + currentDate2;
    }

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
