<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/2
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <meta charset="utf-8">
    <title>病房管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/supersized.css">
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<script type="text/javascript">
    function register(){
        var form = document.getElementById("MyForm");
        if(form.username.value == ""){
            window.alert("未输入用户名！");
            return;
        }
        if(form.password.value == ""){
            window.alert("未输入密码！");
            return;
        }
        if(form.ensurepassword.value == ""){
            window.alert("未确认密码！");
            return;
        }
        if(form.password.value != form.ensurepassword.value){
            window.alert("密码不一致！");
            return;
        }
        form.action = "regresult.jsp";
        form.method = "post";
        form.submit();
    }
</script>
<div class="page-container">
    <h1>注册</h1>
    <form id = "MyForm" method = "post" action = "regresult.jsp">
        <input type="text" name="username" class="username" placeholder="Username">
        <input type="password" name="password" class="password" placeholder="Password">
        <input type="password" name="ensurepassword" class="ensurepassword" placeholder="EnsurePassword">
        <button type = "button" onclick = "register()">Regist</button>
        <div class="error"><span>+</span></div>
    </form>
</div>

<!-- Javascript -->
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../assets/js/supersized.3.2.7.min.js"></script>
<script src="../assets/js/supersized-init.js"></script>
<script src="../assets/js/scripts.js"></script>
</body>
</html>
