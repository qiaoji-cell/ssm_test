<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-11-03
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
</head>
<body>
<div class="layui-container" style="width:35%;display: none">
    <template id="toolbar">
        <button class="layui-btn  layui-btn-sm"  onclick="search()">搜索</button>
    </template>
</div>
<form  lay-filter="leaveGarden"  class="leaveGarden layui-form">
<c:if test="${sessionScope.userSession.garden_id == 0}">
    <div class="layui-form" >
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md3">
                <label class="layui-form-label">选择机构:</label>
                <div class="layui-input-block">

                    <select name="gardenId" >
                        <option value="0"></option>
                    </select>
                </div>
            </div>
        </div>
    </div>


</c:if>

</form>
<input type="hidden" name="garden" value="${sessionScope.userSession.garden_id}">


<template id="action">
    <button class="layui-btn layui-btn-sm" lay-event="pass" >审核通过</button>
    <button class="layui-btn layui-btn-sm" lay-event="returna" >审核退回</button>

</template>
<table id="leaveTb" lay-filter="leaveTb">


</table>
</body>
<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/statics/layuimini/js/lay-config.js" charset="utf-8"></script>
<script>
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
            url:'/leaveGarden/register/search',
            cols:[[
                {field:'studentCode',width:100,title:'学生编号',align:"center"},
                {field:'studentName',width:100,title:'姓名',align:"center"},
                {field:'enterDate',width:160,title:'正式入园时间',align:"center"},
                {field:'leavingType',width:160,title:'离园类型',align:"center",templet:function (data){
                        if (data.leavingType==1){
                            return "幼儿退园";
                        }else if(data.leavingType==2){
                            return"幼儿毕业";
                        }else if(data.leavingType==3){
                            return "转园";
                        }
                    }},
                {field:'leavingCause',width:160,title:'离园原因',align:"center",templet:function (data){
                        if (data.leavingCause){
                            return "家庭原因";
                        }else if(data.leavingCause==2){
                            return"对园所不满意";
                        }else if(data.leavingCause==3){
                            return "转入其他园所";
                        }else if(data.leavingCause==4){
                            return "幼儿不适";
                        }
                    }},
                {field:'state',width:160,title:'状态',align:"center",templet:function (data){
                        if (data.state==1){
                            return '<span style="color: brown">待审核</span>';
                        }else if(data.state==2){
                            return"已通过";
                        }else if(data.state==3){
                            return '<span style="color: dodgerblue">未通过</span>';
                        }
                    }},
                {field:'',width:100,title:'未确认收费',align:"center"},
                {field:'',width:100,title:'已确认收费',align:"center"},
                {field:'',title:'备注',align:"center"},
                {field: 'gardenName',title: '所属园所'},
                {field: 'caozuo',title:"操作",width:260,fixed:'right',align: "center",templet:function (data){
                    if (data.state==1){
                        return ' <button class="layui-btn layui-btn-sm" lay-event="pass" >审核通过</button><button class="layui-btn layui-btn-sm" lay-event="returna" >审核退回</button>';
                    }else{
                        return  '';
                    }
                    }}

            ]]
            ,done: function () {
                let garden = $("input[name='garden']").val();
                if(garden>0){
                    $("[data-field='caozuo']").css('display','none');
                    $("[data-field='gardenName']").css('display','none')
                }

            }
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
    })
    function search() {
        layui.use(function () {
            let where = layui.form.val('leaveGarden');
            console.log(where);
            layui.table.reload("leaveTb", {where});
        })
    }
    layui.use(function (){
        let table = layui.table;
        table.on('tool(leaveTb)',obj=>{
            switch (obj.event){
                case 'pass':

                    pass(obj.data);
                    break;
                case 'returna':
                    returna(obj.data);
                    break;
            }
        })
    })
    function pass(data){
        console.log(data);
        let id = data.id;
        let state = 1;
        layui.use(function (){
            let $ = layui.jquery;
                layer.confirm('确定继续么', function(index){
                    $.get('/leaveGarden/register/update?id='+id+"&state="+2)
                        .done(({msg})=>{
                            layui.table.reload('leaveTb');
                            layui.msg(msg);
                        })
                    $.get('/base/record/updateStatus?id='+id+"&statusId="+3);
                    layer.close(index);
                });
        })

    }
    function returna(data){
        console.log(data);
        layui.use(function (){
            let $ = layui.jquery;
            let id = data.id;
            $.get('/leaveGarden/register/update?id='+id+"&state="+3)
                .done(({msg})=>{
                    layui.table.reload('leaveTb');
                })
            $.get('/base/record/updateStatus?id='+studentId+"&statusId="+1);
        })
    }
</script>
</html>
