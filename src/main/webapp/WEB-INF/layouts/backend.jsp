<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Overseas Trade Backend - <sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/bootstrap/3.2.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>

    <sitemesh:head/>
</head>

<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Overseas Trade Backend</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${ctx}/">Home</a></li>
                <li><a href="#about">About us</a></li>
                <li><a href="#about">Products</a></li>
                <li><a href="#about">News</a></li>
                <li><a href="#about">Download</a></li>
                <li><a href="#about">FAQ</a></li>
                <li><a href="#about">Feedback</a></li>
                <li><a href="#contact">Contact us</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><shiro:principal property="name"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <shiro:hasRole name="admin">
                            <li><a href="${ctx}/admin/user">Admin Users</a></li>
                            <li class="divider"></li>
                        </shiro:hasRole>
                        <li><a href="${ctx}/profile">Edit Profile</a></li>
                        <li><a href="${ctx}/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div id="content">
        <div id="left">

        </div>
        <div id="right"><sitemesh:body/></div>
    </div>
    <%@ include file="/WEB-INF/layouts/footer.jsp" %>
</div>

</body>
</html>