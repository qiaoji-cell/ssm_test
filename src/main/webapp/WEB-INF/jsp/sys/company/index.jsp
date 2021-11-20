<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-16
  Time: 下午 16:14
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
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="layuimini-container" >
    <div class="layuimini-main">
        <form class="layui-form" lay-filter="businessForm" style="margin-top:10px;">
            <div class="layui-row row1">
                <input type="hidden" name="id">
                <div class="layui-col-md6 layui-font-gray" >
                    <label for="" class="layui-form-label">企业编码：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input layui-font-gray disabled" name="businessCode" disabled lay-verify="required">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">企业品牌<i class="layui-font-red">*</i>：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="make" lay-verify="required">
                    </div>
                </div>
            </div>
            <div class="layui-row row2">
                <div class="layui-col-md12">
                    <label for="" class="layui-form-label">企业全称<i class="layui-font-red">*</i>：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="businessName">
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">企业简称：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="businessShort">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">英文名称：</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" name="businessEnname">
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">企业类型：</label>
                    <div class="layui-input-block">
                        <input type="text" name="enterprise" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">所属行业：</label>
                    <div class="layui-input-block">
                        <input type="text" name="trade" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">公司地址：</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">邮政编码：</label>
                    <div class="layui-input-block">
                        <input type="text" name="encoded" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">公司电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="telephony" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">传真号码：</label>
                    <div class="layui-input-block">
                        <input type="text" name="transmission" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">公司网站：</label>
                    <div class="layui-input-block">
                        <input type="text" name="website" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">电子邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">法人代表：</label>
                    <div class="layui-input-block">
                        <input type="text" name="legalPerson" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">注册时间：</label>
                    <div class="layui-input-block">
                        <input type="text" name="register" class="layui-input" id="date">
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">注册资金：</label>
                    <div class="layui-input-block">
                        <input type="number" name="capital" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">员工人数：</label>
                    <div class="layui-input-block">
                        <input type="number" name="staff" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">国税号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stateTax" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">地税号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="localTax" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row3">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">开户银行：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bank" class="layui-input">
                    </div>
                </div>
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">银行账号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bankAccount" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-row row4">
                <div class="layui-form-item">
                    <label for="" class="layui-form-label" >企业简介：</label>
                    <div class="layui-input-block">
                        <textarea  name="introduction" class="layui-textarea" lay-verify="required" rows="8"></textarea>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.userSession.garden_id == 0}">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" lay-submit lay-filter="save" class="layui-btn ">保存</button>
                </div>
            </div>
            </c:if>
        </form>
    </div>

</div>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','jquery','layer','laydate'],function (){
        let $ = layui.jquery,
            form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        laydate.render({
            elem:'[name=register]'
        })
        function loadData(){
            $.get("/base/company/list")
                .done(({data})=>{
                    form.val('businessForm',data)
                })
        }

        loadData();

        form.on('submit(save)',function (){
            let param = form.val('businessForm');
            $.post('/base/company/update',param)
            .done((res)=>{
                if(res.code!=3001){
                    loadData();
                }
                layer.msg(res.msg);
            })

            return false;
        })
    })
</script>
</body>
</html>
