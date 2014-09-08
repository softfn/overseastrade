<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>FAQ</title>
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
<meta name="keywords" content="${faq.keywords}">
<body>
<div class="title">${faq.subject}</div>
<div style="padding: 0 20px">${faq.content}</div>
</body>
</html>
