<%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-16
  Time: 上午 6:56
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
    <title>添加</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="statics/lib/2.6.8/css/layui.css">
    <style>
        .layui-row{
            margin-bottom: 10px;
        }
        [name=remark]{
            resize:none;
        }
        .row4 .layui-form-label{
            margin-left: -32px;
            width: 112px;
            padding:0px;
        }
    </style>
</head>
<body>
    <div class="layui-container" >
        <form class="layui-form" lay-filter="addForm" style="margin-top:10px;">
            <input type="hidden" name="gardenId">
            <input type="hidden" name="id">
            <div class="layui-row row1">
                <div class="layui-col-sm6">
                    <label for="" class="layui-form-label">费项名称<i class="layui-font-red">*</i>：</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="grooveName" lay-verify="required">
                    </div>
                </div>
                <div class="layui-col-sm6">
                    <label for="" class="layui-form-label">所属类目<i class="layui-font-red">*</i>：</label>
                    <div class="layui-input-inline">
                        <select name="costCategory" >

                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-row row2">
                <div class="layui-col-sm6">
                    <label for="" class="layui-form-label">费项类型：</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="costType" lay-filter="costType" title="保育费" value="1">
                        <input type="radio" name="costType" lay-filter="costType" title="伙食费" value="2">
                        <input type="radio" name="costType" lay-filter="costType" title="其他费项" value="3" checked>
                    </div>
                </div>
                <div class="layui-col-sm6">
                    <label for="" class="layui-form-label">收费方式：</label>
                    <div class="layui-input-inline">
                        <select name="univalenceType" lay-filter="univalenceType" class="layui-select">
                            <option value="1">按学期</option>
                            <option value="2" selected>按月</option>
                            <option value="3">按天</option>
                        </select>
                    </div>
                </div>

            </div>
            <div class="layui-row row2" >
                <div class="layui-col-sm6">
                    <label for="" class="layui-form-label ">收费单价<i class="layui-font-red">*</i>：</label>
                    <div class="layui-input-inline">
                        <input type="number"  min="0" class="layui-input" name="univalence">
                    </div>
                    元/每
                    <span class="unit">月</span>
                </div>
                <div class="layui-col-sm6 returnFee layui-hide">
                    <label for="" class="layui-form-label " style="width:200px;margin-left:-120px;">退费时的收费单价：</label>
                    <div class="layui-input-inline">
                        <input type="number" min="0" class="layui-input" name="refund">
                    </div>
                    元/每天
                </div>
                <div class="layui-col-sm6 getFee layui-hide">
                    <label for="" class="layui-form-label ">退费单价：</label>
                    <div class="layui-input-inline">
                        <input type="number" min="0" class="layui-input" name="refund">
                    </div>
                    元/每天
                </div>

            </div>
            <div class="layui-row row3 twoFee layui-hide">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">缴费类别：</label>
                    <div class="layui-input-inline">
                        <select name="payType" class="layui-select">
                            <option value="1" checked>预付费</option>
                            <option value="2">后付费（以【本月考勤】收本月保育费/伙食费）</option>
                            <option value="3">后付费（以【上月考勤】收本月保育费/伙食费）</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-row row3 oneFee">
                <div class="layui-col-md6">
                    <label for="" class="layui-form-label">缴费类别：</label>
                    <div class="layui-input-inline">
                        <input type="text" value="预付费" class="layui-input" >
                        <input type="hidden" name="payType" value="1">
                    </div>
                </div>
            </div>
            <div class="layui-row row">
                <div class="layui-form-item">
                    <label for="" class="layui-form-label" >费项说明：</label>
                    <div class="layui-input-block">
                        <textarea type="text" name="costRemark" class="layui-textarea" ></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-row row">
                <div class="layui-form-item">
                    <label for="" class="layui-form-label" ></label>
                    <div class="layui-input-block">
                        <input type="checkbox" class="checkBox" name="alone" title="收/退款时单独打印此费项">
                        <input type="checkbox" class="checkBox" name="absence" title="是否整月缺勤时才会自动生成该费项">
                    </div>
                </div>
            </div>
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
    <script>
        layui.use(['form','table','jquery','util','layer'],function (){
            let form = layui.form,
                table = layui.table,
                $ = layui.jquery,
                util = layui.util,
                layer = layui.layer;

            /**
             * 预付费显示 下拉隐藏
             */
            function prepaymentShowSelectHide(){
                //只有预付费显示
                $(".oneFee").removeClass('layui-hide');
                //显示缴费类别下拉隐藏
                $(".twoFee").addClass("layui-hide");
            }

            /**
             * 下拉显 预付费隐藏
             */
            function selectShowPrepaymentHide(){
                //只有预付费隐藏
                $(".oneFee").addClass('layui-hide');
                //显示缴费类别下拉显示
                $(".twoFee").removeClass("layui-hide");
            }

            /**
             * 退费时收费单价 显示 退费单价隐藏
             */
            function willReturnShowReturnHide(){
                //退费收费显示
                $(".returnFee").removeClass("layui-hide");
                //退费单价隐藏
                $(".getFee").addClass("layui-hide");
            }

            function returnShowWillReturnHide(){
                //退费收费隐藏
                $(".returnFee").addClass("layui-hide");
                //退费单价显示
                $(".getFee").removeClass("layui-hide");
            }


            //监听费项类型下拉改变事件
            form.on('radio(costType)',function(data){
                let feeType = data.value;
                let type = $("[name='univalenceType'] option:checked").val();
                //伙食费才可按天收取
                if(feeType != 2 && type == 3){
                    $("[name=univalenceType]").val(2);
                    form.render();
                    //是其他费用 收费方式 按月
                    let feeType2 = $("[name='costType']:checked").val();
                    let type2 = $("[name=univalenceType] option:checked").val();
                    if(feeType2 ==3 && type2 == 2){

                        prepaymentShowSelectHide()
                        $('.unit').text('月');
                        $(".checkBox").removeAttr("disabled");
                        form.render()
                    }



                    return layer.msg("对不起，只有【伙食费】允许按天收费！")
                }
                //保育费分支 按月
                if(feeType == 1 && type==2){
                    // //只有预付费隐藏
                    // $(".oneFee").addClass('layui-hide');
                    // //显示缴费类别下拉显示
                    // $(".twoFee").removeClass("layui-hide");
                    selectShowPrepaymentHide()

                    // //退费收费显示
                    // $(".returnFee").removeClass("layui-hide");
                    // //退费单价隐藏
                    // $(".getFee").addClass("layui-hide");
                    willReturnShowReturnHide();
                }else{
                    // //只有预付费显示
                    // $(".oneFee").removeClass('layui-hide');
                    // //显示缴费类别下拉隐藏
                    // $(".twoFee").addClass("layui-hide");
                    prepaymentShowSelectHide();
                    // //退费收费隐藏
                    // $(".returnFee").addClass("layui-hide");
                    // //退费单价显示
                    // $(".getFee").removeClass("layui-hide");
                    returnShowWillReturnHide()
                }
                if(feeType == 1){
                    willReturnShowReturnHide();
                }

                //其他费项
                if(feeType == 3){
                    //下面两个checkbox启用
                    $(".checkBox").removeAttr("disabled")
                    //退费收费单价隐藏
                    $(".returnFee,.getFee").addClass("layui-hide");

                }else{
                    //下面两个checkbox取消选中
                    $(".checkBox").prop('checked',false)

                    //下面两个checkbox禁用
                    $(".checkBox").attr("disabled","disabled");
                }





                form.render()

            })

            //监听收费方式下拉改变事件
            form.on('select(univalenceType)',function(data){

                //收费方式下拉列表值
                let type = data.value;
                //收费方式下拉列表单位字符串
                let typeStr = "";
                //获取单选按钮的取值
                let feeType = $("[name='costType']:checked").val();
                //伙食费才可按天收取
                if(feeType != 2 && type == 3){
                    $("[name=univalenceType]").val(2);
                    form.render();
                    let erFeeType = $("[name='costType']:checked").val();
                    let  erType = $('[name=univalenceType]').val();
                    if(erType == 2&&erFeeType==1){
                        $('.unit').text('月');
                        selectShowPrepaymentHide();
                    }
                    if(erType == 2 && erFeeType==3){
                        $('.unit').text('月')
                    }


                    return layer.msg("对不起，只有【伙食费】允许按天收费！")
                }


                //保育费
                if(feeType==1 && type== 1){
                    // //只有预付费显示
                    // $(".oneFee").removeClass('layui-hide');
                    // //显示缴费类别下拉隐藏
                    // $(".twoFee").addClass("layui-hide");
                    prepaymentShowSelectHide();
                }else{
                    // //只有预付费隐藏
                    // $(".oneFee").addClass('layui-hide');
                    // //显示缴费类别下拉显示
                    // $(".twoFee").removeClass("layui-hide");
                    selectShowPrepaymentHide();
                }

                //是伙食费 收费方式天
                if(feeType==2 && type == 3){
                    // //只有预付费隐藏
                    // $(".oneFee").addClass('layui-hide');
                    // //显示缴费类别下拉显示
                    // $(".twoFee").removeClass("layui-hide");
                    selectShowPrepaymentHide();
                }else{
                    // //只有预付费显示
                    // $(".oneFee").removeClass('layui-hide');
                    // //显示缴费类别下拉隐藏
                    // $(".twoFee").addClass("layui-hide");
                    prepaymentShowSelectHide();
                }
                //伙食费项 并且收费方式 不是天
                if(feeType == 2 && type!=3){
                    // //只有预付费显示
                    // $(".oneFee").removeClass('layui-hide');
                    // //显示缴费类别下拉隐藏
                    // $(".twoFee").addClass("layui-hide");
                    prepaymentShowSelectHide();
                }


                //其他费项 并且收费方式 不是天 也不能是天 缴费类别下拉隐藏
                if(feeType == 3 && type!=3){
                    // //只有预付费显示
                    // $(".oneFee").removeClass('layui-hide');
                    // //显示缴费类别下拉隐藏
                    // $(".twoFee").addClass("layui-hide");
                    prepaymentShowSelectHide()
                }

                //伙食费 收费方式 按月
                if(feeType == 1 && type == 2){
                    // //只有预付费隐藏
                    // $(".oneFee").addClass('layui-hide');
                    // //显示缴费类别下拉显示
                    // $(".twoFee").removeClass("layui-hide");
                    selectShowPrepaymentHide();
                }



                switch (type){
                       case '1':
                        typeStr = "学期";
                        break
                        case '2':
                            typeStr = "月";
                            break;
                            case '3':
                                typeStr = "天";
                                break;
                }
                //赋值单位
                $('.unit').text(typeStr)
            })

            //渲染费用类目列表
            function loadCategoryList() {
                $.get("common/cost/Category")
                    .done(({data}) => {
                        for (let category of data) {
                            let option = $("<option>")
                            option.text(category.costname)
                            option.val(category.id)
                            option.appendTo('[name=costCategory]');
                        }
                        form.render();
                    })
            }
            loadCategoryList();

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
                console.log(param)
                let alone = $("[name=alone]").prop('checked');
                let absence = $("[name=absence]").prop('checked');

                param.alone=alone?1:0;
                param.absence=absence?1:0;
                console.log(param)
                $.post('/generalCharge/assert/add',param)
                .done((result)=>{
                    layer.msg(result.msg)
                })
                return false;
            })
            //保存并关闭事件
            form.on('submit(saveAndClose)',function (){
                let param = form.val('addForm');
                let alone = $("[name=alone]").prop('checked');
                let absence = $("[name=absence]").prop('checked');

                param.alone=alone?1:0;
                param.absence=absence?1:0;
                console.log(param)
                $.post('/generalCharge/assert/add',param)
                    .done((result)=>{
                        if(result.code!=3001){
                            layer.msg(result.msg,{time:1000},function (){
                                let parentIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(parentIndex)
                            })
                        }else{
                            layer.msg(result.msg,{time:1000})
                        }

                    })
                return false;
            })


        })
    </script>
</body>
</html>
