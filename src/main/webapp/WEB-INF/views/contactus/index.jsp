<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Contact us</title>
    <style>
        .title {
            height: 26px;
            line-height: 26px;
            padding: 0 10px;
            font-weight: bold;
            color: #3680ad;
            background-color: #f4f4f4;
            margin-bottom: 20px;
        }
    </style>
</head>
<meta name="keywords" content="${contactus.keywords}">
<body>
<div class="title">${contactus.subject}</div>
<div style="padding: 0 20px">${contactus.content}</div>
</body>
</html>
