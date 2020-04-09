<%--
  Created by IntelliJ IDEA.
  User: jack
  Date: 2019/11/17
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="app-sidebar" id="sidebar">
    <div class="sidebar-header">
        <a class="sidebar-brand" href="#"><span class="highlight">哈哈</span> 调查</a>
        <button type="button" class="sidebar-toggle">
            <i class="fa fa-times"></i>
        </button>
    </div>
    <div class="sidebar-menu">
        <ul class="sidebar-nav">
            <li id="li1">
                <a href="${pageContext.request.contextPath}/admin/toadminindex">
                    <div class="icon">
                        <i class="fa fa-reorder (alias)" aria-hidden="true"></i>
                    </div>
                    <div class="title">用户</div>
                </a>
            </li>
            <li class="" id="li2">
                <a href="${pageContext.request.contextPath}/admin/toadmincompany">
                    <div class="icon">
                        <i class="fa fa-database" aria-hidden="true"></i>
                    </div>
                    <div class="title">公司用户</div>
                </a>
            </li>
            <li class="" id="li3">
                <a href="${pageContext.request.contextPath}/admin/toadminall">
                    <div class="icon">
                        <i class="fa fa-history" aria-hidden="true"></i>
                    </div>
                    <div class="title">所有调查</div>
                </a>
            </li>
            <li class="" id="li5">
                <a href="${pageContext.request.contextPath}/admin/toadminwait">
                    <div class="icon">
                        <i class="fa fa-gift" aria-hidden="true"></i>
                    </div>
                    <div class="title">待处理事项</div>
                </a>
            </li>
            <li class="" id="li4">
                <a href="${pageContext.request.contextPath}/admin/logout">
                    <div class="icon">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                    </div>
                    <div class="title">登出</div>
                </a>
            </li>
        </ul>
    </div>
    <div class="sidebar-footer">
        <ul class="menu">
            <li>
                <a href="${pageContext.request.contextPath}/">
                    <i class="fa fa-tag" aria-hidden="true"></i>回首页
                </a>
            </li>
        </ul>
    </div>
</aside>