<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${product.name} - Product View</title>
    <meta name="description" content="${product.brief}"/>
    <meta name="keywords" content="${product.keywords}"/>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5419d03b6dfc1612"></script>
    <style>
        .section { height: 25px; line-height: 25px; font-weight: bold; font-size: 13px; border-bottom: 1px solid #CCC; clear: both; margin: 8px }
        .pic { height: 280px; }
        .picItem { width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0; }
        .picItem img { cursor: pointer; border: 1px solid #dfdfdf; width: 66px; height: 70px; }
    </style>
</head>
<body>
<div>
    <div style="width: 280px; height: 360px; float: left;">
        <div class="pic">
            <img src="${ctx}${product.pictures[0].path}" title="${product.pictures[0].name}" width="280px" height="280px">
        </div>
        <div>
            <c:forEach items="${product.pictures}" var="pic">
                <div class="picItem">
                    <img src="${ctx}${pic.path}" title="${pic.name}">
                </div>
            </c:forEach>
        </div>
    </div>
    <div style="width: 480px; min-height: 360px; float: right; margin-right: 10px">
        <div style="height:30px; line-height: 30px; font-weight: bold; font-size: 13px" title="${product.name}">
            <c:choose>
                <c:when test="${fn:length(product.name) > 60}">
                    <c:out value="${fn:substring(product.name, 0, 60)}…" />
                </c:when>
                <c:otherwise>
                    <c:out value="${product.name}" />
                </c:otherwise>
            </c:choose>
        </div>
        <div style="line-height: 20px; height: 260px">
            <c:choose>
                <c:when test="${fn:length(product.brief) > 1000}">
                    <c:out value="${fn:substring(product.brief, 0, 1000)}…" />
                </c:when>
                <c:otherwise>
                    <c:out value="${product.brief}" />
                </c:otherwise>
            </c:choose>
        </div>
        <div style="margin-bottom: 6px">
            <a href="${ctx}/feedback?title=${product.name}"><img src="${ctx}/static/images/contactus.jpg" style="border: 0"></a>
        </div>
        <!-- Go to www.addthis.com/dashboard to customize your tools -->
        <div class="addthis_sharing_toolbox"></div>
    </div>
</div>
<div class="section">Detailed description</div>
<div style="line-height: 20px; padding: 0 6px 16px 6px; clear: both">
    ${product.description}
</div>
<div class="section">Related products</div>
<div class="product-grid" style="min-height: 150px;">
    <c:forEach items="${product.referProducts}" var="refProduct">
        <div class="rel-product-item">
            <a href="${ctx}/products/view/${refProduct.id}" target="_blank" style="">
                <img src="${ctx}${refProduct.pictures[0].path}" style="width: 140px; height: 160px;
                border: 1px solid #ededed;" title="${refProduct.name}">
            </a>
        </div>
    </c:forEach>
</div>
<div style="float: right; height: 30px; padding-right: 14px; clear: both">
    <a href="#" onclick="cl()" style="color: #000000; text-decoration: underline;">Close</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:history.go(-1);" style="color: #000000; text-decoration: underline;">Back</a>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".picItem img").mousemove(function () {
            var imgUrl = $(this).attr("src");
            $(".pic img").attr("src", imgUrl);
        });
    });

    function cl() {
        window.opener=null;
        window.open('', '_self', '');
        window.close();
    }
</script>
</body>
</html>
