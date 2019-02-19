<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>皮肤检测网站</title>
    <link rel="stylesheet" href="css/itemcontent.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="font-icon/iconfont.js"></script>
    <style type="text/css">
    .icon {
        /* 通过设置 font-size 来改变图标大小 */
        /* 图标和文字相邻时，垂直对齐 */
        width: 2.5em;
        height: 2.5em;
        /* vertical-align: -8px; */
        /* 通过设置 color 来改变 SVG 的颜色/fill */
        fill: currentColor;
        /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
        overflow: hidden;
        color: black;
        color: #555;
    }
    </style>
</head>

<body>
    <div style="position: absolute;left:48%;"><span style="color: white;line-height: 50px;font-size: 22px;">痘痘</span>
    </div>
    <div class="itemhead" style="padding-top: 4px;">
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="">
                    <use xlink:href="#icon-fanhui"></use>
                </svg></a>
        <a href="index.jsp"><svg class="icon" aria-hidden="true" style="float: right;">
                    <use xlink:href="#icon-home-2"></use>
                </svg></a>
    </div>
    <div class="itemcenter">
        <div class="itemleft">
            <div class="btn-group-vertical" id="item">
            <s:iterator value="#request.list" id="list">
                <button type="button" class="btn btn-primary" onclick="findByProblemName('<s:property value="#list.problemName" />')"><s:property value="#list.problemName" /></button>
             </s:iterator>
            </div>
        </div>
        <p></p>
        <div class="itemright">
            <div class="itemimg"><img src="" id="problemImage" alt="" style="width:200px;"></div>
                <div class="iteminfo">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#menu1">病理原因</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu2">个人原因</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu3">特征</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#">应对措施</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="menu1" class="tab-pane active"><br>
                            <h3>PathologyReason</h3>
                            <p id="pathologyReason"></p>
                        </div>
                        <div id="menu2" class="tab-pane fade"><br>
                            <h3>PersonReason</h3>
                            <p id="personReason"></p>
                        </div>
                        <div id="menu3" class="tab-pane fade"><br>
                            <h3>Feature</h3>
                            <p id="feature"></p>
                        </div>
                        <div id="menu4" class="tab-pane fade"><br>
                            <h3>Solutions</h3>
                            <p id="solutions"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="itemfooter">关于我们</div>
</body>
<script type="text/javascript">
$(document).ready(function (){
	$("#item button:eq(0)").click();
})
function findByProblemName(problemName){
	var url="findByProblemName?problemName="+problemName;
	$.get(url,function(pBlem){
		$("#problemImage").attr("src","/upload/"+pBlem.problemImage);
		$("#pathologyReason").html(pBlem.pathologyReason);
		$("#personReason").html(pBlem.personReason);
		$("#feature").html(pBlem.feature);
		$("#solutions").html(pBlem.solutions);
	});
	
}
</script>
</html>