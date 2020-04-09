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
    <%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/17
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <aside class="app-sidebar" id="sidebar">
        <div class="sidebar-header">
            <a class="sidebar-brand" href="#"><span class="highlight">哈哈</span> 调查</a>
            <button type="button" class="sidebar-toggle">
                <i class="fa fa-times"></i>
            </button>
        </div>
        <div class="sidebar-menu">

        </div>
        <div class="sidebar-footer">
            <ul class="menu">
                <li>
                    <a href="${pageContext.request.contextPath}/" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-tag" aria-hidden="true"></i>回首页
                    </a>
                </li>
            </ul>
        </div>
    </aside>
    <div class="app-container">

        <%@include file="usertopnav.jsp"%>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        搜索结果
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
                                <c:forEach items="${likeBatchs}" var="batch">
                                    <tr>
                                        <td>${batch.batchname}</td>
                                        <td>${batch.desp}</td>
                                        <td><button type="button" class="btn btn-default btn-xs btn-success"><a href="${pageContext.request.contextPath}/qust/doqust?batchID=${batch.id}" target="_blank" style="color: white">去做调查</a></button></td>
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
</script>
</body>
<script type="text/javascript" src="js/vendor.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</html>
