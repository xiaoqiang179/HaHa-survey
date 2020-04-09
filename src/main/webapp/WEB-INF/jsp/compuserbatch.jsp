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
<div class="modal fade" id="statmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">题集详情</h4>
            </div>
            <div class="modal-body" >
                <table class="table table-striped table-bordered">
                    <tbody id="modalmain" >

                    </tbody>
                    <tbody id="modalmain1" >

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="app app-default">

    <%@include file="compside.jsp" %>

    <div class="app-container">

        <%@include file="comptopnav.jsp" %>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        这是宁全部的题集
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

<script type="text/javascript">
    $(document).ready(function () {
        $("#li2").addClass('active')
    });
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
                url:"${pageContext.request.contextPath}/qust/showallpagedbycomp",
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
                            "                                        <td><button type=\"button\" onclick='dostat(\""+batch.id+"\")' class=\"btn btn-default btn-xs btn-success\">查看详情</button></td>\n" +
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
    function dostat(batchid) {
        $("#modalmain").empty()
        $("#modalmain1").empty()
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/getsingledata",
            type:"POST",
            data:{
                batchid:batchid
            },
            success:function (data) {
                $.each(data,function (index,single) {
                    var ele="<tr><td>题目："+single.text+"</td><td>A."+single.texta+"<br>B."+single.textb+"<br>C."+single.textc+"<br>D."+single.textd+"</td></tr>"
                    $("#modalmain").append(ele)
                })
                $("#modalmain").prepend("<tr><td colspan='2'><h2 class='text text-primary'>单选题</h2></td></tr>")
            }
        })
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/getsubjectivedata",
            type:"POST",
            data:{
                batchid:batchid
            },
            success:function (data) {
                $("#modalmain1").append("<tr><td colspan='2'><h2 class='text text-primary'>主观题</h2></td></tr>")
                $.each(data,function (index,single) {
                    var ele="<tr><td colspan='2'>题目："+single.text+"</td></tr>"
                    $("#modalmain1").append(ele)
                })
            }
        })
        $("#statmodal").modal('toggle')
    }
</script>

</body>
</html>
