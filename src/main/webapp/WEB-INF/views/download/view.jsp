<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${viewDownload.title} - Download View</title>
</head>
<body>
<div class="title">${viewDownload.title}</div>
<div style="float: right; height: 16px; padding-right: 20px; margin-top: -10px; clear: both">
    Date:<fmt:formatDate value="${viewDownload.time}" pattern="dd/MM/yyyy"/>
</div>
<div style="line-height: 20px; padding: 0 6px 16px 6px; clear: both">
    ${viewDownload.content}
</div>
<div style="float: right; height: 30px; padding-right: 14px; clear: both">
    <a href="#" onclick="cl()" style="color: #000000; text-decoration: underline;">Close</a>&nbsp;&nbsp;&nbsp;
    <a href="javascript:history.go(-1);" style="color: #000000; text-decoration: underline;">Back</a>
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
