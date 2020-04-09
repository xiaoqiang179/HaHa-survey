<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/16
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>做问卷</title>
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

</head>
<body>
<div class="app app-default">
    <%@include file="side.jsp"%>
    <div class="app-container">

        <%@include file="usertopnav.jsp"%>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="text text-primary">
                                ${batchdata.batchname}
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="section">
                                <div class="section-title">单选题</div>
                                <c:set var="index" value="0" scope="page"/>
                                <form action="${pageContext.request.contextPath}/qust/processResult" method="post">
                                    <c:forEach items="${singlequstdata}" var="qust">
                                    <div class="text">${index=index+1}. ${qust.text}</div>
                                    <div style="margin-top: 30px">
                                        <div class="radio">
                                            <input type="radio" name="radio${index}" id="radio${qust.id}A" value="${qust.id}-A">
                                            <label for="radio${qust.id}A">
                                                A. ${qust.texta}
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="radio${index}" id="radio${qust.id}B" value="${qust.id}-B">
                                            <label for="radio${qust.id}B">
                                                B. ${qust.textb}
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="radio${index}" id="radio${qust.id}C" value="${qust.id}-C">
                                            <label for="radio${qust.id}C">
                                                C. ${qust.textc}
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="radio${index}" id="radio${qust.id}D" value="${qust.id}-D">
                                            <label for="radio${qust.id}D">
                                                D. ${qust.textd}
                                            </label>
                                        </div>
                                        </c:forEach>
                                        <c:forEach items="${subjectivequstdata}" var="item">
                                        <div class="section">
                                            <div class="section-title">主观题</div>
                                            <div class="text">${item.text}</div>
                                            <textarea name="su-${item.id}" rows="3" class="form-control"
                                                      style="margin: 0px 37px 15px 0px; height: 134px; width: 637px;"></textarea>
                                        </div>
                                        </c:forEach>
                                        <input type="text" value="${sessionScope.user.id}" name="userid" hidden/>
                                        <input type="text" value="${batchdata.id}" name="batchid" hidden/>
                                        <input type="submit" class="btn btn-success">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
