<%--
  Created by IntelliJ IDEA.
  User: 爱睡觉的小胖儿
  Date: 2021-11-01
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程考勤统计</title>
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
                            <label  class="layui-form-label">
                                班型：
                            </label>
                            <div class="layui-input-block">
                                <select name="gName">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                班级：
                            </label>
                            <div class="layui-input-block">
                                <select name="className">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
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



<script type="text/html" id="toolbar">
    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="getCheckData" onclick="search()">查询</button>
    <button class="layui-btn layui-btn-normal layui-btn-sm" onclick="cz()">重置</button>
</script>



<div style="margin-left: 55px">
    课时总计：<span id="keshizongji"></span>
</div>
</body>
</html>
<script>
    /*重置*/
    function cz(){
        layui.use(function () {
            let $ = layui.jquery;
            $("#queryForm").get(0).reset();
        })
    }
    /*对班级进行查询并且对select进行渲染*/
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
            height:600,
            toolbar:'#toolbar',
            url:'/attendance/courseCount/search',
            cols:[[
                {field: 'id', title:'ID',align: "center"},
                {field: 'attendanceDate', title:'考勤日期',align: "center"},
                {field: 'gname',title: '班型',align: 'center'},
                {field: 'className',title: '班级',align: 'center'},
                {field: 'studentcode', title:'学号',align: "center"},
                {field: 'studentName',title: '姓名',align: 'center'},
                {field:"gender",title:"性别",align:"center",templet:function (data) {
                        return data.gender==0?"男":"女";
                    }},
                {field: 'phone',title: '手机号',align: 'center'},
                {field:'attendanceType',title:'考勤状态',align:"center",templet:function (d){
                        switch (d.attendanceType) {
                            case 1:
                                return "上课";
                                break;
                            case 2:
                                return "兑换";
                                break;
                            default :
                                return "";
                        }
                    }},
                {field: 'useCoursetime',title: '课时',align: 'center'},
                {field: 'remark',title: '说明',align: 'center'},
            ]]
        })
    })

    // 执行条件查询
    function search(){
        layui.use(function () {
            let where = layui.form.val('searchForm');
            layui.table.reload("tb",{where});
        })
    }

    /*统计课时总计*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/attendance/courseCount/keshitongji")
            .done(({data})=>{
                $("#keshizongji").text(data.zhong)
            })
    })

    /*对班型下拉框渲染*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get('/attendance/courseRegister/model')
            .done(result=>{
                for (let classroomId of result.data){
                    let opt = $("<option/>");
                    opt.html(classroomId.gname);
                    opt.val(classroomId.gname);
                    opt.appendTo("[name = gName]");
                }
                layui.form.render('select');
            })
    })

</script>