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
</head>
<body>
<div class="app app-default">

    <%@include file="compside.jsp"%>

    <div class="app-container">

        <%@include file="comptopnav.jsp"%>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>待审核的题集</h4>
                    </div>
                    <div class="card-body no-padding">
                        <div class="table-responsive">
                            <table class="table card-table">
                                <thead>
                                <tr>
                                    <th>调查题目</th>
                                    <th>相关话题</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${unpassed}" var="batch">
                                    <tr>
                                        <td>${batch.batchname}</td>
                                        <td>${batch.desp}</td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>审核失败的题集</h4>
                    </div>
                    <div class="card-body no-padding">
                        <div class="table-responsive">
                            <table class="table card-table">
                                <thead>
                                <tr>
                                    <th>调查题目</th>
                                    <th>相关话题</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${failed}" var="batch">
                                    <tr>
                                        <td>${batch.batchname}</td>
                                        <td>${batch.desp}</td>
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

</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#li1").addClass('active')
    });
</script>
</body>
<script type="text/javascript" src="js/vendor.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</html>
