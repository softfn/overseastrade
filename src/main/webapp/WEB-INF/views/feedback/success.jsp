<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Feedback</title>
    <link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <meta http-equiv="refresh" content="3;url=${ctx}/products">
</head>
<body>
<div class="title">Feedback</div>
<div style="height: 60px; line-height: 60px; padding-left: 60px">Thanks! We will contact you as soon as possible.</div>
</body>
</html>
