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
        .entry { margin: 10px 10px 0px 6px; border-bottom: 1px solid #dedede; height: 90px; }
        .entry a { color: #000000; text-decoration: none; } .entry a:hover { text-decoration: none; color: #3681AE; }
        .etlf { float: left; height: 80px; width: 110px; } .etmd { float: left; height: 80px; width: 560px; } .etrt { float: right; width: 70px; height: 80px; vertical-align: middle; }
        .badge { display: inline-block; min-width: 10px; padding: 3px 7px; font-size: 12px; font-weight: 500; line-height: 1; color: #fff; text-align: center; white-space: nowrap; vertical-align: baseline; background-color: #79A6C8; border-radius: 8px; margin-bottom: 6px; }
        .selected { background-color: #3fa3d7 !important; } .badge a { color: #fff; text-decoration: none; }
        .pic { width: 84px; height: 78px; border: 1px solid #f4f4f4; } .picView { display: none; position: absolute; z-index: 1000 }
        #productContainer{ width: 768px; padding-bottom: 10px; height: auto; clear: both; }
        .porductGrid { width: 170px; min-height:100px; padding: 6px; background:#fff; margin: 4px; font-size: 12px; float: left; border: 1px solid #f0f0f0; cursor: pointer; }
        .gridOver { background-color: #f3f3f3; border: 1px solid #d1d1d1 !important; box-shadow: 0 1px 3px rgba(34,25,25,0.4); -moz-box-shadow: 0 1px 3px rgba(34,25,25,0.4); -webkit-box-shadow: 0 1px 3px rgba(34,25,25,0.4); }
        .porductGrid strong { border-bottom:1px dashed #ccc; margin: 4px 0; display: block; padding: 0 0 5px; font-size: 12px; }
        .porductGrid p { height: 38px; }
        .porductGrid .imgholder img{ width: 170px; height: 170px; background:#ccc; display: block; }
    </style>
</head>
<body>
<div class="title">Products
    <c:if test="${toggle == 1}">
        <img src="${ctx}/static/images/v11.png" title="switch display">
        <img src="${ctx}/static/images/v22.png" title="switch display" onclick="toggle(2);">
    </c:if>
    <c:if test="${toggle == 2}">
        <img src="${ctx}/static/images/v12.png" title="switch display" onclick="toggle(1);">
        <img src="${ctx}/static/images/v21.png" title="switch display">
    </c:if>
</div>
<div style="margin-top: -12px">
    <c:forEach items="${subCategory}" var="sc">
        <c:choose>
            <c:when test="${sc.id == categoryId}">
                <span class="badge selected"><a href="${ctx}/products/category/${sc.id}?toggle=${toggle}">${sc.name}</a></span>
            </c:when>
            <c:otherwise>
                <span class="badge"><a href="${ctx}/products/category/${sc.id}?toggle=${toggle}">${sc.name}</a></span>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
<c:if test="${toggle == 1}">
    <c:forEach items="${productPage.content}" var="pp">
        <div class="entry">
            <span class="etlf">
                <img class="pic" src="${ctx}${pp.pictures[0].path}">
                <c:if test="${fn:length(pp.pictures) > 0}">
                    <div class="picView">
                        <img src="${ctx}${pp.pictures[0].path}" width="260px" style="border: 1px solid #ededed;">
                    </div>
                </c:if>
            </span>
            <span class="etmd">
                <span style="display: block">
                    <a href="${ctx}/products/view/${pp.id}" style="font-weight: bold;">
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
                <span style="line-height: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${ctx}/products/view/${pp.id}" style="color: #000000">
                        <c:choose>
                            <c:when test="${fn:length(pp.brief) > 290}">
                                <c:out value="${fn:substring(pp.brief, 0, 290)}…" />
                            </c:when>
                            <c:otherwise>
                                <c:out value="${pp.brief}" />
                            </c:otherwise>
                        </c:choose>
                    </a>
                </span>
            </span>
            <span class="etrt"><fmt:formatDate value="${pp.time}" pattern="dd/MM/yyyy"/></span>
        </div>
    </c:forEach>
</c:if>
<c:if test="${toggle == 2}">
<div id="productContainer">
    <c:forEach items="${productPage.content}" var="pp">
        <div class="porductGrid" productId="${pp.id}">
            <div class="imgholder">
                <img src="${ctx}${pp.pictures[0].path}" />
            </div>
            <strong>
                <c:choose>
                    <c:when test="${fn:length(pp.name) > 24}">
                        <c:out value="${fn:substring(pp.name, 0, 24)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${pp.name}" />
                    </c:otherwise>
                </c:choose>
            </strong>
            <p>
                <c:choose>
                    <c:when test="${fn:length(pp.brief) > 70}">
                        <c:out value="${fn:substring(pp.brief, 0, 70)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${pp.brief}" />
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </c:forEach>
</div>
</c:if>
<div style="clear: both"><div id="Pagination" class="pagination"></div></div>
<script type="text/javascript">
    var url = "/products";
    var curPage = ${productPage.number};
    var perSize = ${productPage.size};
    var count = ${productPage.totalElements};
    var id = "${id}";
    $(document).ready(function () {
        if (id) {
            url += "/category/${id}"
        }
        $("#Pagination").pagination(count, {
            current_page: curPage,
            items_per_page: perSize,
            callback: function (index) {
                if (curPage != index) {
                    window.location.href = "${ctx}" + url + "?&toggle=${toggle}&${searchParams}&page=" + (index + 1) ;
                }
            }
        });
        <c:if test="${toggle == 1}">
            $(".pic").mouseover(function () {
                var left = $(this).offset().left + 83;
                var top = $(this).offset().top;
                $(this).parent().find(".picView").css({top:top,left:left}).show();
            }).mouseout(function () {
                $(this).parent().find(".picView").hide();
            });
        </c:if>
        <c:if test="${toggle == 2}">
            $(".porductGrid").mouseover(function() {
                $(this).addClass("gridOver");
            }).mouseout(function () {
                $(this).removeClass("gridOver");
            }).click(function () {
                var productId = $(this).attr("productId");
                window.location.href = "${ctx}/products/view/" + productId ;
            });
        </c:if>
    });

    function toggle(v) {
        window.location.href = "${ctx}" + url + "?&toggle="+v+"&${searchParams}" ;
    }
</script>
</body>
</html>
