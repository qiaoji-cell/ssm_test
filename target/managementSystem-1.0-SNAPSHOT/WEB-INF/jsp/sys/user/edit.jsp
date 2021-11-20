


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <link rel="stylesheet" href="statics/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
        .layui-row{
            margin-bottom: 10px;
        }
        .layui-form-label{
            padding:9px 5px 5px 0px;
            width: 100px;
        }
        .layui-textarea{
            min-height: 66px !important;
        }
        fieldset .layui-row:last-child{
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
<div class="layui-fluid" style="margin-top:10px">
    <form class="layui-form" lay-filter="addForm">
        <input type="hidden" name="gardenId">
        <input type="hidden" name="id">
        <fieldset class="layui-elem-field">
            <legend><h3>基本资料</h3></legend>
            <div class="layui-field-box">
                <div class="layui-row row1">
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            用户编码：<span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="user_code" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
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
                        <label  class="layui-form-label">
                            登录密码：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="userPassword"  lay-verify="pass">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            确认密码*：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="verifyPwd"  lay-verify="pass|verifyPwd">
                        </div>
                    </div>
                </div>
                <div class="layui-row row3">
                    <c:if test="${sessionScope.userSession.garden_id==0}">
                        <div class="layui-col-md4">
                            <label  class="layui-form-label">
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
                    </c:if>
                    <div class="
                                <c:if test="${sessionScope.userSession.garden_id==0}">layui-col-md4</c:if>
                                <c:if test="${sessionScope.userSession.garden_id>0}">layui-col-md6</c:if>

                                ">
                        <label  class="layui-form-label">
                            所属部门：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select name="depId" class="layui-select"></select>
                        </div>
                    </div>
                    <div class="
                                <c:if test="${sessionScope.userSession.garden_id==0}">layui-col-md4</c:if>
                                <c:if test="${sessionScope.userSession.garden_id>0}">layui-col-md6</c:if>
                        ">
                        <label  class="layui-form-label">
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
                    <div class="
                     <c:if test="${sessionScope.userSession.garden_id == 0}">
                    layui-col-md6
                    </c:if>
                    ">
                        <label  class="layui-form-label">
                            角色：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="demo"  name="roleName" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <c:if test="${sessionScope.userSession.garden_id == 0}">
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            所属园所：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <select disabled name="realGardenId" id='realGardenId'class="layui-select">

                            </select>
                        </div>
                    </div>
                    </c:if>
                </div>
                <div class="layui-row row5">
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            账号生效日：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input name="startDate" class="layui-input" lay-verify="date">
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
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
                        <label  class="layui-form-label">
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
                        <label  class="layui-form-label">
                            性别：
                            <span class="layui-font-red">*</span>
                        </label>
                        <div class="layui-input-block">
                            <input type="radio" name="gender" title="男" checked value="0">
                            <input type="radio" name="gender" title="女" value="1">
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <label  class="layui-form-label">
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
                        <label  class="layui-form-label">
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
                        <label  class="layui-form-label">
                            电子邮件：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="email" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            移动电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" class="layui-input"/>
                        </div>
                    </div>
                </div>
                <div class="layui-row row7">
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
                            办公电话：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="officePhone" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <label  class="layui-form-label">
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
                    <button class="layui-btn layui-btn-warm"  lay-submit lay-filter="add">更新</button>
                    <button class="layui-btn"  lay-submit lay-filter="addAndClose">更新并关闭</button>
                    <button type='reset' class="layui-btn layui-btn-danger" >重置</button>
                </div>
            </div>
        </div>
        <input type="hidden" name="allInfo">
    </form>
</div>

<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script src="statics/js/lay-config.js?v=2.0.0" charset="utf-8"></script>

<script>
    layui.use(['form','layer','laydate','tableSelect'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate,
            $ = layui.$,
            tableSelect = layui.tableSelect;
        let id ;
        let gardenId;
        let allInfo;
        setTimeout(()=>{
            //获取父页面传来的id值
            id = $("[name=id]").val();
            //获取父页面的机构类型
            gardenId = $("[name=gardenId]").val();
            allInfo = $("[name=allInfo]").val();
            let user = JSON.parse(allInfo);
            console.log(user.userPassword)
            console.log(user.state)
            //赋值表单
            form.val("addForm",user);
            // $("#demo").val(user.roleName)
            $("[name=userPassword]").val('');
            //================================================================================
            //区分机构 幼儿园id 在user里
            gardenId=gardenId==null||gardenId==''?0:gardenId;
            if(gardenId>1){
                gardenId=1;
            }
            //================================================================================

            $("#demo").attr('ts-selected',user.roleIds)

            tableSelect.render({
                elem: '#demo',	//定义输入框input对象 必填
                checkedKey: 'id', //表格的唯一建值，非常重要，影响到选中状态 必填
                searchKey: 'keyword',	//搜索输入框的name值 默认keyword
                searchPlaceholder: '关键词搜索',	//搜索输入框的提示文字 默认关键词搜索
                height:'400',  //自定义高度
                width:'900',  //自定义宽度
                table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
                    url:'/sys/role/list?gardenId='+gardenId,
                    cols: [[
                        {type:'checkbox'},
                        {field:'id',title:'ID'},
                        {field:'roleName',title:'角色'},
                        {field:'roleRemark',title:'备注'}
                    ]]
                },
                done: function (elem, data) {
                    var NEWJSON = []
                    layui.each(data.data,function(index,item){
                        NEWJSON.push(item.roleName)
                    })
                    elem.val(NEWJSON.join(","))
                    //选择完后的回调，包含2个返回值 elem:返回之前input对象；data:表格返回的选中的数据 []
                    //拿到data[]后 就按照业务需求做想做的事情啦~比如加个隐藏域放ID...

                }
                //默认值
                //只需要在触发input上添加 ts-selected="1,2,3" 属性即可 值需与checkedKey对应

            })

            //===========================================切换机构类型========
            $("[name=garden_id]").val(gardenId);
            loadPosList(gardenId,function (){
                //切换完毕后重新赋值正确的
                $("[name=posId]").val(user.posId);
            });
            loadRoleList(gardenId,function (){
                //切换完毕后重新赋值正确的
                $("[name=roleId]").val(user.roleId);
            });
            loadSelectTree(gardenId,function (){
                //切换完毕后重新赋值正确的
                $("[name=depId]").val(user.depId);
            });

            //属于哪个幼儿园
            loadGardenList(()=>{
                if(gardenId>0){
                    //是否禁用园所的下拉选项
                    $('[name=realGardenId]').removeAttr('disabled');
                    $("[name=realGardenId]").val(user.garden_id);
                }
            });
            form.render();

        },20)
        //=====================================
        form.verify({
            vEndDate:function(value,item){
                let startDate = $("[name=startDate]").val();
                let endDate = value;
                let objStart = new Date(startDate);
                let objEnd = new Date(endDate);
                if(objStart.getTime()>objEnd.getTime()){
                    return "失效日期不能小于开始日期"
                }
            },
            pass:function (value,item){
                let regExp = /^[\S]{6,12}$/;
                if(value!=''&&value!=null){
                    if(!regExp.test(value)){
                        return '密码必须6到12位，且不能出现空格';
                    }
                }else{
                    return false;
                }
            },
            verifyPwd(value,item){
                let oldPwd = $("[name=userPassword]").val();
                let newPwd = value;
                if(oldPwd!=newPwd){
                    return '两次密码不一致';
                }
            }
        })

        //渲染日期
        laydate.render({
            elem:'[name*=Date],[name=birthday]'
        })

        //部门下拉列表
        function loadSelectTree(gardenId,callBack){
            $.get("/sys/dep/selectTree",{gardenId:gardenId}).
            done(({data})=>{
                $('[name=depId]').empty();
                for(let org of data){
                    let option = $('<option>');
                    option.text(org.selectName);
                    option.val(org.id);
                    option.appendTo('[name=depId]');
                }
                if(typeof callBack =='function') callBack();
                form.render();
            })
        }
        loadSelectTree(0);

        // 职位下拉列表
        function loadPosList(gardenId,callBack){
            $.get("/sys/pos/select",{gardenId:gardenId}).
            done(({data})=>{
                $('[name=posId]').empty();
                for(let org of data){
                    let option = $('<option>');
                    option.text(org.posName);
                    option.val(org.id);
                    option.appendTo('[name=posId]');
                }
                if(typeof callBack =='function') callBack();
                form.render();
            })
        }
        loadPosList(0);
        // 角色下拉列表
        function loadRoleList(gardenId,callBack){
            $.get("/sys/role/select",{gardenId:gardenId}).
            done(({data})=>{
                $('[name=roleId]').empty();
                for(let org of data){
                    let option = $('<option>');
                    option.text(org.roleName);
                    option.val(org.id);
                    option.appendTo('[name=roleId]');
                }
                if(typeof callBack =='function') callBack();
                form.render();
            })
        }
        loadRoleList(0);
        //园所下拉列表
        function loadGardenList(callBack){
            $.get("/base/assert/select").
            done(({data})=>{
                $('#realGardenId').empty();
                for(let org of data){
                    let option = $('<option>');
                    option.text(org.gardenName);
                    option.val(org.id);
                    option.appendTo('#realGardenId');
                }
                //执行回调
                if(typeof callBack =='function') callBack();
                form.render();
            })
        }
        loadGardenList();
        //第一次进来 重新渲染一次下拉列表


        //监听机构下拉列表选择事件  重新加载所有的相关下拉列表
        form.on('select(orgFilter)',function(data){
            loadSelectTree(data.value)
            loadRoleList(data.value)
            loadPosList(data.value)
            loadGardenList();
            if(data.value==0){
                //所属园所 下拉 禁用
                $("#realGardenId").attr('disabled','disabled')
                //添加name属性
                $("#realGardenId").attr("name",'realGardenId')
            }else if(data.value==1){
                //所属园所 下拉 启用
                $('#realGardenId').removeAttr('disabled')
                //移除name属性
                $("#realGardenId").attr("name")
            }
            tableSelect.render({
                elem: '#demo',	//定义输入框input对象 必填
                checkedKey: 'id', //表格的唯一建值，非常重要，影响到选中状态 必填
                searchKey: 'keyword',	//搜索输入框的name值 默认keyword
                searchPlaceholder: '关键词搜索',	//搜索输入框的提示文字 默认关键词搜索
                height:'400',  //自定义高度
                width:'900',  //自定义宽度
                table: {	//定义表格参数，与LAYUI的TABLE模块一致，只是无需再定义表格elem
                    url:'/sys/role/list?gardenId='+data.value,
                    cols: [[
                        {type:'checkbox'},
                        {field:'id',title:'ID'},
                        {field:'roleName',title:'角色'},
                        {field:'roleRemark',title:'备注'}
                    ]]
                },
                done: function (elem, data) {
                    var NEWJSON = []
                    layui.each(data.data,function(index,item){
                        NEWJSON.push(item.roleName)
                    })
                    elem.val(NEWJSON.join(","))
                    //选择完后的回调，包含2个返回值 elem:返回之前input对象；data:表格返回的选中的数据 []
                    //拿到data[]后 就按照业务需求做想做的事情啦~比如加个隐藏域放ID...
                }
            })

            form.render();
        })


        function add(){
            let param =form.val("addForm");
            let ids = $("#demo").attr('ts-selected');
            param.roleIds=ids;
            $.post("/sys/user/edit",param)
                .done((res)=>{
                    if(res.code!=3001){
                        return layer.msg(res.msg,{icon:6,time:1000});
                        parent.layui.table.reload('currentTableFilter',{page:{curr:1}});
                    }
                    layer.msg(res.msg,{icon:5,time:1000})
                })
        }
        form.on('submit(add)',function (){
            add();
            return false;
        })

        form.on('submit(addAndClose)',function (){
            let param =form.val("addForm");
            let ids = $("#demo").attr('ts-selected');
            param.roleIds=ids;
            $.post("/sys/user/edit",param)
                .done((res)=>{
                    layer.msg(res.msg,{time:500},function (){
                        if(res.code!=3001){
                            parent.layui.table.reload('currentTableFilter',{page:{curr:1}});
                            let parentIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(parentIndex);
                        }
                    })
                })

            return false;
        })

    });
</script>
</body>
</html>