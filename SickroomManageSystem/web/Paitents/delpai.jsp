<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1><strong>删除病历信息</strong></h1>
<hr>
<jsp:useBean id = "sick" class = "model.Sick"></jsp:useBean>
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<jsp:setProperty name = "sick" property = "*"></jsp:setProperty>
<%
    if(sickservice.delPaitent(sick.getId())){
%>
<jsp:forward page = "../del_success.jsp"></jsp:forward>
<%
}else {
%>
<jsp:forward page = "../del_fail.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
