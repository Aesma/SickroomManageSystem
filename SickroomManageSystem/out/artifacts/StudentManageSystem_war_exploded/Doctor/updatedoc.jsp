<%@ page import="model.Nurse" %><%--
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
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<%
    String name = request.getParameter("name");
    Nurse nurse = nurseservice.getDoctorByName(name);
    out.println("姓名:" + nurse.getName());
    out.println("职称:" + nurse.getTitle());
    out.println("科室:" + nurse.getSection());
    out.println("年龄:" + nurse.getAge());
%>
<hr>
<div>
    <form action = "updocres.jsp" method = "post">
        <table>
            <tr>
                <td>姓名</td>
                <td><input type = "text" name = "name" value = "<%=nurse.getName()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>职称</td>
                <td><input type = "text" name = "title"  value = "<%=nurse.getTitle()%>"/></td>
            </tr>
            <tr>
                <td>科室</td>
                <td><input type = "text" name = "section" value = "<%=nurse.getSection()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type = "text" name = "age" value = "<%=nurse.getAge()%>"></td>
            </tr>
            <tr>
                <td>
                    <input type = "submit" value = "修改">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
