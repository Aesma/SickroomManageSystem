
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>病院管理系统</title>
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
      function login(){
          var form = document.getElementById("MyForm");
          if(form.username.value==""){
              window.alert("账号不能为空！");
              return ;
          }
          if(form.password.value==""){
              window.alert("密码不能为空！");
              return ;
          }
          form.action = "../User/successlogin.jsp";
          form.method = "post";
          form.submit();
      }
      function register(){
          var form = document.getElementById("MyForm");
          form.action = "../User/regRequest.jsp";
          form.method = "post";
          form.submit();
      }
  </script>
        <div class="page-container">
            <h1>Login</h1>
            <form id = "MyForm" method = "post">
                <input type="text" name="username" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
                <button type = "button" onclick = "login()">Sign in</button>
				<button type = "button" onclick = "register()">Register</button>
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

