<%@ page import="model.Sick" %><%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 15:34
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
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Sick sick = sickservice.getPaitentById(id);
    out.println("姓名:" + sick.getName());
    out.println("病历号:" + sick.getId());
    out.println("年龄:" + sick.getAge());
    out.println("性别:" + sick.getSex());
    out.println("诊断:" + sick.getDia());
    out.println("主治医生:" + sick.getDoctor());
    out.println("科室:" + sick.getSection());
    out.println("病床房号:" + sick.getRoom());
%>
<hr>
<div>
    <form action = "uppaires.jsp" method = "post">
        <table>
            <tr>
                <td>姓名</td>
                <td><input type = "text" name = "name" value = "<%=sick.getName()%>" readonly = "true"/></td>
            </tr>
            <tr>
                <td>病历号</td>
                <td><input type = "text" name = "id"  value = "<%=sick.getId()%>" readonly = "true"/></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type = "text" name = "age" value = "<%=sick.getAge()%>"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <select name = "sex" style="width: 173px; height: 23px">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>诊断</td>
                <td><input type = "text" name = "dia" value = "<%=sick.getDia()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>主治医生</td>
                <td><input type = "text" name = "doctor" value = "<%=sick.getDoctor()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>科室</td>
                <td><input type = "text" name = "section" value = "<%=sick.getSection()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>病床房号</td>
                <td><input type = "text" name = "room" value = "<%=sick.getRoom()%>" readonly = "true"></td>
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
