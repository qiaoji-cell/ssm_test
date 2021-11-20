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
    <title>用户设定</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" lay-filter="userSearch">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属部门</label>
                            <div class="layui-input-inline">
                                <select name="depId">
                                </select>

                            </div>

                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-inline">
                                <select name="state">
                                    <option value="1">正常</option>
                                    <option value="2">禁用</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">快速检索</label>
                            <div class="layui-input-inline">
                                <select  name="field" class="layui-select">
                                    <option value="userName">姓名</option>
                                    <option value="user_code">用户编码</option>
                                    <option value="p.pos_name">所属职位</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="text" name="value" autocomplete="off" class="layui-input" placeholder="快速检索">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <input type="checkbox" name="is_approve" title="采购审批人员" >
                        </div>
                        <div class="layui-inline">
                            <input type="checkbox" name="is_purchase" title="采购人员" >
                        </div>
                        <div class="layui-inline">
                            <input type="checkbox" name="is_watch" title="查看物品金额" >
                        </div>


                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                            <button type="reset" class="layui-btn layui-btn-primary" lay-filter="data-search-btn"> 重 置 </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-primary layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-release"></i> 分配班级 </a>
        </script>

    </div>
</div>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        //=================================================




        //==================================
        //加载选项数
        function loadSelectTree(gardenId){
            $.get("/sys/dep/selectTree",{gardenId:gardenId}).
            done(({data})=>{
                $('[name=depId]').empty();
                let option1 = $('<option>');
                option1.text("所有部门");
                option1.val(null)
                option1.appendTo('[name=depId]')
                for(let org of data){
                    let option = $('<option>');
                    option.text(org.selectName);
                    option.val(org.id);
                    option.appendTo('[name=depId]');
                }
                form.render();
            })
        }

        let gardenId = ${sessionScope.userSession.garden_id};
        if(gardenId>0){
            //加载指定园所
            loadSelectTree(gardenId)
        }else{
            loadSelectTree()
        }


        table.render({
            elem: '#currentTableId',
            url: 'base/setting/list',
            height:730,
            cellMinWidth:50,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type:'numbers',  title: 'ID', align: "center"},
                {field: "user_code",title:'用户编码',sort: true,align: "center"},
                {field: 'userName', title: '姓名',align: "center"},
                {field: 'gender', title: '性别', templet:function (d){
                        return d.gender?'女':'男'
                    },align: "center"},
                {field: 'gardenName', title: '所属机构',templet:function (d){
                        return d.gardenName==null?"总部":'分园'
                    },align: "center"},
                {field: 'gardenName', minWidth:200,title: '园所',templet:function (d){
                        return d.gardenName!=null?d.gardenName:'非园所'
                    },align: "center"},
                {field: 'depName', title: '所属部门',align: "center"},
                {field: 'posName', title: '所属职位', minWidth: 150,align: "center"},
                {field: 'roleName', title: '班级',minWidth: 100,align: "center",templet:function (d){
                    let className = d.beLongClass.classname;
                    return className==null?"暂无":className;
                    }},
                {field: 'is_approve', title: '采购审批人员', align: "center",templet:function (d){
                        return '<span lay-event="approve"><input type="checkbox" class="approve" lay-skin="switch" lay-text="是|否" '+(d.is_approve?"checked":"")+'></span>'
                    }},
                {field: 'is_approve', title: '采购人员', align: "center",templet:function (d){
                        return '<span lay-event="purchase"><input type="checkbox" class="purchase" lay-skin="switch" lay-text="是|否" '+(d.is_purchase?"checked":"")+'></span>'
                    }},
                {field: 'is_approve', title: '查看物品金额', align: "center",templet:function (d){
                        return '<span lay-event="watch"><input type="checkbox" class="watch" lay-skin="switch" lay-text="是|否" '+(d.is_watch?"checked":"")+'></span>'
                    }},
                {field: 'state',title: '状态',templet:function (d){
                        return '<span ><input type="checkbox" class="userState" disabled '+(d.id==1?"disabled":"")+' lay-skin="switch" lay-text="正常|禁用" '+(d.state==1?"checked":"")+'></span>'
                    },align: "center"},
                {field: 'creation_date', width: 135, title: '建档日期', sort: true,align: "center"},
                {title: '操作',  toolbar: '#currentTableBar', align: "center"},
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line',
            done:function (){
                $("")
            }
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function () {
            reload();
            return false;
        });

        function reload(){
            let where = form.val("userSearch");
            // let depId = $("[name=depId] ").val();
            //执行搜索重载
            table.reload('currentTableId', {where});
        }

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: 'sys/user/add',
                    end:function(){
                        reload();
                    }
                });
                // $(window).on("resize", function () {
                //     layer.full(index);
                // });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                let ids = data.map(o=>'ids='+o.id).join('&');
                $.post('sys/user/batchDel',ids)
                    .done((res)=>{
                        if(res.code!=3001){
                            reload();
                            return layer.msg('批量删除成功！',{icon:6})
                        }
                        layer.msg('删除失败！联系管理员')
                    })
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        //修改状态
        function changeState(param){
            let p = $.param(param)
            $.post("base/setting/changeState",p)
                .done((res)=>{
                    if(res.code!=3001){
                        reload();
                        layer.msg(res.msg,{icon:6})
                    }else{
                        layer.msg(res.msg,{icon:5})
                    }
                })

        }
        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let tr = obj.tr;
            if (obj.event === 'edit') {
                if(data.id==1){
                    return layer.msg("禁止修改管理员",{icon:5})
                }
                var index = layer.open({
                    title: '变更班级',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['65%', '85%'],
                    content: '/base/setting/editClass',
                    success(layero,index){
                        let body = layer.getChildFrame('body',index);
                        let state = $(tr).find('.userState').prop('checked');
                        data.state = state?1:2;
                        let childFrame = window[layero.find('iframe')[0]['name']];
                        childFrame.loadRecord(data.user_code);
                        childFrame.loadClass(data.class_id);

                        body.find('[name=userCode]').val(data.user_code);
                        body.find('[name=upUser]').val(data.userName);
                    },
                    end:function (){
                        reload();
                    }
                });

                return false;
            } else if (obj.event === 'delete') {

                if(data.id==1){
                    return layer.msg("禁止修改管理员",{icon:5})
                }
                layer.confirm('确定删除？',{btn:['确认','再想想']},function (index) {
                    let delParam = {}
                    delParam.userId = data.id;
                    delParam.gardenId = data.garden_id;
                    delParam.roleId = data.roleId;
                    //发送删除的异步请求
                    $.post("sys/user/delete",delParam)
                        .done((res)=>{
                            if(res.code!=3001){
                                //执行搜索重载
                                reload();
                                return layer.msg(res.msg,{icon:6});
                            }
                            layer.msg(res.msg,{icon:5})

                        })
                    layer.close(index);
                });
            }else if(obj.event==='stateChange'){
                if(data.id==1){
                    return layer.msg("禁止修改管理员",{icon:5})
                }

                //操作行的dom元素
                // let tr = obj.tr;
                //使用jQuery获取选中值
                let checkBoxState = $(tr).find('.userState').prop('checked')
                let param = {};
                param.state = checkBoxState?1:2;
                param.userId = data.id;
                $.post("/sys/user/upState",param)
                    .done((res)=>{
                        if(res.code!=3001){
                            return layer.msg(res.msg,{icon:6});
                        }
                        layer.msg(res.msg,{icon:5});
                        //执行搜索重载
                        // reload();
                    });
            }else if(obj.event === 'approve'){
                let is = $(tr).find('.approve').prop('checked');
                let user = {};
                user.is_approve=is;
                user.id = data.id;
                changeState(user)
            }else if(obj.event === 'purchase'){
                let is = $(tr).find('.purchase').prop('checked');
                let user = {};
                user.is_purchase=is;
                user.id = data.id;
                changeState(user)
            }else if(obj.event === 'watch'){
                let is = $(tr).find('.watch').prop('checked');
                let user = {};
                user.is_watch=is;
                user.id = data.id;
                changeState(user)
            }
        });

    });
</script>

</body>
</html>