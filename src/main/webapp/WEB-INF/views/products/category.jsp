<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Products ${title}</title>
    <link href="${ctx}/static/pagination/pagination.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/pagination/jquery.pagination.js" type="text/javascript"></script>
    <style type="text/css">
        .entry {
            margin: 0 20px 0 6px;
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid #dedede;
        }

        .etlf {
            float: left;
            background: url("${ctx}/static/images/ar.gif") no-repeat 8px 8px;
            text-indent: 1.5em;
        }

        .etlf a {
            color: #000000;
            text-decoration: none;
        }

        .etlf a:hover {
            text-decoration: none;
            color: #3681AE;
            font-weight: bold;
        }

        .etrt {
            float: right;
        }
        .badge {
            display: inline-block;
            min-width: 10px;
            padding: 3px 7px;
            font-size: 12px;
            font-weight: 500;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            background-color: rgba(58, 157, 205, 0.64);
            border-radius: 8px;
            margin-bottom: 6px;
        }
        .selected {
            background-color: #3fa3d7 !important;
        }
        .badge a {
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="title">Products
    <img src="${ctx}/static/images/v2${toggle}.png" title="switch display" onclick="toggle(${toggle1});">
    <img src="${ctx}/static/images/v1${toggle}.png" title="switch display" onclick="toggle(${toggle1});">
</div>
<div style="margin-top: -12px">
    <c:forEach items="${subCategory}" var="sc">
        <c:choose>
            <c:when test="${sc.id == categoryId}">
                <span class="badge selected"><a href="${ctx}/products/category/${sc.id}">${sc.name}</a></span>
            </c:when>
            <c:otherwise>
                <span class="badge"><a href="${ctx}/products/category/${sc.id}">${sc.name}</a></span>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
<c:forEach items="${productPage.content}" var="pp">
    <div class="entry">
        <span class="etlf">
            <a href="${ctx}/products/view/${pp.id}">
                <c:choose>
                    <c:when test="${fn:length(pp.name) > 90}">
                        <c:out value="${fn:substring(pp.name, 0, 90)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${pp.name}" />
                    </c:otherwise>
                </c:choose>
            </a>
        </span>
        <span class="etrt"><fmt:formatDate value="${pp.time}" pattern="dd/MM/yyyy"/></span>
    </div>
</c:forEach>
<div id="Pagination" class="pagination"></div>
<script type="text/javascript">
    var curPage = ${productPage.number};
    var perSize = ${productPage.size};
    var count = ${productPage.totalElements};
    $(document).ready(function () {
        $("#Pagination").pagination(count, {
            current_page: curPage,
            items_per_page: perSize,
            callback: function (index) {
                if (curPage != index) {
                    window.location.href = "${ctx}/products/category/${id}?&toggle=${toggle}&${searchParams}&page=" + (index + 1) ;
                }
            }
        });
    });

    function toggle(v) {
        window.location.href = "${ctx}/products/category/${id}?&toggle="+v+"&${searchParams}" ;
    }
</script>
</body>
</html>
