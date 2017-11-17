<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Nurse" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:19
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
<h1><strong>医护人员信息查询结果</strong></h1>
<hr>
<jsp:useBean id = "doctor" class = "model.Nurse"></jsp:useBean>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<jsp:setProperty property="*" name="doctor"></jsp:setProperty>
<%
    List list = nurseservice.showDoc(doctor);
    Iterator iter = list.iterator();
    while(iter.hasNext()){
        Nurse nurse = (Nurse)iter.next();
%>
<table>
    <tr>
        <td>姓名</td>
        <td>职称</td>
        <td>科室</td>
        <td>年龄</td>
        <td>修改</td>
        <td>删除</td>
    </tr>
    <tr>
        <td><%=nurse.getName()%></td>
        <td><%=nurse.getTitle()%></td>
        <td><%=nurse.getSection()%></td>
        <td><%=nurse.getAge()%></td>
        <td><a href = "updatedoc.jsp?name=<%=nurse.getName()%>">修改</a></td>
        <td><a href = "deldoc.jsp?name=<%=nurse.getName()%>">删除</a></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
