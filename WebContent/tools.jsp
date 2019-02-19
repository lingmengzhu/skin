<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String dir="/upload/";
	request.setAttribute("dir", dir);
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>美妆工具展示</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/tools.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="font-icon/iconfont.js"></script>
    <style type="text/css">
    .icon {
        /* 通过设置 font-size 来改变图标大小 */
        /* 图标和文字相邻时，垂直对齐 */
        width: 2.5em;
        height: 2.5em;
        vertical-align: -8px;
        /* 通过设置 color 来改变 SVG 的颜色/fill */
        fill: currentColor;
        /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
        overflow: hidden;
        color: black;
    }
    </style>
</head>

<body>
    <a href="javascript:leftgo()" style="position: absolute;top: 462px;left: 100px;">
                <svg class="icon" aria-hidden="true" style="color:blue;top: 400px;left: 200px;">
                    <use xlink:href="#icon-arrow-up1-copy"></use>
                </svg>
                </a>
    <a href="javascript:rightgo()" style="position: absolute;top: 462px;left: 1330px;">
                <svg class="icon" aria-hidden="true" style="color:blue;">
                    <use xlink:href="#icon-arrow-right"></use>
                </svg>
            </a>
    <div class="tools-head">
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: left;">
            <use xlink:href="#icon-fanhui"></use>
        </svg></a>
        <span style="font-size: 22px;color: black;">美妆工具</span>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
            <use xlink:href="#icon-home-2"></use>
        </svg></a>
    </div>
    <div class="tools-display">
        <div class="head-search">
            <div class="search">
                <div class="search-center-input"><input type="text" id="key" name="key" style="width: 545px;height: 40px;font-size: 22px;border: none;margin-left: 15px;"></div>
                <div class="search-center-button"><a href="javascript:search()">搜索</a></div>
            </div>
        </div>
        <div class="condition">
            <div class="limit one">
                <span>您是否在找:</span>
                <ul id="toolstype">
                </ul>
            </div>
        </div>
        <span id="currentPage" style="display:none">1</span>
        <span id="pageTotal" style="display:none"></span>
        <div class="serach-content">
            <div id="display-tools" class="tools-display">
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
                <div class="product-items"><img alt="" style="height:180px;width:180px;" src="img/border.png" /></div>
            </div>
        </div>
    </div>
</body>
<script>
$(document).ready(function (){
	showToolsType();
});
function showToolsType(){
	$.post('findToolsType',"",function(data){
		$(data).each(function(i){
		   $("#toolstype").append("<li><a href='javascript:selectType()'>"+data[i]+"</a></li>");
		})
		$("#toolstype a").click(function(event) {
	           $("#toolstype li").removeClass("active");
            $(this).parent().addClass("active");
            event.stopPropagation();
      });
    })
}
function selectType(){
	var currentPage=""+$("#currentPage").text();
	var toolsType=$("#toolstype li.active a").text();
	var key=$("#key").val();
	var url="toolsShow?toolsType="+toolsType+"&currentPage="+currentPage+"&key="+key;
	$.get(url,function(data){
		$(data.content).each(function(i,t){
			$("#display-tools img:eq("+i+")").attr("src","");
		})
		$(data.content).each(function(i,t){
			$("#display-tools img:eq("+i+")").attr("src","/upload/"+t.toolsImg);
		})
		$("#currentPage").html(data.currentPage);
		$("#pageTotal").html(data.pageTotal);
	})
}
function search(){
	$(".limit li").removeClass("active");
	selectType();
}
function leftgo(){
	var currentPage=""+$("#currentPage").text();
	if(currentPage>1){
	currentPage--;
	}
	$("#currentPage").html(currentPage);
	selectType();
}
function rightgo(){
	var currentPage=""+$("#currentPage").text();
	var pageTotal=""+$("#pageTotal").text();
	if(currentPage<pageTotal){
		currentPage++;
	}
	$("#currentPage").html(currentPage);
	selectType();
}
</script>
</html>