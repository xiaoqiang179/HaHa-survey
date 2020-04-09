<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/15
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Home</title>
    <base href="${pageContext.request.contextPath}/">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="css/vendor.css">
    <link rel="stylesheet" type="text/css" href="css/flat-admin.css">
    <link rel="icon" sizes="any" href="img/webicon.png">
    <!-- Theme -->
    <link rel="stylesheet" type="text/css" href="css/theme/blue-sky.css">
    <link rel="stylesheet" type="text/css" href="css/theme/blue.css">
    <link rel="stylesheet" type="text/css" href="css/theme/red.css">
    <link rel="stylesheet" type="text/css" href="css/theme/yellow.css">
    <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">增加题集</h4>
            </div>
            <div class="modal-body">
                <form id="addbatchform">
                    <input type="text" class="form-control" id="inbatchname" placeholder="题集名称">
                    <input type="text" class="form-control" id="indesp" placeholder="题集描述">
                    <span id="wann" style="color: red"></span>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-success" id="savebtn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addsinglemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">增加题集</h4>
            </div>
            <div class="modal-body">
                <form id="addsingleform">
                    <input type="text" class="form-control" id="singledesp" placeholder="题集描述">
                    <input type="text" class="form-control" id="atext" placeholder="A文本">
                    <input type="text" class="form-control" id="btext" placeholder="B文本">
                    <input type="text" class="form-control" id="ctext" placeholder="C文本">
                    <input type="text" class="form-control" id="dtext" placeholder="D文本">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-success" id="savesinglebtn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addsubjectivemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">增加题集</h4>
            </div>
            <div class="modal-body">
                <form id="addsubjectiveform">
                    <input type="text" class="form-control" id="subjectivedesp" placeholder="题集描述">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-success" id="savessubjectivebtn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="app app-default">

    <%@include file="compside.jsp"%>

    <div class="app-container">

        <%@include file="comptopnav.jsp"%>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>添加题集</h4>
                    </div>
                    <div class="card-body">
                        <button class="btn btn-success" id="startbtn">开始添加</button>
                        <button class="btn btn-success" id="addsingle" style="visibility: hidden">添加单选</button>
                        <button class="btn btn-success" id="addsubject" style="visibility: hidden">添加主观题</button>
                        <div class="row">
                            <div class="col-md-8">
                                <form action="${pageContext.request.contextPath}/qust/processadd" method="post" id="mainform">
                                    <h1 id="singleh1" style="visibility: hidden">选择题：</h1>
                                    <h1 id="subjectiveh1" style="visibility: hidden">主观题：</h1>
                                    <input type="submit" class="btn btn-success" value="保存" style="visibility: hidden" id="formsavebtn">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#li3").addClass('active')
    });
    $("#startbtn").click(function () {
        $("#addModal").modal("toggle")
    })
    $("#savebtn").click(function () {
        if($("#inbatchname").val()==""||$("#indesp").val()==""){
            $("#wann").html("任何一项不可为空")
            return;
        }
        $("#startbtn").remove()
        $("#addsingle").css("visibility","visible")
        $("#addsubject").css("visibility","visible")
        $("#singleh1").css("visibility","visible")
        $("#subjectiveh1").css("visibility","visible")
        $("#formsavebtn").css("visibility","visible")
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/addbatch",
            type:"POST",
            success:function (data) {
                var ele="<input type='text' name='batchid' value='"+data+"' hidden>"
                $("#mainform").append(ele)
                $("#mainform").append("<input type='text' name='batchname' value='"+$("#inbatchname").val()+"' hidden>")
                $("#mainform").append("<input type='text' name='batchdesp' value='"+$("#indesp").val()+"' hidden>")
                $("#mainform").append("<input type='text' name='belong' value='"+${sessionScope.user.id} +"' hidden>")
                $("#addModal").modal("toggle")
            }
        })
    })
    $("#addsingle").click(function () {
        $("#singledesp").val("")
        $("#atext").val("")
        $("#btext").val("")
        $("#ctext").val("")
        $("#dtext").val("")
        $("#addsinglemodal").modal("toggle")
    })
    var sigindex=0
    $("#savesinglebtn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/getuuid",
            type:"POST",
            success:function (data) {
                var delbtn="<button class='btn btn-danger' onclick='deletesinglequst(this)'>删除</button><br>"
                var eletext="题目文本：<input type='text' class='form-control' id='"+data+"-text' name='si-"+data+"-text' value='"+$("#singledesp").val()+"' readonly>"
                var eletexta="A:<input type='text' class='form-control' id='"+data+"-a' name='si-"+data+"-a' value='"+$("#atext").val()+"' readonly><br>"
                var eletextb="B:<input type='text' class='form-control' id='"+data+"-b' name='si-"+data+"-b' value='"+$("#btext").val()+"' readonly><br>"
                var eletextc="C:<input type='text' class='form-control' id='"+data+"-c' name='si-"+data+"-c' value='"+$("#ctext").val()+"' readonly><br>"
                var eletextd="D:<input type='text' class='form-control' id='"+data+"-d' name='si-"+data+"-d' value='"+$("#dtext").val()+"' readonly><br>"
                var ctn=$("<div></div>")
                ctn.append(delbtn).append(eletext).append(eletexta).append(eletextb).append(eletextc).append(eletextd)
                $("#singleh1").after(ctn)
                $("#addsinglemodal").modal("toggle")
            }
        })
    })
    $("#addsubject").click(function () {
        $("#subjectivedesp").val("")
        $("#addsubjectivemodal").modal('toggle')
    })
    $("#savessubjectivebtn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/getuuid",
            type:"POST",
            success:function (data) {
                var delbtn="<button class='btn btn-danger' onclick='deletesinglequst(this)'>删除</button><br>"
                var eletext="题目文本：<input type='text' class='form-control' id='"+data+"-text' name='su-"+data+"-text' value='"+$("#subjectivedesp").val()+"' readonly>"
                var ctn=$("<div></div>")
                ctn.append(delbtn).append(eletext)
                $("#subjectiveh1").after(ctn)
                $("#addsubjectivemodal").modal("toggle")
            }
        })
    })
    function testdel(id) {
        $(id).remove()
    }
    function deletesinglequst(id) {
        var par=$(id).parent()
        par.empty()
        par.remove()
    }
</script>
</body>

</html>
