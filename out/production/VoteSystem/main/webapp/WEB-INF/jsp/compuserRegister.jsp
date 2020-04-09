<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/12
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>注册</title>
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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<div class="app app-default">
    <div class="app-container app-login">
        <div class="flex-center">
            <div class="app-header"></div>
            <div class="app-body">
                <div class="loader-container text-center">
                    <div class="icon">
                        <div class="sk-folding-cube">
                            <div class="sk-cube1 sk-cube"></div>
                            <div class="sk-cube2 sk-cube"></div>
                            <div class="sk-cube4 sk-cube"></div>
                            <div class="sk-cube3 sk-cube"></div>
                        </div>
                    </div>
                    <div class="title">Logging in...</div>
                </div>
                <div class="app-block">
                    <div class="app-right-section">
                        <div class="app-brand"><span class="highlight">哈哈</span> 调查</div>
                        <div class="app-info">

                            <ul class="list">
                                <li>
                                    <div class="icon">
                                        <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
                                    </div>
                                    <div class="title">直观 <b>高效</b></div>
                                </li>
                                <li>
                                    <div class="icon">
                                        <i class="fa fa-cubes" aria-hidden="true"></i>
                                    </div>
                                    <div class="title">简洁 <b>易用</b></div>
                                </li>
                                <li>
                                    <div class="icon">
                                        <i class="fa fa-usd" aria-hidden="true"></i>
                                    </div>
                                    <div class="title">价格 <b>实惠</b></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="app-form">
                        <div class="form-suggestion">
                            用户注册
                        </div>
                        <form action="${pageContext.request.contextPath}/comp/signup" method="post" onsubmit="return check()">
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">
                  <i class="fa fa-paper-plane" aria-hidden="true"></i></span>
                                <input type="text" class="form-control has-success" placeholder="姓名"
                                       aria-describedby="basic-addon1" id="inname" name="name">
                            </div>

                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon5">
                  <i class="fa fa-envelope" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="邮箱"
                                       aria-describedby="basic-addon1" id="inemail" name="email">
                            </div>
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon2">
                  <i class="fa fa-phone" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="电话"
                                       aria-describedby="basic-addon2" id="intel" name="tel">
                            </div>
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon3">
                  <i class="fa fa-key" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" placeholder="密码"
                                       aria-describedby="basic-addon3" name="password">
                            </div>
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon6">
                  <i class="fa fa-rss" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="公司名"
                                       aria-describedby="basic-addon2" name="companyname">
                            </div>
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon7">
                  <i class="fa fa-rss" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="公司类型"
                                       aria-describedby="basic-addon2" name="companytype">
                            </div>
                            <div class="input-group">
                <span class="input-group-addon" id="basic-addon8">
                  <i class="fa fa-rss" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="公司描述"
                                       aria-describedby="basic-addon2" name="companydesp">
                            </div>
                            <div class="radio radio-inline">
                                <input type="radio" name="gender" id="radio5" value="m" checked="true">
                                <label for="radio5">
                                    男
                                </label>
                            </div>
                            <div class="radio radio-inline">
                                <input type="radio" name="gender" id="radio6" value="f" >
                                <label for="radio6">
                                    女
                                </label>
                            </div>
                            <div>
                                <input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="form-control" id="inputvarify"/>
                                <canvas id="canvas" width="100" height="43"></canvas>
                            </div>
                            <br>
                            <div class="text-center">
                                <input type="submit" class="btn btn-success btn-submit" value="注册" id="submitbtn">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="app-footer">
            </div>
        </div>
    </div>

</div>
<script>

    var fl1=false,fl2=false,fl3=false,fl4=false
    function check(){
        if(fl1==false||fl2==false||fl3==false||fl4==false){
            return false;
        }
        else{
            return true;
        }
    }
    $(function(){
        var show_num = [];
        draw(show_num);
        $("#canvas").on('click',function(){
            draw(show_num);
        })
        $("#submitbtn").on('click',function(){
            var val = $("#inputvarify").val().toLowerCase();
            var num = show_num.join("");
            if(val==''){
                fl4=false
                $.message({
                    message:'请输入验证码',
                    type:'info'
                });
            }
            else if(val==num){
                fl4=true
            }
            else{
                fl4=false
                $.message({
                    message:'验证码输入错误',
                    type:'info'
                });
                $(".input-val").val('');
                draw(show_num);
            }
        })
    })
    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
    $("#inname").change(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/comp/checkok",
            type: "POST",
            data:{
                data:$("#inname").val(),
                type: "name"
            },
            success:function (data) {
                if(data==true){
                    fl1=true
                }
                else{
                    fl1=false
                    $.message({
                        message:'用户名不可用',
                        type:'info'
                    });
                }
            },
            error:function () {
                alert("error")
            }
        })
    })
    $("#inemail").change(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/comp/checkok",
            type: "POST",
            data:{
                data:$("#inemail").val(),
                type: "email"
            },
            success:function (data) {
                if(data==true){
                    fl2=true
                }
                else{
                    fl2=false
                    $.message({
                        message:'邮箱不可用',
                        type:'info'
                    });
                }
            },
            error:function () {
                alert("error")
            }
        })
    })
    $("#intel").change(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/comp/checkok",
            type: "POST",
            data:{
                data:$("#intel").val(),
                type: "tel"
            },
            success:function (data) {
                if(data==true){
                    fl3=true
                }
                else{
                    fl3=false
                    $.message({
                        message:'电话不可用',
                        type:'info'
                    });
                }
            },
            error:function () {
                alert("error")
            }
        })
    })
</script>
<%--<script type="text/javascript" src="js/vendor.js"></script>--%>
<%--<script type="text/javascript" src="js/app.js"></script>--%>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/message.js"></script>
</body>
</body>
</html>
