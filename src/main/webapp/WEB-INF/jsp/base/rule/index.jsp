<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-15
  Time: 下午 14:21
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
    <title>规则设定</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/localcss/q/base/assert/assertIndex.css">

</head>
<body>
    <div class="layui-fluid">
        <div class="layui-collapse">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">查询条件</h2>
                <div class="layui-colla-content layui-show">
                    <div class="layui-form" lay-filter="assertForm">
                        <div class="layui-inline">
                            <label class="layui-form-label">费用类目</label>
                            <div class="layui-input-block">
                                <select name="field" id="">
                                    <option value="garden_code">园所编码</option>
                                    <option value="garden_name">园所名称</option>
                                    <option value="garden_principal">负责人</option>
                                    <option value="phone">电话</option>
                                    <option value="remark">备注</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="value" class="layui-input">
                        </div>
                        <button class="layui-btn" lay-submit lay-filter="query"><i class="layui-icon layui-icon-search"></i> 搜索</button>
                    </div>
                </div>
            </div>
        </div>
        <table id="assertTb" lay-filter="assertTb"></table>

    </div>

    <%--头部工具栏--%>
    <script type="text/html" id="headTool">
         <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i> 新增</button>
<%--         <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del"><i class="layui-icon layui-icon-delete"></i> 批量删除</button>--%>
    </script>
    <%--行工具栏--%>
    <script type="text/html" id="rowTool">
        <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i> 设定规则</a>
    </script>
    <script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['layer','form','table','jquery'],function (){
            let layer = layui.layer,
                form = layui.form,
                table = layui.table,
                $ = layui.jquery;

            table.render({
                elem:'#assertTb',
                url:"base/assert/list",
                page:true,
                limit:10,
                limits:[10,15,20],
                even:true,
                minWidth:100,
                toolbar:'#headTool',
                cols:[[
                    {type:'numbers',fixed: "left",align: "center"},
                    {field:"gardenCode",title:'园所编码',align:'center'},
                    {field: 'gardenName',title:'园所名称',align: 'center'},
                    // {field: 'parentOrg',title: "上级机构",align: 'center'},
                    {field: 'gardenPrincipal',title:'负责人',align: 'center'},
                    {field: 'phone',title: "电话",align: 'center'},
                    {field: 'remark',title:'备注',align: 'center'},
                    {title:'操作',align: 'center',fixed:'right',templet:'#rowTool'}
                ]]
            })

            //查询事件
            form.on('submit(query)',function (){
                query();
            })


            //查询方法
            function query(){
                let where = form.val('assertForm');
                table.reload('assertTb',{where})
            }

            //添加园所弹窗
            function openAddWindow(){
                layer.open({
                    type:2,
                    title:"添加园所",
                    shadeClose:"true",
                    move:false,
                    area:['800px','500px'],
                    content:'/base/assert/add',
                    end:function (){
                        //重载表格
                        query();
                    }
                })
            }

            //修改园所弹窗
            function openUpdateWindow(data,successCallback){
                layer.open({
                    type:2,
                    title:'设定规则',
                    shadeClose:"true",
                    move:false,
                    resize:false,
                    area:['800px','92%'],
                    content:'/base/rule/edit',
                    success:function (layero,index){
                        let body = layer.getChildFrame('body',index);
                        // let childFrame = window[layero.find('iframe')[0]['name']];
                        body.find('[name=gardenId]').val(data.id);
                        body.find('[name=gardenCode]').val(data.gardenCode);
                        body.find('[name=gardenName]').val(data.gardenName);
                        body.find('[name=prefixSuffix]').val(data.prefixSuffix);
                    },
                    end:function (){
                        //重载
                        query();
                    }
                })
            }
            //头工具栏事件
            table.on("toolbar(assertTb)",function (obj){
                let checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event){
                    case 'add':
                        openAddWindow();
                        break;
                    case 'del':
                        let data = checkStatus.data;
                        let ids = data.map(d=>'ids='+d.id).join('&');
                        if(data.length <= 0){
                            return layer.msg("请勾选园所")
                        }
                        $.post('base/assert/del',ids)
                            .done((res)=>{
                                //如果不是错误的code 就刷新表格
                                if(res.code!=3001){
                                    query();
                                }
                                layer.msg(res.msg);
                            })
                        break;
                }
            })

            //行工具栏事件
            table.on("tool(assertTb)",function (obj){
                let data = obj.data;
                switch (obj.event){
                    case 'edit':
                        openUpdateWindow(data);
                        break;
                    case 'del':
                        layer.confirm('确定要删除么',{
                            btn:['是的','再想想'],
                            yes(index,layero){
                                $.post('base/assert/del',"ids="+data.id)
                                    .done((res)=>{
                                        //如果不是错误的code 就刷新表格
                                        if(res.code!=3001){
                                            query();
                                        }
                                        layer.msg(res.msg);
                                    })
                            }
                        })
                        break;
                }
            })
        })
    </script>

</body>
</html>
