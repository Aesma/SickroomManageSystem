<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1>修改医护人员信息</h1>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "nurse" class = "model.Nurse"></jsp:useBean>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<jsp:setProperty name="nurse" property="*"></jsp:setProperty>
<%
    if(nurseservice.updateNurse(nurse) == true){
%>
<jsp:forward page="showdoc.jsp"></jsp:forward>
<%
    }else {
        out.println("修改医护人员信息失败.");
    }
%>
</body>
</html>
