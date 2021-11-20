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
    </style>
</head>
<body>
<div class="layui-container" >
    <form class="layui-form" lay-filter="addForm" style="margin-top:10px;">
        <input type="hidden" name="id">
        <div class="layui-row row1">
            <div class="layui-col-sm6">
                <label for="" class="layui-form-label">园所编码<i class="layui-font-red">*</i>：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="gardenCode" lay-verify="required">
                </div>
            </div>
            <div class="layui-col-sm6">
                <label for="" class="layui-form-label">园所名称<i class="layui-font-red">*</i>：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="gardenName" lay-verify="required">
                </div>
            </div>
        </div>
        <div class="layui-row row2">
<%--            <div class="layui-col-sm6">--%>
<%--                <label for="" class="layui-form-label">上级机构<i class="layui-font-red">*</i>：</label>--%>
<%--                <div class="layui-input-block">--%>
<%--                    <select name="parentOrg" lay-verify="required">--%>
<%--                        <option value="1">顶层部门</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="layui-col-sm12">
                <label for="" class="layui-form-label">负责人：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="gardenPrincipal">
                </div>
            </div>

        </div>
        <div class="layui-row row2">
            <div class="layui-col-sm6">
                <label for="" class="layui-form-label">电话：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="phone">
                </div>
            </div>
            <div class="layui-col-sm6">
                <label for="" class="layui-form-label">传真：</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="fax">
                </div>
            </div>
        </div>
        <div class="layui-row row3">
            <div class="layui-form-item">
                <label for="" class="layui-form-label">备注：</label>
                <div class="layui-input-block">
                    <textarea name="remark" id=""  class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-row row4">
            <div class="layui-form-item">
                <label for="" class="layui-form-label" >收/退款单号后缀&<br>幼儿学号前缀<i class="layui-font-red">*</i>：</label>
                <div class="layui-input-block">
                    <input type="text" name="prefixSuffix" class="layui-input" lay-verify="required">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" lay-submit lay-filter="save" class="layui-btn ">修改</button>
                <button type="submit" lay-submit lay-filter="saveAndClose" class="layui-btn ">修改并关闭</button>
                <button type="button" lay-event="close" class="layui-btn"> 关闭</button>
            </div>
        </div>
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
        form.on('submit(save)',function (){
            let param = form.val('addForm');
            $.post('/base/assert/edit',param)
                .done((result)=>{
                    if(result.code!=3001){
                        layer.msg(result.msg)
                    }else{
                        layer.msg(result.msg)
                    }
                })
            return false;
        })
        //保存并关闭事件
        form.on('submit(saveAndClose)',function (){
            let param = form.val('addForm');
            $.post('/base/assert/edit',param)
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
