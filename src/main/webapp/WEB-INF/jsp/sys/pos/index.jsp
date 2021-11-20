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
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
</head>
<body>
    <div class="layui-fluid" style="margin-top: 10px">
        <div class="layui-collapse">
            <div class="layui-colla-item">
                 <h2 class="layui-colla-title">查询条件</h2>
                 <div class="layui-colla-content layui-show">
                     <form class="layui-form" lay-filter="posForm" id="posForm">
                         <input type="hidden" name="gardenId" value="${sessionScope.userSession.garden_id}">

                             <div class="layui-inline">
                                 <label class="layui-form-label">快速检索：</label>
                                 <c:if test="${sessionScope.userSession.garden_id == 0}">
                                     <div class="layui-input-block">
                                         <select name="gardenId" class="layui-select" lay-filter="depSelect">
                                             <option value="0">总部</option>
                                             <option value="1">分园</option>
                                         </select>
                                     </div>
                                 </c:if>
                             </div>

                         <div class="layui-inline">
                             <select name="field" class="layui-select">
                                 <option value="pos_name">职位名称</option>
                                 <option value="pos_desc">职位描述</option>
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

    <script type="text/html" id="headTool">
        <div class="layui-btn-container">
<c:if test="${sessionScope.userSession.garden_id == 0}">
            <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i> 增加</button>
</c:if>
            <button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="export"><i class="layui-icon layui-icon-print"></i> 导出到PDF</button>
        </div>
    </script>

    <script type="text/html" id="rowTool">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-search"></i> 查看编辑</a>
<c:if test="${sessionScope.userSession.garden_id == 0}">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i> 删除</a>
</c:if>
    </script>

    <script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
    <script src="statics/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
    <script>
        layui.use(['jquery','form','layer','table'],function (){
            let $= layui.jquery,
                form = layui.form,
                layer = layui.layer,
                table = layui.table;

            //查询事件
            form.on('submit(query)',function (){
                reload();
                return false;
            })

            //监听form的下拉列表改变事件
            form.on('select(depSelect)',function (data){
                reload();
            })

            function reload(){
                let where = form.val("posForm");
                table.reload('posTb',{where});
            }

            //重置查询
            form.on('submit(reset)',function (){
                $("#posForm").get(0).reset();
                reload();
                return false;
            })
            let posTable = table.render({
                elem:'#posTb',
                even:true,
                page:true,
                toolbar:"#headTool",
                height:660,
                cellMinWidth:100,
                limit:15,
                id:'posTb',
                limits:[15,20],
                url:'/sys/pos/list',
                cols:[[
                    {title:'序号',type:"numbers"},
                    {field:'posName',title:'职位名称',align:"center"},
                    {field:'posDesc',title:'职位描述',align:"center"},
                    {title:"操作",align: "center",templet:"#rowTool"}
                ]]
            })

            table.on("toolbar(posTb)",function (obj){
                let event = obj.event;
                switch (event){
                    case "add":
                        openAddWindow()
                        break;
                        case 'export':
                            let gardenId = $("[name=gardenId]").val();
                            location.href="/exportPDF?gardenId="+(gardenId==null?0:gardenId);
                }
            })

            //修改园所弹窗
            function openUpdateWindow(data,successCallback) {
                let gardenId = $("[name=gardenId] option:selected").val();
                layer.open({
                    type: 2,
                    title: '修改职位',
                    shadeClose: "true",
                    move: false,
                    resize: false,
                    area: ['800px', '600px'],
                    content:'/sys/pos/edit',
                    success: function (layero, index) {
                        let body = layer.getChildFrame('body', index);

                        // let childFrame = window[layero.find('iframe')[0]['name']];
                        body.find("[name=id]").val(data.id);
                        body.find('[name=gardenId]').val(gardenId);
                        body.find('[name=posName]').val(data.posName);
                        body.find('[name=posDesc]').val(data.posDesc);
                        body.find('[name=posDuty]').val(data.posDuty);
                    },
                    end: function () {
                        //重载
                        reload();
                    }
                })
            }
            table.on("tool(posTb)",function (obj){
                let gardenId = $("[name=gardenId] option:selected").val()
                let data = obj.data,
                    event = obj.event;
                switch (event){
                    case "del":
                        let ids = "ids="+data.id;
                        layer.confirm("确认删除",{
                            title:'提示',
                            btn:['确认删除','再想想'],
                            shadeClose: true,
                            yes(){
                                $.post("sys/pos/del","gardenId="+gardenId+"&"+ids)
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
                            openUpdateWindow(data);
                            break;
                }

            })
            function openAddWindow(){
                let gardenId = $("[name=gardenId] option:selected").val();
                layer.open({
                    type:2,
                    area:['800px','600px'],
                    shadeClose:true,
                    resize:false,
                    move:false,
                    title:"添加职位",
                    content:"sys/pos/add",
                    success:function (layero,index){
                        let body = layer.getChildFrame('body', index);
                        body.find("[name=gardenId]").val(gardenId);
                    },
                    end:function (){
                        reload();
                    }
                })
            }

        })
    </script>
</body>
</html>
