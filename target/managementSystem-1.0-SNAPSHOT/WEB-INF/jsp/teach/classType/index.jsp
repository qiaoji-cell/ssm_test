<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-29
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
</head>
<body>
<div class="layui-container" style="width:35%;display: none">
    <template id="toolbar">
        <button class="layui-btn  layui-btn-sm"  onclick="search()">搜索</button>
        <c:if test="${sessionScope.userSession.garden_id>0}">
            <button class="layui-btn  layui-btn-sm"  onclick="add()">增加</button>
        </c:if>
    </template>
</div>

<template id="action">
    <button class="layui-btn layui-btn-sm" lay-event="edit">查看班型</button>
    <button class="layui-btn layui-btn-sm" lay-event="showStu">查看学生</button>
</template>

<%--查询条件--%>
<div class="layui-colla-content layui-show">
    <form lay-filter="classTypeFrom"  class="layui-form">
        <div class="layui-form" >
            <div class="layui-row row1">
                <div class="layui-inline layui-col-md3">
                    <label class="layui-form-label">快速检索</label>
                    <div class="layui-input-block">
                        <select name="jiansuo" id="roomState" lay-filter="jiansuo">
                            <option value="1">班级名称</option>
                            <option value="2">所属课程</option>
                            <option value="3">备注</option>
                        </select>
                    </div>
                </div>
                <div class="layui-input-inline layui-col-md3">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <input type="text" name="lessNum" id="cha" class="layui-input">
                    </div>
                </div>
                <input type="hidden" name="garden" value="${sessionScope.userSession.garden_id}">
                <c:if test="${sessionScope.userSession.garden_id == 0}">

                    <div class="layui-input-inline layui-col-md3">
                        <label class="layui-form-label">选择机构:</label>
                        <div class="layui-input-block">

                            <select name="gardenId" >
                                <option value="0"></option>
                            </select>
                        </div>
                    </div>
                </c:if>
            </div>



        </div>


    </form>

</div>

<%--主页显示的表格数据--%>
<table id="classTypeTb" lay-filter="classTypeTb"></table>


<%--增加时显示的数据--%>
<%--增加--%>
<div id="add" style="display: none">

    <form lay-filter="addFrom" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="addRemind()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >班型名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="gname" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">所属课程：</label>
                <div class="layui-input-block">
                    <select name="subjectId"  lay-filter="jiansuo">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-row row2">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >课时数量：</label>
                <div class="layui-input-block">
                    <input type="text" name="classHour" lay-verify="required|number" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">应缴费用：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required|number" name="classCost" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row3">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >开始日期：</label>
                <div class="layui-input-block">
                    <input type="text" name="startDate" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">结束日期：</label>
                <div class="layui-input-block">
                    <input type="text" name="endDate" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row4">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label" >授课老师：</label>
                <div class="layui-input-block">

                    <input type="text" name="TeacherName" placeholder="请输入" autocomplete="off" class="layui-input" id="demo3">
                    <input type="hidden" name="classTeacher" >
                </div>

            </div>

        </div>
        <div class="layui-row row5">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label" >备注：</label>
                <div class="layui-input-block">
                    <textarea name="" remark lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>

<%--修改班型--%>
<div id="upClass" lay-filter="upClass"  style="display: none">

    <form lay-filter ="upForm" id="upForm" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="update()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <button class="layui-btn  layui-btn-sm" onclick="ClassroomDel()" style="margin-left: 20px;margin-top: 15px;">删除</button>

        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >班型名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="gname"  placeholder="请输入" autocomplete="off" class="layui-input">
                    <input type="hidden" name="id">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">所属课程：</label>
                <div class="layui-input-block">
                    <select name="subjectId"  lay-filter="jiansuo">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-row row2">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >课时数量：</label>
                <div class="layui-input-block">
                    <input type="text" name="classHour" lay-verify="required|number" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">应缴费用：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required|number" name="classCost" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row3">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >开始日期：</label>
                <div class="layui-input-block">
                    <input type="text" name="startDate" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">结束日期：</label>
                <div class="layui-input-block">
                    <input type="text" name="endDate" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row4">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label" >授课老师：</label>
                <div class="layui-input-block">
                    <input type="text" name="TeacherName" placeholder="请输入" autocomplete="off" class="layui-input">
                    <input type="hidden" name="classTeacher" >  </div>
            </div>

        </div>
        <div class="layui-row row5">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label" >备注：</label>
                <div class="layui-input-block">
                    <textarea name="" remark lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>


<template id="RegisterAc">
    <button class="layui-btn layui-btn-sm" lay-event="upReg">修改</button>
    <button class="layui-btn layui-btn-sm" lay-event="delReg">删除</button>
</template>

<%--查看学生登记--%>
<div id="showRegister" lay-filter="showRegister"  style="display: none">

    <form lay-filter ="registerForm" id="registerForm" class="layui-form">

        <button class="layui-btn  layui-btn-sm" id="cun" onclick="addRegister()" style="margin-left: 20px;margin-top: 15px;">保存</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                    <label class="layui-form-label">班级名称:</label>
                    <div class="layui-input-block">
                        <select name="classroomId" id="classroomId" lay-filter="classroomId">
                            <option value="0">请选择</option>
                        </select>
                    </div>
            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">选择幼儿：</label>
                <div class="layui-input-block">
                    <select name="studentId" id="studentId" lay-filter="studentId">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-row row2">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >开始上课：</label>
                <div class="layui-input-block">
                    <input type="text" name="startDate" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">上课截至：</label>
                <div class="layui-input-block">
                    <input type="text" name="endDate" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row3">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >课时数：</label>
                <div class="layui-input-block">
                    <input type="text" name="classHour" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">实缴费用：</label>
                <div class="layui-input-block">
                    <input type="hidden" name="classModelId"  class="layui-input">
                    <input type="text" name="paidin"  class="layui-input">
                    <input type="hidden" name="id">
                </div>
            </div>
        </div>

        <div class="layui-row row4">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label" >说明：</label>
                <div class="layui-input-block">
                    <textarea name="explaIn" remark lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
    </form>
    <table id="registerTb" lay-filter="registerTb"></table>
</div>
<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/statics/layuimini/js/lay-config.js" charset="utf-8"></script>
<script>
    /*选择班型的授课老师*/
    layui.use(['table', 'form', 'tableSelect'],function (){
        let $ = layui.jquery,
            table = layui.table,
            form = layui.form,
            tableSelect = layui.tableSelect;
            let garden = $('input[name="garden"]').val();
            console.log(garden);
            let gardenId = garden
            tableSelect.render({
            elem: '#demo3',
            checkedKey: 'id',
            table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
                url:'/sys/user/list?gardenId='+gardenId,
                cols: [[
                    { type: 'radio',height:40 },
                    {field: 'id',width: 10,title: 'id'},
                    {field:'userName',width:100,title:'用户名称',align:"center"}
                ]]

            },
            done: function (elem, data) {
                var NEWJSON = []
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.userName);
                    console.log(item);
                    $("input[name='classTeacher']").val(item.id);
                    $("input[name='TeacherName']").val(item.userName);
                })
                elem.val(NEWJSON.join(","))

            }
        })

    })












    layui.use(function () {
        let $ = layui.jquery;
        let laydate = layui.laydate;
        let table = layui.table;

        /*渲染时间框*/
        laydate.render({
            elem: '[name*=Date]'
        });
        layui.use(function () {
            let laydate = layui.laydate;
            let table = layui.table;
            /*渲染时间框*/

            /*渲染表格*/
            table.render({
                elem: '#classTypeTb',
                even: true,
                page: true,
                toolbar: '#toolbar',
                height:710,
                limit: 20,
                limits: [20, 50, 100],
                url: "/classModel/search",
                cols: [[
                    {field: 'id', width: 50, title: '', align: "center"},
                    {field: 'gname',width:100, title: '版型名称', align: "center"},
                    {field: 'gradeName', width:100, title: '所属课程', align: "center"},
                    {field: 'classHour', width:100,title: '课程数量', align: "left"},
                    {field: 'classCost',width:100, title: '应缴费用', align: "left"},
                    {field: 'startDate',width:140, title: '开始日期', align: "left"},
                    {field: 'endDate',width:140, title: '结束日期', align: "left"},
                    {field: 'userName', width:100,title: '授课老师', align: "left"},
                    {field: 'gardenName',width:170, title: '所属园所', align: "left"},
                    {field: 'remark', title: '备注', align: "left"},
                    {title: "操作", fixed: 'right',width:190,align: "center", templet: "#action"}

                ]]
                , done: function () {
                    let garden = $("input[name='garden']").val();
                    if(garden>0){
                        $("[data-field='gardenName']").css('display','none')
                    }

                }
            });


        });
        $.get("/base/assert/select").
        done(({data})=>{
            $('select[name=gardenId]').empty();
            for(let org of data){
                let option = $('<option>');
                option.text(org.gardenName);
                option.val(org.id);
                option.appendTo('[name = gardenId]');
            }
            layui.form.render('select');
        })
        $.get("/subject/search").
        done(({data})=>{
            for(let sub of data){
                let option = $('<option>');
                option.text(sub.gradename);
                option.val(sub.id);
                option.appendTo('[name = subjectId]');
            }
            layui.form.render('select');
        })
    });


    /*查看里面的数据*/
  /*  layui.use(function (){
        let laydate = layui.laydate;
        let table = layui.table;
        table.render({
            elem: '#registerTb',
            even: true,
            page: true,
            limit: 5,
            limits: [5, 10, 15],
            url: "/register/search?classModelId="+data.id,
            cols: [[
                {field: 'id', width: 50, title: '', align: "center"},
                {field: 'className', width: 120, title: '班级', align: "center"},
                {field: 'studentCode', width: 90, title: '学号', align: "center"},
                {field: 'studentName',width:160, title: '姓名', align: "left"},
                {field: 'startDate', title: '上课开始', align: "left"},
                {field: 'endDate', title: '上课截止', align: "left"},
                {field: 'classHour', title: '课时数', align: "left"},
                {field: 'paidin', title: '实缴费用', align: "left"},
                {field: 'gardenName', title: '所属园所', align: "left"},
                {field: 'remark', title: '说明', align: "left"},
                {title: "操作", fixed: 'right',width: 130, align: "center", templet: ""}

            ]]
            , done: function () {
                let garden = $("input[name='garden']").val();
                if(garden>0){
                    $("[data-field='gardenName']").css('display','none')
                }

            }
        });
    })*/



    /*执行条件查询*/
    function search() {
        layui.use(function () {
            let where = layui.form.val('classTypeFrom');
            console.log(where);
            layui.table.reload("classTypeTb", {where});
        })
    }

    /*监听检索的条件*/
    layui.use(function (){
        let $ = layui.jquery;
        layui.form.on('select(jiansuo)', function(data){
            if(data.value==1){
                $("#cha").attr("name","gName");
            }
            if(data.value==2){
                $("#cha").attr("name","subjectName");
            }
            if(data.value==3){
                $("#cha").attr("name","remark");
            }
            console.log(data.value); //得到被选中的值
        });
    })

    /*增加班型*/
    function add(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '添加用户',
                content: $("#add"),
                end:function (){
                    $("#addForm")[0].reset();
                }
            });
        })

    }



    /*增加班型*/
    function addRemind(){
        layui.use(function (){
            let $=layui.jquery;
            let classType = layui.form.val('addFrom');
            console.log(classType+"-------------------")
            $.post('/classModel/insert',classType)
                .done(({msg})=>{
                    console.log(msg);
                    layer.close(layer.index);
                    layui.table.reload('classTypeTb');
                    layer.msg(msg);
                });
        })
    }
    /*修改*/
    layui.use(function (){
        let table = layui.table;
        table.on('tool(classTypeTb)',obj=>{
            switch (obj.event){
                case 'edit':
                    upRemind(obj.data);
                    break;
                case 'showStu':
                    register(obj.data);
            }
        })
    })
    /*修改*/
    function upRemind(data){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            layui.form.val('upForm',data);
            console.log(data);
            $("input[name='TeacherName']").val(data.userName);
            $("input[name='classTeacher']").val(data.classTeacher);
            /* $("#upForm input[name=remindDate]").val(data.remindDate);
             $("#upForm textarea[name=remindDate]").val(data.remindContent);*/
                layer.open({
                type: 1,
                area:['900px','600px'],
                title: '编辑',
                content: $("#upClass"),
                end:function (){
                    $("#upForm")[0].reset();
                }

        });
        })
    }
    /*修改班型*/
    function update(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            let classmodel = layui.form.val('upForm');
            $.post('/classModel/update',classmodel)
                .done(({msg})=>{
                    layer.close(layer.index);
                    $("#upForm")[0].reset();
                    layui.table.reload('classTypeTb');
                    layer.msg(msg);
                });
        })
    }
    /*修改幼儿显示的信息*/
    layui.use(function (){
        let table = layui.table;
        let $ = layui.jquery
        table.on('tool(registerTb)',obj=>{

            switch (obj.event){
                case 'upReg':
                    $("#classroomId").attr("disabled","disabled");
                    $('#studentId').attr('disabled','disabled');
                    UpRe(obj.data);
                    layui.use(function (){
                        let $ = layui.jquery;
                        $('#cun').removeAttr("onclick");
                        $('#cun').attr('onclick','UpRea()');
                    });
                    break;
                case 'delReg':
                    delReg(obj.data);
            }
        })
    })
/*对幼儿信息进行修改*/
    function UpRe(data){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            console.log(data);
            let option = $('<option>');
            option.text(data.studentName);
            option.val(data.studentId);
            option.appendTo('[name = studentId]');
            layui.form.val('registerForm',data);
        })
    }
    function UpRea(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            let register = layui.form.val('registerForm');
            $.post('/register/update',register)
                .done(({msg})=>{
                    layui.table.reload('registerTb');
                    layer.msg(msg);
                });
        })
    }
    /*删除幼儿信息*/
    function delReg(data){
        layui.use(function (){
            let $ = layui.jquery;
            $.get('/register/delete?id='+data.id)
                .done(({msg})=>{
                    layui.table.reload('registerTb');
                    layer.msg(msg);
                })
        })
    }



    /*查看学生信息 并且进行增加查询等操作*/
    function register(data){
        /*显示table里的信息*/
        layui.use(function (){
            let $ = layui.jquery;
            let laydate = layui.laydate;
            let table = layui.table;
            table.render({
                elem: '#registerTb',
                even: true,
                page: true,
                limit: 5,
                limits: [5, 10, 15],
                url: "/register/search?classModelId="+data.id,
                cols: [[
                    {field: 'id', width: 50, title: '', align: "center"},
                    {field: 'className',width:80,  title: '班级', align: "center"},
                    {field: 'studentCode',width:80, title: '学号', align: "center"},
                    {field: 'studentName',width:70, title: '姓名', align: "left"},
                    {field: 'startDate',width:120, title: '上课开始', align: "left"},
                    {field: 'endDate', width:120,title: '上课截止', align: "left"},
                    {field: 'classHour',width:90, title: '课时数', align: "left"},
                    {field: 'paidin', width:100,title: '实缴费用', align: "left"},
                    {field: 'gardenName', title: '所属园所', align: "left"},
                    {field: 'remark', width:140,title: '说明', align: "left"},
                    {title: "操作", fixed: 'right',width: 140, align: "center", templet: "#RegisterAc"}

                ]]
                , done: function () {
                    let garden = $("input[name='garden']").val();
                    if(garden>0){
                        $("[data-field='gardenName']").css('display','none')
                    }

                }
            });
        })
       /*显示上面input和弹出层*/
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            /*查询班级*/
            $.get('/sys/class/list')
                .done(result=>{
                    console.log(result);
                    for (let classO of result.data){
                        let opt = $("<option/>");
                        opt.html(classO.classname);
                        opt.val(classO.id);
                        opt.appendTo("[name = classroomId]");
                    }
                    layui.form.render('select');
                });
            layui.form.on('select(studentId)', function(datae){
                  if( datae.value>0){
                      console.log(data+"里面的");
                      $('#showRegister input[name="startDate"]').val(data.startDate);
                      $('#showRegister input[name="endDate"]').val(data.endDate);
                      $('#showRegister input[name="classHour"]').val(data.classHour);
                      $('#showRegister input[name="Paidin"]').val(data.classCost);
                      $('#showRegister input[name="classModelId"]').val(data.id);
                  }
            });



            /* $("#upForm input[name=remindDate]").val(data.remindDate);
             $("#upForm textarea[name=remindDate]").val(data.remindContent);*/
            layer.open({
                type: 1,
                area:['1000px','600px'],
                title: '幼儿登记',
                content: $("#showRegister"),
                end:function (){
                    $("#studentId option").remove();
                    $("#registerForm")[0].reset();
                    $("#classroomId").removeAttr("disabled");
                    $('#studentId').removeAttr('disabled');
                }
            });
        })

    }

    layui.use(function (){
        let $ = layui.jquery;
        layui.form.on('select(classroomId)', function(data){
            $('select[name="studentId"]').find("option").remove();
           $.get("/base/record/termSearch?classroomId="+data.value)
               .done(result=>{
                   for (let record of result.data){
                       let opt = $("<option/>");
                       opt.html(record.studentName);
                       opt.val(record.id);
                       opt.appendTo("[name = studentId]");
                   }
                   layui.form.render('select');
               });
            console.log(data.value); //得到被选中的值
        });

    })
    /*增加班型里的幼儿*/
    function addRegister(){
        layui.use(function (){
            let $ = layui.jquery;
            let layer = layui.layer;
            let register = layui.form.val('registerForm');
            let name =  $('#registerForm select[name="studentId"] option:selected').val();
            console.log(name+"------"+"name");
            register.studentId = name;
            console.log(register.classroomId);
            console.log(register.classModelId+"---------");
            console.log(register.Paidin);
            console.log(register.studentId);
            $.post('/register/insert',register)
                .done(({msg})=>{
                    layer.open({
                        type: 1,
                        area:['900px','600px'],
                        title: '幼儿登记',
                        content: $("#showRegister")
                    });
                    layer.msg(msg);
                    layui.table.reload('registerTb');

                });
        })

    }


</script>
</body>
</html>
