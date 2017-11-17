<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.PaitentInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 16:03
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
<h1>住院病人信息查询结果</h1>
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<jsp:useBean id = "sick" class = "model.Sick"></jsp:useBean>
<jsp:setProperty property="name" name="sick"></jsp:setProperty>
<%
    PaitentInfo info = sickservice.getPaitentInfoByName(sick.getName());
    if(info != null){
%>
<table>
    <tr>
        <td>姓名</td>
        <td>科室</td>
        <td>病床房号</td>
        <td>科室电话</td>
        <td>科室地址</td>
        <td>主治医生</td>
    </tr>
    <tr>
        <td><%=info.getName()%></td>
        <td><%=info.getSection()%></td>
        <td><%=info.getRoomID()%></td>
        <td><%=info.getTel()%></td>
        <td><%=info.getAddress()%></td>
        <td><%=info.getDir()%></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
