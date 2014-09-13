<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Products</title>
    <script src="${ctx}/static/infinitescroll/jquery.infinitescroll.min.js"></script>
    <script src="${ctx}/static/blocksit/blocksit.min.js"></script>
    <script src="${ctx}/static/waitforimages/jquery.waitforimages.min.js"></script>
    <style type="text/css">
        #scrollPage {
            display: none;
        }
        #scrollContainer{
            position:relative;
            width:764px;
            /*margin:0 auto 20px;*/
            padding-bottom: 10px;
            display: none;
        }
        .grid{
            width:188px;
            min-height:100px;
            padding: 10px;
            background:#fff;
            margin:8px;
            font-size:12px;
            float:left;
            box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            -moz-box-shadow: 0 1px 3px rgba(34,25,25,0.4);
            -webkit-box-shadow: 0 1px 3px rgba(34,25,25,0.4);

            -webkit-transition: top 1s ease, left 1s ease;
            -moz-transition: top 1s ease, left 1s ease;
            -o-transition: top 1s ease, left 1s ease;
            -ms-transition: top 1s ease, left 1s ease;
        }

        .grid strong {
            border-bottom:1px dashed #ccc;
            margin:6px 0;
            display:block;
            padding:0 0 5px;
            font-size:14px;
        }
        .grid .meta{
            text-align:right;
            color:#777;
            font-style:italic;
        }
        .grid .imgholder img{
            max-width:100%;
            background:#ccc;
            display:block;
        }
    </style>
</head>
<body>
<div id="scrollContainer">
    <div id="scroll">
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img27.jpg" />
            </div>
            <strong>Sunset Lake</strong>
            <p>A peaceful sunset view...</p>
            <div class="meta">by j osborn</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img26.jpg" />
            </div>
            <strong>Bridge to Heaven</strong>
            <p>Where is the bridge lead to?</p>
            <div class="meta">by SigitEko</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img15.jpg" />
            </div>
            <strong>Autumn</strong>
            <p>The fall of the tree...</p>
            <div class="meta">by Lars van de Goor</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img23.jpg" />
            </div>
            <strong>Winter Whisper</strong>
            <p>Winter feel...</p>
            <div class="meta">by Andrea Andrade</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img17.jpg" />
            </div>
            <strong>Light</strong>
            <p>The only shinning light...</p>
            <div class="meta">by Lars van de Goor</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img22.jpg" />
            </div>
            <strong>Rooster's Ranch</strong>
            <p>Rooster's ranch landscape...</p>
            <div class="meta">by Andrea Andrade</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img16.jpg" />
            </div>
            <strong>Autumn Light</strong>
            <p>Sun shinning into forest...</p>
            <div class="meta">by Lars van de Goor</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img21.jpg" />
            </div>
            <strong>Yellow cloudy</strong>
            <p>It is yellow cloudy...</p>
            <div class="meta">by Zsolt Zsigmond</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img28.jpg" />
            </div>
            <strong>Herringfleet Mill</strong>
            <p>Just a herringfleet mill...</p>
            <div class="meta">by Ian Flindt</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img2.jpg" />
            </div>
            <strong>Battle Field</strong>
            <p>Battle Field for you...</p>
            <div class="meta">by Andrea Andrade</div>
        </div>
        <div class="grid">
            <div class="imgholder">
                <img src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img24.jpg" />
            </div>
            <strong>Sundays Sunset</strong>
            <p>Beach view sunset...</p>
            <div class="meta">by Robert Strachan</div>
        </div>
    </div>
    <div id="scrollPage" align="center"><a href="${ctx}/product/scroll/page/1"></a> </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#scrollContainer").infinitescroll({
            navSelector: "#scrollPage",
            nextSelector: "#scrollPage a",
            itemSelector: "#scroll " ,
            animate: true,
            maxPage: 30
        });
        $("#scrollContainer").waitForImages(function() {
            $("#scrollContainer").show();
            blocksItInit();
        });
    });

    function blocksItInit() {
        $('#scroll').BlocksIt({
            numOfCol: 4,
            offsetX: 4,
            offsetY: 4
        });
    }
</script>
</body>
</html>
