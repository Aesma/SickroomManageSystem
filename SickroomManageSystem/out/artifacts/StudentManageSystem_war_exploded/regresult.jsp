<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
<h1>注册</h1>
<hr>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "user" class = "model.User"></jsp:useBean>
<jsp:useBean id = "userService" class = "service.UserService"></jsp:useBean>
<jsp:setProperty property = "*" name = "user"></jsp:setProperty>
<%
    if(!userService.vaildUser(user)){
        userService.regist(user);
%>
<jsp:forward page = "reg_sucess.jsp"></jsp:forward>
<%
    }else {
%>
<jsp:forward page = "reg_faill.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
