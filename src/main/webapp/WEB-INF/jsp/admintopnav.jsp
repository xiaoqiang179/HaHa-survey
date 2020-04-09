<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>


<nav class="navbar navbar-default" id="navbar">
    <div class="container-fluid">
        <div class="navbar-collapse collapse in">
            <ul class="nav navbar-nav navbar-mobile">
                <li>
                    <button type="button" class="sidebar-toggle">
                        <i class="fa fa-bars"></i>
                    </button>
                </li>
                <li class="logo">
                    <a class="navbar-brand" href="#"><span class="highlight">哈哈</span> 调查</a>
                </li>
                <li>
                    <button type="button" class="navbar-toggle">
                        <img class="profile-img" src="img/Mario.jpg">
                    </button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li class="navbar-title">欢迎宁${sessionScope.user.id}</li>

            </ul>
            <ul class="nav navbar-nav navbar-right">


                <li class="dropdown profile">
                    <a href="${pageContext.request.contextPath}/user/userprofile" class="dropdown-toggle"
                       data-toggle="dropdown">
                        <img class="profile-img img-thumbnail" src="img/Mario.jpg">
                        <div class="title">Profile</div>
                    </a>
                    <div class="dropdown-menu">
                        <div class="profile-info">
                            <h4 class="username">${sessionScope.user.id}</h4>
                        </div>
                        <ul class="action">
                            <li>
                                <a onclick="openadd()">
                                    添加admin
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/logout">
                                    登出
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加管理员</h4>
            </div>
            <div class="modal-body" id="details">

                <form id="add">

                    <div class="input-group">
                <span class="input-group-addon" id="basic-addon1">
                  <i class="fa fa-paper-plane" aria-hidden="true"></i></span>
                        <input type="text" class="form-control has-success" placeholder="用户名"
                               aria-describedby="basic-addon1" id="inname" name="id" autocomplete="off">
                    </div>

                    <div class="input-group">
                <span class="input-group-addon" id="basic-addon3">
                  <i class="fa fa-key" aria-hidden="true"></i></span>
                        <input type="password" class="form-control" placeholder="密&nbsp;码"
                               aria-describedby="basic-addon3" name="password" autocomplete="off">
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-success" id="addbtn">添加</button>
                <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function openadd() {
            $("#addmodal").modal("toggle")

        }
        $("#addbtn").click(function () {

            $.ajax({
                url: "${pageContext.request.contextPath}/admin/addadmin",
                type: "POST",
                data: $("#add").serialize(),
                success: function () {
                    $("#modal").modal("toggle")

                }
            })
        })

    </script>
</div>