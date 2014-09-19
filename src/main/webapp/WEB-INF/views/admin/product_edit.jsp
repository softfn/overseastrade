<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <label for="name" class="col-sm-1 control-label">Name</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" placeholder="Product Name" required autofocus>
            </div>
            <label for="category.id" class="col-sm-1 control-label">Category</label>
            <div class="col-sm-3">
                <select class="form-control" id="category.id" name="category.id" required>
                    <option value=""></option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}" <c:if test="${category.id == product.category.id}">selected</c:if>>
                            ${category.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <label for="hot" class="col-sm-1 control-label">Hot</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="hot" name="hot" value="${product.hot}" placeholder="Product hot" required>
            </div>
        </div>
        <div class="form-group">
            <label for="keywords" class="col-sm-1 control-label">Keywords</label>
            <div class="col-sm-11">
                <input type="text" class="form-control" id="keywords" name="keywords" value="${product.keywords}" placeholder="Product Keywords" required>
            </div>
        </div>
        <div class="form-group">
            <label for="brief" class="col-sm-1 control-label">Brief</label>
            <div class="col-sm-11">
                <textarea class="form-control" id="brief" name="brief" rows="4" placeholder="Product Brief" required>${product.brief}</textarea>
            </div>
        </div>
        <c:forEach items="${product.pictures}" var="pic" varStatus="vs">
            <div class="form-group">
                <label class="col-sm-1 control-label">Picture${vs.count}</label>
                <input type="hidden" name="pictures[${vs.count - 1}].id" value="${pic.id}">
                <input type="hidden" name="pictures[${vs.count - 1}].product.id" value="${pic.product.id}">
                <input type="hidden" name="pictures[${vs.count - 1}].seq" value="${pic.seq}">
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="pictures[${vs.count - 1}].name" value="${pic.name}" placeholder="Picture name" required>
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="pictures[${vs.count - 1}].path" value="${pic.path}" placeholder="Picture path" readonly required>
                </div>
                <div class="col-sm-1">
                    <input type="button" value="Select" onclick="selectPic('pictures[${vs.count - 1}].path')" class="btn btn-default btn-sm">
                </div>
            </div>
        </c:forEach>
        <div class="form-group">
            <label class="col-sm-1 control-label">Related products</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="referProducts[0].id" value="${product.referProducts[0].id}" placeholder="Related Product id">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="referProducts[1].id" value="${product.referProducts[1].id}" placeholder="Related Product id">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="referProducts[2].id" value="${product.referProducts[2].id}" placeholder="Related Product id">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="referProducts[3].id" value="${product.referProducts[3].id}" placeholder="Related Product id">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="referProducts[4].id" value="${product.referProducts[4].id}" placeholder="Related Product id">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-1 control-label">Description</label>
            <div class="col-sm-11">
                <textarea class="form-control" id="description" name="description"  rows="30" required>${product.description}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="submit" class="col-sm-1 control-label"></label>
            <div class="col-sm-11">
                <input type="submit" id="submit" value="Submit" class="btn btn-default btn-sm">
                <input type="button" id="back" value="Back" class="btn btn-default btn-sm pull-right" onclick="javascript:history.go(-1)">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var editor;
    $(document).ready(function () {
        var seq = $("#hot").val();
        if (!seq) {
            $("#hot").val(1);
        }
        $(".form-horizontal").validate({
            rules: {
                hot: {
                    digits: true
                }
            }
        });
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="description"]', {
                allowFileManager: true
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
