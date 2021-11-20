<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-11-03
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="layui-colla-content layui-show">
    <form lay-filter="registerFrom"  class="layui-form">
        <div class="layui-form" >
            <div class="layui-row row1">
                <div class="layui-inline layui-col-md3">
                    <label class="layui-form-label">选择班级</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="garden" value="${sessionScope.userSession.garden_id}">
                        <select name="classroomId" id="classroomId" lay-filter="classroomId">
                            <option value="0">请选择</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>
    </form>
</div>
<template id="action">
    <button class="layui-btn layui-btn-sm"  style="display: none" id="jiao" lay-event="subGar">提交</button>

</template>
<table id="leaveTb" lay-filter="leaveTb"></table>
<div class="layui-form" >
    <form class="layui-form" lay-filter="ionForm">
    <div class="layui-row row1">
        <div class="layui-inline layui-col-md3">
            <label class="layui-form-label">离园时间:</label>
            <div class="layui-input-block">
                <input type="text" name="leavingDate" class="layui-input" value="">
            </div>
        </div>
        <div class="layui-inline layui-col-md3">
            <label class="layui-form-label">离园类型:</label>
            <div class="layui-input-block">

                <select name="leavingType" >
                    <option value="1">幼儿退园</option>
                    <option value="2">幼儿毕业</option>
                    <option value="3">转园</option>
                </select>
            </div>
        </div>
        <div class="layui-inline layui-col-md3">
            <label class="layui-form-label">离园原因:</label>
            <div class="layui-input-block">
                <select name="leavingCause" id="leavingCause">
                    <option value="1">家庭原因</option>
                    <option value="2">对园所不满意</option>
                    <option value="3">转入其他园所</option>
                    <option value="4">幼儿不适</option>
                </select>
                <input type="hidden" name="studentId">
            </div>
        </div>

        <div class="layui-inline layui-col-md3">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-sm"  type="button" onclick="queren()" style="margin-top: 10px;margin-left: -50px;">确定提交</button>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/statics/layuimini/js/lay-config.js" charset="utf-8"></script>
<script>
    layui.use(function (){
        let layer = layui.layer;
        let $ = layui.jquery;
        let laydate = layui.laydate;
        laydate.render({
            elem: '[name=leavingDate]'
        });
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
    })
    layui.use(function (){
        let layer = layui.layer;
        let $ = layui.jquery;
        let table = layui.table;
        let gardenId =  $("input[name='garden']").val();
        table.render({
            elem:'#leaveTb',
            even:true,
            page:true,
            cellMinWidth:100,
            limit:5,
            toolbar: '#toolbar',
            id:'leaveTb',
            limits:[5,10,15],
            url:'/base/record/leaveSearch?gardenId='+gardenId,
            cols:[[
                {type: 'checkbox', fixed: 'left',templet:function (){
                            return
                    }},
                {field:'studentCode',width:100,title:'学生编号',align:"center"},
                {field:'studentName',width:100,title:'姓名',align:"center"},
                {field:'className',width:120,title:'所属班级',align:"center",templet:function (data){
                        return data.className;
                    }},
                {field:'enterDate',width:160,title:'正式入园时间',align:"center"},
                {field:'statusName',width:160,title:'状态',align:"center"},
                {field:'',width:100,title:'未确认收费',align:"center"},
                {field:'',width:100,title:'已确认收费',align:"center"},
                {title:"备注",fixed:'right',align: "center",templet:"#action"}
            ]]
        });
    })
    layui.form.on('select(classroomId)',function(data){
        search();
    });
    function search() {
        layui.use(function () {
            let where = layui.form.val('registerFrom');
            console.log(where);
            layui.table.reload('leaveTb', {where});
        })
    }
    layui.use(function  (){
        let table = layui.table;
        let $ = layui.jquery
        table.on('tool(leaveTb)',obj=>{
            switch (obj.event){
                case 'subGar':
                    console.log(obj.data);
                    $("input[name='id']").val(obj.data.id);
                    break;
                case 'delReg':
                    delReg(obj.data);
            }
        })
    })


    let resultsData=new Map();

    layui.table.on('checkbox', function(data){
        let $ = layui.jquery;
       $("input[name='studentId']").val(data.data.id);
    });






    function queren(){

        layui.use(function (){
            let $ = layui.jquery;
            let record = layui.form.val('ionForm');
            let studentId = $("input[name=studentId]").val();
            let leavingDate = $("input[name=leavingDate]").val();
                console.log(studentId+"-----");
       if (studentId==''){
           layer.confirm('请选择一个幼儿', function(index){
               console.log("确定！");
               layer.close(index);
           });
           return;
        }
       if (leavingDate==''){
           layer.confirm('请选择时间', function(index){
               console.log("确定！");
               layer.close(index);
           });
           return;
       }
       layer.confirm('幼儿状态将改为离园是否继续?', function(index){
           console.log(record);
           $.post('/leaveGarden/register/insert',record)
                    .done(({msg})=>{
                        layer.msg(msg);
                        layui.table.reload('leaveTb');
                        $("input[name=studentId]").val('');
                    });
                $.get('/base/record/update?id='+studentId+"&statusId="+3);
                layer.close(index);
            });


        })


    }

</script>
</html>
