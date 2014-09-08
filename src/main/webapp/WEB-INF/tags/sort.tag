<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-group pull-right">
    <button type="button" class="btn btn-default btn-sm">Sort : ${sortTypes[sortType]}</button>
    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <c:forEach items="${sortTypes}" var="entry">
            <li role="presentation"><a role="menuitem" href="?sortType=${entry.key}&${searchParams}">${entry.value}</a></li>
        </c:forEach>
    </ul>
</div>