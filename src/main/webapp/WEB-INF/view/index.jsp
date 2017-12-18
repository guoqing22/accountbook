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
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toast.style.css">
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/moment.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/daterangepicker.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/toast.script.js"></script>




    <style>
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
            height: 100%;
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
        .col-md-1 {
            padding: 0;
            margin: 0;
        }

        .col-md-2 {
            padding: 0;
            margin: 0;
        }

        .col-md-3 {
            padding: 0;
            margin: 0;
        }

        .col-md-4 {
            padding: 0;
            margin: 0;
        }

        .col-md-5 {
            padding: 0;
            margin: 0;
        }

        .col-md-6 {
            padding: 0;
            margin: 0;
        }

        .col-md-7 {
            padding: 0;
            margin: 0;
        }

        .col-md-8 {
            padding: 0;
            margin: 0;
        }

        .col-md-9 {
            padding: 0;
            margin: 0;
        }

        .col-md-10 {
            padding: 0;
            margin: 0;
        }

        .col-md-11 {
            padding: 0;
            margin: 0;
        }

        .col-md-12 {
            padding: 0;
            margin: 0;
        }
    </style>

</head>
<body>
<header style="background-color: #1b5a7d;color: white">
    <div class="container">
        <div class="row head-info">
            <div class="col-md-2"><span>欢迎：</span><span id="user">王国庆</span></div>
            <div class="col-md-10 text-right"><p id="time1"></p></div>
        </div>
    </div>
    <div class="container">
        <div class="row" style="height: 50px">
            <div class="col-md-4"><h3><a href="<%= basePath%>bill.jsp"><img class="logo" src="<%= basePath%>resources/img/284843.png"/> 个人帐务管理系统</a></h3>
            </div>
            <div class="col-md-4 pull-right">
                <ul class="nav nav-pills">
                    <li role="presentation"><a href="#">首页</a></li>
                    <li role="presentation"><a href="#">个人资料</a></li>
                    <li role="presentation"><a href="#">安全设置</a></li>
                    <li role="presentation"><a href="#">关于</a></li>
                    <li role="presentation"><a href="#">退出</a></li>
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
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284868.png">&nbsp;账单查询</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/123397.png">&nbsp;添加账单</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/123405.png">&nbsp;删除账单</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284863.png">&nbsp;修改账单</a></li>
                        </ul>
                    </div>
                </div>

                <div class="link-item">
                    <div class="link-title-a">&#9733; 图表信息</div>
                    <div class="link-title-b">
                        <ul>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284871.png">&nbsp;收支对比</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284859.png">&nbsp;花费去向</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284861.png">&nbsp;收入来源</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/284858.png">&nbsp;资金变化</a></li>
                            <li><a href="#"><img class="png" src="<%= basePath%>resources/img/186244.png">&nbsp;图表赏析</a></li>
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
                <div class="main-title">首页/CPI指数</div>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 100%;height: 540px">
                    <table id="dataGridTableJson"
                           class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th class="selectColumn">选择</th>
                            <th>账单号</th>
                            <th>用户名</th>
                            <th>日期<span id="inputDate"><i class="fa fa-calendar fa-fw"></i></span></th>
                            <th>存/取</th>
                            <th>一级</th>
                            <th>二级</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><i class="fa fa-circle-thin" aria-hidden="true"></i></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a href="#">更改</a></td>
                            <td><a href="#">删除</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

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
    $(function () {
        var datatrangeoption = {
            startDate: moment().subtract(29, 'days').format('YYYY-MM-DD HH:mm:ss'),
            endDate: moment().format('YYYY-MM-DD HH:mm:ss'),
            minDate: '01/01/2010',
            maxDate: '12/31/2100',
            dateLimit: {
                days: 365
            },
            showDropdowns: true,
            timePicker: true,
            timePickerIncrement: 1,
            timePicker24Hour: true,
            alwaysShowCalendars: true,
            calender_style: "picker_4",
            ranges: {
                "今日": [moment().startOf("day"), moment()],
                "昨日": [moment().subtract("days", 1).startOf("day"), moment().subtract("days", 1).endOf("day")],
                "最近7日": [moment().subtract("days", 6), moment()],
                "最近30日": [moment().subtract("days", 29), moment()],
                "本月": [moment().startOf("month"), moment().endOf("month")],
                "上个月": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
            },

            locale: {
                "format": "YYYY-MM-DD HH:mm:ss",
                "separator": " - ",
                "applyLabel": "应用",
                "cancelLabel": "取消",
                "fromLabel": "开始时间",
                "toLabel": "结束时间",
                "customRangeLabel": "自定义",
                "weekLabel": "周",
                "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
                "monthNames": ["1月", "2月", "3月", "4月", "5月", "6月",
                    "7月", "8月", "9月", "10月", "11月", "12月"],
                "firstDay": 1
            }

        };
        $("#inputDate").daterangepicker(datatrangeoption,
            function (start, end, label) {
                $.ajax({
                    url: "<%= basePath%>bill/selectbill",
                    type: "post",
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                        "start_date": start.format("YYYY-MM-DD HH:mm:ss"),
                        "end_date": end.format("YYYY-MM-DD HH:mm:ss")
                    }),
                    success: function (msg) {
                        var tb = $("tbody");
                        $(tb).empty();
                        if (msg && msg.length > 0) {
                            $.each(msg, function (i, row) {
                                var tr = $('<tr>');
                                $(tr).append('<td><i class="fa fa-circle-thin" aria-hidden="true"></i></td>');
                                $(tr).append('<td>' + row.billid + '</td>');
                                $(tr).append('<td>' + row.username + '</td>');
                                $(tr).append('<td>' + row.billdate + '</td>');
                                $(tr).append('<td>' + row.typeid + '</td>');
                                $(tr).append('<td>' + row.classa + '</td>');
                                $(tr).append('<td>' + row.billinfo + '</td>');
                                $(tr).append('<td><a href="#">更新</a></td>');
                                $(tr).append('<td><a href="#">删除</a></td>');
                                $(tb).append(tr);
                            });
                        }


                    },
                    error: function (msg) {
                        alert("123456")
                        /*alert(msg.status)
                        alert(msg.stringify)*/
                        $.Toast("请求出错", "错误代码：" + msg.stack(), "error", {
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
            }
        );



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
