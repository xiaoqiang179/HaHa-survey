<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/17
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>宁做过的</title>
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
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-success">Save changes</button>
            </div>
        </div>
    </div>
</div>
<c:set var="idinedx" value="0" scope="page"></c:set>
<c:forEach items="${detaildata }" var="data">

        <div class="modal fade" id="myModal${idinedx=idinedx+1}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">详细结果</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-striped">
                            <tbody>
                                <tr>
                                    <td>
                                        <b class="text text-primary">选择题</b>
                                    </td>
                                </tr>
                                <c:forEach items="${data.singledata}" var="single">
                                    <tr>
                                        <td>
                                            <b>${single.key.text}</b><br>
                                            A.${single.key.texta}<br>
                                            B.${single.key.textb}<br>
                                            C.${single.key.textc}<br>
                                            D.${single.key.textd}<br>
                                            你选了：${single.value.result}<br>
                                        </td>
                                    </tr>

                            </c:forEach>
                                <tr>
                                    <td>
                                        <b class="text text-primary">主观题</b>
                                    </td>
                                </tr>

                                <c:forEach items="${data.subjectivedata}" var="subjective">
                                <tr>
                                    <td>
                                    <b>${subjective.key.text}</b><br>
                                    你回答了：${subjective.value.text}<br>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>

                        </table>


                     </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</c:forEach>
<div class="app app-default">

    <%@include file="side.jsp"%>

    <div class="app-container">

        <%@include file="usertopnav.jsp"%>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        这是宁做过的调查
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
                                <h1 hidden>${idinedx=0}</h1>
                                <c:forEach items="${donedata}" var="batch">
                                    <tr>
                                        <td>${batch.batchname}</td>
                                        <td>${batch.desp}</td>
                                        <td><button type="button" class="btn btn-default btn-xs btn-success" data-toggle="modal" data-target="#myModal${idinedx=idinedx+1}">详情</button></td>
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
</body>
<%--<script type="text/javascript" src="js/vendor.js"></script>--%>
<%--<script type="text/javascript" src="js/app.js"></script>--%>

<script type="text/javascript">
    $(document).ready(function(){
        $("#li3").addClass('active')
    });
    function getdetail(batchID) {

    }
</script>

</html>
