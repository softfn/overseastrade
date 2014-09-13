http://blog.csdn.net/yongjian1092/article/details/8927820


网上对于infinite-scroll插件使用的例子不多。但由于它的出现，鼓吹了瀑布流形式的页面展示方式，所以不得不了解了解这种新的分页方式。
官网上有对infinite-scroll的详细描述，但一般人即使看未必看得懂，看得懂未必就调试成功。所以借今晚有点时间，把跑通的例子供大家借鉴。
一.无限滚动概念
首先，它是基于Jquery的，另外还要明白无限滚动的概念：无限滚动的实现原理就是当你在网页上的滚动条滚动到离网页底部一定长度的时候，触发某ajax函数（infinite-scroll内已经封装好）,往后台加载文件或者数据，又或者从外部引入静态html形式文件。
二.探讨infinite-scroll
1.从网页头引入两个js文件，注意必须先放jquery的
[javascript] view plaincopy
<script src="css/infinite-scroll/jquery-1.6.4.js"></script>
<script src="css/infinite-scroll/jquery.infinitescroll.js"></script>

2.之后在网页头自己写一个js脚本
[javascript] view plaincopy
<script>
$(document).ready(function (){
  $("#container").infinitescroll({
        navSelector: "#navigation",      //页面分页元素--本页的导航，意思就是一个可以触发ajax函数的模块
        nextSelector: "#navigation a",  //下一页的导航
        itemSelector: ".scroll " ,             //此处我用了类选择器，选择的是你要加载的那一个块（每次载入的数据放的地方）
        animate: true,                          //加载时候时候需要动画，默认是false
        maxPage: 3,                            //最大的页数，也就是滚动多少次停。这个页码必须得要你从数据库里面拿
    });
});
   </script>

3.或许你看到这里还是不太清楚网页怎么定义，这里给出我的demo，希望可以有帮助
[html] view plaincopy
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>无限翻页效果</title>
<script src="css/infinite-scroll/jquery-1.6.4.js"></script>
<script src="css/infinite-scroll/jquery.infinitescroll.js"></script>
<script src="css/infinite-scroll/test/debug.js"></script>
 <script>
 $(document).ready(function (){               //别忘了加这句，除非你没学Jquery
      $("#container").infinitescroll({
            navSelector: "#navigation",     //页面分页元素--成功后自动隐藏
            nextSelector: "#navigation a",
            itemSelector: ".scroll " ,
            animate: true,
            maxPage: 3,
        });
 });
    </script>
</head>
<body>
    <div id="container">            <!-- 容器 -->
        <div class="scroll">         <!-- 每次要加载数据的数据块-->
        第一页内容第一页内容<br>
        第一页内容<br>第一页内容<br>第一页内容<br>
        第一页内容<br>第一页内容<br>第一页内容<br>
        第一页内容<br>第一页内容<br>第一页内容
        </div>
    </div>
        <div id="navigation" align="center">         <!-- 页面导航-->
        <a href="user/list?page=1"></a>        <!-- 此处可以是url，可以是action，要注意不是每种html都可以加，是跟当前网页有相同布局的才可以。另外一个重要的地方是page参数，这个一定要加在这里，它的作用是指出当前页面页码，没加载一次数据，page自动+1,我们可以从服务器用request拿到他然后进行后面的分页处理。-->
    </div>
</body>
</html>

三.细微部分
1.js函数里还可定义的其他属性:
[javascript] view plaincopy
debug        : true,                                         //用于调试，如果需要用到，只需在网页头引入官网demo里的debug.js文件
loadingImg   : "/img/loading.gif",                   //加载时候显示的进度条，用户可以自定义
loadingText  : "Loading new posts...",            //加载时显示的文字
extraScrollPx: 50,                                            //离网页底部多少像素时触发ajax
donetext     : "I think we've hit the end, Jim" ,     //加载完数据(到达底部时)显示的文字提醒
errorCallback: function(){},                             //加载完数据后的回调函数，可选
   其他属性暂不作过多介绍

2.数据的载入方式
①html  ：如果你已经有固定的数据块，可以放到html里面加载静态页面。
②json  ：可以用后台返回json的方式，返回的时候要指定temple里面的html模版，否则会出错。
③我上面例子用的其实也是json，前台在Action层把数据取出后再用StringBuilder拼装成html格式的字符串返回前台。（个人习惯）
3.数据分页方式
