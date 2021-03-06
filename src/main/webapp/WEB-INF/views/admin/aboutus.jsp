<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>About us</title>
    <link rel="stylesheet" href="${ctx}/static/kindeditor/themes/default/default.css"/>
    <script charset="utf-8" src="${ctx}/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="${ctx}/static/kindeditor/lang/zh_CN.js"></script>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" action="${ctx}/admin/article/save" method="post">
        <input id="id" name="id" type="hidden" value="aboutus">
        <div class="form-group">
            <label for="subject" class="col-sm-2 control-label">Subject</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="subject" name="subject" value="${aboutus.subject}" placeholder="subject"  required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="keywords" class="col-sm-2 control-label">Keywords</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="keywords" name="keywords" value="${aboutus.keywords}" placeholder="keywords">
            </div>
        </div>
        <div class="form-group">
            <label for="keywords" class="col-sm-2 control-label">Content</label>
            <div class="col-sm-8">
                <textarea class="form-control" id="content" name="content" required>${aboutus.content}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="keywords" class="col-sm-2 control-label"></label>
            <div class="col-sm-8">
                <input type="submit" id="submit" value="Submit" class="btn btn-default btn-sm">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var editor;
    $(document).ready(function () {
        $(".form-horizontal").validate();
        $("#content").css("height", $(document).height() - 220);
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="content"]', {
                allowFileManager: true
            });
        });
    })
</script>
</body>
</html>
