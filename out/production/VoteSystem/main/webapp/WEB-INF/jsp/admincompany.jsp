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
                                    <th>公司用户名</th>
                                    <th>查看</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allcompany}" var="company">
                                    <tr>
                                        <td>${company.name}</td>
                                        <td>
                                            <button type="button" class="btn btn-default btn-xs btn-success" onclick="showone('${company.id}')">
                                               查看详情</button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-default btn-xs btn-danger"><a href="${pageContext.request.contextPath}/admin/deletecom?comid=${company.id}"
                                                                                                               style="color: white">删除</a>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

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
                    <h4 class="modal-title">公司用户详情</h4>
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
        $("#li2").addClass('active')
    });

    function showone(id) {
        $("#modal").modal("toggle")
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/getdetail2",
            type:"POST",
            data:{
                uid:id
            },
            success:function (company) {
                $("#tb1").empty()
                $("#tb1").append("<tr><td><b>用户名:</b></td><td>"+company.name+"</td></tr>")
                $("#tb1").append("<tr><td><b>密&nbsp&nbsp码:</b></td><td>"+company.password+"</td></tr>")
                $("#tb1").append("<tr><td><b>电&nbsp&nbsp话:</b></td><td>"+company.tel+"</td></tr>")
                $("#tb1").append("<tr><td><b>邮&nbsp&nbsp箱:</b></td><td>"+company.email+"</td></tr>")
                $("#tb1").append("<tr><td><b>性&nbsp&nbsp别:</b></td><td>"+company.gender+"</td></tr>")
                $("#tb1").append("<tr><td><b>公司名:</b></td><td>"+company.companyname+"</td></tr>")

            }
        })
    }

</script>
</body>
<script type="text/javascript" src="js/vendor.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</html>
