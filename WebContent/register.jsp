<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login-register.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/Login.js"></script>
    <script src="font-icon/iconfont.js"></script>
    <style type="text/css">
    .icon {
        /* 通过设置 font-size 来改变图标大小 */
        /* 图标和文字相邻时，垂直对齐 */
        width: 1em;
        height: 1em;
        vertical-align: -8px;
        /* 通过设置 color 来改变 SVG 的颜色/fill */
        fill: currentColor;
        /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
             normalize.css 中也包含这行 */
        overflow: hidden;
    }
    </style>
</head>

<body>
    <div class="content">
        <span style="color: white;font-size: 60px;display: block;">Member Register</span>
        <svg class="icon" aria-hidden="true" style="color: white;font-size: 200px;">
            <use xlink:href="#icon-chengyuanguanli"></use>
        </svg>
        <div class="form">
            <ul>
                <li> <svg class="icon" aria-hidden="true" style="font-size: 36px;">
                        <use xlink:href="#icon-denglu-copy1"></use>
                    </svg><input type="email" name="userName" placeholder="Username"></li>
                <li> <svg class="icon" aria-hidden="true" style="font-size: 36px;">
                        <use xlink:href="#icon-mima"></use>
                    </svg><input type="Password" name="password" placeholder="Password"></li>
                <li> <svg class="icon" aria-hidden="true" style="font-size: 36px;">
                        <use xlink:href="#icon-mima"></use>
                    </svg><input type="text" placeholder="RePassword"></li>
                <li><button onclick="addU()">REGISTER</button></li>
            </ul>
        </div>
    </div>
</body> <script src="js/jquery-3.2.1.min.js">
    </script>
</html>