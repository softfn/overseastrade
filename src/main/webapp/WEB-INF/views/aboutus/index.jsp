<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>About us</title>
</head>
<meta name="keywords" content="${aboutus.keywords}">
<body>
<div class="title">${aboutus.subject}</div>
<div style="padding: 0 20px">${aboutus.content}</div>
</body>
</html>
