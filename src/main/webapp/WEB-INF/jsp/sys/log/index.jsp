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
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">快速检索</label>
                            <div class="layui-input-inline">
                                <select  name="field" class="layui-select">
                                    <option value="userName">姓名</option>
                                    <option value="user_code">用户编码</option>
                                    <option value="p.pos_name">所属职位</option>
                                    <option value="r.role_name">角色</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="text" name="value" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
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
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>

<div class="layui-fluid" style="margin-top:10px;background: white;display: none" id="editPanel">
    <form class="layui-form" lay-filter="addForm">
        <fieldset class="layui-elem-field">
            <input type="hidden" name="gardenId">
            <legend><h3>基本资料</h3></legend>
            <div class="layui-field-box">
                <div class="layui-row row1">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            用户编码：<span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="user_code" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            姓名：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="userName" lay-verify="required">
                        </div>
                    </div>
                </div>
                <div class="layui-row row2">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            登录密码：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="userPassword"  lay-verify="required|pass">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            确认密码*：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="verifyPwd"  lay-verify="required|pass|verifyPwd">
                        </div>
                    </div>
                </div>
                <div class="layui-row row3">
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            所属机构：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select name="garden_id" class="layui-select" lay-filter="orgFilter">
                                <option value="0">总部</option>
                                <option value="1">分园</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            所属部门：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select name="depId" class="layui-select"></select>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            职位：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select name="posId" class="layui-select">

                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-row row4">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            角色：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="demo"  class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            所属园所：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select disabled name="realGardenId" id='realGardenId'class="layui-select">

                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-row row5">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            账号生效日：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input name="startDate" class="layui-input" lay-verify="date">

                            </input>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            账号到期日：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input name="endDate" class="layui-input" lay-verify="date|vEndDate">

                            </input>
                        </div>
                    </div>
                </div>
                <div class="layui-row row6">
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            状态：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select name="state" >
                                <option value="1">正常</option>
                                <option value="2">禁用</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            性别：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="radio" name="gender" title="男" checked value="0">
                            <input type="radio" name="gender" title="女" value="1">
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <label for="" class="layui-form-label">
                            出生日期：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input name="birthday" class="layui-input" lay-verify="date"/>
                        </div>
                    </div>


                </div>
                <div class="layui-row row6">
                    <div class="layui-col-md12">
                        <label for="" class="layui-form-label">
                            备注：
                        </label>
                        <div class="layui-input-block">
                            <textarea name=""  cols="30" rows="2" class="layui-textarea" ></textarea>
                        </div>
                    </div>
                </div>
            </div>

        </fieldset>
        <fieldset class="layui-elem-field">
            <legend><h3>联系方式</h3></legend>
            <div class="layui-field-box">
                <div class="layui-row row7">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            电子邮件：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="email" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            移动电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" class="layui-input"/>
                        </div>
                    </div>
                </div>
                <div class="layui-row row7">
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            办公电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="officePhone" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label for="" class="layui-form-label">
                            内线电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="internalPhone" class="layui-input"/>
                        </div>
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
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        //=================================================






        //==================================
        //加载选项数
        function loadSelectTree(){
            let gardenId = $("[name=depId]").val();
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
        loadSelectTree()

        table.render({
            elem: '#currentTableId',
            url: 'sys/user/list',
            toolbar: '#toolbarDemo',
            height:730,
            cellMinWidth:50,
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id',  title: 'ID', sort: true,align: "center"},
                {field: "user_code",title:'编码',sort: true,align: "center"},
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
                {field: 'posName', title: '所属职位', minWidth: 200,align: "center"},
                {field: 'roleName', title: '所属角色',minWidth: 200,align: "center"},
                {field: 'phone', title: '移动电话', sort: true,align: "center"},
                {field: 'state',title: '状态',templet:function (d){
                    return '<span lay-event="stateChange"><input type="checkbox" class="userState" lay-event="stateChange" '+(d.id==1?"disabled":"")+' lay-skin="switch" lay-text="正常|禁用" '+(d.state==1?"checked":"")+'></span>'
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

            }
        });

    });
</script>

</body>
</html>