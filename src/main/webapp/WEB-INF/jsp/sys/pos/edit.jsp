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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
<body>
<div class="layui-container" >
    <form class="layui-form" lay-filter="addForm">
        <fieldset class="layui-elem-field">
            <input type="hidden" name="gardenId">
            <input type="hidden" name="id">
            <legend><h3>基本资料</h3></legend>
            <div class="layui-field-box">
                <input type="hidden" name="id">
                <div class="layui-form-item">
                    <label for="" class="layui-form-label">
                        职位名称：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="posName" lay-verify="required">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="" class="layui-form-label">
                        职位说明：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="posDesc">
                    </div>
                </div>
            </div>

        </fieldset>
        <fieldset class="layui-elem-field">
            <legend><h3>岗位职责</h3></legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <label for="" class="layui-form-label">
                        岗位职责：
                    </label>
                    <div class="layui-input-block">
                        <textarea name="posDuty"  id="" cols="30" rows="10" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
        </fieldset>
<c:if test="${sessionScope.userSession.garden_id == 0}">
        <div class="layui-inline">
            <div class="layui-input-block">
                <div class="layui-btn-container">
                    <button class="layui-btn"  lay-submit lay-filter="update">更新</button>
                    <button class="layui-btn"  lay-submit lay-filter="updateAndClose">更新并关闭</button>
                    <button  class="layui-btn" lay-submit lay-filter="reset">重置</button>
                </div>
            </div>
        </div>
</c:if>
    </form>

</div>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','table','jquery','util','layer'],function (){
        let form = layui.form,
            table = layui.table,
            $ = layui.jquery,
            util = layui.util,
            layer = layui.layer;

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
            $.post('/sys/pos/edit',param)
                .done((result)=>{
                    if(result.code!=3001){
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
            $.post('/sys/pos/edit',param)
                .done((result)=>{
                    if(result.code!=3001){
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
