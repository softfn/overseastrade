<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Home</title>
    <script type="text/javascript" src="${ctx}/static/jquery/jquery-ui-1.8.6.core.widget.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery/jqueryui.bannerize.js"></script>
</head>
<body>
<div id="slideshow">
    <div id="banners" class="ui-banner">
        <ul class="ui-banner-slides">
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/HeartHealthOmega.jpg" alt="NEW! Get Heart Smart With Essential Omega III" title="NEW! Get Heart Smart With Essential Omega III"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/CellLabs.jpg" alt="NEW! Support Your Skin on a Cellular Level" title="NEW! Support Your Skin on a Cellular Level"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/RoyalSpa.jpg" alt="NEW! Indulge in Luxury With Royal Spa" title="NEW! Indulge in Luxury With Royal Spa"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/Cashback.jpg" alt="NEW! Get paid to shop with Cashback" title="NEW! Get paid to shop with Cashback"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/StealthShield.jpg" alt="NEW! Radiation Protection at its Best" title="NEW! Radiation Protection at its Best"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/IsotonixEducate.jpg" alt="Unleash the Power of Isotonix Today" title="Unleash the Power of Isotonix Today"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/MotivesSimple.jpg" alt="Motives is Changing the Face of UK Beauty" title="Motives is Changing the Face of UK Beauty"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/UltimateAloeKwStb.jpg" alt="Get a Taste of Spring" title="Get a Taste of Spring"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/OPC3AllBetter.jpg" alt="Try Isotonix OPC-3 Today for Better Health" title="Try Isotonix OPC-3 Today for Better Health"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/RoyalSpaRoyalHair.jpg" alt="Feel like a princess with Royal Spa" title="Feel like a princess with Royal Spa"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/JubileeRoyalPartyAcai.jpg" alt="Stay energised with Isotonix for the Queen's Jubilee" title="Stay energised with Isotonix for the Queen's Jubilee"/></a></li>
            <li><a href="${ctx}/"><img src="${ctx}/static/images/products/WorldStores.gif" alt="WorldStores - Top Brands Delivered Next Day" title="WorldStores - Top Brands Delivered Next Day"/></a></li>
        </ul>
        <ul class="ui-banner-slogans">
            <li>NEW! Get Heart Smart With Essential Omega III</li>
            <li>NEW! Support Your Skin on a Cellular Level</li>
            <li>NEW! Indulge in Luxury With Royal Spa</li>
            <li>NEW! Get paid to shop with Cashback</li>
            <li>NEW! Radiation Protection at its Best</li>
            <li>Unleash the Power of Isotonix Today</li>
            <li>Motives is Changing the Face of UK Beauty</li>
            <li>Get a Taste of Spring</li>
            <li>Try Isotonix OPC-3 Today for Better Health</li>
            <li>Feel like a princess with Royal Spa</li>
            <li>Stay energised with Isotonix for the Queen's Jubilee</li>
            <li>WorldStores - Top Brands Delivered Next Day</li>
        </ul>
    </div>
</div>
<div id="aboutus">
    <div class="content-title">About us</div>
    <div class="aboutus_content"><img src="${ctx}/static/images/aboutus.jpg" class="aboutus_img">
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next Day
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next Day
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next Day
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next Day
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next Day
        WorldStores - Top Brands Delivered Next DayWorldStores - Top Brands Delivered Next DayWorldStores
    </div>
</div>
<div id="hotproducts">
    <div class="content-title">Hot Pouducts<div id="more">More >></div></div>
    <div class="product-grid">
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
        <div class="product-item"></div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('#banners').bannerize({
            shuffle: 1,
            interval: "5"
        });
        $(".product-item").mouseover(function () {
            $(this).addClass("product-item-over");
        }).mouseout(function () {
            $(this).removeClass("product-item-over");
        });
    });
</script>
</body>
</html>
