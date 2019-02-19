<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String dir="/upload/";
	request.setAttribute("dir", dir);
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>产品详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/productsinfo.css">
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
    .icon1 {
        width: 1.5em;
        height: 1.5em;
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
    <div class="productsinfohead">
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: left;">
            <use xlink:href="#icon-fanhui"></use>
        </svg></a>
        <span style="font-size: 22px;color: black;">产品详情</span>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
            <use xlink:href="#icon-home-2"></use>
        </svg></a>
    </div>
    <div class="products-content">
        <div class="productsdetail">
            <div class="detail-left">
                <div class="big-img"><img src="${dir }${p.productsImg1 }" style="height:420px;width:420px;" alt=""></div>
                <div class="small-img">
                    <img src="${dir }${p.productsImg1 }" style="height:75px;width:75px;" alt="">
                    <img src="${dir }${p.productsImg2 }" style="height:75px;width:75px;" alt="">
                    <img src="${dir }${p.productsImg3 }" style="height:75px;width:75px;" alt="">
                    <img src="${dir }${p.productsImg4 }" style="height:75px;width:75px;" alt="">
                    <img src="${dir }${p.productsImg5 }" style="height:75px;width:75px;" alt="">
                </div>
                </div>
                <div class="detail-right">
                <span id="TypeId" style="display:none;">${p.productsTypeId }</span>
                    <span>${p.productsName }</span>
                    <div class="right-info">功能描述:<p>${p.productsFunctionContent }</p></div>
                </div>
            </div>
            <div class="productsnominate">
                <div class="nominatehead"><svg class="icon1" aria-hidden="true">
                        <use xlink:href="#icon-tuijian1"></use>
                    </svg>
                    <svg class="icon1" aria-hidden="true" style="float: right;">
                        <use xlink:href="#icon-huanyihuan"></use>
                    </svg>
                </div>
                <div class="nominatecenter">
                    <img id="nominateImg0" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="nominateImg1" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="nominateImg2" src="img/border.png" style="width:180px;height:180px;" alt="">
                    </div>
                </div>
            </div>
            <div class="similarproducts">
                <div class="similarhead"><svg class="icon1" aria-hidden="true"> class=""
                        <use xlink:href="#icon-xiangsishangpin"></use>
                    </svg><span>相似产品</span></div>
                <div class="similarcenter"><svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-arrow-up1-copy"></use>
                    </svg>
                    <img id="similarImg0" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="similarImg1" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="similarImg2" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="similarImg3" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="similarImg4" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <img id="similarImg5" src="img/border.png" style="width:180px;height:180px;" alt="">
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-arrow-right"></use>
                    </svg></div>
            </div>
</body>
<script type="text/javascript">
$(document).ready(function (){
	setTimeout(function(){
	var TypeId=$("#TypeId").text();
	var url="findPByTypeId?TypeId="+TypeId;
	$.get(url,function(data){
		$(data).each(function(i){
			$("#similarImg"+i+"").attr("src",'/upload/'+data[i].productsImg1);
	    })
	})
	$.get("findPByFunction?TypeId="+TypeId,function(data){
		$(data).each(function(i){
			$("#nominateImg"+i+"").attr("src",'/upload/'+data[i].productsImg1);
	    })
	})
	}, 100);
	
});
</script>
</html>