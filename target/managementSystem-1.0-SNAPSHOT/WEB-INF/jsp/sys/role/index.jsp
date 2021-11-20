<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-19
  Time: 上午 10:34
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
    <title>角色</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/ztree_v3/css/metroStyle/metroStyle.css">
    <script src="webjars/jquery/3.1.1/jquery.js"></script>
    <script src="statics/ztree_v3/js/jquery.ztree.all.min.js"></script>
    <style>
        .ztree{
            height:98%;
        }
        .layui-card-body{
            background:#fafafa;
            height: calc(100% - 81px);
            overflow: scroll;
            overflow-x:hidden;
        }
        .layui-card-body::-webkit-scrollbar-track{
            background: transparent;
        }
        .layui-card-body::-webkit-scrollbar-thumb{
            background: rgba(0,0,0,0.3);
            border-radius: 10%;

        }
        .layui-card-body::-webkit-scrollbar-track-piece{
            background: transparent;
        }
        .layui-card-body::-webkit-scrollbar{
            width: 5px;
            background: transparent;
        }

        .ztree *{
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="layui-fluid " style="margin-top: 10px" >
        <div class="lay-row">
            <div class="layui-col-md8">
                <div class="layui-collapse">
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title">查询条件</h2>
                        <div class="layui-colla-content layui-show">
                            <form class="layui-form" lay-filter="posForm" id="roleForm">
                                <div class="layui-inline">
                                    <label class="layui-form-label">快速检索：</label>
<c:if test="${sessionScope.userSession.garden_id == 0}">
                                    <div class="layui-input-block">
                                        <select name="gardenId" class="layui-select" lay-filter="orgSelect">
                                            <option value="0">总部</option>
                                            <option value="1">分园</option>
                                        </select>
                                    </div>
</c:if>
                                </div>
                                <div class="layui-inline">
                                    <select name="field" class="layui-select">
                                        <option value="role_name">角色名称</option>
                                        <option value="role_remark">备注</option>
                                    </select>
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" name="value" class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="query">搜索</button>
                                    <button type='reset' class="layui-btn layui-btn-danger" lay-submit lay-filter="reset">重置</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <table id="posTb" lay-filter="posTb"></table>
            </div>
            <div class="layui-col-md4" style="height:98vh;">
                <div class="layui-card" style="height: calc(100% - 23px);margin-left:10px">
                    <div class="layui-card-header" style="background:#fafafa;">所有权限</div>
                    <div class="layui-card-body" >
                        <ul id="permTree" class="ztree" >
                        </ul>
                    </div>
<c:if test="${sessionScope.userSession.garden_id == 0}">
                        <div class="layui-btn layui-btn-success layui-btn-fluid assignPerm" >授权</div>
</c:if>
                </div>


            </div>
        </div>
    </div>



    <script type="text/html" id="headTool">
        <div class="layui-btn-container">
<c:if test="${sessionScope.userSession.garden_id == 0}">
            <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i> 增加</button>
</c:if>
        </div>
    </script>

    <script type="text/html" id="rowTool">

        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-search"></i> 查看编辑</a>
<c:if test="${sessionScope.userSession.garden_id == 0}">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i> 删除</a>
</c:if>
    </script>

    <script src="statics/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="statics/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
    <script>
        let roleId;

        $(document).ready(function(){

            var zTreeObj;
            // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
            var setting = {
                check:{
                    enable:true,
                    chkStyle:"checkbox",
                    checkStyle:{"Y":"p","N":"s"}
                }
            };
            // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
            var zNodes = [
                {name:"test1", open:true, children:[
                        {name:"test1_1"}, {name:"test1_2"}]},
                {name:"test2", open:true, children:[
                        {name:"test2_1"}, {name:"test2_2"}]}
            ];


            $.get("/sys/role/permissionList")
                .done(({data})=>{
                    zTreeObj = $.fn.zTree.init($("#permTree"), setting, data);
                })

            layui.use(['jquery','form','layer','table'],function (){
                let $= layui.jquery,
                    form = layui.form,
                    layer = layui.layer,
                    table = layui.table;

                //重置查询
                form.on('submit(reset)',function (){
                    $("#roleForm").get(0).reset();
                    reload();
                    return false;
                })

                //查询事件
                form.on('submit(query)',function (){
                    reload();
                    return false;
                })
                //监听form的下拉列表改变事件
                form.on('select(orgSelect)',function (data){
                    reload();
                })

                function reload(){
                    let where = form.val("posForm");
                    table.reload('posTb',{where});
                }

                let posTable = table.render({
                    elem:'#posTb',
                    even:true,
                    page:true,
                    toolbar:"#headTool",
                    height:767,
                    cellMinWidth:100,
                    limit:15,
                    id:'posTb',
                    limits:[15,20],
                    url:'/sys/role/list',
                    cols:[[
                        {type:"radio"},
                        {title:'序号',type:"numbers"},
                        {field:'roleName',title:'角色名称',align:"center",sort:true},
                        {field:'roleRemark',title:'角色备注',align:"center"},
                        {title:"操作",align: "center",templet:"#rowTool"}
                    ]]
                })

                /**
                 * 选中存在的权限
                 * @param nodes
                 * @param data
                 */
                function checkPerm(nodes,data){
                    $.each(nodes,function(){
                        //判断当前节点编号是否在 角色对应的权限编号数组中，说明该选中，否则不选中
                        if($.inArray(this.id,data) != -1){
                            zTreeObj.checkNode(this,true,true);
                        }else{
                            zTreeObj.checkNode(this,false,true);
                        }
                        if(this.children!=null){
                            checkPerm(this.children,data);
                        }
                    })
                }
                //

                $(".assignPerm").click( function (){
                    //先获取所有选中的节点，编号
                    let nodes = zTreeObj.getCheckedNodes(true);
                    let str = nodes.map(d=>d.id).join(",")
                    //发送异步请求，参数：角色编号、一组权限编号
                    $.post("sys/role/assignPers",{
                        roleId:roleId,
                        perIds:str,
                    })
                    .done(function(res){
                        if(res.code!=3001){
                           return layer.msg(res.msg,{icon:6})
                        }
                        layer.msg(res.msg,{icon:5})

                    })
                })

                //监听单选按钮
                table.on("radio(posTb)",function (obj){
                    //异步发送请求获取指定角色的权限
                    roleId = obj.data.id;
                    $.get("sys/role/rolePermission",{roleId:roleId})
                        .done((res)=>{
                            //获取所有节点
                            let nodes = zTreeObj.getNodes();
                            //判断当前节点编号是否在 角色对应的权限编号数组中，说明该选中，否则不选中
                            checkPerm(nodes,res.data);

                        })
                })


                table.on("toolbar(posTb)",function (obj){
                    let event = obj.event;
                    switch (event){
                        case "add":
                            openAddWindow();
                            break;
                    }
                })

                //修改园所弹窗
                function openUpdateWindow(data) {
                    let gardenId=$("[name=gardenId]").val();
                    layer.open({
                        type: 2,
                        title: '修改角色',
                        shadeClose: "true",
                        move: false,
                        resize: false,
                        area: ['800px', '300px'],
                        content:'/sys/role/edit',
                        success: function (layero, index) {
                            let body = layer.getChildFrame('body', index);
                            // let childFrame = window[layero.find('iframe')[0]['name']];
                            body.find('[name=gardenId]').val(gardenId);
                            body.find('[name=id]').val(data.id);
                            body.find('[name=roleName]').val(data.roleName);
                            body.find('[name=roleRemark]').val(data.roleRemark);
                        },
                        end: function () {
                            //重载
                            reload();
                        }
                    })
                }

                table.on("tool(posTb)",function (obj){
                    let data = obj.data,
                        event = obj.event;
                    switch (event){
                        case "del":
                            let ids=[]
                            ids.push(obj.id)
                            if(data.id ==1){
                                return  layer.msg("避免误操作，禁止删除超管信息",{icon:5})
                            }
                            console.log(ids)
                            layer.confirm("确认删除",{
                                title:'提示',
                                btn:['确认删除','再想想'],
                                shadeClose: true,
                                yes(){
                                    let gardenId = $("[name=gardenId]").val();
                                        $.post("sys/role/del",{roleIds:data.id,gardenId:gardenId})
                                        .done((res)=>{
                                            if(res.code!=3001){
                                                reload();
                                            }
                                            layer.msg(res.msg,{time:500});
                                        })
                                }
                            })
                            break;
                        case "edit":
                            if(data.id ==1){
                              return  layer.msg("避免误操作，禁止修改超管信息",{icon:5})
                            }
                            openUpdateWindow(data);
                            break;

                        case 'permission':
                            openPermission(data);
                            break;
                    }

                })

                function openAddWindow(){
                    let gardenId=$("[name=gardenId]").val();
                    layer.open({
                        type:2,
                        area:['800px','300px'],
                        shadeClose:true,
                        resize:false,
                        move:false,
                        title:"添加角色",
                        content:"sys/role/add",
                        success: function (layero, index) {
                            let body = layer.getChildFrame('body', index);
                            // let childFrame = window[layero.find('iframe')[0]['name']];
                            body.find('[name=gardenId]').val(gardenId);
                        },
                        end:function (){
                            reload();
                        }
                    })
                }

            })

        });
    </script>
    <script>

    </script>


</body>
</html>
