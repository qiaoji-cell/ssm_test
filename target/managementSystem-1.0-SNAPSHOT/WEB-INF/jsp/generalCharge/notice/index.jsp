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
    <style>
        .row2{
            margin-top:10px;
        }
    </style>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show">
                <div class="layui-form" lay-filter="assertForm">
                    <div class="layui-row row">
                       <div class="layui-col-md12">
                           <c:if test="${sessionScope.userSession.garden_id == 0}">
                               <div class="layui-input-inline ">
                                   <label class="layui-form-label">选择机构:</label>
                                   <div class="layui-input-block">
                                       <select name="studentGardenId" lay-filter="gardenId">
                                       </select>
                                   </div>
                               </div>
                           </c:if>
                           <div class="layui-input-inline" style="margin-left: 20px;">
                               <input type="radio" name="studentChargeCostType" title="全部" checked value="" lay-filter="paytype">
                               <input type="radio" name="studentChargeCostType" title="保育费" value="1" lay-filter="paytype">
                               <input type="radio" name="studentChargeCostType" title="伙食费" value="2" lay-filter="paytype">
                               <input type="radio" name="studentChargeCostType" title="其他费项" value="3" lay-filter="paytype">
                           </div>
                       </div>

                    </div>
                    <div class="layui-row row2">
                        <div class="layui-col-md12">
                            <div class="layui-inline">
                                <label class="layui-form-label">学生编号:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="studentCode" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">学生姓名：</label>
                                <div class="layui-input-block">
                                    <input type="text" name="studentName" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">缴费状态：</label>
                                <div class="layui-input-block">
                                    <select name="studentState">
                                        <option value="">请选择</option>
                                        <option value="1">未缴费</option>
                                        <option value="2">已缴费</option>
                                        <option value="3">已退费</option>
                                    </select>
                                </div>
                            </div>
                            <button class="layui-btn" lay-submit lay-filter="query"><i class="layui-icon layui-icon-search"></i> 搜索</button>
                        </div>

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
    <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="generate"><i class="layui-icon layui-icon-senior"></i> 生成费用</button>
<%--    <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="batchPay"><i class="layui-icon layui-icon-senior"></i> 批量缴费</button>--%>
</script>
<%--行工具栏--%>
<script type="text/html" id="rowTool">
    {{#  if(d.studentState == 1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="checkOut"><i class="layui-icon layui-icon-up"></i> 缴费 </a>
    {{#  } }}

<%--    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-senior"></i> 删除 </a>--%>
</script>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    let gardenId//园所id
    layui.use(['layer', 'form', 'table', 'jquery'], function () {
        let layer = layui.layer,
            form = layui.form,
            table = layui.table,
            $ = layui.jquery;
        //刚进来页面时 更新费用明细
        $.get('generalCharge/record/generate')
            .done((res) => {
                //如果不是错误的code 就刷新表格
                if (res.code == 3001) {
                    layer.msg(res.msg,{icon:6});
                }
            })
        form.on('submit(query)',function(){
            let param=form.val('assertForm');
            alert(param)
            return false;
        })
        //加载园所
        $.get("/base/assert/select").done(({data}) => {
            $('select[name=studentGardenId]').empty();
            for (let org of data) {
                let option = $('<option>');
                option.text(org.gardenName);
                option.val(org.id);
                option.appendTo('[name = studentGardenId]');
            }
            layui.form.render('select');
        })
        //监听园所下拉列表事件
        form.on('select(gardenId)',function(){
            query();
        })
        //监听单选按钮事件
        form.on('radio(paytype)', function (data) {
            query();
        })

        //获取当前月份的总天数
        function getDays(){
            var date=new Date();
            //将当前月份加1，下移到下一个月
            date.setMonth(date.getMonth()+1);
            //将当前的日期置为0，
            date.setDate(0);
            //再获取天数即取上个月的最后一天的天数
            var days=date.getDate();
            return days;
        }

        setTimeout(function () {
            gardenId = $('[name=gardenId]').val();
            table.render({
                elem: '#assertTb',
                url: "/generalCharge/record/list",
                page: true,
                limit: 20,
                limits: [20, 50, 100],
                even: true,
                cellMinWidth: 100,
                toolbar: '#headTool',
                height:600,
                where:{
                    gardenId:gardenId
                },
                cols: [[
                    {type: 'numbers', fixed: "left", align: "center"},
                    {field: "studentName", title: '学生姓名', align: 'center'},
                    {
                        field: 'studentCode', title: '学生编号', align: 'center'
                    },
                    {
                        field: 'studentGender', title: "类型", align: 'center', templet: (data) => {
                            return data.studentGender==0?'男':'女';
                        }
                    },
                    {
                        field: 'studentGardeName', title: '年级', align: 'center'
                    },
                    {
                        field: 'studentClassName', title: "班级", align: 'center'
                    },
                    {
                        field: 'studentChargeStartDate',width:114, title: "费用开始日期", align: 'center',templet:function(d){
                            if(d.studentChargeStartDate =='1997-01-01'){
                                return '';
                            }else{
                                return d.studentChargeStartDate
                            }
                        }
                    },
                    {
                        field: 'studentChargeEndDate', width:114,title: "费用截止日期", align: 'center',templet:function(d){
                        if(d.studentChargeEndDate =='1997-01-01'){
                            return '';
                        }else{
                            return d.studentChargeEndDate
                        }
                    }
                    },
                    {
                        field: 'studentChargeGrooveName', title: "费项名称", align: 'center'
                    },
                    {
                        field: 'studentChargeCategoryName', title: "费用类目", align: 'center'
                    },
                    {
                        field: 'studentChargeGrooveName', title: "费项类型", align: 'center',templet: function (d) {
                            let type = ""
                            if (d.studentChargeCostType == 1) {
                                type = "保育费"
                            }
                            if (d.studentChargeCostType == 2) {
                                type = "伙食费"
                            }
                            if (d.studentChargeCostType == 3) {
                                type = "其他费项"
                            }
                            return type;
                        }
                    },
                    {
                        field: 'studentChargeUnivalenceType', title: "收费方式", align: 'center',templet: function (d) {
                            let type = ""
                            if (d.studentChargeUnivalenceType == 1) {
                                type = "按学期"
                            }
                            if (d.studentChargeUnivalenceType == 2) {
                                type = "按月"
                            }
                            if (d.studentChargeUnivalenceType == 3) {
                                type = "按天"
                            }
                            return type;
                        }
                    },
                    {
                        field: 'studentChargeUnivalence', title: "收费单价", align: 'center'
                    },
                    {
                        field: 'studentChargeUnivalence', title: "费用合计", align: 'center',templet:function(d){
                            if (d.studentChargeUnivalenceType == 3) {
                                return d.studentChargeUnivalence*getDays();
                            }else{
                                return d.studentChargeUnivalence
                            }
                        }
                    },
                    {
                        field: 'studentChargePayType', title: "缴费类别", align: 'center',templet:function(d){
                                let value = d.studentChargePayType;
                                let type = "";
                                if(value == 1){
                                    type = "预付款"
                                }else if(value==2){
                                    type = "后付费(本月)"
                                }else if(value == 3){
                                    type = "后附费(上月)"
                                }
                                return type
                            }
                    },
                    {field: 'studentChargeRefund', title: '退费单价', align: 'center'},
                    {field: 'studentIsAlone', title: "是否单独打印", align: 'center', templet: function (d) {
                            return d.studentIsAlone==1?'是':'否';
                        }
                    },
                    {field: 'studentEnterDate', title: '入园日期', align: 'center'},
                    {field: 'studentState', title: "收费状态", align: 'center',templet:function (d){
                            let state = '';
                            switch (d.studentState){
                                case 1:
                                    state='未缴费';
                                    break;
                                    case 2:
                                        state='已缴费'
                                    break;
                                        case 3:
                                            state='已退费';

                            }
                            return state;
                        }},
                    {field: 'studentFeeDate', title: '费用月份', align: 'center',templet:function(d){
                        return d.studentFeeDate
                        }},
                    {title: '操作', align: 'center', fixed: 'right', templet: '#rowTool',width:160}
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
                case 'generate':
                    $.get('generalCharge/record/generate')
                        .done((res) => {
                            //如果不是错误的code 就刷新表格
                            if (res.code != 3001) {
                                query();
                            }
                            layer.msg(res.msg);
                        })
                    break;
                    case 'batchPay':
                        //========================批量缴费操作=======================
                        //判断是否是同一个学生的批量
                        //把表格数据传到后台封装到 mapReport里面

                        break;
            }
        })

        //行工具栏事件
        table.on("tool(assertTb)", function (obj) {
            let data = obj.data;
            switch (obj.event) {
                case 'checkOut':
                    //单个缴费操作
                    //========================单个缴费操作=======================
                    //获取单条数据传递到后台
                    let param={}
                    param.id = data.id;
                    //2 已缴费
                    param.state=2;
                    $.get("generalCharge/record/update",param)
                    .done((res)=>{
                        if(res.code!=3001){
                            query();
                            return layer.msg('缴费成功！',{icon:6})
                        }
                       layer.msg('缴费失败',{icon:5})
                    })
                    break;
                case 'del':
                    layer.confirm('确定要删除么', {
                        btn: ['是的', '再想想'],
                        yes(index, layero) {
                            $.post('base/assert/del', "ids=" + data.id)
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
