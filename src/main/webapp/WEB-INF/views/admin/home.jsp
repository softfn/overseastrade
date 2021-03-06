<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="${ctx}/static/kindeditor/themes/default/default.css" />
    <script src="${ctx}/static/kindeditor/kindeditor.js" type="text/javascript"></script>
    <script src="${ctx}/static/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" action="${ctx}/admin/home/save" method="post">
        <div class="form-group">
            <label class="col-sm-1 control-label">Pixel:</label>
            <label class="col-sm-1 control-label">730 X 260</label>
            <div class="col-sm-10">
                <input type="button" id="uploadPicture" value="Batch Upload Picture" class="btn btn-default btn-sm">
            </div>
        </div>
        <c:forEach items="${homes}" var="home" varStatus="vs">
            <input name="homes[${vs.count - 1}].id" type="hidden" value="${home.id}">
            <input name="homes[${vs.count - 1}].seq" type="hidden" value="${vs.count}">
            <div class="form-group">
                <label class="col-sm-1 control-label">Product${vs.count}</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control refer" name="homes[${vs.count - 1}].referId" value="${home.referId}" placeholder="Refer Product Id" required>
                </div>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="homes[${vs.count - 1}].name" value="${home.name}" placeholder="Product Name" required>
                </div>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="homes[${vs.count - 1}].path" value="${home.path}" placeholder="Picture Path" readonly required>
                </div>
                <div class="col-sm-1">
                    <input type="button" value="Select" onclick="selectPic('homes[${vs.count - 1}].path')" class="btn btn-default btn-sm" required>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-10 col-sm-offset-1">
                    <input type="text" class="form-control" name="homes[${vs.count - 1}].brief" value="${home.brief}" placeholder="Product Brief" required>
                </div>
            </div>
        </c:forEach>
        <div class="form-group">
            <label for="submit" class="col-sm-1 control-label"></label>
            <div class="col-sm-8">
                <input type="submit" id="submit" value="Submit" class="btn btn-default btn-sm">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var editor;
    KindEditor.ready(function(K) {
        $(".form-horizontal").validate();
        editor = K.editor({
            allowFileManager : true
        });
        K('#uploadPicture').click(function() {
            editor.loadPlugin('multiimage', function() {
                editor.plugin.multiImageDialog({
                    clickFn : function(urlList) {
                        K.each(urlList, function(i, data) {
//                            div.append('<img src="' + data.url + '">');
                        });
                        editor.hideDialog();
                    }
                });
            });
        });
    });

    function selectPic(inputName) {
        editor.loadPlugin('filemanager', function() {
            editor.plugin.filemanagerDialog({
                viewType : 'VIEW',
                dirName : 'image',
                clickFn : function(url, title) {
                    $("input[name='"+inputName+"']").val(url);
                    editor.hideDialog();
                }
            });
        });
    }
</script>
</body>
</html>
