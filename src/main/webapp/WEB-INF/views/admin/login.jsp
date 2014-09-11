<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Overseas Trade - Login</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/static/bootstrap/3.2.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <%--<script src="${ctx}/static/validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>--%>
</head>

<body>
<div class="container">
    <form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal" role="form">
        <h2 class="col-sm-offset-5 form-signin-heading">Please sign in</h2>
        <%
            String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
            if(error != null){
        %>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-4 alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>Warning!</strong> Better check yourself, you're not looking too good.
            </div>
        </div>
        <%
            }
        %>
        <div class="form-group">
            <label for="username" class="col-sm-offset-2 col-sm-3 control-label">Username</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="username" name="username" value="${username}" placeholder="Username" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-offset-2 col-sm-3 control-label">Password</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-3">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="rememberMe" name="rememberMe"> Remember me
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-3">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        $("#loginForm").validate();
    });
</script>
</body>
</html>
