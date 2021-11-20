<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-16
  Time: 下午 16:15
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
    <title>部门管理</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="webjars/layui/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        /*.layuimini-container{*/
        /*    height: 96vh;*/
        /*}*/
        .layui-elem-field{
            height: 91vh;
            overflow: hidden;
        }
        .layui-form-label{
            width: 90px;
            padding:9px 10px;
        }

        .label_width{
            width:120px;
        }
    </style>
</head>
<body style="padding-bottom: 0px">
    <div class="layui-fluid">
            <div class="layui-row">
                <div class="layui-col-md2">
                    <fieldset class="layui-elem-field" >
                        <legend><h6>请选择班级或幼儿</h6></legend>

                        <div class="layui-field-box <c:if test="${sessionScope.userSession.garden_id == 0}"> depTree</c:if>" >
                            <c:if test="${sessionScope.userSession.garden_id == 0}">
                                <div class="layui-row">
                                    <form class="layui-form" lay-filter="posForm">
                                        <div class="layui-col-md12" style="padding:10px 10px">
                                            <select name="gardenId" class="layui-select" lay-filter="depSelect"></select>
                                        </div>
                                    </form>
                                </div>
                            </c:if>

                            <div id="tree"></div>
                        </div>

                    </fieldset>
                </div>

                <div class="layui-col-md10" style="padding:13px">
                    <div class="layui-row row1">
                       <div class="layui-panel" style="padding:10px;margin-bottom: 10px;">
                           <i class="layui-icon layui-icon-triangle-d"></i>您当前正在设置【<span class="banji" style=" font-weight:bold" ></span>】下全部幼儿应缴纳的常规费项（注：不含保育费和伙食费）
                       </div>
                        <form class="layui-form" lay-filter="setFeeForm" id="setFeeForm">
                            <input type="hidden" name="classId" id="classId"/>
                            <div class="layui-row row1">
                                <div class="layui-inline">
                                    <div class="layui-form-label label_width" >费项开始年月：<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" name="startDate" lay-verify="required">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-form-label label_width ">费项结束年月：<i class="layui-font-red">*</i>：</div>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" name="endDate" lay-verify="required">
                                    </div>
                                </div>

                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <button class="layui-btn" lay-submit lay-filter="batchAdd">批量添加</button>
                                        <button class="layui-btn" lay-submit lay-filter="batchUp">批量修改</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <%--选中班级进行显示  加载所有其他费用清单--%>


                        <table id="otherFee" lay-filter="otherFee" class="layui-hide"></table>
                    </div>

                    <div class="layui-row row2 layui-hide">
                        <div class="layui-panel" style="padding:10px;margin-bottom: 10px;">
                            <i class="layui-icon layui-icon-triangle-d"></i> <span style="font-weight: bold"><span class="stuInfo"></span> 已选的的常规费用项目</span>
                        </div>
                        <table id="alreadyHave" lay-filter="alreadyHave"></table>
                        <div class="layui-panel" style="padding:10px;margin-bottom: 10px;">
                            <i class="layui-icon layui-icon-triangle-d"></i> <span style="font-weight: bold"><span class="stuInfo"></span> 未选的的常规费用项目</span>

                        </div>
                        <form class="layui-form" name="noHave">
                            <div class="layui-inline">
                                <div class="layui-form-label label_width" >费项开始年月：<i class="layui-font-red">*</i>：</div>
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input" name="noStartDate" lay-verify="required">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-form-label label_width ">费项结束年月：<i class="layui-font-red">*</i>：</div>
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input" name="noEndDate" lay-verify="required">
                                </div>
                            </div>

                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button type='button' class="layui-btn addNoHave"  lay-filter="add"> <i class="layui-icon layui-icon-up"></i>添加</button>
                                    <button type="button" class="layui-btn delHave" lay-filter="del"> <i class="layui-icon layui-icon-down"></i>删除</button>
                                </div>
                            </div>
                        </form>
                        <table id="noHave" lay-filter="noHave"></table>
                    </div>

                </div>
        </div>
    </div>
    <script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>

    <script>

        let addIds = '';
        let upIds = '';
        let stuId = '';
        let stuClassId='';
        layui.use(['form','layer','tree','jquery','table','laydate'],function (){
            let tree = layui.tree,
                form = layui.form,
                layer = layui.layer,
                $ = layui.jquery,
                table = layui.table,
                laydate = layui.laydate;
            let date = new Date();
            console.log(date)
            //渲染日期
            laydate.render({
                elem:"[name=startDate]",
                value:new Date(),
                type:'month',
                max: '2021-12-31'
            })
            laydate.render({
                elem:"[name=endDate]",
                value:new Date(),
                type:'month',
                max: '2021-12-31'
            })
            laydate.render({
                elem:"[name=noEndDate]",
                value:new Date(),
                type:'month',
                max: '2021-12-31'
            })
            laydate.render({
                elem:"[name=noStartDate]",
                value:new Date(),
                type:'month',
                max: '2021-12-31'
            })

            //监听批量添加
            form.on('submit(batchAdd)',function(){
               let classId =  $("[name=classId]").val();
               if(classId==''){
                   layer.msg('请选择班级！')
               }else{
                   //插入添加的信息
                    if(addIds==''||addIds.length==0){
                        layer.msg('请选择费项！');
                    }else{
                        let classId = $('[name=classId]').val()
                        let gardenId = $('[name=gardenId]').val();
                        let startDate = $('[name=startDate]').val();
                        startDate+="-01";
                        let endDate = $('[name=endDate]').val();
                        let month = endDate.substr(endDate.lastIndexOf('-')+1);
                        let more =["1",'3','5','7','8','10','12']
                        for (let is in more) {
                            if(month==is){
                                endDate+="-31"
                               break;
                            }else{
                                endDate+="-30";
                                break;
                            }
                        }
                        let param = {
                            classId:classId,
                            gardenId:gardenId,
                            startDate:startDate,
                            endDate:endDate,
                            ids:addIds
                        }

                        $.ajax({
                            url:'generalCharge/other/add',
                            method:'post',
                            data:JSON.stringify(param),
                            contentType:'application/json;charset=UTF-8',
                        }). done((res)=>{
                            if(res.code!=3001){
                                return layer.msg(res.msg,{icon:6})
                            }else{
                                layer.msg(res.msg,{icon:5})
                            }
                        })
                    }
               }

                return false;
            })
            //监听单个添加
            $('.addNoHave').click(function(){
                //获取 选中的ids
                let noHave = table.checkStatus('noHave').data;
                if(noHave.length==0){
                    layer.msg('请选择添加的费项')
                }else{
                    let gardenId = $('[name=gardenId]').val();

                    if(typeof gardenId=='undefined'){
                        gardenId = ${sessionScope.userSession.garden_id}
                    }
                    //需要添加的没有的id
                    let noHaveIds = noHave.map(d=>d.id);

                    let startDate = $('[name=noStartDate]').val();
                    startDate+="-01";

                    let endDate = $('[name=noEndDate]').val();
                    let month = endDate.substr(endDate.lastIndexOf('-')+1);
                    let more =["1",'3','5','7','8','10','12']
                    for (let is in more) {
                        if(month==is){
                            endDate+="-31"
                            break;
                        }else{
                            endDate+="-30";
                            break;
                        }
                    }
                    let param = {
                        stuId:stuId,
                        classId:stuClassId,
                        gardenId:gardenId,
                        startDate:startDate,
                        endDate:endDate,
                        ids:noHaveIds
                    }

                    $.ajax({
                        url:'generalCharge/other/singleAdd',
                        method:'post',
                        data:JSON.stringify(param),
                        contentType:'application/json;charset=UTF-8',
                    }). done((res)=>{
                        if(res.code!=3001){
                            table.reload('alreadyHave',{})
                            table.reload('noHave',{})
                            layer.msg(res.msg,{icon:6})
                        }else{
                            layer.msg(res.msg,{icon:5})
                        }
                    })
                }
            })

            //监听批量修改
            form.on('submit(batchUp)',function(){
                let classId =  $("[name=classId]").val();
                if(classId==''){
                    layer.msg('请选择班级！')
                }else{
                    //修改插入的信息
                    let classId = $('[name=classId]').val()
                    let gardenId = $('[name=gardenId]').val();
                    let startDate = $('[name=startDate]').val();
                    startDate+="-01";
                    let endDate = $('[name=endDate]').val();
                    let month = endDate.substr(endDate.lastIndexOf('-')+1);
                    let more =["1",'3','5','7','8','10','12']
                    for (let is in more) {
                        if(month==is){
                            endDate+="-31"
                            break;
                        }else{
                            endDate+="-30";
                            break;
                        }
                    }
                    let param = {
                        classId:classId,
                        gardenId:gardenId,
                        startDate:startDate,
                        endDate:endDate,
                        ids:addIds
                    }

                    $.ajax({
                        url:'generalCharge/other/up',
                        method:'post',
                        data:JSON.stringify(param),
                        contentType:'application/json;charset=UTF-8',
                    }). done((res)=>{
                        if(res.code!=3001){
                            return layer.msg(res.msg,{icon:6})
                        }else{
                            layer.msg(res.msg,{icon:5})
                        }
                    })
                }

                return false;
            })
            //监听表已有费项的删除事件
            $('.delHave').click(function(){
                let haveData = table.checkStatus('alreadyHave').data;
                let haveIds = haveData.map(d=>'ids='+d.groove.id).join('&');
                let array = haveData.map(d=>d.groove.id)
                console.log(haveIds)
                if(array.length==0){
                    layer.msg('没有选择删除的费项')
                }else{
                    //删除其他费项关联表中的指定 ids
                    $.post("generalCharge/other/del",'stuId='+stuId+"&"+haveIds).done((res)=>{
                        if(res.code!=3001){
                            //删除成功 重载表格
                            table.reload('alreadyHave',{})
                            table.reload('noHave',{})
                            return layer.msg(res.msg,{icon:6})

                        }else{
                            layer.msg(res.msg,{icon:5})
                        }
                    })
                }

            })
            //渲染已选费项表格
            function loadAlreadyHave(stuId){
                table.render({
                    elem:'#alreadyHave',
                    even:true,
                    cellMinWidth:50,
                    height:265,
                    url:'generalCharge/other/have?stuId='+stuId,
                    // size:'sm',
                    text: {
                        none: '暂无相关数据' //默认：无数据。
                    },
                    cols:[[
                        {type:"numbers",align:'center',fixed:'left'},
                        {type:'checkbox',align: 'center',fixed: 'left'},
                        {field:'costCategory',title:'费用类目',align:"center",templet:function(d){
                                return d.groove.category.costname
                            }},
                        {field:'grooveName',title:'费项名称',align:"center",templet:function(d){
                            return d.groove.grooveName
                            }},
                        {field:"costType",title:"类型",align:"center",templet:function(data){
                                let type = "";
                                if (data.groove.costType == 1) {
                                    type = '保育费'
                                }
                                if (data.groove.costType == 2) {
                                    type = "伙食费"
                                }
                                if (data.groove.costType == 3) {
                                    type = "其他费项"
                                }
                                return type;
                            }},
                        {field:'univalence',title:'收费单价',align:"center",width:102,templet:function(d){
                                return d.groove.univalence.toFixed(2);
                            }},
                        {field:"univalenceType",title:'收费方式',align:"center",templet:function(d){
                                let type = ""
                                if (d.groove.univalenceType == 1) {
                                    type = "按学期"
                                }
                                if (d.groove.univalenceType == 2) {
                                    type = "按月"
                                }
                                if (d.groove.univalenceType == 3) {
                                    type = "按天"
                                }
                                return type;
                            }},
                        {field:'alone', title:'是否单独打印',align:"center",templet:function(d){
                                return d.groove.alone==1?'是':"否"
                            }},
                        {field:'startDate', title:'开始年月',align:"center"},
                        {field:'endDate', title:'结束年月',align:"center"}
                    ]]
                })
            }

            function loadNoHave(gardenId,stuId){
                table.render({
                    elem:'#noHave',
                    even:true,
                    page:true,
                    cellMinWidth:50,
                    height:265,
                    limit:20,
                    limits: [20, 50, 100],
                    url:'generalCharge/other/noHave?gardenId='+gardenId+'&stuId='+stuId,
                    // size:'sm',
                    text: {
                        none: '暂无相关数据' //默认：无数据。
                    },
                    cols:[[
                        {type:"numbers",align:'center',fixed:'left'},
                        {type:'checkbox',align: 'center',fixed: 'left'},
                        {field:'costCategory',title:'费用类目',align:"center",templet:function(d){
                                return d.category.costname
                            }},
                        {field:'grooveName',title:'费项名称',align:"center"},
                        {field:"costType",title:"类型",align:"center",templet:function(data){
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
                            }},
                        {field:'univalence',title:'收费单价',align:"center",width:102,templet:function(d){
                                return d.univalence.toFixed(2);
                            }},
                        {field:"univalenceType",title:'收费方式',align:"center",templet:function(d){
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
                            }},
                        {field:'alone', title:'是否单独打印',align:"center",templet:function(d){
                                return d.alone==1?'是':"否"
                            }},
                    ]]
                })
            }

            //渲染园所
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

                let gardenId = $("[name=gardenId]").val();
                if(typeof gardenId == 'undefined'){
                    gardenId = ${sessionScope.userSession.garden_id}
                }

                loadTree(gardenId);
                loadAllFee(gardenId);
                form.render()
            })
            //加载班级树
            function loadTree(gId){
                $.get("/sys/class/treeList",{gardenId:gId})
                    .done(({data})=>{
                        tree.render({
                            elem:"#tree",
                            onlyIconControl:true,
                            data:data,
                            id:'depTree',
                            click:function (obj){
                                let data = obj.data;
                                let title = data.title;
                                if(data.type==1){
                                    //批量添加的隐藏
                                    $('.row1').removeClass("layui-hide")
                                    $(".row2").addClass("layui-hide")
                                    let index = title.indexOf('【');
                                    title = title.substr(0,index);
                                    //填充信息
                                    $(".banji").text(title);
                                    $('[name=classId]').val(data.id)

                                }else{
                                    let gardenId = $('[name=gardenId]').val();
                                    if(typeof gardenId =='undefined'){
                                        gardenId =   ${sessionScope.userSession.garden_id};
                                    }

                                    //批量添加的隐藏
                                    $('.row1').addClass("layui-hide")
                                    $('.row2').removeClass("layui-hide")
                                    //选择具体幼儿 显示已选 和 未选 费用 的列表
                                     $('[name=stuId]').val(data.id)
                                    //通过id 动态渲染表格数据 已选的
                                    loadAlreadyHave(data.id);
                                    //未选的
                                    loadNoHave(gardenId,data.id);
                                    //填充学生信息
                                    $(".stuInfo").text(data.title)
                                    stuClassId = data.stuClassId;
                                    stuId = data.id;
                                }

                                form.render();
                            }
                        })

                    })
            }


           function loadAllFee(gardenId){
               //渲染所有费项表格
               table.render({
                   elem:'#otherFee',
                   even:true,
                   page:true,
                   toolbar:'#headTool',
                   cellMinWidth:50,
                   height:610,
                   limit:20,
                   id:'otherFee',
                   limits: [20, 50, 100],
                   url:'generalCharge/groove/otherList?gardenId='+gardenId,
                   // size:'sm',
                   text: {
                       none: '暂无相关数据' //默认：无数据。
                   },
                   cols:[[
                       {type:"numbers",align:'center',fixed:'left'},
                       {type:'checkbox',align: 'center',fixed: 'left'},
                       {field:'costCategory',title:'费用类目',align:"center",templet:function(d){
                               return d.category.costname
                           }},
                       {field:'grooveName',title:'费项名称',align:"center"},
                       {field:"costType",title:"类型",align:"center",templet:function(data){
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
                           }},
                       {field:'univalence',title:'收费单价',align:"center",width:102,templet:function(d){
                               return d.univalence.toFixed(2);
                           }},
                       {field:"univalenceType",title:'收费方式',align:"center",templet:function(d){
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
                           }},
                       {field:'alone', title:'是否单独打印',align:"center",templet:function(d){
                               return d.alone==1?'是':"否"
                           }},
                   ]]
               });
           }

            table.on('checkbox(otherFee)',function(obj){
                let checkStatus = table.checkStatus('otherFee');
                let data = checkStatus.data;
                addIds=data.map(d=>d.id);
                // addIds=data.map(d=>"ids="+d.id).join('&');
            })

                //监听form的下拉列表改变事件
                form.on('select(depSelect)',function (data){
                    loadTree(data.value)
                    $('.row1').removeClass('layui-hide');
                    $('.row2').addClass('layui-hide');
                    //清除详细信息
                    $("#setFeeForm").get(0).reset();
                })


        })
    </script>
</body>
</html>
