<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title><sitemesh:title/> - Overseas Trade Backend</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/bootstrap/3.2.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
    <link href="${ctx}/static/styles/backend.css" type="text/css" rel="stylesheet"/>
    <sitemesh:head/>
    <style>
        body {
            min-height: 600px;
            padding-top: 60px;
        }
    </style>
</head>

<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:void(0)">Overseas Trade Backend</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li id="home"><a href="${ctx}/admin/home">Home</a></li>
                <li id="aboutus"><a href="${ctx}/admin/aboutus">About us</a></li>
                <li id="products"><a href="${ctx}/admin/products">Products</a></li>
                <li id="news"><a href="${ctx}/admin/news">News</a></li>
                <li id="download"><a href="${ctx}/admin/download">Download</a></li>
                <li id="faq"><a href="${ctx}/admin/faq">FAQ</a></li>
                <li id="feedback"><a href="${ctx}/admin/feedback">Feedback</a></li>
                <li id="contactus"><a href="${ctx}/admin/contactus">Contact us</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><shiro:principal property="name"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <%--<shiro:hasRole name="admin">--%>
                            <%--<li><a href="${ctx}/admin/user">Admin Users</a></li>--%>
                            <%--<li class="divider"></li>--%>
                        <%--</shiro:hasRole>--%>
                        <li><a href="${ctx}/admin/profile">Edit Profile</a></li>
                        <li><a href="${ctx}/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <sitemesh:body/>
</div>
<script src="${ctx}/static/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#"+"${activeId}").addClass("active");
</script>
</body>
</html>