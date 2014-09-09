<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${feedback.title}</title>
</head>
<body>
<form class="form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-2 control-label">Feedback Info</label>
        <div class="col-sm-10">
            <button type="button" class="btn btn-default btn-sm pull-right" onclick="javascript:history.go(-1)">Back</button>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Title:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.title}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Content:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.content}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Name:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.name}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Email:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.email}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Phone:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.phone}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Fax:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.fax}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Country:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.country}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Company:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.company}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Site:</label>
        <div class="col-sm-10">
            <p class="form-control-static">${feedback.site}</p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">Time:</label>
        <div class="col-sm-10">
            <p class="form-control-static"><fmt:formatDate value="${feedback.time}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
        </div>
    </div>
</form>
</body>
</html>
