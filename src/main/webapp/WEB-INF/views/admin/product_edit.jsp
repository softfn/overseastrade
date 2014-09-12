<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${product.name} Edit</title>
    <script charset="utf-8" src="${ctx}/static/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="${ctx}/static/kindeditor/lang/zh_CN.js"></script>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" action="${ctx}/admin/product/save" method="post">
        <input id="id" name="id" type="hidden" value="${product.id}">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Title</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" placeholder="name" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">Content</label>
            <div class="col-sm-8">
                <textarea class="form-control" id="description" name="description" required>${product.description}</textarea>
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
        $(".form-horizontal").validate();
        $("#description").css("height", $(document).height() - 200);
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="description"]', {
                allowFileManager: true
            });
        });
    })
</script>
</body>
</html>
