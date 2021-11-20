<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021-10-21
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="/statics/lib/2.6.8/css/layui.css">
    <title>Title</title>
</head>
<body >


    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>调班</legend>
    </fieldset>
<form class="layui-form">


        <div >
            <button type="button" onclick="gai()" class="layui-btn layui-btn-primary layui-btn-sm"  style="margin-left: 25px;position:relative;top: 60px;left: 850px;top: 200px; ">》》</button>
        </div>



    <div class="layui-row row2" style="margin-left:200px">
        <div class="layui-card layui-col-md5" style="width: 600px;margin-left:40px; ">
            <div class="layui-card-header" style="height: 80px;padding-top: 10px">
                <label  class="layui-form-label">
                    调出班级:
                </label>

                <div class="layui-input-block" id="chua">
                    <select name="classroomId" id="chu"  lay-filter="chu">
                        <option value="" ></option>
                    </select>

                </div>
                <p style="margin-top: 20px;margin-left: 420px; width: 150px;">
                    <input type="checkbox" lay-skin="primary" title="全选" id="quanxuan" name="quanxuan" style="margin-top: 30px;">
<%--
                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="aaaa()"  id="queren" style="margin-top: -65px; ">确认</button>
               --%> </p>

            </div>

            <div class="layui-card-body" style="height: 300px" >
                <div id="chuXinXi">

                </div>
            </div>
        </div>
        <div class="layui-card layui-col-md5" style="width: 600px;margin-left:90px; ">
            <div class="layui-card-header" style="height: 80px;padding-top: 10px">
                <label  class="layui-form-label">
                    调入班级:
                </label>
                <div class="layui-input-block">
                    <select name="classroomId" id="ru"  lay-filter="ru">
                        <option value=""></option>
                    </select>
                </div>

              <%--  <p style="margin-top: 20px;">
                    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="ruaa()"  id="ruqueren" style="margin-top: -5px;margin-left: 525px;">确认</button>
                </p>--%>
            </div>
            <div class="layui-card-body" style="height: 300px;">
                <div id="ruXinXi">

                </div>
            </div>
        </div>
    </div>


</form>
    <form lay-filter="upform">
        <input type="hidden" name="quid">
        <input type="hidden" name="qubanji">
        <input type="hidden" name="nianji">
    </form>

</body>
<script src="/statics/lib/2.6.8/layui.js" charset="utf-8"></script>
<script src="/webjars/jquery/3.1.1/jquery.js"></script>
<script>

/*    $("#quanxuan").click( function(){
        var qx = document.getElementById("quanxuan");
        var inputs = document.getElementsByName("chu");
        if(qx.checked){
            for(var i in inputs){
                inputs[i].checked=true;
            }
        }else{
            for(var i in inputs){
                inputs[i].checked=false;
            }
        }
    });
    */



        /*var ha = $("#quanxuan").prop('checked');
        if (ha==false){
            $("input [name=chu]").each(function (){
                $(this).attr("checked",'true');
            })
        }*/

   /* $("#quanxuan").click( function(){
        alert("选啊");
        $("input[name=chu]").each(function (){
            $(this).attr('check',true);
        })
    });*/
function gai(){
    let ru = $('#ru').val();
    let gradeIda = ru.split(',');
    var classroomId=gradeIda[1];
    var gradeId=gradeIda[0];
    var shu=[];

    $('input[name="chu"]:checked').each(function(){
        shu.push($(this).val());
    });


    if(shu.length==0){
        alert("你还没有选择任何内容");
        return;
    }
    let studentCode={};
    studentCode.classroomId=classroomId;
    studentCode.gradeId=gradeId;
    studentCode.id=shu;


    $.ajax({
        url:"/base/record/lotUpdate",
        type:"post",
        data:JSON.stringify(studentCode),
        contentType:"application/json;charset=UTF-8"
    }).done(({msg})=>{

        tiaochu();
        tiaoru();
    })

}
        layui.use(function () {
            let $ = layui.jquery;
            $.get('/sys/class/batchList')
                .done(result => {
                    console.log(result);
                    for (let classO of result.data) {
                        let opt = $("<option/>");
                        opt.html(classO.classname);
                        classO.id = classO.gradeid + ',' + classO.id
                        opt.val(classO.id);
                        opt.appendTo("[name = classroomId]");
                    }
                    layui.form.render('select');
                });
            layui.form.on('select(chu)',function(data){
                let outa = $('#chu').val();
                let gradeId = outa.split(',');
                let classroomId = gradeId[1];
                $(".aoa").remove()
                $.get('/base/record/termSearch?classroomId='+classroomId)

                    .done(result => {
                        console.log(result);
                        for (let record of result.data) {
                            $(`
                            <p style="height: 40px;" class="aoa">
                                <input type='checkbox' lay-skin="primary" value='\${record.id}' name="chu"  title='\${record.studentName}'>
                            </p>
                            `).appendTo($("#chuXinXi"));
                        }
                        layui.form.render();
                        console.log($("#chuXinXi"))
                    });
             /*   console.log(data.value); //得到被选中的值*/

            });

            layui.form.on('select(ru)',function(data){
                let outa = $('#ru').val();
                let outchu = $('#chu').val();
                let gradeId = outa.split(',');
                let classroomId = gradeId[1];
                if (outa!=outchu){
                    $(".raoa").remove()
                    $.get('/base/record/termSearch?classroomId='+classroomId)
                        .done(result => {
                            console.log(result);
                            for (let record of result.data) {
                                $(`
                            <p style="height: 40px;" class="raoa">
                                <input type='checkbox' lay-skin="primary" value='\${record.id}' name="ru"  title='\${record.studentName}'>
                            </p>
                            `).appendTo($("#ruXinXi"));
                            }
                            layui.form.render();
                            console.log($("#ruXinXi"))
                        });
                }else{
                    alert("调出班级和调入班级不能相同");
                }
                /*   console.log(data.value); //得到被选中的值*/

            });

        });

/*  $("#queren").click(function (){
      let outa = $('#chu').val();
      let gradeId = outa.split(',');
      let classroomId = gradeId[1];
      $.ajax({
          url:"/base/record/termSearch",
          type:"get",
          data:{classroomId:classroomId},
          success:function (result){
              console.log(result);
              for (let record of result.data){
                  console.log( record.studentName);
                  let check =$("<input type='checkbox' title='"+record.studentName+"'>");
                  let p = $("<p/>")
                  p.append(check);
                  console.log(p)
                  $("#chuXinXi").appendTo(p);
              }
          }
      })


  })*/




/*查询调出班级的学生*/
        function tiaochu(){


            layui.use(function (){
                let $ = layui.jquery;
                let outa = $('#chu').val();
                let gradeId = outa.split(',');
                let classroomId = gradeId[1];
            $(".aoa").remove()
            $.get('/base/record/termSearch?classroomId='+classroomId)

                    .done(result => {
                        console.log(result);
                        for (let record of result.data) {
                            $(`
                            <p style="height: 40px;" class="aoa">
                                <input type='checkbox' lay-skin="primary" value='\${record.id}' name="chu"  title='\${record.studentName}'>
                            </p>
                            `).appendTo($("#chuXinXi"));
                        }
                        layui.form.render();
                        console.log($("#chuXinXi"))
            });
            })
        };

        /*查询调入班级*/
     function tiaoru(){
         layui.use(function (){

             let $ = layui.jquery;
            let outa = $('#ru').val();
            let outchu = $('#chu').val();
            let gradeId = outa.split(',');
            let classroomId = gradeId[1];
            if (outa!=outchu){
            $(".raoa").remove()
            $.get('/base/record/termSearch?classroomId='+classroomId)
                .done(result => {
                    console.log(result);
                    for (let record of result.data) {
                        $(`
                            <p style="height: 40px;" class="raoa">
                                <input type='checkbox' lay-skin="primary" value='\${record.id}' name="ru"  title='\${record.studentName}'>
                            </p>
                            `).appendTo($("#ruXinXi"));
                    }
                    layui.form.render();
                    console.log($("#ruXinXi"))
                });
            }else{
                alert("调出班级和调入班级不能相同");
            }
         })
        };

        /*确认修改*/

</script>
</html>
