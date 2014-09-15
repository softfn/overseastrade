<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${product.name} - Product View</title>
    <meta name="description" content="${product.brief}"/>
    <meta name="keywords" content="${product.keywords}"/>
    <style>
        .section {
            height: 25px;
            line-height: 25px;
            font-weight: bold;
            font-size: 13px;
            border-bottom: 1px solid #CCC;
            clear: both;
            margin: 8px
        }
    </style>
</head>
<body>
<div>
    <div style="width: 280px; height: 400px; float: left;">
        <div style="height: 320px;"></div>
        <div>
            <div style="width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0;"></div>
            <div style="width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0;"></div>
            <div style="width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0;"></div>
            <div style="width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0;"></div>
        </div>
    </div>
    <div style="width: 480px; min-height: 400px; float: right; margin-right: 10px">
        <div style="height:30px; line-height: 30px; font-weight: bold; font-size: 13px">${product.name}</div>
        <div style="line-height: 20px;">${product.brief}</div>
        <div></div>
        <div></div>
    </div>
</div>
<div class="section">Detailed description</div>
<div style="line-height: 20px; padding: 0 6px 16px 6px; clear: both">
    ${product.description}
</div>
<div class="section">Related products</div>
<div class="product-grid" style="min-height: 230px; ">
    <div class="product-item"></div>
    <div class="product-item"></div>
    <div class="product-item"></div>
    <div class="product-item"></div>
</div>
<div style="float: right; height: 30px; padding-right: 14px; clear: both">
    <a href="#" onclick="cl()">Close</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:history.go(-1)">Back</a>
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
