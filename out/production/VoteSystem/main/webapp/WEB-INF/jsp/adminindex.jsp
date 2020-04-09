<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>管理员</title>
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
</head>
<body>
<div class="app app-default">

    <%@include file="adminside.jsp" %>

    <div class="app-container">

        <%@include file="admintopnav.jsp" %>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        这里是所有的用户
                    </div>
                    <div class="card-body no-padding">
                        <div class="table-responsive">
                            <table class="table card-table">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>查看</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <C:forEach items="${alluser}" var="user">
                                    <tr>
                                        <td>${user.name}</td>
                                        <td>
                                            <button type="button" class="btn btn-default btn-xs btn-success" onclick="showone('${user.id}')">
                                                <a style="color: white">查看详情</a></button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-default btn-xs btn-danger"><a href="${pageContext.request.contextPath}/admin/deleteUser?uid=${user.id}"
                                                                                                               style="color: white">删除</a>
                                            </button>
                                        </td>
                                    </tr>
                                </C:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">用户详情</h4>
                </div>
                <div class="modal-body" id="details">
                    <table class="table card-table">

                        <tbody id="tb1">

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#li1").addClass('active')
    });
    function showone(id) {
        $("#modal").modal("toggle")
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/getdetail",
            type:"POST",
            data:{
                uid:id
            },
            success:function (user) {
                $("#tb1").empty()
                $("#tb1").append("<tr><td><b>用户名:</b></td><td>"+user.name+"</td></tr>")
                $("#tb1").append("<tr><td><b>密&nbsp&nbsp码:</b></td><td>"+user.password+"</td></tr>")
                $("#tb1").append("<tr><td><b>电&nbsp&nbsp话:</b></td><td>"+user.tel+"</td></tr>")
                $("#tb1").append("<tr><td><b>邮&nbsp&nbsp箱:</b></td><td>"+user.email+"</td></tr>")
                $("#tb1").append("<tr><td><b>性&nbsp&nbsp别:</b></td><td>"+user.gender+"</td></tr>")
                $("#tb1").append("<tr><td><b>兴趣点:</b></td><td>"+user.likeword+"</td></tr>")
            }
        })
    }
</script>
</body>
<script type="text/javascript" src="js/vendor.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</html>
