<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>News</title>
</head>
<body>
<form class="form-inline" role="form" action="#">
    <a href="${ctx}/admin/news/add" class="btn btn-sm btn-default">Add</a>
    <div class="form-group">
        <div class="input-group input-group-sm">
            <div class="input-group-addon">Title:</div>
            <input class="form-control" type="text" name="search_LIKE_title" value="${param.search_LIKE_title}">
        </div>
    </div>
    <button type="submit" class="btn btn-sm btn-default" id="search_btn">Search</button>
    <tags:sort/>
</form>
<table id="contentTable" class="table table-striped  table-condensed">
    <thead>
    <tr>
        <th width="30px">ID</th>
        <th width="250px">Title</th>
        <th>Content</th>
        <th width="150px">Create Time</th>
        <th width="100px">Manage</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${newses.content}" var="news">
        <tr>
            <td>${news.id}</td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(news.title) > 30}">
                        <c:out value="${fn:substring(news.title, 0, 30)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${news.title}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${fn:length(news.content) > 90}">
                        <c:out value="${fn:substring(news.content, 0, 90)}…" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${news.content}" />
                    </c:otherwise>
                </c:choose>
            </td>
            <td><fmt:formatDate value="${news.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><a href="${ctx}/admin/news/edit/${news.id}">Edit</a> | <a href="${ctx}/admin/news/delete/${news.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${newses}" paginationSize="15"/>
</body>
</html>
