<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/27
  Time: 21:48
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
<jsp:useBean id = "section" class = "model.Section"></jsp:useBean>
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<jsp:setProperty name = "section" property = "*"></jsp:setProperty>
<%
    if(sectionservice.addSection(section)){
        out.println("增加科室" + section.getName() + "成功");
    }else{
        out.println("增加科室失败.");
    }
%>
<meta http-equiv="refresh" content="5;url=../right.jsp">
</body>
</html>
