<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1>修改病历信息</h1>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "sick" class = "model.Sick"></jsp:useBean>
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<jsp:setProperty name="sick" property="*"></jsp:setProperty>
<%
    if(sickservice.updatePaitent(sick) == true){
%>
<jsp:forward page="showpaitent.jsp"></jsp:forward>
<%
    }else {
        out.println("修改病历信息失败.");
    }
%>
</body>
</html>
