<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>user edit</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/admin/profile" method="post" class="form-inline">
		<input type="hidden" name="id" value="${user.id}"/>
        <div class="form-group">
            <label for="name" class="control-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
        </div>
        <div class="form-group">
            <label for="plainPassword" class="control-label">Password</label>
            <input type="password" class="form-control" id="plainPassword" name="plainPassword" required>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-default" value="Submit"/>
        </div>
	</form>
	<script>
		$(document).ready(function() {
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
