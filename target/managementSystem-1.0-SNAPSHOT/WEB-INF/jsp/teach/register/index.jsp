<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-11-02
  Time: 11:36
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
<template id="action">
    <button class="layui-btn layui-btn-sm" lay-event="attend">上课登记</button>
</template>
<div class="layui-container" style="width:35%;display: none">
    <template id="toolbar">
        <button class="layui-btn  layui-btn-sm"  onclick="search()">搜索</button>
         <c:if test="${sessionScope.userSession.garden_id>0}">
        <button class="layui-btn  layui-btn-sm"  onclick="add()">增加</button>
        </c:if>
    </template>
</div>

<div class="layui-colla-content layui-show">
    <form lay-filter="registerFrom"  class="layui-form">
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
<table id="classTypeTb" lay-filter="classTypeTb"></table>
<%----%>
<template id="RegisterAc">
    <button class="layui-btn layui-btn-sm" lay-event="upReg">修改</button>
    <button class="layui-btn layui-btn-sm" lay-event="delReg">删除</button>
</template>
<div id="showRegister" lay-filter="showRegister"  style="display: none">

    <form lay-filter ="registerForm" id="registerForm" class="layui-form">

        <button class="layui-btn  layui-btn-sm" id="cun" onclick="addRegister()" style="margin-left: 20px;margin-top: 15px;">保存</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label">上课时间:</label>
                <div class="layui-input-block">
                    <input type="text" name="timeClass" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">教室：</label>
                <div class="layui-input-block">
                    <select name="classroomId" id="classroomId" lay-filter="classroomId">

                    </select>
                </div>
            </div>
        </div>
        <div class="layui-row row2">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >本次课时：</label>
                <div class="layui-input-block">
                    <input type="text" name="hours" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">主课老师：</label>
                <div class="layui-input-block">
                   <select name="userId" id="userId" lay-filter="userId">

                    </select>
                       <%-- <input type="text" name="userId">--%>
                        <input type="hidden" name="id">
                    <input type="hidden" name="classmodelId" id="classModelId">
                </div>
            </div>
        </div>
        <div class="layui-row row3">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >说明：</label>
                <div class="layui-input-block">
                    <input type="text" name="explaIn" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </form>
    <table id="registerTb" lay-filter="registerTb"></table>
</div>

<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/statics/layuimini/js/lay-config.js" charset="utf-8"></script>
<script>
    /*查询用户*/
    /*layui.use(function (){
        let $ = layui.jquery;
        let gardenId = $("input[name='garden']").val();
        $.get("/sys/user/listRe?gardenId="+gardenId).
        done(({data})=>{
            for(let org of data){
                let option = $('<option>');
                option.text(org.userName);
                option.val(org.id);
                option.appendTo('[name = userId]');
            }
            layui.form.render('select');
        });
    })*/




    layui.use(function () {
        let $ = layui.jquery;
        let laydate = layui.laydate;
        let table = layui.table;

        /*渲染时间框*/
        laydate.render({
            elem: '[name=timeClass]'
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
                    {field: 'gname',width:100, title: '班型名称', align: "center"},
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
        //获取教室
        let gardenId = $("input[name='garden']").val();


        $.get("/classRoom/searchQuery?gardenId="+gardenId).
        done(({data})=>{
            for(let org of data){
                let option = $('<option>');
                option.text(org.gradename);
                option.val(org.id);
                option.appendTo('[name = classroomId]');
            }
            layui.form.render('select');
        });
        $.get("/registerUser/search?gardenId="+gardenId).
        done(({data})=>{
            for(let org of data){
                let option = $('<option>');
                option.text(org.userName);
                option.val(org.id);
                option.appendTo('[name = userId]');
            }
            layui.form.render('select');
        });
    });
    /*执行条件查询*/
    function search() {
        layui.use(function () {
            let where = layui.form.val('registerFrom');
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





    /*上课登记*/
    layui.use(function (){
        let table = layui.table;
        let $ = layui.jquery
        table.on('tool(classTypeTb)',obj=>{

            switch (obj.event){
                case 'attend':

                    showAttend(obj.data);
                    break;
                case 'delReg':
                    delReg(obj.data);
            }
        })
    })

    /*显示幼儿的信息*/
    function showAttend(data){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            console.log(data);
            $("#classModelId").val(data.id);
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
                    url: "/teach/register/search?classroomId="+data.id,
                    cols: [[
                        {field: 'id', width: 50, title: '', align: "center"},
                        {field: 'timeClass',width:110,  title: '上课时间', align: "center"},
                        {field: 'gradeName',width:80, title: '教室', align: "center"},
                        {field: 'userName',width:120, title: '主课老师', align: "left"},
                        {field: 'hours',width:120, title: '本次课时', align: "left"},
                        {field: 'explaIn', width:240,title: '说明', align: "left"},
                        {title: "操作", fixed: 'right',width: 140, align: "center", templet: "#RegisterAc"}

                    ]]
                });
            })
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '编辑',
                content: $("#showRegister"),
                end:function (){
                    $("#registerForm")[0].reset();
                }
            });
        })
    }
    function addRegister(){
        layui.use(function (){
            let $ = layui.jquery;
            let layer = layui.layer;
            let register = layui.form.val('registerForm');
            console.log(register);
            $.post('/teach/register/insert',register)
                .done(({msg})=>{
                    layer.msg(msg);
                    layui.table.reload('registerTb');
                });
        })

    }

    /*课时信息进行修改*/
    layui.use(function (){
        let table = layui.table;
        let $ = layui.jquery
        table.on('tool(registerTb)',obj=>{
            switch (obj.event){
                case 'upReg':
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
    function UpRe(data){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            layui.form.val('registerForm',data);
        })
    }

    function UpRea(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            let register = layui.form.val('registerForm');
            $.post('/teach/register/update',register)
                .done(({msg})=>{
                    layui.table.reload('registerTb');
                    layer.msg(msg);
                });
        })
    }
    function delReg(data){
        layui.use(function (){
            let $ = layui.jquery;
            $.get('/teach/register/delete?id='+data.id)
                .done(({msg})=>{
                    layui.table.reload('registerTb');
                    layer.msg(msg);
                })
        })
    }
</script>
</body>
</html>
