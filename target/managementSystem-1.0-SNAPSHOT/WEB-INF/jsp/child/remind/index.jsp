<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-26
  Time: 10:01
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
    <link rel="stylesheet" href="/statics/localcss/z/return/index.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show">
                <form lay-filter="chargeForm"  class="layui-form">
                    <div class="layui-form" >
                        <div class="layui-row row1">
                            <div class="layui-inline layui-col-md3">
                                <label class="layui-form-label">班级</label>
                                <div class="layui-input-block">
                                    <select name="classId" id="classId">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-input-inline layui-col-md3">
                                <label class="layui-form-label">幼儿姓名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="studentName" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-input-inline layui-col-md3">
                                <label class="layui-form-label">状态</label>
                                <div class="layui-input-block">
                                    <select name="status" id="status" >
                                        <option value="0">全部</option>
                                        <option value="1">待办理</option>
                                        <option value="2">办理中</option>
                                        <option value="3">已办理</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row row2">
                            <div class="layui-input-inline layui-col-md3" style="margin-top: 10px;">
                                <label class="layui-form-label" >提醒时间自：</label>
                                <div class="layui-input-block">
                                    <input type="text" name="createDate" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-input-inline layui-col-md3" style="margin-top: 10px;">
                                <label class="layui-form-label">提醒时间至：</label>
                                <div class="layui-input-block">
                                    <input type="text" name="endDate" class="layui-input">
                                </div>
                            </div>
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
                            <div class="layui-input-inline layui-col-md3" style="margin-top: 10px;">

                            </div>
                        </div>
                    </div>

                    <div class="layui-container" style="width:35%;display: none">
                        <template id="toolbar">
                            <button class="layui-btn  layui-btn-sm" type="button"  onclick="search()">查询</button>
                           <c:if test="${sessionScope.userSession.garden_id>0}">
                               <button class="layui-btn  layui-btn-sm"  onclick="add()">增加</button>
                           </c:if>

                        </template>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <table id="chargeTb" lay-filter="chargeTb"></table>

</div>

<template id="action">
    <button class="layui-btn layui-btn-sm" lay-event="edit" >查看</button>
</template>
<%--新增--%>

<div id="add" style="display: none">

    <form lay-filter="addFrom" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="addRemind()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >所属幼儿：</label>
                <div class="layui-input-block">
                    <input type="text" name="" placeholder="请输入" autocomplete="off" class="layui-input" id="demo3">
                    <input type="hidden" name="studentId" placeholder="" class="" >
                    <input type="hidden" name="classId" placeholder="" class="">
                    <input type="hidden" name="gradeId" placeholder="" class="">
                </div>

            </div>
            <div class="layui-input-inline">
                <div class="layui-input-block">

                </div>
            </div>

            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">提醒时间：</label>
                <div class="layui-input-block">
                    <input type="text" name="remindDate" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label">提醒内容：</label>
                <div class="layui-input-block">
                <textarea name="remindContent" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md7" style="margin-top: 10px;">
                <label class="layui-form-label">提醒状态：</label>
                <div class="layui-input-block">
                    <select name="status" id="addStatus">
                        <option value="1">待办理</option>
                        <option value="2">办理中</option>
                        <option value="3">已办理</option>
                    </select>

                </div>
            </div>
        </div>

    </form>
</div>


<%--修改状态--%>

<div id="upRe" style="display: none">

    <form lay-filter ="upForm" id="upForm" class="layui-form">

        <button class="layui-btn  layui-btn-sm" onclick="update()" style="margin-left: 20px;margin-top: 15px;">保存并关闭</button>
        <button class="layui-btn  layui-btn-sm" onclick="RemindDel()" style="margin-left: 20px;margin-top: 15px;">删除</button>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;">
                <label class="layui-form-label" >所属幼儿：</label>
                <div class="layui-input-block">
                    <input type="text" name="studentName" placeholder="请输入" readonly="readonly" autocomplete="off" class="layui-input" >
                    <input type="hidden" name="id" placeholder="" class="" >
                    <input type="hidden" name="classId" placeholder="" class="">
                    <input type="hidden" name="gradeId" placeholder="" class="">
                </div>

            </div>
            <div class="layui-input-inline">
                <div class="layui-input-block">

                </div>
            </div>

            <div class="layui-input-inline layui-col-md5" style="margin-top: 10px;margin-left: 20px;">
                <label class="layui-form-label">提醒时间：</label>
                <div class="layui-input-block">
                    <input type="text" name="remindDate" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md9" style="margin-top: 10px;">
                <label class="layui-form-label">提醒内容：</label>
                <div class="layui-input-block">
                    <textarea name="remindContent" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-row row1">
            <div class="layui-input-inline layui-col-md7" style="margin-top: 10px;">
                <label class="layui-form-label">提醒状态：</label>
                <div class="layui-input-block">
                    <select name="status" >
                        <option value="0">全部</option>
                        <option value="1">待办理</option>
                        <option value="2">办理中</option>
                        <option value="3">已办理</option>
                    </select>

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
    let $=layui.jquery;
    layui.use(function (){
        let laydate = layui.laydate;
        let table = layui.table;
        /*渲染时间框*/
        laydate.render({
            elem: '[name*=Date]'
        });
        /*渲染表格*/
        table.render({
            elem: '#chargeTb',
            even: true,
            page: true,
            toolbar:'#toolbar',
            limit: 5,
            limits: [5, 10, 15],
            url: "/remind/search",
            cols: [[
                {field: 'id', width: 120, title: 'id', align: "center"},
                {field: 'remindDate', width: 120, title: '提醒时间', align: "center"},
                {field: 'studentCode', width: 90, title: '学号', align: "center"},
                {field: 'studentName', width: 100, title: '姓名', align: "center"},
                {field: 'className', width: 90, title: '班级', align: "center"},
                {field: 'status', width: 90, title: '状态', align: "center",templet:function (data) {
                        if (data.status==1){
                            return '<span style="color: brown">待办理</span>';
                        }else if(data.status==2){
                            return '<span style="color: dodgerblue">已办理</span>';
                        }else if(data.status==3){
                            return "办理中";
                        }
                    }},
                {field: 'remindContent', width: 700, title: '提醒内容', align: "left"},
                {field: 'userName', width: 130, title: '录入人', align: "center"},
                {field: 'gardenName', width: 150, title: '所属园所', align: "center"},
                {field: 'creationDate', width: 130, title: '录入时间', align: "center"},
                {title:"操作",fixed:'right',align: "center",templet:"#action"}
            ]]
            ,done:function (){
                $("[data-field='id']").css('display','none')

            }
        });

        /*渲染班级select*/
        $.get('/sys/class/list')
            .done(result=>{
                console.log(result);
                for (let classO of result.data){
                    let opt = $("<option/>");
                    opt.html(classO.classname);
                    classO.id = classO.id
                    opt.val(classO.id);

                    opt.appendTo("[name = classId]");
                }
                layui.form.render('select');
            });
    })

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
/*执行条件查询*/
function search() {
    layui.use(function () {
        let where = layui.form.val('chargeForm');
        console.log(where);
        layui.table.reload("chargeTb", {where});
    })
}

function addRemind(){

    layui.use(function (){
        let $=layui.jquery;
        let remind = layui.form.val('addFrom');
        console.log(remind.status+"-------------------")
        $.post('/remind/insert',remind)
            .done(({msg})=>{
                console.log(msg);
                layer.close(layer.index);
                layui.table.reload('chargeTb');
                layer.msg(msg);
            });

    })

}


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
        let remind = layui.form.val('upForm');
        $.post('/remind/update',remind)
            .done(({msg})=>{
                layer.close(layer.index);
                layui.table.reload('chargeTb');
                layer.msg(msg);
            });
    })
}


/*删除*/
function RemindDel(){
    layui.use(function (){
        let layer = layui.layer;
        let $ = layui.jquery;
        let remind = layui.form.val('upForm');

        let id = remind.id;
        console.log(id+"-------------");
        $.get('/remind/delete?id='+id)
            .done(({msg})=>{
                layer.close(layer.index);
                layui.table.reload('chargeTb');
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
/* layui.use(function () {
     let layer = layui.layer;
     let $ = layui.jquery;
     /!*  ("#add>form")[0].each(function (){
           $(this).get(0).reset();
       })*!/
     layer.open({
         type: 1,
         area:['900px','600px'],
         title: '添加用户',
         content: $("#add")
     });
 });*/
/*显示提醒学生信息*/
layui.use(['table', 'form', 'tableSelect'],function (){

    let $ = layui.jquery,
        table = layui.table,
        form = layui.form,
        tableSelect = layui.tableSelect;
    tableSelect.render({
        elem: '#demo3',
        checkedKey: 'id',
        searchType: 'more', //开启多条件搜索
        searchList: [
            {searchKey: 'name', searchPlaceholder: '搜索用户姓名'}, //搜索条件1
            {searchKey: 'sex', searchPlaceholder: '搜索用户性别'},  //搜索条件2
        ],
        table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
            url:'/base/record/searchEr',
            cols: [[
                { type: 'radio',height:40 },
                {field: 'id',width: 10,title: 'id'},
                {field:'studentCode',width:100,title:'学生编号',align:"center"},
                {field:'studentName',width:100,title:'姓名',align:"center"},
                {field:"gender",width:100,title:"性别",align:"center",templet:function(data){
                        return data.gender==0?"男":"女"
                    }},
                {field:'className',width:120,title:'所属班级',align:"center",templet:function (data){
                        return data.className;
                    }},
                {field: 'gradeId',width: 80,title:'年级'},
                {field: 'classroomId',width: 80,title:'班级id'},
                {field:'statusName',width:100,title:'状态',align:"center"},
                {field:'enterDate',title:'正式入园',align:"center"}

            ]]
            ,done:function (){
                $("[data-field='classroomId']").css('display','none')
                $("[data-field='id']").css('display','none')
                $("[data-field='gradeId']").css('display','none')
            }
        },
        done: function (elem, data) {
            var NEWJSON = []
            layui.each(data.data, function (index, item) {
                NEWJSON.push(item.studentName);
                $("input[name='studentId']").val(item.id);
                $("input[name='classId']").val(item.classroomId);
                $("input[name='gradeId']").val(item.classroomId);

            })
            elem.val(NEWJSON.join(","))


        }
    })

})


layui.use(function (){
    let table = layui.table;
    table.on('tool(chargeTb)',obj=>{
        switch (obj.event){
            case 'edit':
                upRemind(obj.data);
                break;
        }
    })
})








</script>
</html>
