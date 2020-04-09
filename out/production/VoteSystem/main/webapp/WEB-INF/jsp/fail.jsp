<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/15
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>错误页面</title>
    <link rel="icon" sizes="any" href="img/webicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style404.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
</head>
<body>
<div class="error_main">
    <div class="content">
        <h1>出了一些错</h1>
        <div class="error_content">
            <span class="fa fa-frown-o"></span>
            <h2>Sorry, Page not found!</h2>
            <p>请检查信息</p>
            <form action="#" method="post">
                <input class="serch" type="search" name="serch" placeholder="Search here" required="">
                <button class="btn1"><i class="fa fa-search" aria-hidden="true"></i></button>
                <div class="clear"> </div>
            </form>
            <a class="b-home" href="${pageContext.request.contextPath}/">Back to Home</a>
        </div>
        <div class="footer">
            <p>Copyright &copy; 2018.Company 哈哈调查 All rights reserved.</p>
        </div>
    </div>

</div>

</body>
</html>