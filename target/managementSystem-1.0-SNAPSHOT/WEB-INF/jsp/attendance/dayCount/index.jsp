<%--
  Created by IntelliJ IDEA.
  User: 爱睡觉的小胖儿
  Date: 2021-10-27
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日常考勤统计</title>
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
    <script src="/statics/lib/2.6.8/layui.js"></script>
    <link rel="stylesheet" href="/statics/localcss/c/input/inputIndex.css">
</head>
<body>
<%--条件查询--%>
<div>
    <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show">
                <form class="layui-form"  lay-filter = "searchForm" id="queryForm">
                    <div class="layui-row row1">
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                考勤日期自：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="willIntoDateStart" placeholder="请输入考勤日期自">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                考勤日期至：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="willIntoDateEnd"placeholder="请输入考勤日期至">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                班级：
                            </label>
                            <div class="layui-input-block">
                                    <select name="className" id="ru"  lay-filter="ru">
                                        <option value=""></option>
                                    </select>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                幼儿姓名：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="name" placeholder="请输入幼儿姓名">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--数据表格--%>
<div class="layui-container layui-table">
    <table id="tb" lay-filter="tb"></table>
</div>




<%--操作--%>
<script type="text/html" id="toolbar">
    <button type="button" class="layui-btn layui-btn-normal  layui-btn-sm"  onclick="search()">查询</button>
    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" lay-event="reset" onclick="cz()">重置</button>
</script>
<script type="text/html" id="rowTool">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">查看</a>
</script>




<div id="update" style="display: none">
    <form class="layui-form" lay-filter = "updateForm">
        <div class="layui-container layui-table">
            <table id="t" lay-filter="t"></table>
        </div>
    </form>
</div>







<span style="margin-left: 35px">
            考勤总计<span name=""style="padding-right: 35px"></span>
            【病假总次数】： <span id="bingjia"style="padding-right: 35px"></span>
            【事假总次数】： <span id="shijia"style="padding-right: 35px"></span>
            【总人数】： <span id="zongrenshu"style="padding-right: 35px"></span>
        </span>

</body>
</html>
<script>

    // 执行条件查询
    function search(){
        layui.use(function () {
            let where = layui.form.val('searchForm');
            layui.table.reload("tb",{where});
        })
    }

    /*重置*/
    function cz(){
        layui.use(function () {
            let $ = layui.jquery;
            $("#queryForm").get(0).reset();
        })
    }

    /*渲染日期*/
    layui.use(function () {
        let laydata = layui.laydate;
        laydata.render({
            elem: '[name=willIntoDateStart],[name=willIntoDateEnd]'
        });
    });

    /*渲染表格*/
    layui.use(function () {
        var table = layui.table;
        table.render({
            elem:"#tb",
            even:true,
            page:true,
            limit:20,
            limits:[20,50,100],
            height:605,
            toolbar:'#toolbar',
            url:'/attendance/dayCount/search',
            cols:[[
                {field: 'id', title:'ID',width:50,align: "center"},
                {field: 'inattendance',title: '考勤月份',align: "center"},
                {field: 'name',title: '姓名',align: 'center'},
                {field: 'leaver',title: '事假',align: 'center'},
                {field: 'sickleave',title: '病假',align: 'center'},
                {field: 'occupiedbed',title: '占床',align: 'center'},
                {field: 'notpark',title: '未入园',align: 'center'},
                {field: 'className',title: '班级',align: 'center'},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
            ]]
        })
    })

    /*考勤统计在园人数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/dayCount/zyrs')
            .done(({data})=>{
                $("#zaiyuan").text(data.zyrs);
            })
    })

    /*考勤统计不在园人数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/dayCount/bzyrs')
        .done(({data})=>{
            $("#weiruyuan").text(data.bzyrs)
        })
    })

    /*对年级进行查询并且对select进行渲染*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/sys/class/list')
            .done(result=>{
                for (let classroomId of result.data){
                    let opt = $("<option/>");
                    opt.html(classroomId.classname);
                    opt.val(classroomId.classname);
                    opt.appendTo("[name = className]");
                }
                layui.form.render('select');
            })
    })

    /*考勤统计病假总次数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/dayCount/bingjia')
        .done(({data})=>{
            $("#bingjia").text(data.bingjia);
        })
    })

    /*考勤统计事假总次数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/dayCount/shijia')
        .done(({data})=>{
            $("#shijia").text(data.bingjia);
        })
    })

    /*考勤统计总人数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/dayCount/zongrenshu')
        .done(({data})=>{
            $("#zongrenshu").text(data.zongrenshu);
        })
    })


    layui.use(function () {
        let table = layui.table,layer = layui.layer,
            $ = layui.jquery;
        table.on('tool(tb)',obj=>{
            let datatime = obj.data.inattendance;
            let data = obj.data;
            switch (obj.event) {
                case 'del':
                    layui.use(function () {
                        var table = layui.table;
                        table.render({
                            elem:"#t",
                            even:true,
                            page:true,
                            limit:20,
                            limits:[20,50,100],
                            height:440,
                            url:'/attendance/dayCount/query?date='+datatime,
                            cols:[[
                                // {field: 'inattendance',title: '考勤月份',align: "center"},
                                {field: 'stunumber',title: '学号',align: 'center'},
                                {field: 'name',title: '姓名',align: 'center'},
                                {field: 'sunday',title: '星期',align: 'center'},
                                {field: 'reason',title:'状态',align:"center",templet:function (d){
                                        switch (d.reason) {
                                            case 1:
                                                return "请假";
                                            case 2:
                                                return "事假";
                                            case 3:
                                                return "占床";
                                            case 4:
                                                return "未入园";
                                                break;
                                            default :
                                                return  "";
                                                break;
                                        }
                                    }},
                            ]]
                        })
                    })
                    layer.open({
                        type: 1,
                        title: '',
                        area: ['1300px', '500px'],
                        content: $("#update"),
                    })

                    break;
            }
        });
    });
</script>