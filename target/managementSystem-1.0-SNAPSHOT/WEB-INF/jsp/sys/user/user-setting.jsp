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
    <title>修改密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/statics/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="/statics/css/public.css" media="all">
    <style>
        .layui-form-item .layui-input-company {width: auto;padding-right: 10px;line-height: 38px;}
        .text{
            padding:10px 0px 0px 0px;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="layui-form layuimini-form">
            <div class="layui-form-item">
                <input type="hidden" name="id" value="${sessionScope.userSession.id}">
                <label class="layui-form-label required">用户编码：</label>
                <div class="layui-input-block">
                    <p class="text userCode" >${sessionScope.userSession.user_code}</p>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">用户名称：</label>
                <div class="layui-input-block">
                    <p class="text userName">${sessionScope.userSession.userName}</p>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门：</label>
                <div class="layui-input-block">
                    <p class="text depName">${sessionScope.userSession.depName}</p>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">职位：</label>
                <div class="layui-input-block">
                    <p class="text posName">${sessionScope.userSession.posName}</p>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">入职时间：</label>
                <div class="layui-input-block">
                    <p class="text entryTime">${sessionScope.userSession.creation_date}</p>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">移动电话：</label>
                <div class="layui-input-block">
                    <p class="text phone">${sessionScope.userSession.phone}</p>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">电子邮件：</label>
                <div class="layui-input-block">
                    <input name="email"  class="layui-input" value="${sessionScope.userSession.email}"/>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">办公电话：</label>
                <div class="layui-input-block">
                    <input name="officePhone" class="layui-input" value="${sessionScope.userSession.officePhone}"/>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内线电话：</label>
                <div class="layui-input-block">
                    <input name="internalPhone"  class="layui-input" value="${sessionScope.userSession.internalPhone}"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="0" title="男" ${sessionScope.userSession.gender==false?"checked":""}>
                    <input type="radio" name="gender" value="1" title="女" ${sessionScope.userSession.gender==true?"checked":""}>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">出生日期：</label>
                <div class="layui-input-block">
                    <input type="text" id="birthday" name="birthday" class="layui-input" value="${sessionScope.userSession.birthday}">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="statics/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="statics/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form','miniTab'], function () {
        var form = layui.form,
            layer = layui.layer,
            miniTab = layui.miniTab,
            laydate = layui.laydate,
            $ = layui.jquery;
        laydate.render({
            elem:"#birthday"
        })

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            let param = $.param(data.field);
            $.post("sys/user/setting",param)
            .done((res)=>{
                if(res.code!=3001){
                   return layer.msg(res.msg,{icon:6})
                }
                layer.msg(res.msg,{icon:5})
            })

            return false;
        });

    });
</script>
</body>
</html>