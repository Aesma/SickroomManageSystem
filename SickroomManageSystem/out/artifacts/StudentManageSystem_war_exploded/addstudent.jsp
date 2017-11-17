<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/6
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id = "student" class = "model.Student"></jsp:useBean>
    <jsp:useBean id = "studentservice" class = "service.StudentService"></jsp:useBean>
    <jsp:setProperty name = "student" property = "*"></jsp:setProperty>
    <%
        if(studentservice.addStu(student)){
            out.println("增加学生" + student.getName() + "成功");
        }else{
            out.println("增加学生失败.");
        }
    %>
    <meta http-equiv="refresh" content="5;url=request.jsp">
</body>
</html>
