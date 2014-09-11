<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title/> - Overseas Trade</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>

<sitemesh:head/>
</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
        <div id="container">
            <div id="left">
                <div id="product-categories">
                    <div class="grid-header">Product Categories</div>
                    <div class="grid-container">
                        <ul>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a> <img src="${ctx}/static/images/new.gif"></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas dffe</a> <img src="${ctx}/static/images/new.gif"></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a> <img src="${ctx}/static/images/new.gif"></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                            <li><img src="${ctx}/static/images/news.gif"> <a href="${ctx}/products/class/ufewfwef23fwe">Shenzhen Overseas</a></li>
                        </ul>
                    </div>
                </div>
                <div id="latest-news">
                    <div class="grid-header">Latest News</div>
                    <div class="grid-container">
                        <ul>
                            <c:forEach items="${newses}" var="news" varStatus="vs">
                                <li><img src="${ctx}/static/images/sn/${vs.count}.gif">
                                    <a href="${ctx}/news/view/${news.id}">
                                        <c:choose>
                                            <c:when test="${fn:length(news.title) > 24}">
                                                <c:out value="${fn:substring(news.title, 0, 24)}…" />
                                            </c:when>
                                            <c:otherwise>
                                               <c:out value="${news.title}" />
                                             </c:otherwise>
                                        </c:choose>
                                    </a>
                                </li>
                            </c:forEach>
                            <%--<img src="${ctx}/static/images/new.gif">--%>
                        </ul>
                    </div>
                </div>
                <div id="contact-us">
                    <div class="grid-header">Contact Us</div>
                    <div class="grid-container">
                        <ul>
                            <li>Contact： <strong>Mr.Zhang</strong></li>
                            <li>Tel： <strong>86-755-18926005906</strong></li>
                            <li>Alitalk：<a href="http://webatm.alibaba.com/atm_chat.htm?enemberId=enaliintcn1001402227" target="_blank">
                                <img src="http://amos.us.alitalk.alibaba.com/online.aw?v=2&uid=cn1001402227&site=enaliint&s=2"></a>
                                <a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=cn1001402227&site=cntaobao&s=2&charset=utf-8">
                                    <img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=cn1001402227&site=cntaobao&s=2&charset=utf-8"
                                    alt="Click here to send me a messag"/> <strong> cn1001402227</strong></a></li>
                            <li>QQ：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=252802512&site=qq&menu=yes"><img
                                    border="0" src="http://wpa.qq.com/pa?p=2:252802512:52" alt="Click here to send me a messag"
                                    title="Click here to send me a messag"/> <strong>252802512</strong></a></li>
                            <li>Skype：<a href="skype:overseastradecn@outlook.com?call" onclick="return skypeCheck();">
                                <img src=http://mystatus.skype.com/smallclassic/overseastradecn_1 style="border: none;" alt="Call me!"/></a></li>
                            <li>Email：</li>
                            <li>
                                <a href="mailto:overseastradecn@outlook.com"><strong>overseastradecn@outlook.com</strong></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="right"><sitemesh:body/></div>
        </div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
</body>
</html>