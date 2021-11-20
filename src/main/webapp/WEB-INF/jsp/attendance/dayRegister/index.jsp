<%--
  Created by IntelliJ IDEA.
  User: 爱睡觉的小胖儿
  Date: 2021-10-25
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>日常考勤登记</title>
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
    <script src="/statics/lib/2.6.8/layui.js"></script>
    <link rel="stylesheet" href="/statics/localcss/c/input/inputIndex.css">
</head>
<body>

<%--条件查询--%>
<div>
    <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show">
                <form class="layui-form"  lay-filter = "searchForm" id="queryForm">
                    <div class="layui-row row1">
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                选择班级：
                            </label>
                            <div class="layui-input-block">
                                <select name="className" id="ru"  lay-filter="ru">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--表格数据--%>
<div><table id="tb" lay-filter="tb"></table></div>

<div id="update" style="display: none">
    <form class="layui-form" lay-filter = "updateForm">
        <input type="hidden" name="id">
        <br>
        <div class="layui-col-md10">
            <label  class="layui-form-label">
                请假类型：
            </label>
            <div class="layui-input-block">
                <select name="attendanceState">
                    <option value="">请选择</option>
                    <option value="2">病假</option>
                    <option value="3">事假</option>
                    <option value="4">占床</option>
                    <option value="5">未入园</option>
                </select>
            </div>
        </div>
        <br> <br> <br><br>
        <div class="layui-row row8">
            <div class="layui-col-md10">
                <label  class="layui-form-label">
                    说明：
                </label>
                <div class="layui-input-block">
                    <textarea name="remark" placeholder="请输入内容" class="layui-textarea" style="height: 200px"></textarea>
                </div>
            </div>

        </div>
    </form>
</div>


<script type="text/html" id="toolbar">
    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="getCheckData">批量签到</button>
    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="del">批量删除</button>
</script>

<%--操作--%>
<script type="text/html" id="rowTool">
    {{#  if(d.attendanceState !=2 && d.attendanceState != 3 && d.attendanceState != 4 && d.attendanceState != 5){ }}
    <button class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del" id="qj">请假</button>
    {{#  } }}


    {{#  if(d.attendanceState == 1){ }}
    <button class="layui-btn layui-btn-normal layui-btn-xs" lay-event="qd" >签到</button>
    {{#  }else if (d.attendanceState != 0){ }}
    <button class="layui-btn layui-btn-normal layui-btn-xs" lay-event="qd" >签到</button>
    {{#  } }}
</script>




</body>
</html>
<script>

    /*显示数据*/
    layui.use(function () {
        var table = layui.table;
        table.render({
            elem:"#tb",
            even:true,
            page:true,
            limit:20,
            limits:[20,50,100],
            height:635,
            toolbar:'#toolbar',
            url:'/attendance/dayRegister/search',
            cols:[[
                {type: "checkbox", align: "center"},
                {field:'id',title:'ID',align:"center"},
                {field:'studentCode',title:'学号',align:"center"},
                {field:'studentname',title:'姓名',align:"center"},
                {field:"gender",title:"性别",align:"center",templet:function (data) {
                        return data.gender==0?"男":"女";
                    }},
                 {field:'chargeType',title:'收费类型',align:"center"},
                {field:'homeAddress',title:'家庭住址',align:"center"},
                {field:'chargeType',title:'收费类型',align:"center"},
                {field:'relationName',title:'监护人',align:"center"},
                {field:'phone',title:'监护人电话',align:"center"},
                {field:'attendanceState',title:'考勤状态',align:"center",templet:function (d){
                    switch (d.attendanceState) {
                        case 2:
                            return "病假";
                        case 3:
                            return "事假";
                        case 4:
                            return "占床";
                        case 5:
                            return "未入园";
                                break;
                        default:
                            return '<span lay-event="state"><input type="checkbox" lay-filter="lockDemo" lay-skin="switch" class="state" lay-text="已签|未签" '+(d.attendanceState==0?"checked":"")+'/></span>'
                    }
                    }},
                {field:'registrant',title:'登记人',align:"center"},
                // {field:'attendanceLock',title:'考勤锁定',align:"center",templet:function (d){
                //         return '<span lay-event="lock"><input type="checkbox" lay-skin="switch" class="lock" lay-text="锁定|未锁" '+(d.attendanceLock==0?"checked":"")+'/></span>'
                //     }},
                //{field:'className',title:'班级',align:"center"},
                 {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
           ]]
        })
    })

    /*考勤状态和考勤锁定*/
  layui.use(function () {
        let table = layui.table,layer = layui.layer,
            $ = layui.jquery;
        table.on('tool(tb)',obj=>{
            let tr = obj.tr;
            let id = obj.data.id;
            let data = obj.data.attendanceState;
            console.log(data)
            switch (obj.event) {
                case 'del':
                    if(data != 0 && data != 1){
                        layer.msg("已请假")
                    }else{
                        update(obj.data);
                    }
                    break;
                case 'state':
                    let stat = $(tr).find('.state').prop('checked');
                    if(stat == true){
                        $.post("/attendance/dayRegister/upState?id="+id)
                            .done(({msg})=>{
                                layui.table.reload('tb');
                                layer.msg(msg);
                            })
                    }else{
                        $.post("/attendance/dayRegister/upState2?id="+id)
                            .done(({msg})=>{
                                layui.table.reload('tb');
                                layer.msg(msg);
                            })
                    }
                    break;
                case 'lock':
                    let lock = $(tr).find('.lock').prop('checked');
                    if(lock == true){
                        $.post("/attendance/dayRegister/upyisuo?id="+id)
                        .done(({msg})=>{
                            layui.table.reload('tb');
                            layer.msg(msg);
                        })
                    }else {
                        $.post("/attendance/dayRegister/upweisuo?id="+id)
                            .done(({msg})=>{
                                layui.table.reload('tb');
                                layer.msg(msg);
                            })
                    }
                    break;
                case 'qd':
                    if(data == 0){
                        layer.msg("已签到")
                    }else{
                        qd(obj.data);
                    }
                        break;


            }
        })

    })


    /*对年级进行查询并且对select进行渲染*/
   layui.use(function () {
       let $ = layui.jquery;
       $.get('/sys/class/list')
           .done(result=>{
               for (let classroomId of result.data){
                   let opt = $("<option/>");
                   opt.html(classroomId.classname);
                   opt.val(classroomId.classname);
                   opt.appendTo("[name = className]");
               }
               layui.form.render('select');
           })
   })

    /*查询*/
   layui.use(function () {
       layui.form.on('select(ru)', function(data){
           layui.use(function () {
               let where = layui.form.val('searchForm');
               layui.table.reload("tb", {where});
           })
       });

   })

    /*请假修改*/
    function update(data) {
        layui.use(function () {
            let $ = layui.jquery;
            let layer = layui.layer;
            let id = data.id;
            let lx = data.attendanceState;
            layui.form.val('updateForm',data);
            layer.open({
                type:1,
                title:'',
                area: ['300px','400px'],
                content: $("#update"),
                btn:['确定','取消'],
                yes(){
                    let qj = layui.form.val('updateForm');
                    $.post('/attendance/dayRegister/upq',qj)
                        .done(({msg})=>{
                            layer.close(layer.index);
                            layui.table.reload('tb');
                            layer.msg(msg);
                        });
                    let a = qj.attendanceState;
                    console.log(a)
                    if(a == 3){
                        $.post('/attendance/dayRegister/djup?id='+id)
                    }else if(a == 2){
                        $.post('/attendance/dayRegister/djup2?id='+id)
                    }else if (a ==4){
                        $.post('/attendance/dayRegister/djup3?id='+id)
                    }

                }
            })
        })
    }

    /*按钮签到*/
    function qd(data){
        layui.use(function () {
            let $ = layui.jquery;
            $.post('/attendance/dayRegister/qjup?id='+data.id)
                .done(({msg})=>{
                    layui.table.reload('tb');
                    layer.msg(msg);
                });
        })
    }

    layui.use(function () {
        let table = layui.table;
        let $ = layui.jquery;
        let layer = layui.layer;
        table.on('toolbar(tb)',function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch (obj.event) {
                case 'getCheckData':
                    if (data.length == 0){
                        layer.msg("请最少选择一行");
                    }else {
                        //传递到后台的vo对象
                        let returnCode = {};
                        //勾选的学生的id数组
                        let ids=[]
                        ids = data.map(d=>d.id);
                        //给vo对象赋值ids
                        returnCode.ids=ids;
                        $.ajax({
                            url:"/attendance/dayRegister/plqj?id="+returnCode.ids,
                            type:"post",
                            data:JSON.stringify(returnCode.ids),
                            contentType:"application/json;charset=UTF-8"
                        }).done(({msg})=>{
                            layui.table.reload('tb');
                            layer.msg(msg);
                        })
                    }
                    break;
                case 'del':
                    if (data.length == 0){
                        layer.msg("请最少选择一行");
                    }else {
                        //传递到后台的vo对象
                        let returnCode = {};
                        //勾选的学生的id数组
                        let ids=[]
                        ids = data.map(d=>d.id);
                        //给vo对象赋值ids
                        returnCode.ids=ids;
                        $.ajax({
                            url:"/attendance/dayRegister/pldel?id="+returnCode.ids,
                            type:"post",
                            data:JSON.stringify(returnCode.ids),
                            contentType:"application/json;charset=UTF-8"
                        }).done(({msg})=>{
                            layui.table.reload('tb');
                            layer.msg(msg);
                        })
                    }
                    break;
            }
        })
    })





</script>
