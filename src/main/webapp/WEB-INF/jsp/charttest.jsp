<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/26
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图标测试</title>
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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<div class="modal fade" id="statmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">题集详情</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2>题目内容题目内容题目内容题目内容</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            A.xxxxxxxx<br>
                            A.xxxxxxxx<br>
                            A.xxxxxxxx<br>
                            A.xxxxxxxx<br>
                        </p>

                    </div>
                    <div class="col-md-6">
                        <div id="main" style="width: 300px;height:300px;">

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-success" id="savebtn">保存</button>
            </div>
        </div>
    </div>
</div>

</body>
<button class="btn btn-success" id="btn"></button>
<script type="text/javascript">
    $("#btn").click(function () {
        $("#statmodal").modal('toggle')
    })
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'),'light');

    // 指定图表的配置项和数据
    var option = {
        title : {
            text: '答题详情',
            subtext: '纯属虚构',
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
                    {value:335, name:'A'},
                    {value:310, name:'B'},
                    {value:234, name:'C'},
                    {value:135, name:'D'}
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
    myChart.setOption(option);
</script>
</html>
