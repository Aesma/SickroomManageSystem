<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/6
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
<h1>查询结果</h1>
<hr>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "student" class = "model.Student"></jsp:useBean>
<jsp:useBean id = "stuService" class = "service.StudentService"></jsp:useBean>
<jsp:setProperty property="*" name="student"></jsp:setProperty>
<%
    List list = stuService.showStu(student);
    Iterator iter = list.iterator();
    while(iter.hasNext()){
        Student stu = (Student)iter.next();
%>
<table>
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>院系</td>
        <td>专业</td>
    </tr>
    <tr>
        <td><%=stu.getId()%></td>
        <td><%=stu.getName()%></td>
        <td><%=stu.getFaculty()%></td>
        <td><%=stu.getMajor()%></td>
    </tr>
</table>
<%
    }
%>
<br>
<a href = "anoshow.jsp">返回</a>
</body>
</html>
