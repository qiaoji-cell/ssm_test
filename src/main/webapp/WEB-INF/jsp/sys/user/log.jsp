<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>日志查询</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/css/public.css" media="all">
    <style>
        .layui-btn{
            margin-bottom: 0px !important;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" lay-filter="userSearch">
                    <div class="layui-form-item">
<%--                        <div class="layui-inline">--%>
<%--                            <label class="layui-form-label">用户编码</label>--%>
<%--                            <div class="layui-input-inline">--%>
<%--                                <input type="text" name="userCode" class="layui-input">--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="layui-inline">
                            <label class="layui-form-label">登录人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="userName" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">日期范围</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="startTime" name="startTime" class="layui-input" placeholder="开始日期">
                                </div>
                                <div class="layui-form-mid">-</div>
                                <div class="layui-input-inline">
                                    <input type="text" id="endTime" name='endTime' class="layui-input" placeholder="结束日期">
                                </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline" style="width: 300px">
                                <div class="layui-btn-container">
                                    <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                                    <button type="reset" class="layui-btn layui-btn-danger"  ><i class="fa fa-refresh"></i> 重 置 </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

    </div>
</div>

<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','laydate'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate;
        laydate.render({
            elem: '[name*=Time]'//开始时间和结束时间所在 input 框的父选择器
            //设置开始日期、日期日期的 input 选择器
        });

        form.verify({
            vEndDate:function(value,item){

            },
        })
        table.render({
            elem: '#currentTableId',
            url: 'sys/log/list',
            height:630,
            cellMinWidth:50,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'userName', title: '登录人',align: "center"},
                {field: 'ip',title:'网络ip', width:120, align:'center'},
                {field: 'address',title:'网络位置',align:'center'},
                {field: 'loginDate',title:'登录时间',minWidth:200,align: 'center'},
                {field: 'gender', title: '性别', templet:function (d){
                    return d.gender?'女':'男'
                    },align: "center"},
                {field: 'gardenName', title: '所属机构',templet:function (d){
                    return d.gardenName==null?"总部":'分园'
                    },align: "center"},
                {field: 'gardenName', minWidth:100,title: '园所',templet:function (d){
                        return d.gardenName!=null?d.gardenName:'非园所'
                    },align: "center"},
                {field: 'depName', title: '所属部门',align: "center",templet:function (d){
                        return d.depName==null?'暂无':d.depName
                    }},
                {field: 'posName', title: '所属职位', minWidth: 200,align: "center",templet:function (d){
                    return d.posName==null?'暂无':d.posName
                    }},
                {field: 'roleName', title: '所属角色',minWidth: 200,align: "center"},
                {field: 'phone', title: '移动电话', sort: true,align: "center"},
                {field: 'state',title: '状态',templet:function (d){
                    return '<span lay-event="stateChange"><input type="checkbox" class="userState" lay-event="stateChange" disabled lay-skin="switch" lay-text="正常|禁用" '+(d.state==1?"checked":"")+'></span>'
                    },align: "center"},
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line',
            done:function (){
            }
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function () {
            let startDate = $("[name=startTime]").val();
            let endDate = $("[name=endTime]").val();
            let objStart = new Date(startDate);
            let objEnd = new Date(endDate);

            //两个不空 验证
            if(endDate!=''&&startDate!=''){
                console.log(objStart.getTime()<objEnd.getTime())
                if(!(objStart.getTime()<objEnd.getTime())){
                    return layer.msg("结束日期不能小于开始日期");
                }
            }
            reload();
            return false;
        });

        function reload(){
            let where = form.val("userSearch");

            // let depId = $("[name=depId] ").val();
            //执行搜索重载
            table.reload('currentTableId', {where});
        }



        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let tr = obj.tr;
            if (obj.event === 'edit') {
                if(data.id==1){
                    return layer.msg("禁止修改管理员",{icon:5})
                }
                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '/sys/user/edit',
                    success(layero,index){
                        let body = layer.getChildFrame('body',index);
                        let state = $(tr).find('.userState').prop('checked');
                         data.state = state?1:2;
                        // let childFrame = window[layero.find('iframe')[0]['name']];
                        let param = JSON.stringify(data);
                        body.find('[name=id]').val(data.id);
                        body.find('[name=gardenId]').val(data.garden_id);
                        body.find('[name=allInfo]').val(param)
                    },
                    end:function (){
                        reload();
                    }
                });

                return false;
            }
        });

    });
</script>

</body>
</html>