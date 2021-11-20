<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-12
  Time: 下午 16:33
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
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/localcss/q/count/countIndex.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        .layui-form-label{
            padding:9px 10px;
            width: 90px;
        }
    </style>
</head>
<body>
    <%--查询条件--%>
    <div class="layui-fluid" style="margin-top:10px">
        <div class="layui-collapse">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">查询条件</h2>
                <div class="layui-colla-content layui-show">
                    <form class="layui-form"  lay-filter = "searchForm" id="queryForm">
                       <div class="layui-row row1">
                           <div class="layui-col-md3">
                               <label for="id" class="layui-form-label">
                                   幼儿编号：
                               </label>
                               <div class="layui-input-block">
                                   <input type="text" class="layui-input" name="studentCode" placeholder="请输入幼儿编号" id="id">
                               </div>
                           </div>
                           <div class="layui-col-md3">
                               <label for="studentname" class="layui-form-label">
                                   幼儿姓名：
                               </label>
                               <div class="layui-input-block">
                                   <input type="text" class="layui-input" name="studentname" id="studentname" placeholder="请输入幼儿姓名  ">
                               </div>
                           </div>
                           <div class="layui-col-md3">
                               <label for="" class="layui-form-label">
                                   定班家长：
                               </label>
                               <div class="layui-input-block">
                                   <input type="text" class="layui-input" name="setclassParents"  placeholder="请输入定班家长">
                               </div>
                           </div>
                           <div class="layui-col-md3">
                               <label for="" class="layui-form-label">
                                   联系电话：
                               </label>
                               <div class="layui-input-block">
                                   <input type="text" class="layui-input" name="phone" placeholder="请输入手机号">
                               </div>
                           </div>
                       </div>

                        <div class="layui-row row2">
                            <div class="layui-col-md3">
                                <label for="" class="layui-form-label">
                                    定班教师：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="setclassTeacher" placeholder="请输入定班教师">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label for="" class="layui-form-label">
                                    定班票号：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="setclassTicketno"placeholder="请输入定班票号">
                                </div>
                            </div>

                            <div class="layui-col-md3">
                                <label for="" class="layui-form-label">
                                    备注说明：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="remark"placeholder="请输入备注说明">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label for="" class="layui-form-label">
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
                        </div>
                        <div class="layui-row row3">
                            <div class="layui-col-md3">
                                <label for="gradeId" class="layui-form-label">
                                    所属年级：
                                </label>
                                <div class="layui-input-block">
                                    <select name="gradeId" id="gradeId">
                                        <option value="">年级列表</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label for="" class="layui-form-label">
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
                                <label for="willIntoDateStart" class="layui-form-label">
                                    预计入园自：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="willIntoDateStart" id="willIntoDateStart" placeholder="请输入预计入园自">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label for="willIntoDateEnd" class="layui-form-label">
                                    预计入园至：
                                </label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="willIntoDateEnd" id="willIntoDateEnd" placeholder="请输入预计入园至">
                                </div>
                            </div>
                        </div>

                        <div class="layui-row row4">
                            <div class="layui-row row5">

                                <div class="layui-col-md3">
                                    <label for="setclassDateStart" class="layui-form-label">
                                        定班日期自：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="setclassDateStart" id="setclassDateStart" placeholder="请输入定班日期自">
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <label for="setclassDateEnd" class="layui-form-label">
                                        定班日期至：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="setclassDateEnd" id="setclassDateEnd" placeholder="请输入定班日期至">
                                    </div>
                                </div>
                                <c:if test="${sessionScope.userSession.garden_id == 0}">
                                    <div class="layui-col-md3">
                                        <label class="layui-form-label">选择机构:</label>
                                        <div class="layui-input-block">
                                            <select name="gardenId" >
                                                <option value="0"></option>
                                            </select>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <%--表格数据--%>
    <table id="studentTb" lay-filter="studentTb"></table>




<%--查看--%>
<div id="update" style="display: none">
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
                            <input type="text" class="layui-input" name="studentname"  style="border: 0px">
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
                            <input type="hidden" class="layui-input" name="returntype"  style="border: 0px">
                            <p class="tuifei" style="padding-top: 9px;margin-left: 15px"></p>
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
            </fieldset>
        </div>
    </form>
</div>




    <%--各种计算--%>
    <div class="layui-btn-container">
        <template  id="headTool">
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="query" >查询</button>
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="reset">重置</button>
            <span style="margin-left: 135px">
            合计： <span id="heji" style="padding-right: 35px"></span>
            总班人数： <span id="zongrenshu"style="padding-right: 35px"></span>
            入园人数： <span id="ruyuan"style="padding-right: 35px"></span>
            <%--失流人数： <span></span>--%>
            未退费： <span id="weituifei"></span></span>
        </template>
    </div>


<script type="text/html" id="rowTool">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">查看</a>
</script>
    <script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>



<script>



    /*表格数据渲染*/
    layui.use(['laydate','table','form','jquery'],function (){
        let laydate = layui.laydate
        ,table = layui.table,
            form=layui.form,
            $=layui.jquery;
        laydate.render({
            elem:'[name*=Date]'
        })
        table.render({
            elem:'#studentTb',
            even:true,
            page:true,
            toolbar:"#headTool",
            cellMinWidth:100,
            limit:5,
            id:'studentTb',
            limits:[5,10,15],
            url:'/recruit/count/list',
            cols:[[
                {field:'id',width:60,title:'ID',align:"center"},
                {field:'studentname',width:80,title:'姓名',align:"center"},
                {field:'studentCode',width:90,title:'学生编号',align:"center"},
                {field:"gender",width:60,title:"性别",align:"center",templet:function(data){
                        return data.gender==0?"男":"女"
                    }},
                {field:"gradeName",width:90,title:'所属年级',align:"center",templet:function (data){
                    return data.grade.gradename;
                    }},
                {field:"intoKindergarten",width:90,title:"是否入园",align:"center",templet:function(data){
                        return data.intoKindergarten==0?"是":"否";
                    }},
                {field:'willIntoDate',width:120,title:'预计入园时间',align:"center"},
                {field:'brithday',width:108,title:'出生日期',align:"center"},
                {field:'setclassDate',width:102,title:'定班日期',align:"center"},
                {field:'setclassParents',width:89,title:'定班家长',align:"center"},
                {field:'phone',width:116,title:'联系电话',align:"center"},
                {field:'setclassTeacher',width:87,title:'定班教师',align:"center"},
                {field:'setclassTicketno',width:90,title:'定班票号',align:"center"},
                {field:'chargeamount',width:95,title:'缴费金额',align:"center"},
                {field:"isreturn",width:90,title:"是否退费",align:"center",templet:function(data){
                        return data.isreturn==0?"是":"否";
                    }},
                {field:"returntype",width: 86,title:"退费类型",align:"center",templet:function (data) {
                        if (data.returnway==0){
                            return "入园退费";
                        }else if(data.returnway==1){
                            return "未入园退费"
                        }else{
                            return "";
                        }
                    }},
                {field:"returndate",title: "退费日期",align: "center"},
                {field:"returnway",width: 86,title:"退费方式",align:"center",templet:function (data) {
                        if (data.returnway==0){
                            return "现金";
                        }else if(data.returnway==1){
                            return "微信"
                        }else{
                            return "";
                        }
                    }},
                {field:"remark",title: "说明",align: "center"},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
            ]]
        })


        table.on("toolbar(studentTb)",function (obj){
            let checkStatus = table.checkStatus(obj.config.id);
            let event = obj.event;
            switch (event){
                case 'query':
                    let where = form.val("searchForm");
                    table.reload('studentTb',{
                        where
                    })
                    break;
                case 'reset':
                    $("#queryForm").get(0).reset();
                    break;
            }
        })

        /*下拉框*/
        function getGradeList(){
            $.get("/sys/grade/list")
            .done(({data})=>{
                console.log(data)
                $("[name=gradeId]").empty();
                let option = $("<option>")
                option.val(0);
                option.text("请选择");
                $("[name=gradeId]").append(option);

                for(let grade of data){
                    let option = $('<option/>');
                    option.val(grade.id);
                    option.text(grade.gradename);
                   option.appendTo("[name=gradeId]")
                }
                form.render("select");
            })
        }

        getGradeList();

    })




    //查看
    layui.use(function () {
        let table = layui.table;
        table.on('tool(studentTb)',obj=>{
            switch (obj.event) {
                case 'edit':
                    console.log(obj.data);
                    update(obj.data);
                    break;

            }
        })
    })
    //查看详细
    function update(data) {
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
            }else if(a==1){
                $(".tuikuan").html("现金");
            }else if (a==0){
                $(".tuikuan").html("微信");
            }

            /**
             * 判断招生退费里面查看里面的退费类型
             */

            var c = $("input[name=returntype]").val();

            if(c==""){
                $(".tuifei").html("");
            }else if(c==0){
                $(".tuifei").html("入园退费");
            }else if(c==1){
                $(".tuifei").html("未入园退费");
            }





            layer.open({
                type:1,
                area: ['900px'],
                title:'查看幼儿',
                content: $("#update"),
                yes(){
                    let kmsstudent = layui.form.val('updateForm');
                    $.post('/recruit/return/search',kmsstudent)
                        .done(({msg})=>{
                            layer.close(layer.index);
                            layui.table.reload('tb');
                            layer.msg(msg);
                        });
                }
            })
        })
    }

    /*招生统计幼儿总人数*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/recruit/input/rs")
            .done(({data})=>{
                //console.log(data)
                $("#zongrenshu").text(data.zhong);

            })
    })

    /*招生统计幼儿金额总和*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/recruit/input/zh")
            .done(({data})=>{
                //console.log(data);
                $("#heji").text(data.zonghe);
            })
    })

    /*招生统计里的已退费总和*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/recruit/input/tf")
            .done(({data})=>{
                console.log(data)
                $("#tuifei").text(data.tuifei)
            })
    })

    /*招生统计里的幼儿入园总和*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/recruit/input/ry")
            .done(({data})=>{
                //console.log(data);
                $("#ruyuan").text(data.ruyuan)
            })
    })

    /*招生统计里的幼儿未退费总和*/
    layui.use(function () {
        let $ = layui.jquery;
        $.get("/recruit/input/wtf")
        .done(({data})=>{
            //console.log(data)
            $("#weituifei").text(data.weituifei)
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
                option.val(org.id);
                option.appendTo('[name=gardenId]');
            }
            layui.form.render('select');
        })
    })
</script>



</body>
</html>
