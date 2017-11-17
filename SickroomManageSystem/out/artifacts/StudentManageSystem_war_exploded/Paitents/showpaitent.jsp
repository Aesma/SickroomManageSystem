<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Sick" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:include page="../User/checklogin.jsp"></jsp:include>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<h1>查询病例信息</h1>
<form action="selpaiinquire.jsp">
    <table>
        <tr>
            <td>姓名</td>
            <td><input type = "text" name = "name"/></td>
        </tr>
        <tr>
            <td>病历号</td>
            <td><input type = "text" name = "id"/></td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type = "text" name = "age"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type = "text" name = "sex"></td>
        </tr>
        <tr>
            <td>诊断</td>
            <td><input type = "text" name = "dia"></td>
        </tr>
        <tr>
            <td>主治医生</td>
            <td><input type = "text" name = "doctor"></td>
        </tr>
        <tr>
            <td>科室</td>
            <td><input type = "text" name = "section"></td>
        </tr>
        <tr>
            <td>病床房号</td>
            <td><input type = "text" name = "room"></td>
        </tr>
        <tr>
            <td>
                <input type = "submit" value = "查询">
            </td>
        </tr>
    </table>
</form>
<hr>
<h2>进行住院病人查询</h2>
<form action = "paitentinfo.jsp" method ="post">
    <table>
        <tr>
            <td>姓名</td>
            <td><input type = "text" name = "name"/></td>
        </tr>
        <tr>
            <td><input type = "submit" value = "查询"/></td>
        </tr>
    </table>
</form>
<hr>
<h3>查看所有病例信息</h3>
<jsp:useBean id = "sicservice" class = "service.SickService"></jsp:useBean>
<%
    List list = sicservice.getAllPaitents();
    Iterator iterator = list.iterator();
%>
<div class = "show_pai">
    <table>
        <tr>
            <td>姓名</td>
            <td>病历号</td>
            <td>年龄</td>
            <td>性别</td>
            <td>诊断</td>
            <td>主治医生</td>
            <td>科室</td>
            <td>病房床号</td>
            <td>修改</td>
            <td>删除</td>
        </tr>
        <%
            int i = 0;
            while(iterator.hasNext()){
                Sick sick = (Sick) iterator.next();
        %>
        <tr <%if(i % 2 == 0){%> bgcolor="#CAE1FF"<%}%>>
            <td><%= sick.getName()%></td>
            <td><%= sick.getId()%></td>
            <td><%= sick.getAge()%></td>
            <td><%= sick.getSex()%></td>
            <td><%= sick.getDia()%></td>
            <td><%= sick.getDoctor()%></td>
            <td><%= sick.getSection()%></td>
            <td><%= sick.getRoom()%></td>
            <td><a href = "updatepai.jsp?id=<%=sick.getId()%>">修改</a></td>
            <td><a href = "delpai.jsp?id=<%=sick.getId()%>">删除</a></td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>
</body>
</html>
