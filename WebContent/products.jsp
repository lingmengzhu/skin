<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="/struts-tags" prefix="s"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% String dir="/upload/";
	request.setAttribute("dir", dir);
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>产品汇总</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/products.css">
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
    <a href="javascript:leftgo()" style="position: absolute;top: 512px;left: 100px;">
                <svg class="icon" aria-hidden="true" style="color:blue;top: 400px;left: 200px;">
                    <use xlink:href="#icon-arrow-up1-copy"></use>
                </svg>
                </a>
    <a href="javascript:rightgo()" style="position: absolute;top: 512px;left: 1330px;">
                <svg class="icon" aria-hidden="true" style="color:blue;">
                    <use xlink:href="#icon-arrow-right"></use>
                </svg>
            </a>
    </div>
    <div class="products-head">
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: left;">
            <use xlink:href="#icon-fanhui"></use>
        </svg></a>
        <span style="color: black;line-height: 40px;font-size: 22px;">护理产品</span>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
            <use xlink:href="#icon-home-2"></use>
        </svg></a>
    </div>
    <div class="center-content">
        <div class="head-search">
            <div class="search">
                <div class="search-center-input"><input type="text" name="key" style="width: 545px;height: 40px;font-size: 22px;border: none;margin-left: 15px;"></div>
                <div class="search-center-button"><a style="color:white;" href="javascript:search()">搜索</a></div>
            </div>
        </div>
        <div class="condition">
            <div class="limit one">
                <span>功能:</span>
                <ul id="function">
                </ul>
            </div>
            <div class="limit two">
                <span>类型:</span>
                <ul id="type">
                </ul>
            </div>
        </div>
        <span id="currentPage" style="display:none">1</span>
        <span id="pageTotal" style="display:none"></span>
        <div class="serach-content">
            <div id="display-products" class="products-display">
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
                <div class="product-items"><a href=""><img alt="" style="height:180px;width:180px;" src="img/border.png" /></a></div>
            </div>
        </div>
    </div>
</body>
<script>
$(document).ready(function (){
	showFunction();
});
function showFunction(){
		$.post('findFunction',"",function(data){
			$(data).each(function(i){
			   $("#function").append("<li><a href='javascript:changeType()'>"+data[i]+"</a></li>");
			})
               $("#function a").click(function(event) {
    	           $("#function li").removeClass("active");
                   $(this).parent().addClass("active");
                   event.stopPropagation();
             });
			var formdata=data[0];
			$.post('findType',{formdata : formdata},function(data){
				$(data).each(function(i,n){
					$("#type").append("<li><a href='javascript:showproducts()'>"+data[i]+"</a></li>");
				});
				  $("#type a").click(function(event) {
	    	           $("#type li").removeClass("active");
	                   $(this).parent().addClass("active");
	                   event.stopPropagation();
	             });
			},'json');
		},'json'); 
	}
function changeType(){
	var str=$("#function li.active a").text();
	$("#type").html("");
	$.post('findType',{formdata : str},function(data){
		$(data).each(function(i){
			$("#type").append("<li><a href='javascript:showproducts()'>"+data[i]+"</a></li>");
		});
		$("#type a").click(function(event) {
	         $("#type li").removeClass("active");
            $(this).parent().addClass("active");
            event.stopPropagation();
      });
	},'json');
		
}
function showproducts(){
	var currentPage=""+$("#currentPage").text();
	var type=$("#type li.active a").text();
	var key=$("input[name=key]").val();
	var url="productsShow?type="+type+"&currentPage="+currentPage+"&key="+key;
	$.get(url,function(data){
		$(data).each(function(i,p){
			$("#display-products img:eq("+i+")").attr("src","");
		})
		$(data).each(function(i,p){
			$("#display-products img:eq("+i+")").attr("src","/upload/"+p.content[i].productsImg1);
			$("#display-products a:eq("+i+")").attr("href",'findPDetial?productsId='+p.content[i].productsId);
		})
		$("#currentPage").html(data.currentPage);
		$("#pageTotal").html(data.pageTotal);
	})
}
function search(){
	$(".limit li").removeClass("active");
	showproducts();
}
function leftgo(){
	var currentPage=""+$("#currentPage").text();
	if(currentPage>1){
	currentPage--;
	}
	$("#currentPage").html(currentPage);
	showproducts();
}
function rightgo(){
	var currentPage=""+$("#currentPage").text();
	var pageTotal=""+$("#pageTotal").text();
	if(currentPage<pageTotal){
		currentPage++;
	}
	$("#currentPage").html(currentPage);
	showproducts();
}
</script>
</html>