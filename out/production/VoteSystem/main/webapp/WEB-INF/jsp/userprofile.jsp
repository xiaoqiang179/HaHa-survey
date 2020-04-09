<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/17
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">改密码</h4>
            </div>

            <div class="modal-body">
                <input type="text" class="form-control" placeholder="输入新密码" id="pwdinput" onfocus="this.type='password'" autocomplete="off">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-danger" id="changebtn">保存</button>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加</h4>
            </div>

            <div class="modal-body">
                <input type="text" class="form-control" placeholder="话题 可多个 空格分开" id="likeinput" autocomplete="off">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-danger" id="addbtn">添加</button>
            </div>

        </div>
    </div>
</div>
<div class="app app-default">
    <%@include file="side.jsp"%>

    <div class="app-container">
       <%@include file="usertopnav.jsp"%>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body app-heading">
                        <img class="profile-img" src="${sessionScope.user.iconfilename}">
                        <div class="app-title">
                            <div class="title"><span class="highlight">${sessionScope.user.name}</span></div>
                            <div class="description">普通用户</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card card-tab">
                    <div class="card-header">
                        <ul class="nav nav-tabs">
                            <li role="tab1" class="active">
                                <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">资料</a>
                            </li>
                            <li role="tab3">
                                <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">更改头像</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body no-padding tab-content">
                        <div role="tabpanel" class="tab-pane active" id="tab1">
                            <div class="row">
                                <div class="col-md-3 col-sm-12">
                                    <div class="section">
                                        <div class="section-title"><i class="icon fa fa-user" aria-hidden="true"></i> 关键信息</div>
                                        <div class="section-body __indent">
                                            用户名：${sessionScope.user.name}<br>
                                            邮箱：${sessionScope.user.email}<br>
                                            电话：${sessionScope.user.tel}
                                        </div>
                                    </div>
                                    <div class="section">
                                        <div class="section-title"><i class="icon fa fa-book" aria-hidden="true"></i> 兴趣话题</div>
                                        <div class="section-body __indent">
                                            <div id="likeword">${sessionScope.user.likeword}</div><br><br>
                                            <br>
                                            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal1">添加兴趣话题</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-md-offset-3">
                                    <button class="btn btn-danger" data-toggle="modal" data-target="#myModal">改密码</button>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab3">
                            <form id="logoform" enctype="multipart/form-data">
                                <img src="${sessionScope.user.iconfilename}" style="width:150px;height:150px;" id="showimg"/>
                                <input type="file" class="btn btn-success" name="file" id="image_input"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#changebtn").click(function () {
        $("#pwdinput").html("")
        $.ajax({
            url:"${pageContext.request.contextPath}/user/changepwd",
            type:"POST",
            data:{
                pwd:$("#pwdinput").val()
            },
            success:function () {
                $.message({
                    type:'success',
                    message:'<div style="color:#333;font-weight:bold;font-size:16px;">用户信息保存成功<div><span style="color:lightgrey;font-size:small;">3秒后自动关闭</span>',
                    duration:3000,
                    center:true
                });
                $("#myModal").modal('toggle');

            }
        })
    })
    $("#addbtn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/addlikeword",
            type:"POST",
            data:{
                likeword:$("#likeinput").val()
            },
            success:function (backdata) {
                $("#myModal1").modal('toggle');
                //alert(backdata)
                $("#likeword").html(backdata)
                $.message({
                    type:'success',
                    message:'<div style="color:#333;font-weight:bold;font-size:16px;">用户信息保存成功<div><span style="color:lightgrey;font-size:small;">3秒后自动关闭</span>',
                    duration:3000,
                    center:true
                });
            }
        })
    })

    $(function(){
        $("#image_input").change(function(){
            var imagePath = $("#image_input").val();
           // alert(imagePath)
            if (imagePath == '') {
                return false;
            }
            var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
            $("#logoform").ajaxSubmit({
                type : 'POST',
                url : '${pageContext.request.contextPath}/user/usericonupdate',
                success : function(data) {
                   // alert(data)
                    $("#showimg").attr("src", data);
                },
                error : function() {
                    alert("上传失败，请检查网络后重试");
                }
            });
        })
    })

</script>
<script type="text/javascript" src="js/message.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
</html>
