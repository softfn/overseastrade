<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${product.name} - Product View</title>
    <meta name="description" content="${product.brief}"/>
    <meta name="keywords" content="${product.keywords}"/>
</head>
<body>
<div class="title">${product.name}</div>
<div style="float: right; height: 18px; padding-right: 20px; margin-top: -10px; clear: both; color: #adadad">
    Date:<fmt:formatDate value="${product.time}" pattern="dd/MM/yyyy"/>
</div>
<div style="line-height: 20px; padding: 0 6px 16px 6px; clear: both">
    ${product.brief}
    ${product.description}
</div>
<div style="float: right; height: 30px; padding-right: 14px; clear: both">
    <a href="#" onclick="cl()">Close</a>
</div>
<script type="text/javascript">
    function cl() {
        window.opener=null;
        window.open('', '_self', '');
        window.close();
    }
</script>
</body>
</html>
