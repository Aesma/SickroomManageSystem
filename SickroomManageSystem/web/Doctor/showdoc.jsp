<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Nurse" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 9:29
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
<h1>查看医护人员信息</h1>
<form action="seldocinquire.jsp">
    <table>
        <tr>
            <td>姓名</td>
            <td><input type = "text" name = "name"/></td>
        </tr>
        <tr>
            <td>职称</td>
            <td><input type = "text" name = "title"/></td>
        </tr>
        <tr>
            <td>科室</td>
            <td><input type = "text" name = "section"/></td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type = "text" name = "age"/></td>
        </tr>
        <tr>
            <td><input type = "submit" value = "查询"/></td>
        </tr>
    </table>
</form>
<h2>进行医护人员查询</h2>
<form action = "docinfo.jsp" method ="post">
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
<h3>查看所有医护人员信息</h3>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<%
    List list = nurseservice.getAllNurse();
    Iterator iterator = list.iterator();
%>
<div class = "show_doc">
    <table>
        <tr>
            <td>姓名</td>
            <td>职称</td>
            <td>科室</td>
            <td>年龄</td>
            <td>修改</td>
            <td>删除</td>
        </tr>
        <%
            int i = 0;
            while(iterator.hasNext()){
                Nurse nurse = (Nurse) iterator.next();
        %>
        <tr <%if(i % 2 == 0){%> bgcolor="#CAE1FF"<%}%>>
            <td><%= nurse.getName()%></td>
            <td><%= nurse.getTitle()%></td>
            <td><%= nurse.getSection()%></td>
            <td><%= nurse.getAge()%></td>
            <td><a href = "updatedoc.jsp?name=<%=nurse.getName()%>">修改</a></td>
            <td><a href = "deldoc.jsp?name=<%=nurse.getName()%>">删除</a></td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>
</body>
</html>
