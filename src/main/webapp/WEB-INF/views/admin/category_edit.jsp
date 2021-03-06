<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${category.name} Edit</title>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" action="${ctx}/admin/category/save" method="post">
        <input id="id" name="id" type="hidden" value="${category.id}">
        <input id="id" name="code" type="hidden" value="${category.code}">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Name</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="name" name="name" value="${category.name}" placeholder="name" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="category.id" class="col-sm-2 control-label">Parent Category</label>
            <div class="col-sm-8">
                <select class="form-control" id="category.id" name="category.id">
                    <option value="">none</option>
                    <c:forEach items="${categories}" var="cg">
                        <option value="${cg.id}" <c:if test="${cg.id == category.category.id}">selected</c:if>>
                            ${cg.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="isNew" class="col-sm-2 control-label">isNew</label>
            <div class="col-sm-8">
                <select class="form-control" id="isNew" name="isNew">
                    <option value="false" <c:if test="${!category.isNew}">selected</c:if>>False</option>
                    <option value="true" <c:if test="${category.isNew}">selected</c:if>>True</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="seq" class="col-sm-2 control-label">SEQ</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="seq" name="seq" value="${category.seq}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="submit" class="col-sm-2 control-label"></label>
            <div class="col-sm-8">
                <input type="submit" id="submit" value="Submit" class="btn btn-default btn-sm">
                <input type="button" id="back" value="Back" class="btn btn-default btn-sm pull-right" onclick="javascript:history.go(-1)">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var editor;
    $(document).ready(function () {
        var seq = $("#seq").val();
        if (!seq) {
            $("#seq").val(1);
        }
        $(".form-horizontal").validate({
            rules: {
                seq: {
                    digits: true
                }
            }
        });
    })
</script>
</body>
</html>
