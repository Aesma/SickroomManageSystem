<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "doctor" class = "model.Nurse"></jsp:useBean>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<jsp:setProperty name = "doctor" property = "*"></jsp:setProperty>
<%
    if(nurseservice.addNurse(doctor)){
        out.println("增加医护人员" + doctor.getName() + "成功");
    }else{
        out.println("增加医护人员失败.");
    }
%>
<meta http-equiv="refresh" content="5;url=../right.jsp">
</body>
</html>
