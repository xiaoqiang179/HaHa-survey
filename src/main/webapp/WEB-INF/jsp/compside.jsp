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
                <a href="${pageContext.request.contextPath}/comp/compindex">
                    <div class="icon">
                        <i class="fa fa-tasks" aria-hidden="true"></i>
                    </div>
                    <div class="title">情况</div>
                </a>
            </li>
            <li class="" id="li2">
                <a href="${pageContext.request.contextPath}/comp/tocompshowall">
                    <div class="icon">
                        <i class="fa fa-database" aria-hidden="true"></i>
                    </div>
                    <div class="title">你的题集</div>
                </a>
            </li>
            <li class="" id="li3">
                <a href="${pageContext.request.contextPath}/comp/toaddbatch">
                    <div class="icon">
                        <i class="fa fa-history" aria-hidden="true"></i>
                    </div>
                    <div class="title">添加题集</div>
                </a>
            </li>
            <li class="" id="li4">
                <a href="${pageContext.request.contextPath}/comp/tostat">
                    <div class="icon">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                    </div>
                    <div class="title">结果汇总</div>
                </a>
            </li>
            <li class="" id="li5">
                <a href="${pageContext.request.contextPath}/comp/logout">
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