<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>资讯详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/informationdetail.css">
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
        width: 2em;
        height: 2em;
        vertical-align: -8px;
        /* 通过设置 color 来改变 SVG 的颜色/fill */
        fill: currentColor;
        /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
        overflow: hidden;
        color: rgb(130, 130, 130);
        line-height: 40px;
    }
    </style>
</head>

<body>
    <div class="informationdetailhead">
        <a href="Beautyinformation.jsp"><svg class="icon" aria-hidden="true" style="float: left;">
            <use xlink:href="#icon-fanhui"></use>
        </svg></a>
        <span style="font-size: 22px;line-height: 40px;color: black;">美妆资讯</span>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
            <use xlink:href="#icon-home-2"></use>
        </svg></a>
    </div>
    <div class="informationdetailcerter">
        <div class="detail-left">
            <div class="detail-head"><a href="index.jsp">首页</a><span>></span><a href="Beautyinformation.jsp">美妆资讯</a><span>></span><a href="#">资讯详情</a></div>
            <div class="detail-title">
                <div><span class="headtitle">${bInfo.beautyInformationTitle}</span>
                </div>
                <div class="titlesource"><span>来源：${bInfo.beautyInformationResourse}</span>
                    <span>${bInfo.beautyInformationTime}</span>
                    <span>编辑：${bInfo.beautyInformationAuthor}</span></div>
                <div class="abstract">
                    <p>${bInfo.beautyInformationSynopsis}</p>
                </div>
                <div class="detail-info">
                <img alt=""  style="width:450px;" src="/upload/${bInfo.beautyInformationImage}">
                <p>${bInfo.beautyInformationContent}</p>
                </div>
            </div>
            <!-- <div class="paging">
                <div class="location"><a href=" Beautyinformation.html"><svg class="icon1" aria-hidden="true" style="">
                        <use xlink:href="#icon-next1"></use>
                    </svg></a><a href="" class="number actived">1</a>
                    <a href="" class="number">2</a>
                    <a href="" class="number">3</a>
                    <a href="Beautyinformation.html"><svg class="icon1" aria-hidden="true" style="">
            <use xlink:href="#icon-xiayiye3"></use>
        </svg></a></div>
            </div> -->
        </div>
        <div class="detail-right">
            <div class="detail-img">
                <div class="img-item1"><a class="item0" href=""><img id="item0" style="width:230px;" src="" alt=""></a></div>
                <div class="img-item2"><a class="item1" href=""><img id="item1" style="width:230px;" src="" alt=""></a></div>
                    </div>
                    <div class="news-information">
                        <div><span class="EinglishName">NEWS</span></div>
                        <div><span class="ChineseName">最新资讯</span></div>
                        <div class="information-type">
                            <ul>
                                <li>生活<span>Life</span></li>
                                <li>珠宝<span>Jewellery</span></li>
                                <li>奢华<span>Luxury</span></li>
                                <li>明星<span>Celebrity</span></li>
                                <li>美容<span>Beauty</span></li>
                                <li>时装<span>Fashion</span></li>
                            </ul>
                        </div>
                        <div class="information-list">
                            <ul>
                                <li><a href="">艺术家限量合作系列</a></li>
                                <li><a href="">艺术家限量合作系列</a></li>
                                <li><a href="">艺术家限量合作系列</a></li>
                                <li><a href="">艺术家限量合作系列</a></li>
                                <li><a href="">艺术家限量合作系列</a></li>
                            </ul>
                        </div>
                    </div>
                    <div style="margin-top: 10px;"><img src="img/cut-off.png" alt="" style="width: 260px;"></div>
                        <div class="news-information" style="margin-top: 20px;">
                            <div><span class="EinglishName">HOT</span></div>
                            <div><span class="ChineseName">热门资讯</span></div>
                            <div class="information-type">
                                <ul>
                                    <li>生活<span>Life</span></li>
                                    <li>珠宝<span>Jewellery</span></li>
                                    <li>奢华<span>Luxury</span></li>
                                    <li>明星<span>Celebrity</span></li>
                                    <li>美容<span>Beauty</span></li>
                                    <li>时装<span>Fashion</span></li>
                                </ul>
                            </div>
                            <div class="information-list">
                                <ul>
                                    <li><a href="">艺术家限量合作系列</a></li>
                                    <li><a href="">艺术家限量合作系列</a></li>
                                    <li><a href="">艺术家限量合作系列</a></li>
                                    <li><a href="">艺术家限量合作系列</a></li>
                                    <li><a href="">艺术家限量合作系列</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
</body>
<script>
$(document).ready(function (){
	findRightImg(); 
});
function findRightImg(){
	 $.post('findTwoImg',"",function(data){
		$(data).each(function(i){
		   $("#item"+i+"").attr("src","/upload/"+data[i].beautyInformationImage);
		   $(".item"+i+"").attr("href","findInfoById?Id="+data[i].beautyInformationId);
		})
	}) 
}
</script>
</html>