<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>menu</title>
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <style>
        .layui-btn:not(.layui-btn-lg ):not(.layui-btn-sm):not(.layui-btn-xs) {
            height: 34px;
            line-height: 34px;
            padding: 0 8px;
        }
    </style>
</head>
<body>
<div class="layui-fluid" style="margin-top:10px">
        <div>
            <div class="layui-btn-group">
                <button class="layui-btn" id="btn-expand">全部展开</button>
                <button class="layui-btn layui-btn-normal" id="btn-fold">全部折叠</button>
            </div>
            <table id="munu-table" class="layui-table" lay-filter="munu-table"></table>
        </div>
</div>
<!-- 操作列 -->
<script type="text/html" id="auth-state">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="statics/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="statics/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script>
    let roleId;
    function setId(id){
        roleId = id;
    }

    layui.use(['table', 'treetable'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var treetable = layui.treetable;

        let currScroll;
        let oldScroll;
        $(window).scroll(function() {
            currScroll = $(document).scrollTop();
            if ($(document).scrollTop()<=0){
                // alert("滚动条已经到达顶部为0");
            }

            if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                // alert("滚动条已经到达底部为" + $(document).scrollTop());
            }
        });

        let renderTable;
        setTimeout(function (){
            // 渲染表格
            renderTable = function(){
                treetable.render({
                    treeColIndex: 1,
                    treeSpid: -1,
                    treeIdName: 'id',
                    treePidName: 'parentId',
                    elem: '#munu-table',
                    url: 'sys/role/permissionList?roleId='+roleId,
                    page: false,
                    cols: [[
                        {type: 'numbers'},
                        {field: 'permName', minWidth: 200, title: '权限名称'},
                        {field: 'permCode', title: '权限标识'},
                        {field: 'url', title: '菜单url'},
                        {field: 'sort', width: 80, align: 'center', title: '排序号'},

                        {
                            field: 'resourceType', width: 80, align: 'center', templet: function (d) {
                                if (d.resourceType=='button') {
                                    return '<span class="layui-badge layui-bg-gray">按钮</span>';
                                }
                                if (d.url == null) {
                                    return '<span class="layui-badge layui-bg-blue">目录</span>';
                                } else {
                                    return '<span class="layui-badge-rim">菜单</span>';
                                }
                            }, title: '类型'
                        },
                        {field:'isHave',title:"操作",align: "center",templet:function (d){
                                return '<span  lay-event="openClose"><input type="checkbox" lay-skin="switch" lay-event="openClose" lay-text="启用|禁用"'+(d.have==true?"checked":"")+'></span>'
                            }}
                    ]],
                    done: function () {
                        $(document).scrollTop(oldScroll)
                    }
                });
            }
            renderTable();
        },50);

        $('#btn-expand').click(function () {
            treetable.expandAll('#munu-table');
        });

        $('#btn-fold').click(function () {
            treetable.foldAll('#munu-table');
        });
        let id = window.frameElement.id
        //监听工具条
        table.on('tool(munu-table)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'del') {
                layer.msg('删除' + data.id);
            } else if (layEvent === 'edit') {
                layer.msg('修改' + data.id);
            }else if(layEvent ==="openClose"){
                $.post("/sys/role/permUpdate",
                    {   roleId:roleId,
                        currState:data.have,
                        permId:data.id,
                        parentId:data.parentId}
                )
                .done((res)=>{
                    if(res.code==3001){
                       return layer.msg(res.msg,{icon:2})
                    }
                    //刷新表格前记录原始 滚动距离
                    oldScroll = currScroll;
                    //刷新后回到原始位置 在刷新的回调里
                    renderTable();
                    layer.msg(res.msg,{icon:1})
                })
            }
        });


    });
</script>
</body>
</html>