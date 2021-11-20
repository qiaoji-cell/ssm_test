<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-12
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>招生退费</title>

</head>



<link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css" media="all">
<link rel="stylesheet" href="/statics/layuimini/css/layuimini.css" media="all">
<link rel="stylesheet" href="/statics/localcss/z/return/index.css" media="all">
<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>




<body>
<%--查询条件--%>
<div class="layui-fluid">
    <div class="layui-collapse">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show">
                <form class="layui-form"  lay-filter = "searchForm" id="queryForm">
                    <div class="layui-row row1">
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                幼儿编号：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="studentCode" placeholder="请输入幼儿编号">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                幼儿姓名：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="studentname" placeholder="请输入幼儿姓名">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                定班家长：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="setclassParents" placeholder="请输入定班家长">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                联系电话：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="phone" placeholder="请输入手机号">
                            </div>
                        </div>
                    </div>
                    <div class="layui-row row2">
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                定班教师：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="setclassTeacher" placeholder="请输入定班教师">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                定班票号：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="setclassTicketno" placeholder="请输入定班票号">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                是否入园：
                            </label>
                            <div class="layui-input-block">
                                <select name="intoKindergarten">
                                    <option value="">请选择</option>
                                    <option value="0">是</option>
                                    <option value="1">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                所属年级：
                            </label>
                            <div class="layui-input-block">
                                <select name="gradeId">
                                    <option value="">请选择年级</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row row3">

                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                预计入园自：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="startWillIntoDate" placeholder="请输入预计入园自">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                预计入园至：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="endWillIntoDate" placeholder="请输入预计入园至">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label  class="layui-form-label">
                                定班日期自：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="startSetClassDate" placeholder="请输入定班日期自">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                定班日期至：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="endSetClassDate" placeholder="请输入定班日期至">
                            </div>
                        </div>
                    </div>
                    <div class="layui-row row4">

                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                退费日期自：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="startReturnDate" placeholder="请输入退费日期自">
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <label class="layui-form-label">
                                退费日期至：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="endReturnDate" placeholder="请输入退费日期至">
                            </div>
                        </div>
                        <c:if test="${sessionScope.userSession.garden_id == 0}">
                            <div class="layui-col-md3">
                                <label class="layui-form-label">选择机构:</label>
                                <div class="layui-input-block">
                                    <select name="gardenName" >
                                        <option value="0"></option>
                                    </select>
                                </div>
                            </div>
                        </c:if>
                    </div>




                </form>


                <%--操作--%>
                <script type="text/html" id="toolbar">
                    <button type="button" class="layui-btn layui-btn-normal  layui-btn-sm"  onclick="search()">查询</button>
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" lay-event="reset" onclick="cz()">重置</button>
                    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="getCheckData">批量退费</button>
                </script>





                <script type="text/html" id="rowTool">
                    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">查看</a>
                </script>



            </div>
        </div>
    </div>
</div>
<%--查看--%>
<div id="query" style="display: none">
    <form class="layui-form" lay-filter = "updateForm">

        <div style="margin: 10px">
            <fieldset class="table-search-fieldset" style="border: #E6E6E6 1px solid">
                <legend style="color:#6B6B6B ">基本信息</legend>
                <br>
                <input type="hidden" name="id">
                <div class="layui-row row1">
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            幼儿姓名：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="studentname" style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            幼儿编号：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="studentCode"  style="border: 0px">
                        </div>
                    </div>
                </div>

                <div class="layui-row row5">
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            定班日期：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="setclassDate" style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            缴费金额：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="chargeamount"  style="border: 0px">
                        </div>
                    </div>
                </div>
                <div class="layui-row row6">
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            入园时间：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="willIntoDate"  style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <label class="layui-form-label">
                            联系电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="phone"  style="border: 0px">
                        </div>
                    </div>
                </div>
                <div class="layui-row row7">
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            定班家长：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="setclassParents" style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <label class="layui-form-label">
                            定班教师：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="setclassTeacher"  style="border: 0px">
                        </div>
                    </div>
                </div>
                <div class="layui-row row8">
                    <div class="layui-col-md5">
                        <label class="layui-form-label">
                            定班票号：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="setclassTicketno" style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        出生日期：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="brithday"  style="border: 0px">
                    </div>
                </div>
                </div>
                <div class="layui-row row2">
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            说明：
                        </label>
                        <div class="layui-input-block">
                            <textarea name="remark"  class="layui-textarea" style="border: 0px"></textarea>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
        <div style="margin: 10px">
            <fieldset class="table-search-fieldset" style="border: #E6E6E6 1px solid">
                <legend style="color:#6B6B6B ">退费信息</legend>
                <div class="layui-row row1">
                    <div class="layui-col-md5">
                        <label class="layui-form-label">
                            是否退费：
                        </label>
                        <div class="layui-input-block">
                            <input type="hidden" name="isreturn">
                           <p class="return" style="padding-top: 9px;margin-left: 35px"></p>
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <label  class="layui-form-label">
                            退费类型：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="returntype"  style="border: 0px">
                        </div>
                    </div>
                    <div class="layui-row row2">
                        <div class="layui-col-md5">
                            <label class="layui-form-label">
                                退费日期：
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="returndate"  style="border: 0px">
                            </div>
                        </div>
                        <div class="layui-col-md5">
                            <label  class="layui-form-label">
                                退款方式：
                            </label>
                            <div class="layui-input-block">
                                <input type="hidden" name="returnway">
                                <p class="tuikuan" style="padding-top: 9px;margin-left: 35px"></p>
                            </div>
                        </div>

                    </div>
                </div>
                </fieldset>
        </div>
    </form>
</div>

<%--数据显示--%>
<div class="layui-container layui-table">
    <table id="tb" lay-filter="studentTb"></table>
</div>

<%--退费--%>
<input type="hidden" name="id">
<div id="up" >
<form class="layui-form" lay-filter = "returnForm" id="aa">

    <div class="layui-input-inline">
        <label class="layui-form-label">退费日期:</label>
        <div class="layui-input-block">
            <input type="text" name="returndate"  autocomplete="off" class="layui-input" style="">
        </div>
    </div>
    <div class="layui-input-inline">
        <label class="layui-form-label">退款方式:</label>
        <div class="layui-input-block">
            <select name="returnway">
                <option value="">请选择</option>
                <option value="0">现金</option>
                <option value="1">微信</option>
            </select>
        </div>
    </div>
    <div class="layui-input-inline">
        <label class="layui-form-label">退费类型:</label>
        <div class="layui-input-block">
            <select name="returntype">
                <option value="">请选择</option>
                <option value="0">入园退费</option>
                <option value="1">未入园退费</option>
            </select>
        </div>
    </div>
</form>
</div>


<script>





    /*数据渲染*/
    layui.use(['laydate','table','jquery'],function () {
        let laydate = layui.laydate;
        laydate.render({
            elem: '[name*=Date],[name=returndate]'
        })
        var table = layui.table;
        layui.use(function () {
            var table = layui.table;
            table.render({
                elem: '#tb',
                even: true,
                page: true,
                limit: 5,
                toolbar: '#toolbar',
                limits: [5, 10, 15],
                url: "/recruit/return/search",
                cols: [[
                    {type: "checkbox", align: "center"},
                    // {field: 'id',title:'ID',align: 'center'},
                    {field: 'studentname', width: 70,title: '幼儿姓名', align: "center"},
                    {field: 'studentCode', width: 80, title: '幼儿编号', align: "center"},
                    {
                        field: "gender", width: 60, title: "性别", align: "center", templet: function (data) {
                            return data.gender == 1 ? "女" : "男";
                        }
                    },
                    {field: 'gradeName', width: 90, title: '所属年级', align: "center"},
                    {field:"intoKindergarten",width: 86,title:"是否入园",align:"center",templet:function (data) {
                            return data.intoKindergarten==0?"是":"否";
                        }},
                    {field: 'willIntoDate', width: 116, title: '预计入园时间', align: "center"},
                    {field: 'brithday', width: 108, title: '出生日期', align: "center"},
                    {field: 'setclassDate', width: 102, title: '定班日期', align: "center"},
                    {field: 'phone', width: 116, title: '联系电话', align: "center"},
                    {field: 'setclassTeacher', width: 87, title: '定班教师', align: "center"},
                    {field: 'setclassTicketno', width: 90, title: '定班票号', align: "center"},
                    // {field: 'returntype', width: 100, title: '退费类型', align: "center"},
                    {field:"returntype",width: 86,title:"退费类型",align:"center",templet:function (data) {
                            if (data.returnway==0){
                                return "入园退费";
                            }else if(data.returnway==1){
                                return "未入园退费"
                            }else{
                                return "";
                            }
                        }},
                    {field: 'returndate', width: 108, title: '退费日期', align: "center"},
                    /*  {field: 'returnway', width: 86, title: '退费方式', align: "center"},*/
                    {field:"returnway",width: 86,title:"退费方式",align:"center",templet:function (data) {
                            if (data.returnway==0){
                                return "现金";
                            }else if(data.returnway==1){
                                return "微信"
                            }else{
                                return "";
                            }
                        }},
                    {field: 'chargeamount',width: 95,title: '缴费金额',align: "center"},
                    {field:"isreturn",width: 86,title:"是否退费",align:"center",templet:function (data) {
                            return data.isreturn==0?"是":"否";
                        }},
                    {field: 'gardenName',title: '所属园所',align: 'center'},
                    {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
                ]]
            });
        })
    })


    /*下拉框*/
    let $ = layui.jquery;
    $.get('/sys/grade/list')
        .done(result => {
            for (let gradeId of result.data) {
                let opt = $("<option/>");
                opt.html(gradeId.gradename);
                opt.val(gradeId.id);
                opt.appendTo("[name = gradeId]");
            }
            layui.form.render('select');
        });

    // 执行条件查询
    function search() {
        layui.use(function () {
            let where = layui.form.val('searchForm');
            console.log(where);
            layui.table.reload("tb", {where});
        })
    }

    /*重置*/
    function cz(){
        layui.use(function () {
            let $ = layui.jquery;
            $("#queryForm").get(0).reset();
            $("#aa").get(0).reset();
        })
    }

    //查看
    layui.use(function () {
        let table = layui.table;
        table.on('tool(studentTb)',obj=>{
            switch (obj.event) {
                case 'edit':
                    query(obj.data);
                    break;
            }
        })
    })

    //查看详细
    function query(data) {
        layui.use(function () {
            let $ = layui.jquery;
            let layer = layui.layer;
            layui.form.val('updateForm',data);
            /**
             *判断招生退费里面的查看里面的是否退费
             */
            var a = $("input[name=isreturn]").val();
            if(a==0){
                $(".return").html("是");
            }else if (a==1){
                $(".return").html("否");
            }
            /**
             * 判断招生退费里面的查看里面的退费方式是是什么
             */
            var b = $("input[name=returnway]").val();


            if(b==""){
                $(".tuikuan").html("");
            }else if (b==0){
                $(".tuikuan").html("现金");
            }else if (b==1){
                $(".tuikuan").html("微信");
            }

            layer.open({
                type:1,
                area: ['900px'],
                title:'查看幼儿',
                content: $("#query"),
            })
        })
    }



    /*退费按钮*/
    layui.use(function () {
        let table = layui.table;
        let $ = layui.jquery;
        let layer = layui.layer;
        let form = layui.form;
        table.on('toolbar(studentTb)',function (obj) {
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
                         let param = form.val('returnForm')
                         returnCode.returnInfo = param;
                         $.ajax({
                             url:"/recruit/return/up?id="+returnCode,
                             type:"post",
                             data:JSON.stringify(returnCode),
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



    /*渲染机构下拉框数据*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/base/assert/select").
        done(({data})=>{
            $('select[name=gardenId]').empty();
            for(let org of data){
                let option = $('<option>');
                option.text(org.gardenName);
                option.val(org.gardenName);
                option.appendTo('[name=gardenName]');
            }
            layui.form.render('select');
        })
    })



</script>





</body>
</html>
