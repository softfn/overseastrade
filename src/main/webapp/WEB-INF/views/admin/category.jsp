<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Category</title>
</head>
<body>
<form class="form-inline" role="form" action="#">
    <a href="${ctx}/admin/category/add" class="btn btn-sm btn-default">Add</a>
    <div class="form-group">
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
        <th>Name</th>
        <th width="200px">Parent Category</th>
        <th width="60px">SEQ</th>
        <th width="150px">Create Time</th>
        <th width="100px">Manage</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${categoryPage.content}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(category.name) > 90}">
                        <c:out value="${fn:substring(category.name, 0, 90)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${category.name}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(category.category.name) > 90}">
                        <c:out value="${fn:substring(category.category.name, 0, 90)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${category.category.name}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${category.seq}</td>
            <td><fmt:formatDate value="${category.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><a href="${ctx}/admin/category/edit/${category.id}">Edit</a> | <a href="${ctx}/admin/category/delete/${category.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${categoryPage}" paginationSize="15"/>
</body>
</html>
