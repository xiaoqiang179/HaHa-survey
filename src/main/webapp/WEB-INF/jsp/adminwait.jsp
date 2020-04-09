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
    <script type="text/javascript" src="js/bootstrap.js"></script>

</head>
<body>
<div class="modal fade" id="detailmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">详情</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <td>单选</td>
                    </thead>
                    <tbody id="singles">

                    </tbody>
                    <thead>
                         <td>主观题</td>
                    </thead>
                    <tbody id="subjectives">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-danger" id="unpassbtn">不通过</button>
                <button type="button" class="btn btn-sm btn-success" id="passbtn">通过</button>
            </div>
        </div>
    </div>
</div>
<div class="app app-default">

    <%@include file="adminside.jsp" %>

    <div class="app-container">

        <%@include file="admintopnav.jsp" %>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        这里是你要处理的事务
                    </div>
                    <div class="card-body no-padding">
                        <div class="table-responsive">
                            <table class="table card-table">
                                <thead>
                                <tr>
                                    <th>题集标题</th>
                                    <th>描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${batchs}" var="batch">
                                    <tr>
                                        <td>
                                            ${batch.batchname}
                                        </td>
                                        <td>
                                            ${batch.desp}
                                        </td>
                                        <td>
                                            <button class="btn btn-success" onclick="showandprocess('${batch.id}')">查看详情</button>
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

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#li5").addClass('active')
    });
    var tmpbatchid
    function showandprocess(batchid) {
        tmpbatchid=batchid
        $("#singles").empty()
        $("#subjectives").empty()
        var idx=1
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/getunpassedsingle",
            type:"POST",
            data:{
                batchID:batchid
            },
            success:function (data) {
                $.each(data,function (index,single) {

                    var ele="<tr><td>"+idx+",题目:"+single.text+"<br>A:"+single.texta+"<br>B:"+single.textb+"<br>C:"+single.textc+"<br>D:"+single.textd+"</td></tr>"
                    $("#singles").append(ele)
                    idx++
                })
            }
        })
        var idx1=1
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/getunpassedsubjective",
            type:"POST",
            data:{
                batchID:batchid
            },
            success:function (data) {
                $.each(data,function (index,subjective) {

                    var ele="<tr><td>"+idx1+",题目:"+subjective.text+"</td></tr>"
                    $("#subjectives").append(ele)
                    idx1++
                })
            }
        })
        $("#detailmodal").modal("toggle")
    }
    $("#unpassbtn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/processunpass",
            type:"POST",
            data:{
                batchid:tmpbatchid
            },
            success:function () {
                //window.location.reload()
            }
        })
        $("#detailmodal").modal("toggle")
        window.location.reload()
    })
    $("#passbtn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/processpass",
            type:"POST",
            data:{
                batchid:tmpbatchid
            },
            success:function () {
                //window.location.reload()
            }
        })
        $("#detailmodal").modal("toggle")
        window.location.reload()
    })
</script>
</body>
</html>
