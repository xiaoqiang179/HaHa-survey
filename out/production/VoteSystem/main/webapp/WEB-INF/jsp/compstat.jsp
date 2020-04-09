<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/26
  Time: 20:55
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
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
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
                        这是宁全部的题集的详情
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
        $("#li4").addClass('active')
    });
    function dostat(batchid) {
        $("#modalmain").empty()
        var myCharts=new Array()
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/processinglesstat",
            type: "POST",
            data:{
                batchId: batchid
            },
            success:function (data) {
                if(data.length==0){
                   //$("#modalmain").append("这套题没人做过！")
                    //$("#statmodal").modal('toggle')
                    return;
                }

                $.each(data,function (index,batch) {
                    var ele="<tr><td>"+
                        "                        <h2>"+""+(data.length-index)+"."+batch.key.text+"</h2>" +
                        "                        <p>" +
                        "                            A."+batch.key.texta+"<br>" +
                        "                            B."+batch.key.textb+"<br>" +
                        "                            C."+batch.key.textc+"<br>" +
                        "                            D."+batch.key.textd+"<br>" +
                        "                        </p>" +
                        "                       </td>" +
                        "                    <td>" +
                        "                        <div id=\"chart"+(index)+"\" style=\"width: 300px;height:300px;\"></div>" +
                        "                    </td></tr>"
                    $("#modalmain").prepend(ele)
                    // 基于准备好的dom，初始化echarts实例
                    myCharts[index] = echarts.init(document.getElementById('chart'+index),'light');
                    // 指定图表的配置项和数据
                    var option = {
                        title : {
                            text: '答题详情',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        series : [
                            {
                                name: '选择人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:[
                                    {name:"A",value:batch.value["A"]==undefined? 0:batch.value["A"]},
                                    {name:"B",value:batch.value["B"]==undefined? 0:batch.value["B"]},
                                    {name:"C",value:batch.value["C"]==undefined? 0:batch.value["C"]},
                                    {name:"D",value:batch.value["D"]==undefined? 0:batch.value["D"]}
                                ],
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myCharts[index].setOption(option);

                })
                $("#modalmain").prepend("<tr><td colspan='2'><h1 class='text text-primary'>单选</h1></td></tr>")

            }
        })
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/processsubjectivestat",
            type:"POST",
            data:{
                batchid:batchid
            },
            success:function (data) {
                if(data.length==0){
                    $("#modalmain").append("这套题没人做过！")
                   // $("#statmodal").modal('toggle')
                    return;
                }
                $("#modalmain").append("<tr><td colspan='2'><h1 class='text text-primary'>主观题</h1></td></tr>")
                $.each(data,function (index,subdata) {
                    var anstext=""
                    $.each(subdata.value,function (index,resultdata) {
                        anstext+=""+resultdata.userid+"回答了："+resultdata.text+"<br>"
                    })
                    var ele= "<tr><td colspan='2'><h2>"+(index+1)+"."+subdata.key.text+"</h2>" +
                        "<h2>"+anstext+"</h2></td></td>"
                    $("#modalmain").append(ele)
                })
            }
        })
        $("#statmodal").modal('toggle')
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
                            "                                        <td><button type=\"button\" onclick=\"dostat(\'"+batch.id+"\')\" class=\"btn btn-default btn-xs btn-success\">查看统计</button></td>\n" +
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
