<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Feedback</title>
    <link href="${ctx}/static/validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <style>
        .red {
            color: red;
        }
        .row {
            min-height: 36px;
            vertical-align: middle;
        }
        .lable {
            float: left;
            width: 28%;
            height: 26px;
            line-height: 26px;
            text-align: right;
        }
        .field {
            float: right;
            width: 70%;
            height: 26px;
            line-height: 26px;
        }
        .field input {
            width: 300px;
            padding: 2px 4px;
            color: #676767;
        }
        .field textarea {
            width: 308px;
            height: 120px;
            color: #676767;
        }
        .error {
            padding-left: 4px;
        }
    </style>
</head>
<body>
<div class="title">Feedback</div>
<form id="feedbackForm" action="${ctx}/feedback/send" method="post">
    <div>
        <div class="row">
            <div class="lable"><label for="title"><span class="red">*</span> Title:</label></div>
            <div class="field"><input id="title" name="title" type="text" value="${email.title}" required autofocus></div>
        </div>
        <div class="row" style="height: 134px">
            <div class="lable"><label for="content"><span class="red">*</span> Content:</label></div>
            <div class="field"><textarea id="content" name="content" maxlength="1000" required>${email.content}</textarea></div>
        </div>
        <div class="row">
            <div class="lable"><label for="name"><span class="red">*</span> Name:</label></div>
            <div class="field"><input id="name" name="name" type="text" value="${email.name}" maxlength="50" required></div>
        </div>
        <div class="row">
            <div class="lable"><label for="email"><span class="red">*</span> E-mail:</label></div>
            <div class="field"><input id="email" name="email" type="text" value="${email.email}" required></div>
        </div>
        <div class="row">
            <div class="lable"><label for="phone"><span class="red">*</span> Phone:</label></div>
            <div class="field"><input id="phone" name="phone" type="text" value="${email.phone}" required></div>
        </div>
        <div class="row">
            <div class="lable"><label for="fax">Fax:</label></div>
            <div class="field"><input id="fax" name="fax" type="text" value="${email.fax}"></div>
        </div>
        <div class="row">
            <div class="lable"><label for="country"><span class="red">*</span> Country/Region:</label></div>
            <div class="field"><input id="country" name="country" type="text" value="${email.country}" required></div>
        </div>
        <div class="row">
            <div class="lable"><label for="company">Company: </label></div>
            <div class="field"><input id="company" name="company" type="text" value="${email.company}"></div>
        </div>
        <div class="row">
            <div class="lable"><label for="site">Home Page:</label></div>
            <div class="field"><input id="site" name="site" type="text" value="${email.site}"></div>
        </div>
        <%--<div class="row">
            <div class="lable"><label for="code"><span class="red"> *</span> Code:</label></div>
            <div class="field"><input id="code" name="code" type="text" required></div>
        </div>--%>
        <div class="row">
            <div class="lable"></div>
            <div class="field"><input type="submit" value="Submit" style="width: 50px"></div>
        </div>
    </div>
</form>
<script>
    $(document).ready(function() {
        $("#feedbackForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                email: {
                    required: true,
                    email: true
                }
            }
        });
    });
</script>
</body>
</html>
