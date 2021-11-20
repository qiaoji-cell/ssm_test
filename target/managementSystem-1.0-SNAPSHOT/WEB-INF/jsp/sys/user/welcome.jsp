<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>首页二</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="statics/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="statics/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="statics/css/public.css" media="all">
    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-cray {color:#ffb800!important;}
        .icon-blue {color:#1e9fff!important;}
        .icon-tip {color:#ff5722!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .layui-red {color:red}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
        .layuimini-notice:hover {background:#f6f6f6;}
        .layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
        .layuimini-notice-title,.layuimini-notice-label {
            padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
        .layuimini-notice-title {line-height:28px;font-size:14px;}
        .layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="fa fa-warning icon"></i>数据统计</div>
                            <div class="layui-card-body">
                                <div class="welcome-module">
                                    <div class="layui-row layui-col-space10">
                                        <div class="layui-col-xs6">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-blue">实时</span>
                                                        <h5>用户统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins"><span id="countUser"></span></h1>
                                                        <small>当前园所用户总数</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs6">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-cyan">实时</span>
                                                        <h5>招生统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins"><span id="studentCount"></span></h1>
                                                        <small>当前招生总记录数</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs6">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-orange">实时</span>
                                                        <h5>档案统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins"><span id="RecordCount"></span></h1>
                                                        <small>当前档案总记录数</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs6">
<%--                                            <div class="panel layui-bg-number">--%>
<%--                                                <div class="panel-body">--%>
<%--                                                    <div class="panel-title">--%>
<%--                                                        <span class="label pull-right layui-bg-green">实时</span>--%>
<%--                                                        <h5>订单统计</h5>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="panel-content">--%>
<%--                                                        <h1 class="no-margins">1234</h1>--%>
<%--                                                        <small>当前分类总记录数</small>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue">费项收入构成</i></div>
                            <div class="layui-card-body">
                                <div class="welcome-module">
                                    <div id="container" style="height: 100%;"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>年度收入统计报表</div>
                            <div class="layui-card-body">
                                <div id="echarts-records" style="width: 100%;min-height:500px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-md4">

                <div class="layui-card">
                    <div class="layui-card-header"><i class="fa fa-paper-plane-o icon"></i>月度学生统计</div>
                    <div class="layui-card-body layui-text layadmin-text">
                        <div id="containerEr" style="height: 300%"></div>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>有提醒信息！！！！</div>
                    <div class="layui-card-body layui-text" id="chuXinXi">
                        <div class="layuimini-notice">
                            <div class="layuimini-notice-title"><span name="studentName"></span></div>
                            <div class="layuimini-notice-extra"><span name="creationDate"></span></div>
                            <div class="layuimini-notice-content layui-hide">
                                <span name="remindContent"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.2.2/dist/echarts.min.js"></script>
<script src="statics/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="statics/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
    layui.use(['layer', 'miniTab','echarts','jquery'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniTab = layui.miniTab,
            echarts = layui.echarts;
            $.get('/count/countUser')
                .done(({data})=>{
                    console.log(data)
                    $("#countUser").html(data);
                })
            $.get('/count/countStudent')
            .done(({data})=>{
                console.log(data)
                $("#studentCount").html(data);
            })
            $.get('/count/countRecord')
            .done(({data})=>{
                console.log(data)
                $("#RecordCount").html(data);
            })
        /*查询每月的学生*/
/*
*                $(`
                            <p style="height: 40px;" class="aoa">
                                <input type='checkbox' lay-skin="primary" value='\${record.id}' name="chu"  title='\${record.studentName}'>
                            </p>
                            `).appendTo($("#chuXinXi"));
                             <div class="layuimini-notice">
                            <div class="layuimini-notice-title"><span name="studentName"></span></div>
                            <div class="layuimini-notice-extra"><span name="creationDate"></span></div>
                            <div class="layuimini-notice-content layui-hide">
                                <span name="remindContent"></span>
                            </div>
                        </div>
* */
            $.get('/count/remindShow')
                .done(result => {
                    console.log(result);
                    for (let classO of result.data) {
                        $(`
                            <div class="layuimini-notice">
                            <div class="layuimini-notice-title"><span name="studentName">\${classO.studentName}\${classO.remindContent}</span></div>
                            <div class="layuimini-notice-extra"><span name="creationDate">\${classO.remindDate}</span></div>
                            <div class="layuimini-notice-content layui-hide">
                                <span name="remindContent">\${classO.remindContent}</span>
                            </div>
                            </div>
                            `).appendTo($("#chuXinXi"));

                    }
                    layui.form.render('select');
                });


        /* $.get('/count/MonthAll')
            .done(result => {
                var dom = document.getElementById("containerEr");
                var myChart = echarts.init(dom);
                var app = {};
                var option;
                option = {
                    xAxis: {
                        type: 'category',
                        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            data: [result.data.count],
                            type: 'bar',
                            showBackground: true,
                            backgroundStyle: {
                                color: 'rgba(180, 180, 180, 0.2)'
                            }
                        }
                    ]
                };
            });*/







        if (option && typeof option === 'object') {
            myChart.setOption(option);
        }

        miniTab.listen();

        /**
         * 查看公告信息
         **/
        $('body').on('click', '.layuimini-notice', function () {
            var title = $(this).children('.layuimini-notice-title').text(),
                noticeTime = $(this).children('.layuimini-notice-extra').text(),
                content = $(this).children('.layuimini-notice-content').html();
            var html = '<div style="padding:15px 20px; text-align:justify; line-height: 22px;border-bottom:1px solid #e2e2e2;background-color: #2f4056;color: #ffffff">\n' +
                '<div style="text-align: center;margin-bottom: 20px;font-weight: bold;border-bottom:1px solid #718fb5;padding-bottom: 5px"><h4 class="text-danger">' + title + '</h4></div>\n' +
                '<div style="font-size: 12px">' + content + '</div>\n' +
                '</div>\n';
            parent.layer.open({
                type: 1,
                title: '提醒你喔！'+'<span style="float: right;right: 1px;font-size: 12px;color: #b1b3b9;margin-top: 1px">'+noticeTime+'</span>',
                area: '300px;',
                shade: 0.8,
                id: 'layuimini-notice',
                btn: ['查看', '取消'],
                btnAlign: 'c',
                moveType: 1,
                content:html,
                success: function (layero) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').attr({
                        href: '',
                        target: '_blank'
                    });
                }
            });
        });

        /**
         * 报表功能
         */
        /*var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
        var optionRecords = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {

            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'邮件营销',
                    type:'line',
                    data:[120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name:'联盟广告',
                    type:'line',
                    data:[220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:'视频广告',
                    type:'line',
                    data:[150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name:'直接访问',
                    type:'line',
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'搜索引擎',
                    type:'line',
                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };
        echartsRecords.setOption(optionRecords);*/

        // echarts 窗口缩放自适应
        window.onresize = function(){
            echartsRecords.resize();
        }
        /*统计*/

    });
</script>
<%--图标统计--%>
<script type="text/javascript">

    layui.use(function(){
        let $ = layui.jquery
        $.ajax({
            url:'/count/MonthAll',
            type:'post',
            success:function(data){

                var domEr = document.getElementById("containerEr");
                var myChart = echarts.init(domEr);
                var app = {};
                var option;
                option = {
                    xAxis: {
                        type: 'category',
                        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            data: [
                                { value: data.str[0] },
                                { value: data.str[1] },
                                { value: data.str[2] },
                                { value: data.str[3] },
                                { value: data.str[4] },
                                { value: data.str[5] },
                                { value: data.str[6] },
                                { value: data.str[7] },
                                { value: data.str[8] },
                                { value: data.str[9] },
                                { value: data.str[10] },
                                { value: data.str[11] },
                                { value: data.str[12] },
                            ],
                            type: 'bar',
                            showBackground: true,
                            backgroundStyle: {
                                color: 'rgba(180, 180, 180, 0.2)'
                            }
                        }
                    ]
                };
                if (option && typeof option === 'object') {
                    myChart.setOption(option);
                }
            }


        })
        $.ajax({
            url:'/count/ChargeMonthAll',
            type:'post',
            success:function(data){
                var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
                var optionRecords = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {

                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'收入',
                            type:'line',
                            data: [
                                { value: data.str[0] },
                                { value: data.str[1] },
                                { value: data.str[2] },
                                { value: data.str[3] },
                                { value: data.str[4] },
                                { value: data.str[5] },
                                { value: data.str[6] },
                                { value: data.str[7] },
                                { value: data.str[8] },
                                { value: data.str[9] },
                                { value: data.str[10] },
                                { value: data.str[11] },
                                { value: data.str[12] },
                            ]
                        }
                    ]
                };
                echartsRecords.setOption(optionRecords);
            }
        })
        $.ajax({
            url:'/count/GrooveCount',
            type:'post',
            success:function(data){
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                var option;
                option = {
                    title: {
                        left: 'left'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    series: [
                        {
                            name: '费项收入构成',
                            type: 'pie',
                            radius: '90%',
                            data: [
                                { value: data.str[0], name: '伙食费' },
                                { value: data.str[1], name: '教材费' },
                                { value: data.str[2], name: '卫生费' },
                                { value: data.str[3], name: '占位费' },
                                { value: data.str[4], name: '园服费' }
                            ],
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                if (option && typeof option === 'object') {
                    myChart.setOption(option);
                }
            }
        })

    })



</script>

<%--月度招生统计--%>
<script type="text/javascript">


</script>
</body>
</html>
