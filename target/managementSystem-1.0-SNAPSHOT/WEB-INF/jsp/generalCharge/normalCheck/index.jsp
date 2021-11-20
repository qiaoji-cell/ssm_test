<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-15
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css" >

    <link rel="stylesheet" href="/statics/localcss/z/return/index.css" >
    <style>
        .approval{
            width:130px;
        }
        .layui-input-inline{
            margin-bottom:0px;
        }
        .changeForm{
            /*position: absolute;*/
            /*top: 182px;*/
            /*left: 101px;*/
            /*z-index: 1000;*/
        }

    </style>
</head>

<body>

<div class="layui-fluid" style="margin-top: 8px;">
    <%-- 查询学生档案数据 --%>
    <div class="layui-collapse" >
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">查询条件</h2>
            <div class="layui-colla-content layui-show" >
                <form class="layui-form searchForm" lay-filter="searchForm">
                    <div class="layui-row row1">

                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">选择年级:</label>
                            <div class="layui-input-block">
                                <select name="gradeId" >
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">选择班级:</label>
                            <div class="layui-input-block">
                                <select name="classroomId">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">学生姓名:</label>
                            <div class="layui-input-block">
                                <input type="text" name="studentName" required  lay-verify="required"  autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">状态:</label>
                            <div class="layui-input-block">
                                <select name="statusId">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row row2">
                    <c:if test="${sessionScope.userSession.garden_id == 0}">
                            <div class="layui-input-inline layui-col-md3">
                                <label class="layui-form-label">选择机构:</label>
                                <div class="layui-input-block">
                                    <select name="gardenId" >
                                    </select>
                                </div>
                            </div>
                    </c:if>

                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">申请时间自:</label>
                            <div class="layui-input-block">
                                <input name="startDate" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-input-inline layui-col-md3">
                            <label class="layui-form-label">申请时间至:</label>
                            <div class="layui-input-block">
                                <input name="endDate" class="layui-input" lay-verify="verifyDate">
                            </div>
                        </div>
                    </div>


                    <div class="layui-container" style="width:35%;display: none">
                        <template id="toolbar">
                            <button class="layui-btn  layui-btn-sm"  onclick="search()" ><i class="layui-icon layui-icon-search"></i> 查询</button>
                            <c:if test="${sessionScope.userSession.garden_id>0}">
                                <button class="layui-btn  layui-btn-sm"  onclick="add()"> 增加</button>
                            </c:if>

                            <button class="layui-btn layui-btn-sm"  lay-event="rest"><i class="layui-icon layui-icon-refresh-3"></i> 重置 </button>
                            <button class="layui-btn layui-btn-sm"  lay-event="pass"><i class="layui-icon layui-icon-next"></i> 审批通过 </button>
                            <button class="layui-btn layui-btn-sm"  lay-event="refuse"><i class="layui-icon layui-icon-upload-circle"></i> 审批驳回 </button>
                        </template>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <table id="studentTb" lay-filter="studentTb"></table>


    <template id="action">
        <button class="layui-btn layui-btn-sm" lay-event="edit" >查看</button>
    </template>


    <%--新增学生档案--%>

    <div id="add" style="display: none" >
        <div style="margin-top: 8px;margin-bottom: 8px;margin-left: 15px">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="addRecord()" >确定</button>
            <button type="submit" class="layui-btn layui-btn-primary layui-btn-sm" onclick="colse()">取消</button>
            <button type="button" class="layui-btn layui-btn-primary layui-border-red layui-btn-sm" onclick="parentsAdd()">添加</button>
        </div>

        <div class="layui-tab layui-tab-card">


            <ul class="layui-tab-title">
                <li class="layui-this">基本信息</li>
                <li>监护人信息</li>
            </ul>
            <div class="layui-tab-content" >
                <%--默认显示基本信息--%>
                <div class="layui-tab-item layui-show">

                    <%--对基本信息的增加--%>
                    <form class="layui-form" lay-filter = "addForm" style="padding-left: 40px;margin-right: 40px">
                        <br>
                        <fieldset class="layui-elem-field"  >
                            <legend>基本信息</legend>
                            <p style="margin-left: 20px;margin-bottom: 20px"></p>
                            <div class="layui-row row1">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        学号：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentCode">
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        姓名：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentName" >
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
                                        所属班级:
                                    </label>
                                    <div class="layui-input-block">
                                        <select name="classroomId">
                                            <option value="" ></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row4">s
                                <div class="layui-col-md5">
                                    <label class="layui-form-label">
                                        状态：
                                    </label>
                                    <div class="layui-input-block">
                                        <select name="statusId">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label class="layui-form-label" style="width: 130px">
                                        允许保育费退费：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="childReturn" value="1" title="是" checked>
                                        <input type="radio" name="childReturn" value="2" title=否>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row5">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label" style="width: 130px">
                                        允许伙食费退费：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="messReturn" value="1" title="是" checked>
                                        <input type="radio" name="messReturn" value="2" title=否>
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        招生顾问：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="adviserId" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row6">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label" >
                                        正式入园：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="enterDate" >
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label class="layui-form-label">
                                        推荐人：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="recommender" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row7">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        离园日期：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="leaveDate">
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <%--其他事项的增加--%>
                    <form class="layui-form" lay-filter ="addMatter">

                        <div class="layui-form"  style="padding-left: 40px;margin-right: 40px;">
                            <fieldset class="layui-elem-field" >
                                <legend>其他事项</legend>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            是否独生：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="radio" name="isOnly" value="1" title="是" checked>
                                            <input type="radio" name="isOnly" value="0" title=否>
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            户籍类型：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="householdType">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            户籍所在：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="householdLocation">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            籍贯：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="nativePlace">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            家庭住址：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="address">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            证件号码：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="certificatesNumber">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            健康状况：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="health">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            害怕事物：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="fearThings">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            忌食：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="Avoid">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            过敏：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="allergy">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            兴趣爱好：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="hobby">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            特殊照顾：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" name="special">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row8">
                                    <div class="layui-col-md11">
                                        <label  class="layui-form-label">
                                            说明：
                                        </label>
                                        <div class="layui-input-block">
                                            <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
                                        </div>
                                    </div>

                                </div>
                            </fieldset>
                        </div>
                        <input type="hidden" class="xuehao" name="studentCode">
                    </form>
                </div>

                <%--监护人信息的显示--%>
                <div class="layui-tab-item">



                    <form class="layui-form" lay-filter="addParents">
                        <div id="jian" style="margin-right: 35px">

                            <input type="hidden" name="studentCode">
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        所属关系：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="relationName" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        姓名：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentName" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        手机号码：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="phone" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        证件类型：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="idType" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        证件号码：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="idCard" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        行业：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="business" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        学历：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="education" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        银行卡号：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="bankNo" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        工作单位：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="workUnit" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        Email：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="email" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        家庭住址：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="homeAddress" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4" style="padding-left:30px;padding-top:10px;height:40px">
                                    <input type="checkbox" name="isGetMessage" title="可接受短信" lay-skin="primary">
                                    <input type="checkbox" name="isEmergencyGuardian" title="紧急联系" lay-skin="primary" style="margin-right: 30px;">
                                </div>

                            </div>

                        </div>
                    </form>
                    <table id="parentsTb" ></table>

                </div>
            </div>
        </div>
    </div>


    <%--查看学生档案的信息--%>
    <div id="search" style="display: none" >
        <div style="margin-top: 8px;margin-bottom: 8px;margin-left: 15px">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm" onclick="updateRecord()">修改</button>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="colse()">取消</button>
            <button type="button" class="layui-btn layui-btn-primary layui-border-red layui-btn-sm" onclick="deleteParents()">删除</button>
        </div>

        <div class="layui-tab layui-tab-card">


            <ul class="layui-tab-title">
                <li class="layui-this">基本信息</li>
                <li>用户管理</li>
            </ul>
            <div class="layui-tab-content" >
                <%--默认显示基本信息--%>
                <div class="layui-tab-item layui-show" id="cha">

                    <%--对基本信息的查看--%>
                    <form class="layui-form" lay-filter = "upForm" style="padding-left: 40px;margin-right: 40px">
                        <br>
                        <fieldset class="layui-elem-field"  >
                            <legend>基本信息</legend>
                            <p style="margin-left: 20px;margin-bottom: 20px"></p>
                            <div class="layui-row row1">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        学号：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentCode">
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        姓名：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentName" >
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
                                        所属班级:
                                    </label>
                                    <div class="layui-input-block">
                                        <select name="classroomId">
                                            <option value="" ></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row4">
                                <div class="layui-col-md5">
                                    <label class="layui-form-label">
                                        状态：
                                    </label>
                                    <div class="layui-input-block">
                                        <select name="statusId">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label class="layui-form-label" style="width: 130px">
                                        允许保育费退费：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="childReturn" value="1" title="是" checked>
                                        <input type="radio" name="childReturn" value="2" title=否>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row5">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label" style="width: 130px">
                                        允许伙食费退费：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="messReturn" value="1" title="是" checked>
                                        <input type="radio" name="messReturn" value="2" title=否>
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        招生顾问：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="adviserId" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row6">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label" >
                                        正式入园：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="enterDate" >
                                    </div>
                                </div>
                                <div class="layui-col-md5">
                                    <label class="layui-form-label">
                                        推荐人：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="recommender" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row7">
                                <div class="layui-col-md5">
                                    <label  class="layui-form-label">
                                        离园日期：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="leaveDate">
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <%--其他事项的查看--%>
                    <form class="layui-form" lay-filter ="upMatter" id="show">

                        <div class="layui-form" lay-filter="addMatter"  style="padding-left: 40px;margin-right: 40px;">
                            <fieldset class="layui-elem-field" >
                                <legend>其他事项</legend>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            是否独生：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="radio" name="isOnly" value="1" title="是" checked>
                                            <input type="radio" name="isOnly" value="0" title=否>
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            户籍类型：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" value="${householdType}" name="householdType">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            户籍所在：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" value="${householdLocation}" name="householdLocation">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            籍贯：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" value="${nativePlace}" name="nativePlace">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            家庭住址：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input"  value="${address}" name="address">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            证件号码：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" class="layui-input" value="${certificatesNumber}" name="certificatesNumber">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            健康状况：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${health}" class="layui-input" name="health">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            害怕事物：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${fearThings}" class="layui-input" name="fearThings">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            忌食：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${Avoid}" class="layui-input" name="Avoid">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            过敏：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${allergy}" class="layui-input" name="allergy">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row7">
                                    <div class="layui-col-md5">
                                        <label  class="layui-form-label">
                                            兴趣爱好：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${hobby}" class="layui-input" name="hobby">
                                        </div>
                                    </div>
                                    <div class="layui-col-md6">
                                        <label  class="layui-form-label">
                                            特殊照顾：
                                        </label>
                                        <div class="layui-input-block">
                                            <input type="text" value="${special}" class="layui-input" name="special">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row row8">
                                    <div class="layui-col-md11">
                                        <label  class="layui-form-label">
                                            说明：
                                        </label>
                                        <div class="layui-input-block">
                                            <textarea name="remark"  placeholder="请输入内容" class="layui-textarea"></textarea>
                                        </div>
                                    </div>

                                </div>
                            </fieldset>
                        </div>
                        <input type="hidden" class="xuehao" name="studentCode">
                    </form>
                </div>

                <%--监护人信息的显示--%>
                <div class="layui-tab-item" id="jianhu">



                    <form class="layui-form" lay-filter="upParents">
                        <div id="showJian" style="margin-right: 35px">

                            <input type="hidden" name="studentCode">
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        所属关系：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="relationName" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        姓名：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="studentName" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        手机号码：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="phone" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        证件类型：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="idType" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        证件号码：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="idCard" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        行业：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="business" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        学历：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="education" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        银行卡号：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="bankNo" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        工作单位：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="workUnit" style="height: 35px" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row row1">
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        Email：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="email" style="height: 35px">
                                    </div>
                                </div>
                                <div class="layui-col-md4">
                                    <label  class="layui-form-label">
                                        家庭住址：
                                    </label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" name="homeAddress" style="height: 35px" >
                                    </div>
                                </div>
                                <div class="layui-col-md4" style="padding-left:30px;padding-top:10px;height:40px">
                                    <input type="checkbox" name="isGetMessage" title="可接受短信" lay-skin="primary">
                                    <input type="checkbox" name="isEmergencyGuardian" title="紧急联系" lay-skin="primary" style="margin-right: 30px;">
                                </div>

                            </div>

                        </div>
                    </form>
                    <table id="showParentsTb "></table>
                </div>
            </div>
        </div>
    </div>
</div>





<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script>

    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    /*进页面查询*/
    layui.use(['laydate','table','form','jquery','element','laydate'], function(){
        let laydate = layui.laydate,
            form = layui.form,
            table = layui.table;

        //渲染日期
        laydate.render({
            elem:"[name*=Date]"
        })



        //监听申请变更表单
        form.on('submit(change)',function(){
            return false;
        })
        //监听申请变更表单头部btn
        table.on('toolbar(studentTb)',function(obj){
            let checkStatus = table.checkStatus(obj.config.id);
            let data = checkStatus.data;
            let event = obj.event;
            let stuIds = data.map(obj=>"stuIds="+obj.id).join('&');
            switch (event){
                case 'changeBtn':
                    if(data.length==0){
                        layer.msg("请选择变更的学生");
                    }else{
                        //获取变更伙食费、保育费的form
                        let changeParam = form.val('changeForm');
                        //学生id 可能是多个
                        let stuIds = data.map(d=>'stuIds='+d.id).join('&');
                        let param = $.param(changeParam);
                        param=param+"&"+stuIds;
                        //发送异步请求
                        alert(param)
                        $.post("generalCharge/eatCare/add",param)
                        .done((res)=>{
                            if(res.code!=3001){
                                table.reload('studentTb',{});
                                return layer.msg(res.msg,{icon:6})
                            }
                            layer.msg(res.msg,{icon:5})
                        })
                    }
                    break;
                    case 'rest':
                        $('.searchForm').get(0).reset();
                        break;
                        case 'pass':
                            if(data.length==0){
                                return layer.msg("请选择审批的学生");
                            }
                            $.post('generalCharge/eatCare/update',"state=2&"+stuIds)
                                .done((res)=>{
                                    if(res.code!=3001){
                                        table.reload('studentTb',{});
                                        return layer.msg(res.msg,{icon:6})

                                    }
                                    layer.msg(res.msg,{icon:5})
                                })
                            break;
                            case 'refuse':
                                if(data.length==0){
                                    return layer.msg("请选择审批的学生");
                                }
                                $.post('generalCharge/eatCare/update',"state=3&"+stuIds)
                                    .done((res)=>{
                                        if(res.code!=3001){
                                            table.reload('studentTb',{});
                                            return layer.msg(res.msg,{icon:6})
                                        }
                                        layer.msg(res.msg,{icon:5})
                                    })
                                break;
            }
        })

        form.verify({
            verifyDate:function(value,item){
                alert(value)
                if(value!=null){
                    let startDate = $("[name=startDate]").val();
                    let start = new Date(startDate);
                    let end = new Date(value);
                    if(start.getTime()-end.getTime()<0){
                        return '开始时间不能小于节时间'
                    }
                }else{
                    return false;
                }

            }
        })



        let element = layui.element;
        table.render({
            elem:'#studentTb',
            even:true,
            page:true,
            toolbar:'#toolbar',
            cellMinWidth:50,
            height:510,
            limit:20,
            id:'studentTb',
            limits: [20, 50, 100],
            url:'/generalCharge/normal/waitList',
            // size:'sm',
            text: {
                none: '暂无相关数据' //默认：无数据。
            },
            cols:[[
                {type:'checkbox',align: 'center',fixed: 'left'},
                {type:"numbers",align:'center',fixed:'left'},
                {field:'studentCode',width:100,title:'学号',align:"center"},
                {field:'studentName',width:100,title:'姓名',align:"center"},
                {field:"gender",width:100,title:"性别",align:"center",templet:function(data){
                        return data.gender==0?"男":"女"
                    }},
                {field:'brithday',title:'出生日期',align:"center",width:102},
                {field:"gradeName",width:90,title:'年级',align:"center"},
                {field:'className',width:120,title:'班级',align:"center"},
                {field:'enterDate',title:'入园时间',align:"center",width: 102},
                {field:'statusName',title:'状态',width:60,align:"center"},
                {field:'nowEat',width:100,title:'现保育费',align:"center"},
                {field:'nowCare',width:100,title:'现伙食费',align:"center"},
                {field:'oldEat',width:110,title:'保育费(变更)',align:"center"},
                {field:'oldCare',width:110,title:'伙食费(变更)',align:"center"},
                {field:'approvalEatCare',width:100,title:'变更状态',align:"center",templet:function(d){
                        if(d.approvalEatCare!=null){
                            let state = "";
                            switch (d.approvalEatCare.approvalState){
                                case 1:
                                    return state = '<span class="layui-font-orange">待审批</span>'
                                case 2:
                                    return '<span class="layui-font-orange">已审批</span>'
                                case 3:
                                    return '<span class="layui-font-orange">已驳回</span>'
                            }
                            return
                        }else{
                            return '';
                        }

                    }},
                {field:'record',width:100,title:'变更说明',align:"center",templet:function(d){
                        if(d.approvalEatCare!=null){
                            return d.approvalEatCare.approvalChangeRemark
                        }else{
                            return '';
                        }
                    }},
                {field:'userName',width:100,title:'申请人',align:"center"},
                {field:'applyDateTime',width:100,title:'申请时间',width: 102,align:"center",templet:function(d){
                        if(d.approvalEatCare!=null){
                            return d.approvalEatCare.applyDatetime
                        }else{2
                            return '';
                        }
                    }},
                {title:"操作",fixed:'right',width:100,align: "center",templet:"#action"}
            ]]
        });



        table.on('tool(studentTb)',obj=>{
            switch (obj.event){
                case 'edit':

                    update(obj.data);
                    break;


            }
        })
        /*对监护人信息进行查询*/
        table.render({
            elem:'#parentsTb',
            even:true,
            url:'/parents/search',
            cols:[[
                {field:'relationName',title:'所属关系',align:"center"},
                {field:'studentName',title:'姓名',align:"center"},
                {field:'phone',title:'手机号码',align:"center"},
                {field:'idCard',title:'证件号码',align:"center"},
                {field:'business',title:'行业',align:"center"},
                {field:'education',title:'学历',align:"center"},
                {field:'bankNo',title:'银行卡号',align:"center"},
                {field:'workUnit',title:'工作单位',align:"center"},
                {field:'email',title:'Email',align:"center"},
                {field:'homeAddress',title:'家庭住址',align:"center"},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
            ]]
        });
        var studentCode = $("#cha input[name=studentCode]").val();
        table.render({
            elem:'#showParentsTb',
            even:true,
            url:'/parents/search?studentCode='+studentCode,
            cols:[[
                {field:'relationName',title:'所属关系',align:"center"},
                {field:'studentName',title:'姓名',align:"center"},
                {field:'phone',title:'手机号码',align:"center"},
                {field:'idCard',title:'证件号码',align:"center"},
                {field:'business',title:'行业',align:"center"},
                {field:'education',title:'学历',align:"center"},
                {field:'bankNo',title:'银行卡号',align:"center"},
                {field:'workUnit',title:'工作单位',align:"center"},
                {field:'email',title:'Email',align:"center"},
                {field:'homeAddress',title:'家庭住址',align:"center"},
                {title:"操作",fixed:'right',align: "center",templet:"#rowTool"}
            ]]
        })

    });

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
        /*对年级进行查询并且对select进行渲染*/
        $.get('/sys/grade/list',{gardenId:gardenId})
            .done(result=>{
                for (let gradeId of result.data){
                    let opt = $("<option/>");
                    opt.html(gradeId.gradename);
                    opt.val(gradeId.id);
                    opt.appendTo("[name = gradeId]");
                }
                layui.form.render('select');
            });


        /*对班级进行查询并且对select进行渲染*/
        $.get('/sys/class/list',{gardenId:gardenId})
            .done(result=>{
                for (let classO of result.data){
                    let opt = $("<option/>");
                    opt.html(classO.classname);
                    opt.val(classO.id);
                    opt.appendTo("[name = classroomId]");
                }
                layui.form.render('select');
            });

        //渲染指定园所的保育费列表 1
        $.get("generalCharge/groove/list",{gardenId:gardenId,costCategory:1})
            .done(({data})=>{
                for(let eat of data){
                    let way = "";
                    if(eat.univalenceType==1){
                        way = '按学期'
                    }else if(eat.univalenceType==2){
                        way = '按月'
                    }else if(eat.univalenceType == 3){
                        way = '按天'
                    }

                    let option = $('<option>')
                    option.text(eat.grooveName+'('+way+"_单价:"+eat.univalence.toFixed(2)+"园");
                    option.val(eat.id);
                    option.appendTo('[name=oldCareId]');
                }
                layui.form.render()
            })
        //渲染指定园所的伙食费列表 2
        $.get("generalCharge/groove/list",{gardenId:gardenId,costCategory:2})
            .done(({data})=>{
                for(let eat of data){
                    let way = "";
                    if(eat.univalenceType==1){
                        way = '按学期'
                    }else if(eat.univalenceType==2){
                        way = '按月'
                    }else if(eat.univalenceType == 3){
                        way = '按天'
                    }

                    let option = $('<option>')
                    option.text(eat.grooveName+'('+way+"_单价:"+eat.univalence.toFixed(2)+"元");
                    option.val(eat.id);
                    option.appendTo('[name=oldEatId]');
                }
                layui.form.render()
            })


        //根据园所年级

    })


    /*对状态进行查询*/
    $.get('/sys/state/search')
        .done(result=>{
            for (let statusId of result.data){
                let opt = $("<option/>");
                opt.html(statusId.statusname);
                opt.val(statusId.id);
                opt.appendTo("[name = statusId]");
            }
            layui.form.render('select');
        });

    /*条件查询*/
    function search(){
        layui.use(["form","table"],function(){
            let where = layui.form.val('searchForm');
            layui.table.reload("studentTb",{where});
        })
    }


    /* 增加 */
    function add() {
        layui.use(function () {
            let layer = layui.layer;
            let $ = layui.jquery;
            /*  ("#add>form")[0].each(function (){
                  $(this).get(0).reset();
              })*/
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '添加用户',
                content: $("#add")
            });
        });
    }

    /*增加学生档案*/
    function addRecord(){
        layui.use(function (){
            let layer = layui.layer;
            //获取学生档案表的数据
            let record = layui.form.val('addForm');
            console.log(record);
            //获取班级和年纪的id
            let gradeId = record.classroomId.split(',');
            record.classroomId=gradeId[1];
            record.gradeId=gradeId[0]
            var studentCode = $("input[name=studentCode]").val();
            $(".xuehao").val(studentCode);
            var studentCodea = $("input[name=xuehao]").val();
            /*获取注意事项的数据*/
            let matter = layui.form.val('addMatter');

            console.log(matter.householdType+"事项的信息----");
            /*获取监护人的数据*/
            let parents = layui.form.val('addParents');

            parents.studentCode=studentCode;
            console.log(parents.studentCode+"监护人的数据是-----")
            /*对事项的增加*/
            $.post('/matter/matter/insert',matter)
                .done(({msg})=>{
                    console.log(msg+"事项");
                });
            /*对监护人的增加*/
            $.post('/parents/parents/add',parents)
                .done(({msg})=>{
                    console.log(msg+"监护人");
                });
            $.post('/record/record/add',record)
                .done(({msg})=>{
                    layer.close(layer.index);
                    layui.table.reload('studentTb');
                    layer.msg(msg);
                });
        })

    }

    /*关闭add*/
    function colse(){
        $("#add").hide();
        $("#search").hide();
        layui.use(function (){
            let layer = layui.layer;
            layer.closeAll();
        })

    }
    /*增加监护人信息*/
    /* function parentsAdd(){
         layui.use(function (){
             let parents = layui.form.val('addParents');
             var studentCode = $("input[name=studentCode]").val();
             var  duanxin =  $('input[name=isGetMessage]').is(':checked');
             var  jianhu =  $('input[name=isEmergencyGuardian]').is(':checked');
             if(jianhu==true){
                 var isEmergencyGuardian = 1;

             }else if(jianhu==false){
                 var isEmergencyGuardian = 2;
             }
             if(duanxin==true){
                 var isGetMessage = 1 ;
             }else if(duanxin==false){
                 var isGetMessage = 2
             }
             parents.isGetMessage = isGetMessage;
             parents.studentCode = studentCode;
             parents.isEmergencyGuardian = isEmergencyGuardian;
             $.get('/parents/add',parents)
                 .done(({msg})=>{
                     layui.table.reload('parentsTb');
                     layer.msg(msg);
                 });
         })
     }*/

    /*删除学生档案信息*/
    function deleteParents(){
        var studentCode = $("#search input[name=studentCode]").val();
        console.log(studentCode);
        layer.confirm("确定要删除吗?",function (){
            /*删除监护人信息*/
            $.get("/parents/parents/delete?studentCode="+studentCode)
                .done(({msg})=>{
                    layui.table.reload('studentTb');
                });
            /*删除学生注意事项*/
            $.get("/matter/matter/delete?studentCode="+studentCode)
                .done(({msg})=>{
                    layui.table.reload('studentTb');
                });

            /*删除学生档案*/
            $.get("/record/delete/deleteRecord?studentCode="+studentCode)
                .done(({msg})=>{
                    layer.close(layer.index);
                    layui.table.reload('studentTb');
                    layer.msg(msg);
                    $("#add").hide();
                    $("#search").hide();
                });
        });



    }

    /*查看信息 */
    function update(data) {
        layui.use(function () {
            let layer = layui.layer;
            let $ = layui.jquery;
            /*根据学号查看学生注意事项信息*/
            $.get('/matter/matterSearch?studentCode='+data.studentCode)
                .done(({data})=>{
                    $("#show input[name=householdType]").val(data.householdType);
                    $("#show input[name=householdLocation]").val(data.householdLocation);
                    $("#show input[name=birthLocation]").val(data.birthLocation);
                    $("#show input[name=nativePlace]").val(data.nativePlace);
                    $("#show input[name=address]").val(data.address);
                    $("#show input[name=health]").val(data.health);
                    $("#show input[name=fearThings]").val(data.fearThings);
                    $("#show input[name=avoid]").val(data.avoid);
                    $("#show input[name=allergy]").val(data.allergy);
                    $("#show input[name=hobby]").val(data.hobby);
                    $("#show input[name=special]").val(data.special);
                    $("#show input[name=remarks]").val(data.remarks);
                })
            /*根据学号查看监护人的信息*/
            $.get('/parents/search?studentCode='+data.studentCode)
                .done(({data})=>{
                    $("#jianhu input[name=relationName]").val(data.relationName);
                    $("#jianhu input[name=phone]").val(data.phone);
                    $("#jianhu input[name=idType]").val(data.idType);
                    $("#jianhu input[name=idCard]").val(data.idCard);
                    $("#jianhu input[name=business]").val(data.business);
                    $("#jianhu input[name=education]").val(data.education);
                    $("#jianhu input[name=bankNo]").val(data.bankNo);
                    $("#jianhu input[name=workUnit]").val(data.workUnit);
                    $("#jianhu input[name=email]").val(data.email);
                    $("#jianhu input[name=homeAddress]").val(data.homeAddress);
                    $("#jianhu input[name=isgetmessage]").val(data.isgetmessage);
                    $("#jianhu input[name=isemergencyGuardian]").val(data.isemergencyGuardian);
                    layui.table.reload('showParentsTb');
                });
            layui.form.val('upForm',data);
            console.log(data.studentCode)
            layer.open({
                type: 1,
                area:['900px','600px'],
                title: '查看用户',
                content: $("#search"),
                end:function(){
                    $('#search').css('display','none')
                }

            });

        });
    }

    /*修改信息*/
    function updateRecord(){
        layui.use(function (){
            let layer = layui.layer;
            //获取学生档案表的数据
            let record = layui.form.val('upForm');
            console.log(record);
            //获取班级和年纪的id
            let gradeId = record.classroomId.split(',');
            record.classroomId=gradeId[1];
            record.gradeId=gradeId[0]
            var studentCode = $("#cha input[name=studentCode]").val();
            $(".xuehao").val(studentCode);
            var studentCodea = $("input[name=xuehao]").val();
            /*获取注意事项的数据*/
            let matter = layui.form.val('upMatter');
            console.log(studentCode+"学号这是")
            console.log(matter.householdType+"事项的信息----");
            /*获取监护人的数据*/
            let parents = layui.form.val('upParents');
            parents.studentCode=studentCode;
            matter.studentCode=studentCode;
            console.log(parents.studentCode+"监护人的数据是-----")
            /*对事项修改*/
            $.post('/matter/matter/update',matter)
                .done(({msg})=>{
                    console.log(msg+"事项");
                });
            /*对监护人进行修改*/
            $.post('/parents/parents/update',parents)
                .done(({msg})=>{
                    layui.table.reload('showParentsTb');
                    console.log(msg+"监护人");
                });
            /*对档案进行修改*/
            $.post('/record/record/update',record)
                .done(({msg})=>{
                    layer.close(layer.index);
                    layui.table.reload('studentTb');
                    layer.msg(msg);
                });
        })
    }




</script>
</body>
</html>
