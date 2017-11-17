<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
<jsp:useBean id = "user" class = "model.User"></jsp:useBean>
<jsp:useBean id = "userservice" class = "service.UserService"></jsp:useBean>
<jsp:setProperty property = "*" name = "user" />
<%
        if(userservice.vaildUser(user)){
        session.setAttribute("user", user);
%>
<jsp:forward page = "request.jsp"></jsp:forward>
<%
    }else {
%>
<h1>登陆失败</h1>
<hr>
用户名或密码错误!<br>
<a href = "index.jsp">返回主页</a>
<%
    }
%>
</body>
</html>
