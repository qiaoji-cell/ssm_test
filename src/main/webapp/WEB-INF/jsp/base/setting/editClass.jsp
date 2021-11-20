<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-15
  Time: 下午 17:44
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
    <title>编辑</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        [name=remark]{
            resize:none;
        }
        .row4 .layui-form-label{
            margin-left: -32px;
            width: 112px;
            padding:0px;
        }
        .selectNone{
            user-select: none;
            border:none;
        }
    </style>
</head>
<body>
<div class="layui-container" >
    <form class="layui-form" lay-filter="addForm">
        <fieldset class="layui-elem-field">
            <input type="hidden" name="gardenId">
            <input type="hidden" name="id">
            <legend><h6>基本信息</h6></legend>
            <div class="layui-field-box">
                <input type="hidden" name="id">
                <div class="layui-row row1">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            编码：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input selectNone" name="userCode" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            姓名：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input selectNone" name="upUser">
                        </div>
                    </div>
                </div>
                <div class="layui-row row2">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            变更日期：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input " name="upDate" lay-verify="required|date">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            所属班级：
                        </label>
                        <div class="layui-input-block">
                            <select name="classId" id=""></select>
                        </div>
                    </div>
                </div>
                <div class="layui-row row3">
                    <div class="layui-col-md12">
                        <label for="" class="layui-form-label">
                            变更说明：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input " name="changeNote" lay-verify="">
                        </div>
                    </div>
                   
                </div>
            </div>

        </fieldset>
        <fieldset class="layui-elem-field">
            <legend><h6>变更记录</h6></legend>
            <div class="layui-field-box">
                <table id="changeRecord" lay-filter="changeRecord"></table>
            </div>
        </fieldset>
        <div class="layui-inline">
            <div class="layui-input-block">
                <div class="layui-btn-container">
                    <button class="layui-btn"  lay-submit lay-filter="update">变更</button>
                    <button class="layui-btn"  lay-submit lay-filter="updateAndClose">变更并关闭</button>
                    <button  class="layui-btn" lay-submit lay-filter="reset">重置</button>
                </div>
            </div>
        </div>
    </form>

</div>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    /**
     * 加载变更记录表
     * @param userCode 用户编码
     */
    function loadRecord(userCode){
        layui.use(['form','table','jquery','layer'],function (){
            let form = layui.form,
                $ = layui.jquery,
                table = layui.table;

                table.render({
                    elem: '#changeRecord',
                    url: 'base/setting/upClassRecord?userCode='+userCode,
                    height:330,
                    cellMinWidth:50,
                    defaultToolbar: ['filter', 'exports', 'print', {
                        title: '提示',
                        layEvent: 'LAYTABLE_TIPS',
                        icon: 'layui-icon-tips'
                    }],
                    cols: [[
                        {type:'numbers', align: "center"},
                        {field: "upDate",title:'变更日期',align: "center"},
                        {field: 'newClass', title: '新班级', width:220,align: "center"},
                        {field: 'oldClass', title: '原班级', width:220,align:'center',align: "center"},
                        {field: 'upNote', title: '变更说明',align: "center"},
                        {field: 'upUser', minWidth:200,title: '变更人',align: "center"}
                    ]],
                    limits: [5, 10, 15, 20, 25,50, 100],
                    limit: 5,
                    page: true,
                    skin: 'line',
                    done:function (){
                        $("")
                    }
                });
        })
    }

    let oldClassName="";
    let oldClassId;
    /**
     * 加载班级列表 并通过classId选中所在班级
     * @param classId
     */
    function loadClass(classId){
        layui.use(['form','jquery'],function (){
            let form = layui.form,
                $ = layui.jquery;
            $.get("base/setting/ClassList")
            .done(({data})=>{
                for (let classObj of data) {
                    let option = $('<option>')
                    option.text(classObj.classname)
                    option.val(classObj.id);
                    option.appendTo("[name=classId]");
                }
                if(classId!=null){
                    $('[name=classId]').val(classId)
                    oldClassName = $("[name=classId] option:selected").text();
                }
                form.val();
            })

        })
    }


    layui.use(['form','table','jquery','util','layer'],function (){
        let form = layui.form,
            table = layui.table,
            $ = layui.jquery,
            util = layui.util,
            laydate = layui.laydate,
            layer = layui.layer;



        laydate.render({
            elem:'[name*=Date]',
            value:new Date()
        })

        //监听lay-event事件
        util.event('lay-event',{
            'close':function (othis){
                let parentIndex = parent.layer.getFrameIndex(window.name);
                parent.layer.close(parentIndex)
            }
        })

        //修改事件
        form.on('submit(update)',function (){
            let param = form.val('addForm');
            let newClass=$("[name=classId] option:selected").text();
            if(oldClassId!=null){
                if(newClass==oldClassName){
                    layer.msg("该人员已属于该班级，请重新选择")
                }
                let oIndex = oldClassName.indexOf('】');
                oldClassName = oldClassName.substr(oIndex+1);
            }
            param.oldClass=oldClassName;
            //新班级的名字
            param.newClass=newClass;

            $.post('/base/setting/add',param)
                .done((result)=>{
                    if(result.code!=3001){
                        //完成后oldName编程newName
                        oldClassName  = $("[name=classId] option:selected").text();
                        table.reload('changeRecord',{})
                        layer.msg(result.msg)
                    }else{
                        layer.msg(result.msg)
                    }
                })
            return false;
        })
        //重置
        form.on('submit(reset)',function (){
            form.val('addForm',{
                posName:'',
                posDesc:'',
                posDuty:''
            })
            return false;
        })
        //保存并关闭事件
        form.on('submit(updateAndClose)',function (){
            let param = form.val('addForm');
            //原来班级的名字
            //新班级的名字
            let newClass=$("[name=classId] option:selected").text();
            if(oldClassId!=null){
                if(newClass==oldClassName){
                    layer.msg("该人员已属于该班级，请重新选择")
                }
                let oIndex = oldClassName.indexOf('】');
                oldClassName = oldClassName.substr(oIndex+1);
            }
            param.oldClass=oldClassName;
            param.newClass=newClass;
            $.post('/base/setting/add',param)
                .done((result)=>{
                    if(result.code!=3001){
                        oldClassName = newClass=$("[name=classId] option:selected").text();
                        layer.msg(result.msg,{time:1000},function (){
                            let parentIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(parentIndex)
                        })
                    }else{
                        layer.msg(result.msg)
                    }
                })
            return false;
        })
    })


</script>
</body>
</html>
