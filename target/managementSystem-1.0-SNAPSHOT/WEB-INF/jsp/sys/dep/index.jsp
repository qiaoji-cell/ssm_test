<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-16
  Time: 下午 16:15
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
    <title>部门管理</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="webjars/layui/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        /*.layuimini-container{*/
        /*    height: 96vh;*/
        /*}*/
        .layui-elem-field{
            height: 91vh;
            overflow: hidden;
        }
        .layui-form-label{
            width: 90px;
            padding:9px 10px;
        }
        .depTree{
            margin-top:40px;

        }
        .depTree::-webkit-scrollbar-track{
            background: transparent;
        }
        .depTree::-webkit-scrollbar-thumb{
            background: rgba(0,0,0,0.3);
            border-radius: 10%;

        }
        .depTree::-webkit-scrollbar-track-piece{
            background: transparent;
        }
        .depTree::-webkit-scrollbar{
            width: 5px;
            background: transparent;
        }
    </style>
</head>
<body style="padding-bottom: 0px">
    <div class="layui-fluid">
            <div class="layui-row">
                <div class="layui-col-md2">
                    <fieldset class="layui-elem-field" >
                        <legend><h3>选择部门</h3></legend>
                        <c:if test="${sessionScope.userSession.garden_id == 0}">
                            <form class="layui-form" lay-filter="posForm">
                                <div class="layui-col-md12" style="padding:10px 10px">
                                    <select name="gardenId" class="layui-select" lay-filter="depSelect">
                                        <option value="0">总部</option>
                                        <option value="1">分园</option>
                                    </select>
                                </div>
                            </form>
                        </c:if>

                        <div class="layui-field-box <c:if test="${sessionScope.userSession.garden_id == 0}"> depTree</c:if>
                        " >
                            <div id="tree"></div>
                        </div>

                    </fieldset>
                </div>
                <fieldset class="layui-elem-field">
                    <legend><h3>详细信息</h3></legend>
                    <div class="layui-field-box">
                        <form class="layui-form" lay-filter="depForm" id="depForm">
                            <input type="hidden" name="id" id="depId">
                            <div class="layui-row row1">
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门编码<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="depCode" lay-verify="required">
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门名称<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="depName" lay-verify="required">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row2">
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">上级部门<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-block">
                                        <select name="parentId" class="layui-select">
                                            <option value="-1">顶层部门</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门负责人：</div>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="depPrincipal">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row3">
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门电话：</div>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="depPhone">
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门传真：</div>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="depFax">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row4">
                                <div class="layui-col-md6">
                                    <div class="layui-form-label">部门类型<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-block">
                                        <select class="layui-select" name="depType" lay-verify="required">
                                            <option value="">请选择</option>
                                            <option value="1">常规部门</option>
                                            <option value="2">销售部门</option>
                                            <option value="3">客服部门</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md6">
                                </div>
                            </div>
                            <div class="layui-row row5">
                                <div class="layui-col-md12">
                                    <div class="layui-form-label">备注：</div>
                                    <div class="layui-input-block">
                                        <textarea class="layui-textarea" name="depRemark" id="" cols="30" rows="10"></textarea>
                                    </div>
                                </div>

                            </div>
                            <c:if test="${sessionScope.userSession.garden_id == 0}">
                                <div class="layui-row row5">
                                    <div class="layui-col-md12">
                                        <div class="layui-input-block">
                                            <div class="layui-btn-container">
                                                <shiro:hasPermission name="jc:sys:dep:add"><button type="submit" class="layui-btn" lay-submit lay-filter="add"><i class="layui-icon layui-icon-add-1"></i> 新增</button></shiro:hasPermission>
                                                <shiro:hasPermission name="jc:sys:dep:delete"><button type="submit" class="layui-btn layui-btn-danger" lay-submit lay-filter="del"><i class="layui-icon layui-icon-delete"></i> 删除</button></shiro:hasPermission>
                                                <shiro:hasPermission name="jc:sys:dep:update"><button type="submit" class="layui-btn"  lay-submit lay-filter="update">更新</button></shiro:hasPermission>
                                                <shiro:hasPermission name="jc:sys:dep:reset"><button type="reset" class="layui-btn layui-btn-warm">重置</button></shiro:hasPermission>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:if>

                        </form>

                    </div>
                </fieldset>

        </div>
    </div>
    <script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<%--    <script src="webjars/jquery/3.1.1/jquery.js" charset="utf-8"></script>--%>
    <script>
        layui.use(['form','layer','tree','jquery'],function (){
            let tree = layui.tree,
                form = layui.form,
                layer = layui.layer,
                $ = layui.jquery;
                //监听form的下拉列表改变事件
                form.on('select(depSelect)',function (data){
                    loadTree(data.value)
                    //清除详细信息
                    $("#depForm").get(0).reset();
                })

                let garden_id = ${sessionScope.userSession.garden_id};
                if(garden_id > 0){
                    loadTree(garden_id)
                }
                let oldParent=null; //旧上级部门
                let oldDep=null;//旧部门类型
                //加载部门树
                function loadTree(gId){
                    $.get("/sys/dep/list",{gardenId:gId})
                        .done(({data})=>{
                            tree.render({
                                elem:"#tree",
                                onlyIconControl:true,
                                data:data,
                                id:'depTree',
                                click:function (obj){
                                    let data = obj.data;
                                    //填充信息
                                    $('[name=depType]').val(data.depType)
                                    $('[name=parentId]').val(data.parentId)
                                    oldDep = data.depType;
                                    oldParent = data.parentId;
                                    form.val('depForm',obj.data)
                                    form.render();
                                }
                            })
                            //加载下拉部门树
                            loadSelectTree();

                        })


                }

                //如果是总部用户的话 可以查看加载分园总部部门类型
                if(garden_id==0){
                    let gardenId= $("[name=gardenId]").val();
                    loadTree(gardenId);
                }

                //加载选项数
                function loadSelectTree(){
                    let gardenId = $("[name=gardenId]").val();
                    $.get("/sys/dep/selectTree",{gardenId:gardenId}).
                        done(({data})=>{
                            $('[name=parentId]').empty();
                        let option = $('<option>');
                        option.text("顶层部门");
                        option.val(-1);
                        option.appendTo('[name=parentId]')
                          for(let org of data){
                              let option = $('<option>');
                              option.text(org.selectName);
                              option.val(org.id);
                              option.appendTo('[name=parentId]');
                         }

                        form.render();
                        console.log("旧的"+oldParent)
                        if(oldParent!=null){
                            $('[name=depType]').val(oldDep)
                            $('[name=parentId]').val(oldParent)
                            console.log("重新渲染了")
                            form.render();
                        }
                    })
                    //重新加载
                }

                form.on("submit(update)",function (){
                    //加载部门类型
                    let gardenId= $("[name=gardenId]").val();

                    let param = form.val('depForm');
                    if(param.id==null||param.id==''){
                        layer.msg("请选择一个部门");
                        return false
                    }
                    param.gardenId=gardenId;
                    console.log(param)
                    $.post('/sys/dep/update',param)
                    .done((res)=>{
                        //刷新树菜单
                        if(res.code!=3001){
                            let gardenId= $("[name=gardenId]").val();
                            loadTree(gardenId);
                        }
                        layer.msg(res.msg)
                    })
                    return false;
                })

                form.on("submit(add)",function (){
                    let gardenId= $("[name=gardenId]").val();
                    let param = form.val('depForm')
                    param.gardenId=gardenId;
                    $.post('/sys/dep/add',param)
                        .done((res)=>{
                            if(res.code!=3001){
                                let gardenId= $("[name=gardenId]").val();
                                loadTree(gardenId);
                            }
                            layer.msg(res.msg)
                        })
                    return false;
                })

                form.on("submit(del)",function (){
                    let param = form.val('depForm')
                    if(param.id==null||param.id==''){
                        layer.msg("请选择一个部门");
                        return false
                    }
                    let gardenId= $("[name=gardenId]").val();
                    param.gardenId=gardenId;
                    layer.confirm('确定删除么',{icon: 3, title:'提示'}, function(index){
                        $.post('/sys/dep/del',param)
                            .done((res)=>{
                                if(res.code!=3001){
                                    //刷新树菜单
                                    let gardenId= $("[name=gardenId]").val();
                                    loadTree(gardenId);
                                    //清空表单
                                    $('#depForm').get(0).reset();
                                    $("#depId").val(null);
                                }
                                layer.msg(res.msg)
                            })
                        layer.close(index);
                    })

                    return false;
                })
        })
    </script>
</body>
</html>
