<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-15
  Time: 下午 17:44
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
    <title>设定规则</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        [name=remark]{
            resize:none;
        }
        .row4 .layui-form-label,.extension{
            margin-left: -13px;
            width: 112px;
            padding:0px;
        }
        .selectNone{
            user-select: none;
            border:none;
        }
        .label{
            width: 150px;
            margin-left:-63px;
        }
        .erWidth{
            width: 40px;
        }
    </style>
</head>
<body>
<div class="layui-container" >
    <form class="layui-form" lay-filter="addForm" style="margin-top:10px;">
        <input type="hidden" name="gardenId">
        <fieldset class="layui-elem-field">
            <legend>
                <h3 class="layui-field-title">基本信息</h3>
            </legend>
            <div class="layui-field-box">
                <div class="layui-row row1">
                    <div class="layui-col-sm6">
                        <label for="" class="layui-form-label">园所编码<i class="layui-font-red">*</i>：</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input selectNone" name="gardenCode" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-col-sm6">
                        <label for="" class="layui-form-label">园所名称<i class="layui-font-red">*</i>：</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input selectNone" name="gardenName" lay-verify="required">
                        </div>
                    </div>
                </div>
                <div class="layui-row row4">
                    <div class="layui-form-item">
                        <label for="" class="layui-form-label" >收/退款单号后缀&<br>幼儿学号前缀<i class="layui-font-red">*</i>：</label>
                        <div class="layui-input-block">
                            <input type="text" name="prefixSuffix" class="layui-input selectNone"  lay-verify="required">
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>
                <h3 class="layui-field-title">保育费相关设定</h3>
            </legend>
            <div class="layui-field-box">
                <div class="layui-row row1">
                    <div class="layui-col-md12" style="margin-bottom: 20px">
                        <label for="" class="layui-form-label label">保育费退费规则：</label>
                        <div class="layui-input-block" >
                            <div class="layui-inline" >
                                <div class="layui-col-md12" >
                                    当本月出勤天数小于等于
                                   <div style="display: inline-block">
                                       <input type="number" min="0" name='attendanceDays' lay-verify="required|number"  class="layui-input-block" style="margin-left:0px;width: 40px;" lay-verify="required">
                                   </div>
                                    <div class="layui-inline" style="width: 57px" >
                                        <select name="lessUnit"  class="layui-select erWidth" lay-filter="attendanceDays">
                                            <option value="1">天</option>
                                            <option value="2">%</option>
                                        </select>
                                    </div>
                                    时，按
                                    <div class="layui-inline" style="width: 140px" >
                                        <select name="lessChoice" lay-filter="lessChoice" class="layui-select erWidth">
                                            <option value="1">按缺勤天数退还</option>
                                            <option value="2">按百分比退还</option> <%--选中这个 显示退还百分比--%>
                                            <option value="3">按出勤天数收取</option>
                                        </select>
                                    </div>
                                    <div style="display: inline-block" class="returnUnit layui-hide">
                                        <input type="number" min="0" name='lessChoiceReturnRate' class="layui-input-block" style="margin-left:0px;text-align:center;width: 40px;" >
                                        %
                                    </div>
                                    费用
                                </div>
                                <div class="layui-col-md4" style="margin-top:25px">当本月出勤天数大于
                                    <input type="text" class="layui-input-block" style="margin-left:0px;width: 30px;text-align: center" disabled value="天" id="greater"> 时，将不退还费用
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="layui-row">
                    <div class="layui-col-sm6">
                        <label for="" class="layui-form-label label">月出勤天数取值：</label>
                        <div class="layui-input-inline">
                            <select name="attendanceRule" class="layui-select">
                                <option value="1">按每月实际应出勤天数收费</option>
                                <option value="2">按每月固定22天收费</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>
                <h3 class="layui-field-title">伙食费相关设定</h3>
            </legend>
            <div class="layui-field-box">
                <div class="layui-row row1">
                    <div class="layui-col-sm6">
                        <label for="" class="layui-form-label label">伙食费收费规则：</label>
                        <div class="layui-input-inline">
                            <select name="eatMoneyRule" class="layui-select">
                                <option value="1">按每月实际应出勤天数收费</option>
                                <option value="2">按每月固定22天收费</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
        </fieldset>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" lay-submit lay-filter="save" class="layui-btn ">保存</button>
                <button type="submit" lay-submit lay-filter="saveAndClose" class="layui-btn ">保存并关闭</button>
                <button type="button" lay-event="close" class="layui-btn"> 关闭</button>
            </div>
        </div>
    </form>

</div>
<script src="statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="webjars/jquery/3.1.1/jquery.js"></script>
<script>
    layui.use(['form','table','jquery','util','layer'],function (){
        let form = layui.form,
            table = layui.table,
            $ = layui.jquery,
            util = layui.util,
            layer = layui.layer;

        setTimeout(function (){
            //获取园所id 赋值它的规则 如果有的话
            let gardenId = $('[name=gardenId]').val();
            console.log(gardenId)
            $.get("base/rule/find",{gardenId:gardenId})
            .done((res)=>{
                let data = res.data;
                if(res.code!=3001){
                    //回显页面
                    //天数
                    $("[name=attendanceDays]").val(data.attendanceDays);
                    //单位下拉赋值
                    $("[name=lessUnit]").val(data.lessUnit);
                    //小于天数的单位
                    let lessUnit = data.lessUnit==1?'天':'%';
                    //大于的天数
                    $("#greater").val(data.attendanceDays+lessUnit);
                    //小于某值时的下拉赋值
                    $("[name=lessChoiceReturnRate]").val(data.lessChoiceReturnRate);
                    //是否选择了第二个小于的下拉值
                    if(data.lessChoiceReturnRate==2){
                        //显示
                        $(".returnUnit").removeClass("layui-hide")
                        //添加required属性
                        $(".returnUnit input").attr('lay-verify','required');
                    }
                    //出勤天数取值
                    $("[name=attendanceRule]").val(data.attendanceRule)
                    //伙食收费规则取值
                    $("[name=eatMoneyRule]").val(data.eatMoneyRule);
                    form.render();
                }else{
                    layer.msg('参数错误',{icon:5})
                }
            })
        },10)


        $("[name=attendanceDays]").on('input propertychange',function (){
            let attendDays = $(this).val();
            let unit = $('[name=lessUnit] option:selected').text();
            $("#greater").val(attendDays+unit);
        })
        form.on('select(attendanceDays)',function (){
            let attendDays = $('[name=attendanceDays]').val();
            let unit = $('[name=lessUnit] option:selected').text();
            $("#greater").val(attendDays+unit);
        })
        form.on('select(lessChoice)',function (data){
            if(data.value==2){
                //显示
                $(".returnUnit").removeClass("layui-hide")
                //添加required属性
                $(".returnUnit input").attr('lay-verify','required');
            }else{
                //隐藏
                $(".returnUnit").addClass("layui-hide")
                //移除required属性
                $(".returnUnit input").removeAttr('lay-verify');
            }

        })
        //保存到收退费规则表


        //查询指定园所的收退费规则表



        //监听lay-event事件
        util.event('lay-event',{
            'close':function (othis){
                let parentIndex = parent.layer.getFrameIndex(window.name);
                parent.layer.close(parentIndex)
            }
        })

        //保存事件
        form.on('submit(save)',function (){
            let param = form.val('addForm');
            $.post('/base/rule/add',param)
                .done((result)=>{
                    if(result.code!=3001){
                        layer.msg(result.msg)
                    }else{
                        layer.msg(result.msg)
                    }
                })
            return false;
        })
        //保存并关闭事件
        form.on('submit(saveAndClose)',function (){
            let param = form.val('addForm');
            $.post('/base/rule/add',param)
                .done((result)=>{
                    if(result.code!=3001){
                        layer.msg(result.msg,{time:1000},function (){
                            let parentIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(parentIndex)
                        })
                    }else{
                        layer.msg(result.msg)
                    }
                })
            return false;
        })
    })


</script>
</body>
</html>
