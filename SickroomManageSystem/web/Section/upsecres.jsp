<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1>修改科室信息</h1>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "section" class = "model.Section"></jsp:useBean>
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<jsp:setProperty name="section" property="*"></jsp:setProperty>
<%
    if(sectionservice.updateSection(section) == true){
%>
<jsp:forward page="showsection.jsp"></jsp:forward>
<%
    }else {
        out.println("修改科室信息失败.");
    }
%>
</body>
</html>
