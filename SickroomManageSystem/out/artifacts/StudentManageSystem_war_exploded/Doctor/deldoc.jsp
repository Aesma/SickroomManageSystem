<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1><strong>删除医护人员信息</strong></h1>
<hr>
<jsp:useBean id = "nurse" class = "model.Nurse"></jsp:useBean>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<jsp:setProperty name = "nurse" property = "*"></jsp:setProperty>
<%
    if(nurseservice.delNurse(nurse.getName())){
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
