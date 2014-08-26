<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Overseas Trade : <sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon1.ico" rel="shortcut icon">
<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>

<sitemesh:head/>
</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
        <div id="content">
            <div id="left">
                <div id="product-categories">
                    <div class="grid-header">Product Categories</div>
                    <div class="grid-container"></div>
                </div>
                <div id="latest-news">
                    <div class="grid-header">Latest News</div>
                    <div class="grid-container"></div>
                </div>
                <div id="contact-us">
                    <div class="grid-header">Contact Us</div>
                    <div class="grid-container"></div>
                </div>
            </div>
            <div id="right"><sitemesh:body/></div>
        </div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
</body>
</html>