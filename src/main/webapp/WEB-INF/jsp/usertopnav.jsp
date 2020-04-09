<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<div class="modal fade" id="modalsearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">搜索结果</h4>
            </div>
            <div class="modal-body" id="searchbody">
                <div class="table-responsive">
                    <table class="table card-table">
                        <thead>
                        <tr>
                            <th>调查题目</th>
                            <th>相关话题</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="resulttable">


                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
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
                        <img class="profile-img img-thumbnail" src="${sessionScope.user.iconfilename}">
                    </button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li class="navbar-title">欢迎宁：${sessionScope.user.name}</li>
                <li class="navbar-search hidden-sm">
                    <input id="search" type="text" placeholder="Search..">
                    <button class="btn-search" id="searchbtn"><i class="fa fa-search"></i></button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">


                <li class="dropdown profile">
                    <a href="${pageContext.request.contextPath}/user/userprofile" class="dropdown-toggle" data-toggle="dropdown">
                        <img class="profile-img img-thumbnail" src="${sessionScope.user.iconfilename}">
                        <div class="title">Profile</div>
                    </a>
                    <div class="dropdown-menu">
                        <div class="profile-info">
                            <h4 class="username">${user.name}</h4>
                        </div>
                        <ul class="action">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/userprofile">
                                    修改资料
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
<script type="text/javascript" src="js/message.js"></script>
<script type="text/javascript">
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
    $("#searchbtn").click(function () {
        var data=$("#search").val();
        if(data==""){
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/qust/processsearch",
            type:"POST",
            data:{
                keyWord:$("#search").val()
            },
            success:function (data) {
                $("#resulttable").empty()
                $.each(data,function (index,batch) {
                    var ele="<tr>\n" +
                        "                                <td>"+batch.batchname+"</td>\n" +
                        "                                <td>"+batch.desp+"</td>\n" +
                        "                                        <td><button type=\"button\" class=\"btn btn-default btn-xs btn-success\" onclick=\"check('"+batch.id+"')\">去做调查</button></td>\n" +
                        "                            </tr>"
                    $("#resulttable").append(ele)
                })
                $("#modalsearch").modal("toggle")
            }
        })
    })
</script>