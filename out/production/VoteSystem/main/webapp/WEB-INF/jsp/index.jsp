<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/8
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>哈哈调查</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="icon" sizes="any" href="img/webicon.png">
    <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
</head>
<body>
<nav class="navbar probootstrap-megamenu navbar-default probootstrap-navbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" title="uiCookies:Inspire"></a>
        </div>

        <div id="navbar-collapse" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.html">首页</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">更多</a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="modal" data-target="#adminloginModal">管理员入口</a></li>
                    </ul>
                </li>
                <c:if test="${user==null}">
                    <li class="probootstra-cta-button"><a href="#" class="btn" data-toggle="modal" data-target="#UserloginModal">普通用户入口</a></li>
                    <li class="probootstra-cta-button last"><a href="#" class="btn" data-toggle="modal" data-target="#ComploginModal">企业用户入口</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <c:if test="${type=='user'}">
                        <li class="probootstra-cta-button"><a href="user/userindex" class="btn">欢迎宁：${sessionScope.user.name}</a></li>
                        <li class="probootstra-cta-button last"><a href="user/logout" class="btn">登出</a></li>
                    </c:if>
                    <c:if test="${type=='comp'}">
                        <li class="probootstra-cta-button"><a href="comp/compindex" class="btn">欢迎宁：${sessionScope.user.name}</a></li>
                        <li class="probootstra-cta-button last"><a href="comp/logout" class="btn">登出</a></li>
                    </c:if>
                    <c:if test="${type=='admin'}">
                        <li class="probootstra-cta-button"><a href="admin/toadminindex" class="btn">欢迎宁：${sessionScope.user.id}</a></li>
                        <li class="probootstra-cta-button last"><a href="admin/logout" class="btn">登出</a></li>
                    </c:if>
                    <c:if test="${type==null}">
                        <li class="probootstra-cta-button"><a href="#" class="btn" data-toggle="modal" data-target="#UserloginModal">普通用户入口</a></li>
                        <li class="probootstra-cta-button last"><a href="#" class="btn" data-toggle="modal" data-target="#ComploginModal">企业用户入口</a></li>
                    </c:if>
                </c:if>
            </ul>
        </div>
    </div>
</nav>



<section class="probootstrap-hero">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 text-center probootstrap-hero-text pb0 probootstrap-animate" data-animate-effect="fadeIn">
                <h1>调查你想知道的一切</h1>
                <p>哈哈调查网，值得你的信赖！！</p>
<%--                <p>--%>
<%--                    <a href="#" class="btn btn-primary btn-lg" role="button">Get This App</a>--%>
<%--                    <a href="#" class="btn btn-primary btn-ghost btn-lg" role="button">Try it for free</a>--%>
<%--                </p>--%>
                <!-- <p><a href="#"><i class="icon-play2"></i> Watch the video</a></p> -->
            </div>
        </div>

        <div class="row probootstrap-feature-showcase">
            <div class="col-md-4 col-md-push-8 probootstrap-showcase-nav probootstrap-animate">
                <ul>
                    <li class="active">
                        <a href="#">发布快</a>
                        <p>24H人工审核，秒发布</p>
                    </li>
                    <li>
                        <a href="#">类型多样</a>
                        <p>调查类型多样，丰富灵活</p>
                    </li>
                    <li>
                        <a href="#">安全性高</a>
                        <p>所有的用户信息都经过多重加密，安全可靠</p>
                    </li>
                    <li>
                        <a href="#">数据直观</a>
                        <p>数据图表展示，直观方便</p>
                    </li>
                    <li>
                        <a href="#">搜索全面</a>
                        <p>全局搜索，无所不在</p>
                    </li>
                    <li>
                        <a href="#">完全自定义</a>
                        <p>高度自定义，灵活度高</p>
                    </li>
                </ul>
            </div>
            <div class="col-md-8 col-md-pull-4 probootstrap-animate" style="position: relative;">
                <div class="probootstrap-home-showcase-wrap">
                    <div class="probootstrap-home-showcase-inner">
                        <div class="probootstrap-chrome">
                            <div><span></span><span></span><span></span></div>
                        </div>
                        <div class="probootstrap-image-showcase">
                            <ul class="probootstrap-images-list">
                                <li class="active"><img src="img/img_showcase_2.jpg" alt="Image" class="img-responsive"></li>
                                <li><img src="img/img_showcase_1.jpg" alt="Image" class="img-responsive"></li>
                                <li><img src="img/img_showcase_2.jpg" alt="Image" class="img-responsive"></li>
                                <li><img src="img/img_showcase_1.jpg" alt="Image" class="img-responsive"></li>
                                <li><img src="img/img_showcase_2.jpg" alt="Image" class="img-responsive"></li>
                                <li><img src="img/img_showcase_1.jpg" alt="Image" class="img-responsive"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="probootstrap-section probootstrap-bg-white probootstrap-zindex-above-showcase">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center section-heading probootstrap-animate" data-animate-effect="fadeIn">
                <h2>平台功能</h2>
                <p class="lead">调查，管理，一应俱全</p>
            </div>
        </div>
        <!-- END row -->
        <div class="row probootstrap-gutter60">
            <div class="col-md-4 probootstrap-animate" data-animate-effect="fadeInLeft">
                <div class="service text-center">
                    <div class="icon"><i class="icon-mobile3"></i></div>
                    <div class="text">
                        <h3>发布快速n</h3>
                        <p>全天审核，发布快速</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 probootstrap-animate" data-animate-effect="fadeIn">
                <div class="service text-center">
                    <div class="icon"><i class="icon-presentation"></i></div>
                    <div class="text">
                        <h3>类型多样</h3>
                        <p>满足您的一切需求</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 probootstrap-animate" data-animate-effect="fadeInRight">
                <div class="service text-center">
                    <div class="icon"><i class="icon-circle-compass"></i></div>
                    <div class="text">
                        <h3>安全性高</h3>
                        <p>数据库加密存储</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 probootstrap-animate" data-animate-effect="fadeInLeft">
                <div class="service text-center">
                    <div class="icon"><i class="icon-lightbulb"></i></div>
                    <div class="text">
                        <h3>数据直观</h3>
                        <p>图表展示，直观</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 probootstrap-animate">
                <div class="service text-center">
                    <div class="icon"><i class="icon-magnifying-glass2"></i></div>
                    <div class="text">
                        <h3>搜索全面</h3>
                        <p>强力搜索引擎</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 probootstrap-animate" data-animate-effect="fadeInRight">
                <div class="service text-center">
                    <div class="icon"><i class="icon-browser2"></i></div>
                    <div class="text">
                        <h3>完全自定义</h3>
                        <p>非常灵活</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="probootstrap-section proboostrap-clients probootstrap-bg-white probootstrap-border-top">
    <div class="container">
        <div class="row">
            <div class="col-md-6 section-heading probootstrap-animate">
                    <h2> 我们的客户</h2>
                <p class="lead">目前没有客户</p>
                <p>emmmm～～</p>
            </div>
        </div>
        <!-- END row -->
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-6 text-center client-logo probootstrap-animate" data-animate-effect="fadeIn">
                <img src="img/client_1.png" class="img-responsive" alt="哈哈调查网">
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6 text-center client-logo probootstrap-animate" data-animate-effect="fadeIn">
                <img src="img/client_2.png" class="img-responsive" alt="哈哈调查网">
            </div>
            <div class="clearfix visible-sm-block visible-xs-block"></div>
            <div class="col-md-3 col-sm-6 col-xs-6 text-center client-logo probootstrap-animate" data-animate-effect="fadeIn">
                <img src="img/client_3.png" class="img-responsive" alt="哈哈调查网">
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6 text-center client-logo probootstrap-animate" data-animate-effect="fadeIn">
                <img src="img/client_4.png" class="img-responsive" alt="哈哈调查网">
            </div>

        </div>
    </div>
</section>
<section class="probootstrap-cta">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="probootstrap-animate" data-animate-effect="fadeInRight">有需求？</h2>
                <a href="#" role="button" class="btn btn-primary btn-lg btn-ghost probootstrap-animate" data-animate-effect="fadeInLeft">联系我们</a>
            </div>
        </div>
    </div>
</section>
<footer class="probootstrap-footer">
    <div class="container">
        <div class="row">

            <div class="col-md-6 probootstrap-animate">
                <div class="probootstrap-footer-widget">
                    <h3>哈哈调查</h3>
                    <p>值得你的信赖</p>
                    <ul class="probootstrap-footer-social">
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-facebook"></i></a></li>
                        <li><a href="#"><i class="icon-github"></i></a></li>
                        <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        <li><a href="#"><i class="icon-linkedin"></i></a></li>
                        <li><a href="#"><i class="icon-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- END row -->
        <div class="row">
            <div class="col-md-12 copyright probootstrap-animate">
                <p><small>Copyright &copy; 2019.哈哈调查网 All rights reserved.</small></p>
            </div>
        </div>
    </div>
</footer>


<!-- Modal login -->
<div class="modal fadeInUp probootstrap-animated" id="UserloginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog modal-md vertical-align-center">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-cross"></i></button>
                <div class="probootstrap-modal-flex">
                    <div class="probootstrap-modal-figure" style="background-image: url(img/modal_bg.jpg);"></div>
                    <div class="probootstrap-modal-content">
                        <h1 class="text">普通用户登录</h1>
                        <form action="user/login" class="probootstrap-form" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="用户名/Email/电话" name="name">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="密码" name="password">
                            </div>
                            <div class="form-group text-left">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-block" value="Sign In" id="userloginbtn">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group probootstrap-or">
                                <span><em>or</em></span>
                            </div>
                            <div class="form-group">
                                <a href="user/toRegister" class="btn btn-danger btn-block">没有账号？去注册</a>
                            </div>

<%--                            <button class="btn" data-toggle="modal" data-target="#UsersignupModal">注册</button>--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END modal login -->

<!-- Modal login -->
<div class="modal fadeInUp probootstrap-animated" id="ComploginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog modal-md vertical-align-center">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-cross"></i></button>
                <div class="probootstrap-modal-flex">
                    <div class="probootstrap-modal-figure" style="background-image: url(img/modal_bg.jpg);"></div>
                    <div class="probootstrap-modal-content">
                        <h1 class="text">企业用户登录</h1>
                        <form action="comp/login" class="probootstrap-form" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="用户名/Email/电话" name="name">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="密码" name="password">
                            </div>
                            <div class="form-group text-left">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-block" value="Sign In" id="comploginbtn">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group probootstrap-or">
                                <span><em>or</em></span>
                            </div>
                            <div class="form-group">
                                <a href="comp/toRegister" class="btn btn-danger btn-block">没有账号？去注册</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END modal login -->

<!-- Modal login -->
<div class="modal fadeInUp probootstrap-animated" id="adminloginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog modal-md vertical-align-center">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-cross"></i></button>
                <div class="probootstrap-modal-flex">
                    <div class="probootstrap-modal-figure" style="background-image: url(img/modal_bg.jpg);"></div>
                    <div class="probootstrap-modal-content">
                        <h1 class="text">管理员用户登录</h1>
                        <form action="admin/login" class="probootstrap-form" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="ID" name="id">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="密码" name="password">
                            </div>
                            <div class="form-group text-left">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-block" value="Sign In" id="adminloginbtn">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
<script src="js/scripts.min.js"></script>
<script src="js/custom.min.js"></script>
</body>
</html>
