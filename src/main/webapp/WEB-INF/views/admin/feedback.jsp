<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Feedback</title>
</head>
<body>
<form class="form-inline" role="form" action="#">
    <div class="form-group">
        <div class="input-group input-group-sm">
            <div class="input-group-addon">Title:</div>
            <input class="form-control" type="text" name="search_LIKE_title" value="${param.search_LIKE_title}">
        </div>
        <div class="input-group input-group-sm">
            <div class="input-group-addon">Name:</div>
            <section id="isss"></section>
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
        <th width="140px">Title</th>
        <th>Content</th>
        <th width="80px">Name</th>
        <th width="140px">Email</th>
        <th width="80px">Phone</th>
        <th width="120px">Country</th>
        <th width="150px">Feedback Time</th>
        <th width="60px">Manage</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${feedbacks.content}" var="feedback">
        <tr>
            <td>${feedback.id}</td>
            <td><a href="${ctx}/admin/feedback/view/${feedback.id}">${feedback.title}</a></td>
            <td>${feedback.content}</td>
            <td>${feedback.name}</td>
            <td>${feedback.email}</td>
            <td>${feedback.phone}</td>
            <td>${feedback.country}</td>
            <td><fmt:formatDate value="${feedback.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><a href="${ctx}/admin/feedback/delete/${feedback.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${feedbacks}" paginationSize="15"/>
</body>
</html>
