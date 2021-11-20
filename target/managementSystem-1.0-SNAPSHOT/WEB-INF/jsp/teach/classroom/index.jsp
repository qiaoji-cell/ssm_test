<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-29
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教室维护</title>
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
</head>
<body>

<div class="layui-container" style="width:35%;display: none">
    <template id="toolbar">
        <button class="layui-btn  layui-btn-sm"  onclick="search()">搜索</button>
        <button class="layui-btn  layui-btn-sm"  onclick="add()">增加</button>
    </template>
</div>
<%--查询条件--%>
<div class="layui-collapse">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">查询条件</h2>
        <div class="layui-colla-content layui-show">
            <form lay-filter="classroomForm"  class="layui-form">
                <div class="layui-form" >
                    <div class="layui-row row1">
                        <div class="layui-inline layui-col-md3">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-block">
                                <select name="roomState" id="roomState">
                                    <option value="1">正常</option>
                                    <option value="2">停用</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">容纳人数</label>
                            <div class="layui-input-block">
                                <input type="text" name="lessNum"  class="layui-input">
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3"style="margin-left: -70px;">
                            <label class="layui-form-label">--</label>
                            <div class="layui-input-block">
                                <input type="text" name="manyNum" class="layui-input">
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
    </div>
</div>
<table id="classRoomTb" lay-filter="classRoomTb"></table>
<%--增加--%>
<div id="add" style="display: none">

    <form lay-filter="addFrom" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="addRemind()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >教室名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="gradename" placeholder="请输入" autocomplete="off" class="layui-input" id="demo3">
                </div>

            </div>
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">容纳人数：</label>
                <div class="layui-input-block">
                    <input type="text" name="conttainNum" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label">状态：</label>
                <div class="layui-input-block">
                    <input type="radio" name="roomState" value="1" title="可用" checked>
                    <input type="radio" name="roomState" value="2" title="停用" >
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md7" style="margin-top: 10px;">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-block">
                    <textarea name="remark" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>

    </form>
</div>
<%--修改--%>
<div id="upRe"  style="display: none">

  <form lay-filter ="upForm" id="upForm" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="update()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <button class="layui-btn  layui-btn-sm" onclick="ClassroomDel()" style="margin-left: 20px;margin-top: 15px;">删除</button>
      <div class="layui-row row1">
          <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
              <label class="layui-form-label" >教室名称：</label>
              <div class="layui-input-block">
                  <input type="text" name="gradename" placeholder="请输入" autocomplete="off" class="layui-input">
                  <input type="hidden" name="id">
              </div>

          </div>
          <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
              <label class="layui-form-label">容纳人数：</label>
              <div class="layui-input-block">
                  <input type="text" name="conttainNum" class="layui-input">
              </div>
          </div>
      </div>
      <div class="layui-row row1">
          <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
              <label class="layui-form-label">状态：</label>
              <div class="layui-input-block">
                  <input type="radio" name="roomState" value="1" title="可用" checked>
                  <input type="radio" name="roomState" value="2" title="停用" >
              </div>
          </div>
      </div>
      <div class="layui-row row1">
          <div class="layui-input-inline layui-col-md7" style="margin-top: 10px;">
              <label class="layui-form-label">备注：</label>
              <div class="layui-input-block">
                  <textarea name="remark" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
              </div>
          </div>
      </div>

  </form>
</div>

<template id="action">
    <button class="layui-btn layui-btn-sm" lay-event="edit">查看</button>
</template>


<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/statics/layuimini/js/lay-config.js" charset="utf-8"></script>
<script>
    layui.use(function () {
        let $ = layui.jquery;
        layui.use(function () {
            let laydate = layui.laydate;
            let table = layui.table;
            /*渲染时间框*/

            /*渲染表格*/
            table.render({
                elem: '#classRoomTb',
                even: true,
                page: true,
                toolbar: '#toolbar',
                limit: 5,
                limits: [5, 10, 15],
                url: "/classRoom/search",
                cols: [[
                    {field: 'id', width: 50, title: '', align: "center"},
                    {field: 'gradename', width: 120, title: '教室名称', align: "center"},
                    {field: 'conttainNum', width: 90, title: '容纳人数', align: "center"},
                    {
                        field: 'roomState', width: 100, title: '教室状态', align: "center", templet: function (data) {
                            return data.roomState == 1 ? "正常" : "停用"
                        }
                    },
                    {field: 'gardenName',width:160, title: '所属园所', align: "left"},
                    {field: 'remark', title: '备注', align: "left"},
                    {title: "操作", fixed: 'right',width: 130, align: "center", templet: "#action"}

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

    });
    function search() {
        layui.use(function () {
            let where = layui.form.val('classroomForm');
            console.log(where);
            layui.table.reload("classRoomTb", {where});
        })
    }


    /*修改*/
    layui.use(function (){
        let table = layui.table;
        table.on('tool(classRoomTb)',obj=>{
            switch (obj.event){
                case 'edit':
                    upRemind(obj.data);
                    break;
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
            /* $("#upForm input[name=remindDate]").val(data.remindDate);
             $("#upForm textarea[name=remindDate]").val(data.remindContent);*/
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '编辑',
                content: $("#upRe")
            });
        })
    }


    function update(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            let classRoom = layui.form.val('upForm');
            $.post('/classRoom/update',classRoom)
                .done(({msg})=>{
                    layer.close(layer.index);
                    layui.table.reload('classRoomTb');
                    layer.msg(msg);
                });
        })
    }


    /*删除*/
    function ClassroomDel(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            let id = $("input[name='id']").val();
            $.get('/classRoom/delete?id='+id)
                .done(({msg})=>{
                    layer.close(layer.index);
                    layui.table.reload('classRoomTb');
                    layer.msg(msg);
                });
        })
    }


    /*新增*/
    function add(){
        layui.use(function (){
            let layer = layui.layer;
            let $ = layui.jquery;
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '添加用户',
                content: $("#add")
            });
        })

    }


    /*增加*/
    function addRemind(){
        layui.use(function (){
            let $=layui.jquery;
            let classroom = layui.form.val('addFrom');
            console.log(classroom.gradename+"-------------------")
            $.post('/classRoom/insert',classroom)
                .done(({msg})=>{
                    console.log(msg);
                    layer.close(layer.index);
                    layui.table.reload('classRoomTb');
                    layer.msg(msg);
                });
        })
    }
</script>
</body>
</html>
