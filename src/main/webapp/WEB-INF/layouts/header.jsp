<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="logo"></div>
    <div id="sub">
        <input id="submit" name="submit" type="submit" value="SEARCH">
    </div>
    <div id="seo">
        <input id="search" name="search" type="text" max="50" value="Enter keywords here!" autocomplete="off" onfocus="if(this.value!='Enter keywords here!'){this.style.color='#666666'}else{this.value='';this.style.color='#666666'}" onblur="if(this.value==''){this.value='Enter keywords here!';this.style.color='#666666'}">
    </div>
</div>
<div id="menu">
    <div class="item"><a href="${ctx}/">Home</a></div>
    <div class="item"><a href="${ctx}/aboutus">About us</a></div>
    <div class="item"><a href="${ctx}/products">Products</a></div>
    <div class="item"><a href="${ctx}/news">News</a></div>
    <div class="item"><a href="${ctx}/download">Download</a></div>
    <div class="item"><a href="${ctx}/faq">FAQ</a></div>
    <div class="item"><a href="${ctx}/feedback">Feedback</a></div>
    <div class="item"><a href="${ctx}/contactus">Contact us</a></div>
</div>
<script type="text/javascript">
    $("#submit").click(function () {
        window.location.href = "${ctx}/products?search_LIKE_name=" + $("#search").val();
    });
</script>