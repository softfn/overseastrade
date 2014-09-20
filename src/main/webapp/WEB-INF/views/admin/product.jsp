<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Products</title>
</head>
<body>
<form class="form-inline" role="form" action="#">
    <a href="${ctx}/admin/product/add" class="btn btn-sm btn-default">Add</a>
    <div class="form-group">
        <div class="input-group input-group-sm">
            <div class="input-group-addon">Category:</div>
            <select class="form-control" name="search_EQ_category.id">
                <option value="">all</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}" <c:if test="${category.id == param[\"search_EQ_category.id\"]}">selected</c:if> >
                        ${category.name}
                    </option>
                </c:forEach>
            </select>
            <%--${param.search_LIKE_category}--%>
        </div>
        <div class="input-group input-group-sm">
            <div class="input-group-addon">Name:</div>
            <input class="form-control" type="text" name="search_LIKE_name" value="${param.search_LIKE_name}">
        </div>
    </div>
    <button type="submit" class="btn btn-sm btn-default" id="search_btn">Search</button>
    <tags:sort/>
</form>
<table id="contentTable" class="table table-striped  table-condensed">
    <thead>
    <tr>
        <th width="30px">ID</th>
        <th width="250px">Name</th>
        <th>Brief</th>
        <th width="150px">Create Time</th>
        <th width="140px">Manage</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productPage.content}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(product.name) > 30}">
                        <c:out value="${fn:substring(product.name, 0, 30)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${product.name}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(product.brief) > 80}">
                        <c:out value="${fn:substring(product.brief, 0, 80)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${product.brief}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td><fmt:formatDate value="${product.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/admin/product/edit/${product.id}">Edit</a>
                | <a href="${ctx}/products/view/${product.id}" target="_blank">View</a>
                | <a href="${ctx}/admin/product/delete/${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${productPage}" paginationSize="15"/>
</body>
</html>
