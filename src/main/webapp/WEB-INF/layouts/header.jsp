<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="logo">
	    <a href="${ctx}">Overseas Trade</a>
    </div>
    <div id="sub">
        <input id="submit" name="submit" type="submit" value="SEARCH">
    </div>
    <div id="seo">
        <input id="search" name="search" type="text" max="50" value="Enter keywords here!" autocomplete="off" onfocus="if(this.value!='Enter keywords here!'){this.style.color='#666666'}else{this.value='';this.style.color='#666666'}" onblur="if(this.value==''){this.value='Enter keywords here!';this.style.color='#666666'}">
    </div>
</div>
<div id="menu">
    <div class="item">Home</div>
    <div class="item">About us</div>
    <div class="item">Products</div>
    <div class="item">News</div>
    <div class="item">Download</div>
    <div class="item">FAQ</div>
    <div class="item">Feedback</div>
    <div class="item">Contact us</div>
</div>