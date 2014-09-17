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
        .pic {
            height: 280px;
        }
        .picItem {
            width: 66px; height: 70px; float: left; margin: 4px 4px 4px 0;
        }
        .picItem img {
            cursor: pointer;
            border: 1px solid #dfdfdf;
            width: 66px;
            height: 70px;
        }
    </style>
</head>
<body>
<div>
    <div style="width: 280px; height: 360px; float: left;">
        <div class="pic">
            <img src="${ctx}${product.pictures[0].path}" title="${product.pictures[0].name}" width="280px" height="280px">
        </div>
        <div>
            <c:forEach items="${product.pictures}" var="picture">
                <div class="picItem">
                    <img src="${ctx}${picture.path}" title="${picture.name}">
                </div>
            </c:forEach>
        </div>
    </div>
    <div style="width: 480px; min-height: 360px; float: right; margin-right: 10px">
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
    <a href="#" onclick="cl()">Close</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:history.go(-1);">Back</a>
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
