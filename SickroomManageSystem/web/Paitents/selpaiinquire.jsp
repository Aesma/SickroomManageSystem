<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Sick" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1><strong>病历信息查询结果</strong></h1>
<hr>
<jsp:useBean id = "sick" class = "model.Sick"></jsp:useBean>
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<jsp:setProperty property="*" name="sick"></jsp:setProperty>
<%
    List list = sickservice.showPaitents(sick);
    Iterator iter = list.iterator();
    while(iter.hasNext()){
        Sick s = (Sick)iter.next();
%>
<table>
    <tr>
        <td>姓名</td>
        <td>病历号</td>
        <td>年龄</td>
        <td>性别</td>
        <td>诊断</td>
        <td>主治医生</td>
        <td>科室</td>
        <td>病床房号</td>
        <td>修改</td>
        <td>删除</td>
    </tr>
    <tr>
        <td><%=s.getId()%></td>
        <td><%=s.getName()%></td>
        <td><%=s.getAge()%></td>
        <td><%=s.getSex()%></td>
        <td><%=s.getDia()%></td>
        <td><%=s.getDoctor()%></td>
        <td><%=s.getSection()%></td>
        <td><%=s.getRoom()%></td>
        <td><a href = "updatepai.jsp?id=<%=s.getId()%>">修改</a></td>
        <td><a href = "delpai.jsp?id=<%=s.getId()%>">删除</a></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
