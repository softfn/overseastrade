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
    <link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <%--<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>--%>
</head>

<body>

<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
	<%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){
	%>
		<div class="alert alert-error input-medium controls">
			<button class="close" data-dismiss="alert">×</button>登录失败，请重试.
		</div>
	<%
	}
	%>
        <div class="container">
            <form class="form-signin" role="form">
                <h2 class="form-signin-heading">Please sign in</h2>

                <div class="row">
                    <div class="col-md-2">
                        <input id="username" name="username" type="text" value="${username}" class="form-control required" placeholder="Username" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <input id="password" name="password" type="password" class="form-control required" placeholder="Password" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <input id="rememberMe" name="rememberMe" type="checkbox" value="remember-me"> Remember me
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <button class="btn btn-sm btn-primary" type="submit">Sign in</button>
                    </div>
                </div>
            </form>
        </div>
</form>

<script>
    $(document).ready(function() {
        $("#loginForm").validate();
    });
</script>
</body>
</html>
