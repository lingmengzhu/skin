<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
    String url=request.getServletPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin</title>
    <link rel="shortcut icon" href="${path }img/cut-off.png" />
    <link rel="stylesheet" href="${path }skin-admin/css/index.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="${path }skin-admin/font-icon/iconfont.js"></script>
    <style type="text/css">
    .icon {
        /* 通过设置 font-size 来改变图标大小 */
        /* 图标和文字相邻时，垂直对齐 */
        width: 1em;
        height: 1em;
        /* vertical-align: -8px; */
        /* 通过设置 color 来改变 SVG 的颜色/fill */
        fill: currentColor;
        /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
        overflow: hidden;
    }
    </style>
</head>

<body>
    <div class="index">
        <div class="admin-left">
            <div class="head-img">
                <span>skin</span>
            </div>
            <div class="item-list">
                <ul class="dropdown">
                    <li class="click actived"><a href="userM" id="selected" target="xx">用户管理</a></li>
                    <li class="click"><a href="productsM" target="xx">产品管理</a></li>
                    <li class="click"><a href="productstypeM" target="xx">产品类别管理</a></li>
                    <li class="click"><a href="toolsM" target="xx">工具管理</a></li>
                    <li class="click"><a href="informationM" target="xx">资讯管理</a></li>
                    <li class="click"><a href="problemM.jsp" target="xx">皮肤问题管理</a></li>
                    <li class="click"><a href="managerM" target="xx">管理员管理</a></li>
                    <li class="click"><a href="javascript:out()">注销</a></li>
                </ul>
            </div>
        </div>
        <div class="admin-right">
            <iframe name="xx" id="xx" src="" frameborder="0" width="100%" scrolling="no" height="100%"></iframe>
        </div>
    </div>
    <script type="text/javascript">
    function out() {
        if (window.confirm("您确定要退出吗？")) {
            location.href ="${path }admin_login.jsp"
        }
    }
    $(".click").click(function() {
        $(this).children()[0].click();
    });
    $("a").click(function(event) {
    	$("li").removeClass("actived");
        $(this).parent().addClass("actived");
        event.stopPropagation();
    });
    window.onload=function(){
    	document.getElementById("selected").click();
    }
    </script>
</body>
</html>