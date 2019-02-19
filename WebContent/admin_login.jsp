<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <link rel="stylesheet" type="text/css" href="css/admin_login.css">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/Login.js"></script>
</head>

<body>
    <div class="skin-login">
        <div class="login-form">
            <div class="form-head"><span>login</span></div>
            <div class="form-center">
                <div class="form-item"><input type="text" name="managerName" placeholder="请输入账号"></div>
                <div class="form-item" style="margin-top: 20px"><input type="text" name="managerPassword" placeholder="请输入密码"></div>
                <div class="form-button"><button onclick="Mlogincheck()">submit</button></div>
            </div>
        </div>
    </div>
</body>
</html>