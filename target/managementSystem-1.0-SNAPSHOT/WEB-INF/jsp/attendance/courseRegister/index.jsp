<%--
  Created by IntelliJ IDEA.
  User: 爱睡觉的小胖儿
  Date: 2021-10-29
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程考勤登记</title>
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
                                <select name="gName"id="r"  lay-filter="r">
                                    <option value=""></option>
                                </select>
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
    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="getCheckData">批量删除</button>
</script>
<script type="text/html" id="rowTool">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">登记</a>
</script>



<%--登记--%>
<div id="update" style="display: none">
    <form class="layui-form" lay-filter = "updateForm">
        <input type="hidden" name="id">
        <br>
        <div class="layui-col-md10">
            <label  class="layui-form-label">
                考勤类型：
            </label>
            <div class="layui-input-block">
                <select name="attendanceType">
                    <option value="">请选择</option>
                    <option value="1">上课</option>
                    <option value="2">兑换</option>
                </select>
            </div>
        </div>
        <br> <br> <br><br>
        <div class="layui-row row8">
            <div class="layui-col-md10">
                <label  class="layui-form-label">
                    本次课时：
                </label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="useCoursetime">
                </div>
            </div>
            <br><br><br><br>
            <div class="layui-col-md10">
                <label  class="layui-form-label">
                    备注：
                </label>
                <div class="layui-input-block">
                    <textarea name="remark" placeholder="请输入内容" class="layui-textarea" style="height: 200px"></textarea>
                </div>
            </div>

        </div>
    </form>
</div>


</body>
</html>
<script>

    /*渲染表格*/
    layui.use(function () {
        var table = layui.table;
        table.render({
            elem:"#tb",
            even:true,
            page:true,
            limit:20,
            limits:[20,50,100],
            height:635,
            toolbar:'#toolbar',
            url:'/attendance/courseRegister/search',
            cols:[[
                {type: "checkbox", align: "center"},

                {field: 'id', title:'ID',align: "center"},
                {field: 'studentcode', title:'学号',align: "center"},
                {field: 'studentName',title: '姓名',align: 'center'},
                {field:"gender",title:"性别",align:"center",templet:function (data) {
                        return data.gender==0?"男":"女";
                    }},
                {field: 'className',title: '班级',align: 'center'},
                {field: 'relationName',title: '关系',align: 'center'},
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
                {field: 'useCoursetime',title: '本次使用',align: 'center'},
                {field: 'gname',title: '班型',align: 'center'},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
            ]]
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

    /*查询*/
    layui.use(function () {
        layui.form.on('select(ru)', function(data){
            layui.use(function () {
                let where = layui.form.val('searchForm');
                layui.table.reload("tb", {where});
            })
        });


        layui.form.on('select(r)', function(data){
            layui.use(function () {
                let where = layui.form.val('searchForm');
                layui.table.reload("tb", {where});
            })
        });

    })

    /*批量删除*/
    layui.use(function () {
        let table = layui.table;
        let $ = layui.jquery;
        let layer = layui.layer;
        let form = layui.form;
        table.on('toolbar(tb)',function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch (obj.event) {
                case 'getCheckData':
                    if (data.length == 0){
                        layer.msg("请最少选择一行");
                    }else {
                        //传递到后台的vo对象
                        let returnCode = {};
                        //勾选的学生的id数组
                        let ids=[]
                        ids = data.map(d=>d.id);
                        //给vo对象赋值ids
                        returnCode.ids=ids;
                        $.ajax({
                            url:"/attendance/courseRegister/del?id="+returnCode.ids,
                            type:"post",
                            data:JSON.stringify(returnCode.ids),
                            contentType:"application/json;charset=UTF-8"
                        }).done(({msg})=>{
                            layui.table.reload('tb');
                            layer.msg(msg);
                        })
                    }
                    break;
            }
        })
    })

    /*操作选择*/
    layui.use(function () {
        let table = layui.table,layer = layui.layer,
            $ = layui.jquery;
        table.on('tool(tb)',obj=>{
            let tr = obj.tr;
            let id = obj.data.id;
            switch (obj.event) {
                case 'del':
                    update(obj.data);
                    break;
            }
        })

    })

    /*课程考勤登记修改*/
    function update(data) {
        layui.use(function () {
            let $ = layui.jquery;
            let layer = layui.layer;
            let id = data.id;
            layui.form.val('updateForm',data);
            layer.open({
                type:1,
                title:'',
                area: ['300px','450px'],
                content: $("#update"),
                btn:['确定','取消'],
                yes(){
                    let kmsstudent = layui.form.val('updateForm');

                    $.post('/attendance/courseReister/djup',kmsstudent)
                        .done(({msg})=>{
                            layer.close(layer.index);
                            layui.table.reload('tb');
                            layer.msg(msg);
                        });
                }
            })
        })
    }
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

