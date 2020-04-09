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

    <%@include file="side.jsp" %>

    <div class="app-container">

        <%@include file="usertopnav.jsp" %>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        这是全部的题集
                    </div>
                    <div class="card-body no-padding">
                        <div class="table-responsive">
                            <table class="table card-table" >
                                <thead>
                                <tr>
                                    <th>调查题目</th>
                                    <th>相关话题</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody id="datatable">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <div class="card-body">
                        <nav>
                            <ul id="btmnav" class="pagination">

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="js/jq-paginator.js"></script>
<script type="text/javascript" src="js/message.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#li2").addClass('active')
    });
    function check(batchID) {
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/checkisdone",
            type:"POST",
            data:{
                batchID:batchID
            },
            success:function (data) {
                if(data==true){
                    $.message({
                        message:'你做过了',
                        type:'error',
                        center:true
                    });
                    return
                }
                else{
                    window.open("${pageContext.request.contextPath}/qust/doqust?batchID="+batchID)
                }
            }
        })
    }
    $("#btmnav").jqPaginator({
        totalPages: ${total},
        visiblePages: 10,
        currentPage: 1,
        first: '<li class="first"><a href="javascript:void(0);">First<\/a><\/li>',
        prev: '<li class="prev"><a href="javascript:void(0);">Previous<\/a><\/li>',
        next: '<li class="next"><a href="javascript:void(0);">Next<\/a><\/li>',
        last: '<li class="last"><a href="javascript:void(0);">Last<\/a><\/li>',
        page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
        onPageChange: function (n) {
           $.ajax({
               url:"${pageContext.request.contextPath}/qust/showallpaged",
               type:"POST",
               data:{
                   pagenum:n
               },
               success:function (data) {
                   $("#datatable").empty()
                   $.each(data,function (index,batch) {
                       var ele=" <tr>\n" +
                           "                                        <td>"+batch.batchname+"</td>\n" +
                           "                                        <td>"+batch.desp+"</td>\n" +
                           "                                        <td><button type=\"button\" class=\"btn btn-default btn-xs btn-success\" onclick=\"check('"+batch.id+"')\">去做调查</button></td>\n" +
                           "                                    </tr>"
                       $("#datatable").append(ele)
                   })
               },
               error:function () {
                   alert("error")
               }
           })
        }
    });
</script>

</body>
</html>
