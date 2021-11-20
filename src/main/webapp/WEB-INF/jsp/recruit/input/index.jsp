<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 爱睡觉的小胖儿
  Date: 2021-10-12
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
<script src="/statics/lib/2.6.8/layui.js"></script>
<script src="/webjars/jquery/3.1.1/jquery.js"></script>
<link rel="stylesheet" href="/statics/localcss/c/input/inputIndex.css">

<html>
<head>
    <title>招生录入</title>
</head>
<body>
<div class="layui-fluid">
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
                                    <input type="text" class="layui-input" name="phone" placeholder="请输入他手机号">
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
                                    备注说明：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="remark" placeholder="请输入备注说明">
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
                                <label  class="layui-form-label">
                                    是否退费：
                                </label>
                                <div class="layui-input-block">
                                    <select name="isreturn">
                                        <option value="">请选择</option>
                                        <option value="0">是</option>
                                        <option value="1">否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label  class="layui-form-label">
                                    预计入园自：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="willIntoDateStart" placeholder="请输入预计入园自">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label  class="layui-form-label">
                                    预计入园至：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="willIntoDateEnd"placeholder="请输入预计入园至">
                                </div>
                            </div>
                        </div>
                        <div class="layui-row row4">

                            <div class="layui-col-md3">
                                <label  class="layui-form-label">
                                    定班日期自：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="setclassDateStart" placeholder="请输入定班日期自">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label class="layui-form-label">
                                    定班日期至：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="setclassDateEnd" placeholder="请输入定班日期至">
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
                        <button type="button" class="layui-btn layui-btn-normal  layui-btn-sm" onclick="add()">新增</button>
                        <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" lay-event="reset" onclick="cz()">重置</button>
                    </script>




                    <script type="text/html" id="rowTool">
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">查看</a>
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">删除</a>
                    </script>

                </div>
            </div>
        </div>
    </div>

    <%--新增--%>
    <div id="add" style="display: none">
        <form class="layui-form" name="addForm" lay-filter = "addForm" method="post" enctype="multipart/form-data">
            <br>
            <div class="layui-row row1">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        幼儿姓名：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="studentname">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        幼儿编号：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="studentCode" >
                    </div>
                </div>
            </div>
            <div class="layui-row row2">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        性别：
                    </label>
                    <div class="layui-input-block">
                        <select name="gender">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        出生日期：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="brithday" >
                    </div>
                </div>
            </div>
            <div class="layui-row row4">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        所属年级：
                    </label>
                    <div class="layui-input-block">
                        <select name="gradeId">
                            <option value="">请选择年级</option>
                        </select>
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        收费类型：
                    </label>
                    <div class="layui-input-block">
                        <select name="chargetype">
                            <option value="">请选择收费类型</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-row row5">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        定班日期：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassDate">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        缴费金额：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="chargeamount" >
                    </div>
                </div>
            </div>
            <div class="layui-row row6">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        入园时间：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="willIntoDate" >
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        联系电话：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="phone" >
                    </div>
                </div>
            </div>
            <div class="layui-row row7">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        定班家长：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassParents">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        定班教师：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassTeacher" >
                    </div>
                </div>
            </div>
            <div class="layui-row row8">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        定班票号：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassTicketno">
                    </div>
                </div>
                <div class="layui-col-md5">
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
            </div>
            <div class="layui-row row8">
                <div class="layui-col-md10">
                    <label  class="layui-form-label">
                        说明：
                    </label>
                    <div class="layui-input-block">
                        <textarea name="remark"  class="layui-textarea"></textarea>
                    </div>
                </div>

            </div>
            <div class="layui-row row8">
                <div class="layui-col-md10">
                    <label for="" class="layui-form-label">头像</label>
                    <div class="layui-input-block">
                        <input name="picture" type="file" id="addPicture">
                        <img id="stuHeader" src="" alt="" width="100px" height="100px" class="layui-hide">
                        <div id="zyupload" class="zyupload"></div>
                    </div>
                </div>
            </div>

        </form>
    </div>


    <%--修改--%>
    <div id="update" style="display: none">
        <form class="layui-form" lay-filter = "updateForm">
            <br>
            <input type="hidden" name="id">
            <div class="layui-row row1">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        幼儿姓名：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="studentname">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        幼儿编号：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="studentCode" >
                    </div>
                </div>
            </div>
            <div class="layui-row row2">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        性别：
                    </label>
                    <div class="layui-input-block">
                        <select name="gender">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        出生日期：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="brithday" >
                    </div>
                </div>
            </div>
            <div class="layui-row row4">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        所属年级：
                    </label>
                    <div class="layui-input-block">
                        <select name="gradeId">
                            <option value="">请选择年级</option>
                        </select>
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        收费类型：
                    </label>
                    <div class="layui-input-block">
                        <select name="chargetype">
                            <option value="">请选择收费类型</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-row row5">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        定班日期：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassDate">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        缴费金额：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="chargeamount" >
                    </div>
                </div>
            </div>
            <div class="layui-row row6">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        入园时间：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="willIntoDate" >
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        联系电话：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="phone" >
                    </div>
                </div>
            </div>
            <div class="layui-row row7">
                <div class="layui-col-md5">
                    <label  class="layui-form-label">
                        定班家长：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassParents">
                    </div>
                </div>
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        定班教师：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassTeacher" >
                    </div>
                </div>
            </div>
            <div class="layui-row row8">
                <div class="layui-col-md5">
                    <label class="layui-form-label">
                        定班票号：
                    </label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="setclassTicketno">
                    </div>
                </div>
                <div class="layui-col-md5">
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
            </div>
            <div class="layui-row row8">
                <div class="layui-col-md10">
                    <label  class="layui-form-label">
                        说明：
                    </label>
                    <div class="layui-input-block">
                        <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-row row8">
                <div class="layui-col-md10">
                    <label  class="layui-form-label">
                        头像：
                    </label>
                    <div class="layui-input-block">
                        <img src="" alt="" height="100px" width="100px" id="upHeader">
                    </div>
                </div>
            </div>

        </form>
    </div>


    <%--数据显示--%>
    <div class="layui-container layui-table">
        <table id="tb" lay-filter="studentTb"></table>
    </div>
</div>





<script>

    layui.use(function () {
        let laydata = layui.laydate;
        laydata.render({
            elem: '[name=willIntoDateStart],[name=willIntoDateEnd],[name=setclassDateStart],[name=setclassDateEnd],[name=brithday],[name=setclassDate],[name=willIntoDate]'
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



        /*下拉框*/
        let $ = layui.jquery;
        $.get('/sys/grade/list')
            .done(result=>{
                for (let gradeId of result.data){
                    let opt = $("<option/>");
                    opt.html(gradeId.gradename);
                    opt.val(gradeId.id);
                    opt.appendTo("[name = gradeId]");
                }
                layui.form.render('select');
            });



        /* 新增*/
        $.get('/sys/chargeType/list')
            .done(result=>{
                console.log(result);
                for (let chargetype of result.data){
                    let opt = $("<option/>");
                    opt.html(chargetype.chargeType);
                    opt.val(chargetype.id);
                    opt.appendTo("[name = chargetype]");
                }
                layui.form.render('select');
            });


    })

    // 执行条件查询
    function search(){
        layui.use(function () {
            let where = layui.form.val('searchForm');
            console.log(where);
            layui.table.reload("tb",{where});
        })
    }

    /*显示数据*/
    layui.use(function () {
        var table = layui.table;
        table.render({
            elem:"#tb",
            even:true,
            page:true,
            limit:5,
            toolbar:'#toolbar',
            limits:[5,10,15],
            url:'/recruit/input/search',
            cols:[[
                {field:'id', width:50,align: "center"},
                {field: 'studentname', width: 89,title: '幼儿姓名',align: "center"},
                {field: 'studentCode',width: 90,title: '幼儿编号',align: "center"},
                {field:"gender",width: 60,title:"性别",align:"center",templet:function (data) {
                        return data.gender==0?"男":"女";
                    }},
                {field: 'gradeName',width: 90,title: '所属年级',align: "center"},

                {field:"intoKindergarten",width: 90,title:"是否入园",align:"center",templet:function (data) {
                        return data.intoKindergarten==0?"是":"否";
                    }},
                {field: 'willIntoDate',width: 120,title: '预计入园时间',align: "center"},
                {field: 'brithday',width: 108,title: '出生日期',align: "center"},
                {field: 'setclassDate',width: 102,title: '定班日期',align: "center"},
                {field: 'setclassParents',width: 89,title: '定班家长',align: "center"},
                {field: 'phone',width: 116,title: '联系电话',align: "center"},
                {field: 'setclassTeacher',width: 87,title: '定班教师',align: "center"},
                {field: 'setclassTicketno',width: 90,title: '定班票号',align: "center"},
                {field: 'chargeamount',width: 95,title: '缴费金额',align: "center"},
                {field:"isreturn",width: 90,title:"是否退费",align:"center",templet:function (data) {
                        return data.isreturn==0?"是":"否";
                    }},
                // {field:"returntype",width: 86,title:"退费类型",align:"center",templet:function (data) {
                //         if (data.returnway==0){
                //             return "入园退费";
                //         }else if(data.returnway==1){
                //             return "未入园退费"
                //         }else{
                //             return "";
                //         }
                //     }},
                {field: 'gardenName',title: '所属园所',align: 'center'},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}


            ]]
        })
    })

    let canUp = false;
    $("[name=picture]").on('input propertychange',function(){
        let fs = $(this)[0].files;

        let max_size = 1024 * 1024 * 100;
        //展示上传的文件名字
        let length = fs.length;
        //当有文件上传时显示文件名
        if(length == 0){
           layer.msg('暂无上传文件');
           canUp=false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(fs[0], 'UTF-8');
        reader.onload = function (e) {
            // urlData就是对应的文件内容
            $('#stuHeader').removeClass("layui-hide");
            $("#stuHeader").attr('src',this.result);
        };
        for (let i = 0; i < fs.length; i++) {
            let d = fs[0];
            if (d.size <= max_size) {  //文件必须小于100M
                if (/(|PNG|png|JPG|jpg)$/.test(d.name)) { //文件类型可自定义
                    canUp = true;
                } else {
                    layer.msg('该文件不可上传！');
                    canUp=false;
                    return false
                }
            } else {
                layer.msg('上传文件过大！');
                canUp=false;
                return false
            }
        }
    })

    //增加用户弹框打开添加模态框
    function add() {
        layui.use(function () {
            let layer = layui.layer;
            let $ = layui.jquery;
            $("#add>form")[0].reset();
            layer.open({
                type: 1,
                area: ['900px'],
                title: '添加幼儿',
                content: $("#add"),
                btn:['确定','取消'],
                yes(){
                    let formData= new FormData($('[name=addForm]').get(0));
                    $.ajax({
                        url:'/recruit/add',
                        type:'post',
                        data:formData,
                        processData:false,
                        contentType:false,
                    }).done(({msg})=>{
                        layer.close(layer.index);
                        layui.table.reload('tb');
                        layer.msg(msg);
                    })
                    // $.post('/recruit/add',kmsstudent)
                    //     .done(({msg})=>{
                    //         layer.close(layer.index);
                    //         layui.table.reload('tb');
                    //         layer.msg(msg);
                    //     });
                },
                end:function(){
                    $('#add').css('display','none')
                }
            });
        });
    }


    /*重置*/
    function cz(){
        layui.use(function () {
            let $ = layui.jquery;
            $("#queryForm").get(0).reset();
        })
    }



    //选择修改或删除
    layui.use(function () {
        let table = layui.table;
        table.on('tool(studentTb)',obj=>{
            switch (obj.event) {
                case 'edit':
                    update(obj.data);
                    break;
                case 'del':
                    del(obj.data.id);
                    break;
            }
        })
    })





    //修改用户弹框打开添加模态框
    function update(data) {
        layui.use(function () {
            let $ = layui.jquery;
            let layer = layui.layer;
            layui.form.val('updateForm',data);
            $("#upHeader").attr('src',"/statics/localImg/"+data.pictrue)
            layer.open({
                type:1,
                area: ['900px'],
                title:'修改幼儿',
                content: $("#update"),
                btn:['确定','取消'],
                yes(){
                    let kmsstudent = layui.form.val('updateForm');
                    $.post('/recruit/update',kmsstudent)
                        .done(({msg})=>{
                            layer.close(layer.index);
                            layui.table.reload('tb');
                            layer.msg(msg);
                        });
                },
                end:function(){
                    $('#update').css('display','none');
                }
            })
        })
    }


    /*删除*/
    function del(id){
        layui.use(function () {
            let layer = layui.layer;
            let $ = layui.jquery;
            layer.confirm("确认要删除嘛！",function () {
                $.post("/recruit/del?id="+id)
                    .done(({msg})=>{
                        layui.table.reload('tb');
                        layer.msg(msg);
                    });
            })
        })
    }


</script>
</body>
</html>
