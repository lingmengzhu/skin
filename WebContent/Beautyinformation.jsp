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
    <title>美妆资讯</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/beautyinformation.css">
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
    <div class="beautyhead">
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: left;">
            <use xlink:href="#icon-fanhui"></use>
        </svg></a>
        <span style="font-size: 22px;line-height: 40px;color: black;">美妆资讯</span>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
            <use xlink:href="#icon-home-2"></use>
        </svg></a>
    </div>
    <div class="beauty">
        <div class="information">
            <div class="information-left">
                <div class="information-left-head"><svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-tuwen"></use>
                    </svg>
                    <span style="vertical-align: 6px;">资讯</span>
                </div>
                <div class="information-tuwen">
                    <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg0" href=""><img src="" id="infoimg0" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg0" href=""><span style="line-height: 40px;" id="span0"></span></a></div>
                            </div>
                            <div class="item-right">
                            <s:iterator value="#request.list1" id="info1">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div>
                        </div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg1" href=""><img src="" id="infoimg1" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg1" href=""><span style="line-height: 40px;" id="span1"></span></a></div>
                            </div>
                            <div class="item-right">
                                <s:iterator value="#request.list2" id="info2">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div>
                            </div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg2" href=""><img src="" id="infoimg2" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg2" href=""><span style="line-height: 40px;" id="span2"></span></a></div>
                            </div>
                            <div class="item-right">
                                 <s:iterator value="#request.list3" id="info3">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div></div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg3" href=""><img src="" id="infoimg3" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg3" href=""><span style="line-height: 40px;" id="span3"></span></a></div>
                            </div>
                            <div class="item-right">
                                <s:iterator value="#request.list4" id="info4">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div></div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg4" href=""><img src="" id="infoimg4" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg4" href=""><span style="line-height: 40px;" id="span4"></span></a></div>
                            </div>
                            <div class="item-right">
                                <s:iterator value="#request.list5" id="info5">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div></div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg5" href=""><img src="" id="infoimg5" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg5" href=""><span style="line-height: 40px;" id="span5"></span></a></div>
                            </div>
                            <div class="item-right">
                                <s:iterator value="#request.list6" id="info6">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div></div>
                        <div class="information-item">
                        <div class="item-left">
                            <div class="information-img"><a class="leftimg6" href=""><img src="" id="infoimg6" alt="" style="width:150px;"></a></div>
                                <div class="information-img-description"><a class="leftimg6" href=""><span style="line-height: 40px;" id="span6"></span></a></div>
                            </div>
                            <div class="item-right">
                                 <s:iterator value="#request.list7" id="info7">
                                <div class="list-info"><a href="findInfoById?Id=<s:property value='#info1.beautyInformationId' />"><s:property value='#info1.beautyInformationTitle' /></a></div>
                            </s:iterator>
                            </div></div>
                    </div>
                    <p></p>
                </div>
                <div class="information-right">
                    <div><a id="rightHref0" href=""><img id="rightImg0" src="" alt=""></a></div>
                    <div><a id="rightHref1" href=""><img id="rightImg1" src="" alt=""></a></div>
                    <div><a id="rightHref2" href=""><img id="rightImg2" src="" alt=""></a></div>
                    <div><a id="rightHref3" href=""><img id="rightImg3" src="" alt=""></a></div>
                    <div><a id="rightHref4" href=""><img id="rightImg4" src="" alt=""></a></div>
                    <div><a id="rightHref5" href=""><img id="rightImg5" src="" alt=""></a></div>
                    <div><a id="rightHref6" href=""><img id="rightImg6" src="" alt=""></a></div>
                    <div><a id="rightHref7" href=""><img id="rightImg7" src="" alt=""></a></div>
                </div>
                <div class="pagination"></div>
            </div>
            </div>
</body>
<script type="text/javascript">
$(document).ready(function (){
	 findLeftImg();
	findRightImg(); 
});
function findLeftImg(){
	 $.post('findLeftImg',"",function(data){
		$(data).each(function(i){
		   $(".leftimg"+i+"").attr("href","findInfoById?Id="+data[i].beautyInformationId);
		   $("#infoimg"+i+"").attr("src","/upload/"+data[i].beautyInformationImage);
		   $("#span"+i+"").text(data[i].beautyInformationTitle);
		})
	}) 
	
}
function findRightImg(){
	 $.post('findRightImg',"",function(data){
		$(data).each(function(i){
		   $("#rightImg"+i+"").attr("src","/upload/"+data[i].beautyInformationImage);
		   $("#rightHref"+i+"").attr("href","findInfoById?Id="+data[i].beautyInformationId);
		})
	}) 
}
</script>
</html>