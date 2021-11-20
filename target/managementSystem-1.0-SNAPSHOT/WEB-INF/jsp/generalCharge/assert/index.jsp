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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>费项维护</title>
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
                    <c:if test="${sessionScope.userSession.garden_id == 0}">
                        <div class="layui-input-inline ">
                            <label class="layui-form-label">选择机构:</label>
                            <div class="layui-input-block">
                                <select name="gardenId" lay-filter="gardenId">
                                </select>
                            </div>
                        </div>
                    </c:if>

                    <div class="layui-inline">
                        <label class="layui-form-label">费用类目</label>
                        <div class="layui-input-block">
                            <select name="costCategory" id="" lay-filter="costCategory">
                                <option value="">全部</option>

                            </select>
                        </div>
                    </div>
                    <div class="layui-input-inline" style="margin-left: 20px;">
                        <input type="radio" name="costType" title="全部" checked value="" lay-filter="paytype">
                        <input type="radio" name="costType" title="保育费" value="1" lay-filter="paytype">
                        <input type="radio" name="costType" title="伙食费" value="2" lay-filter="paytype">
                        <input type="radio" name="costType" title="其他费项" value="3" lay-filter="paytype">
                    </div>
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
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i> 编辑 </a>
    <a class="layui-btn layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i> 删除 </a>
</script>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    let gardenId//园所id
    layui.use(['layer', 'form', 'table', 'jquery'], function () {
        let layer = layui.layer,
            form = layui.form,
            table = layui.table,
            $ = layui.jquery;

        //加载园所
        $.get("/base/assert/select").done(({data}) => {
            $('select[name=gardenId]').empty();
            for (let org of data) {
                let option = $('<option>');
                option.text(org.gardenName);
                option.val(org.id);
                option.appendTo('[name = gardenId]');
            }
            layui.form.render('select');
        })
        //监听园所下拉列表事件
        form.on('select(gardenId)',function(){
            query();
        })
        //监听类目下拉列表事件
        form.on('select(costCategory)', function (data) {
            query();
        })
        //监听单选按钮事件
        form.on('radio(paytype)', function (data) {
            query();
        })


        //渲染费用类目列表
        function loadCategoryList() {
            $.get("common/cost/Category")
                .done(({data}) => {
                    for (let category of data) {
                        let option = $("<option>")
                        option.text(category.costname)
                        option.val(category.id)
                        option.appendTo('[name=costCategory]');
                    }
                    form.render();
                })
        }

        loadCategoryList();


        setTimeout(function () {
            gardenId = $('[name=gardenId]').val();
            table.render({
                elem: '#assertTb',
                url: "/generalCharge/assert/list?",
                page: true,
                limit: 20,
                limits: [20, 50, 100],
                even: true,
                cellMinWidth: 100,
                toolbar: '#headTool',
                height:655,
                where:{
                    gardenId:gardenId
                },
                cols: [[
                    {type: 'numbers', fixed: "left", align: "center"},
                    {field: "grooveName", title: '费项名称', align: 'center'},
                    {
                        field: 'costCategory', title: '费用类目', align: 'center', templet: function (d) {
                            return d.category.costname
                        }
                    },
                    {
                        field: 'costType', title: "类型", align: 'center', templet: (data) => {
                            let type = "";
                            if (data.costType == 1) {
                                type = '保育费'
                            }
                            if (data.costType == 2) {
                                type = "伙食费"
                            }
                            if (data.costType == 3) {
                                type = "其他费项"
                            }
                            return type;
                        }
                    },
                    {
                        field: 'univalence', title: '收费单价', align: 'center', templet: function (d) {
                            return d.univalence.toFixed(2);
                        }
                    },
                    {
                        field: 'univalenceType', title: "收费方式", align: 'center', templet: function (d) {
                            let type = ""
                            if (d.univalenceType == 1) {
                                type = "按学期"
                            }
                            if (d.univalenceType == 2) {
                                type = "按月"
                            }
                            if (d.univalenceType == 3) {
                                type = "按天"
                            }
                            return type;
                        }
                    },
                    {field: 'payType', title: '缴费类别', align: 'center',templet:function(d){
                        let value = d.payType;
                        let type = "";
                        if(value == 1){
                            type = "预付款"
                        }else if(value==2){
                            type = "后付费(本月)"
                        }else if(value == 3){
                            type = "后附费(上月)"
                        }
                        return type
                        }},
                    {
                        field: 'refund', title: "退费单价", align: 'center', templet: function (d) {
                            return d.refund;
                        }
                    },
                    {field: 'alone', title: '单独打印', align: 'center',templet:function (d){
                        return d.alone==1?'是':"否"
                        }},
                    {field: 'absence', title: "整月缺勤时生成", align: 'center',templet:function (d){
                            return d.absence==1?'是':"否"
                        }},
                    {field: 'createDate', title: '创建时间', align: 'center'},
                    {title: '操作', align: 'center',width:150,fixed: 'right', templet: '#rowTool'}
                ]]
            })

        }, 50)
        //查询事件
        form.on('submit(query)', function () {
            query();
        })


        //查询方法
        function query() {
            let where = form.val('assertForm');
            console.log(where)
            table.reload('assertTb', {where})
        }

        //添加园所弹窗
        function openAddWindow() {
            layer.open({
                type: 2,
                title: "添加费项",
                shadeClose: "true",
                move: false,
                area: ['60%', '500px'],
                content: '/generalCharge/assert/add',
                end: function () {
                    //重载表格
                    query();
                },success: function (layero, index) {
                    let body = layer.getChildFrame('body', index);
                    // let childFrame = window[layero.find('iframe')[0]['name']];
                    let gardenId = $('[name=gardenId]').val();
                    body.find('[name=gardenId]').val(gardenId);
                },
            })
        }

        //修改费项弹窗
        function openUpdateWindow(data, successCallback) {
            layer.open({
                type: 2,
                title: '编辑费项',
                shadeClose: "true",
                move: false,
                resize: false,
                area: ['60%', '500px'],
                content: '/generalCharge/assert/edit',
                success: function (layero, index) {
                    let body = layer.getChildFrame('body', index);
                    let childFrame = window[layero.find('iframe')[0]['name']];
                    let gardenId = $('[name=gardenId]').val();
                    body.find('[name=gardenId]').val(gardenId);
                    body.find('[name=id]').val(data.id);
                    //简单渲染
                    childFrame.loadData(data);
                    //获取收费方式下拉进行赋值单位
                    // let shouFeiFangShi = body.find('[name=univalenceType]').val();
                    // if(shouFeiFangShi==1){
                    //     body.find('.unit').text('学期')
                    // }else if(shouFeiFangShi==2){
                    //     body.find('.unit').text('月')
                    // }else if(shouFeiFangShi == 3){
                    //     body.find('.unit').text('天')
                    // }
                },
                end: function () {
                    //重载
                    query();
                }
            })
        }

        //头工具栏事件
        table.on("toolbar(assertTb)", function (obj) {
            let checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    openAddWindow();
                    break;
                case 'del':
                    let data = checkStatus.data;
                    let ids = data.map(d => 'ids=' + d.id).join('&');
                    if (data.length <= 0) {
                        return layer.msg("请勾选园所")
                    }
                    $.post('base/assert/del', ids)
                        .done((res) => {
                            //如果不是错误的code 就刷新表格
                            if (res.code != 3001) {
                                query();
                            }
                            layer.msg(res.msg);
                        })
                    break;
            }
        })

        //行工具栏事件
        table.on("tool(assertTb)", function (obj) {
            let data = obj.data;
            switch (obj.event) {
                case 'edit':
                    openUpdateWindow(data);
                    break;
                case 'del':
                    layer.confirm('确定要删除么', {
                        btn: ['是的', '再想想'],
                        yes(index, layero) {
                            $.post('generalCharge/assert/del', "id=" + data.id)
                                .done((res) => {
                                    //如果不是错误的code 就刷新表格
                                    if (res.code != 3001) {
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
