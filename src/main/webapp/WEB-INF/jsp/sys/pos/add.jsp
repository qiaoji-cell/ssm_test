<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-19
  Time: 下午 14:04
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
    <title>添加窗口</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top:10px">
    <form class="layui-form" lay-filter="addForm">
        <fieldset class="layui-elem-field">
            <input type="hidden" name="gardenId">
            <legend><h3>基本资料</h3></legend>
            <div class="layui-field-box">

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
                        <textarea name="posDuty" id="" cols="30" rows="10" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
        </fieldset>

            <div class="layui-inline">
                <div class="layui-input-block">
                    <div class="layui-btn-container">
                        <button class="layui-btn"  lay-submit lay-filter="add">添加</button>
                        <button class="layui-btn"  lay-submit lay-filter="addAndClose">添加并关闭</button>
                        <button type='reset' class="layui-btn" >重置</button>
                    </div>
                </div>
            </div>

    </form>
</div>

<script src="webjars/layui/2.6.8/layui.js" charset="utf-8"></script>
<script src="statics/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script>
    layui.use(['form','layer'],function (){
        let form = layui.form,
            layer = layui.layer;
        function add(){
            let param =form.val("addForm");
            $.post("/sys/pos/add",param)
                .done((res)=>{
                    layer.msg(res.msg)
                })
        }
        form.on('submit(add)',function (){
           add();
            return false;
        })

        form.on('submit(addAndClose)',function (){
            let param =form.val("addForm");
            $.post("/sys/pos/add",param)
                .done((res)=>{

                    layer.msg(res.msg,{time:500},function (){
                        if(res.code!=3001){
                            let parentIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(parentIndex);
                        }
                    })
                })

            return false;
        })
    })
</script>
</body>
</html>
