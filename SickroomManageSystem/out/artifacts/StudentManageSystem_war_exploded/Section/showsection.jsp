<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Section" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/27
  Time: 23:16
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
<h1>查看科室信息</h1>
<form action = "selsecinquire.jsp" method = "post">
    <table>
        <tr>
            <td>科名</td>
            <td><input type = "text" name = "name"/></td>
        </tr>
        <tr>
            <td>主任</td>
            <td><input type = "text" name = "dir"/></td>
        </tr>
        <tr>
            <td>地址</td>
            <td><input type = "text" name = "address"/></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type = "text" name = "tel"/></td>
        </tr>
        <tr>
            <td><input type = "submit" value = "查询"/></td>
        </tr>
    </table>
</form>
<hr>
<h2>进行科查询</h2>
<form action = "secinfo.jsp" method ="post">
    <table>
        <tr>
            <td>科名</td>
            <td><input type = "text" name = "name"/></td>
        </tr>
        <tr>
            <td><input type = "submit" value = "查询"/></td>
        </tr>
    </table>
</form>
<hr>
<h3>查看所有科室信息</h3>
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<%
    List list = sectionservice.getAllSections();
    Iterator iterator = list.iterator();
%>
<div class = "show_sec">
    <table>
        <tr>
            <td>科名</td>
            <td>主任</td>
            <td>地址</td>
            <td>电话</td>
            <td>修改</td>
        </tr>
        <%
            int i = 0;
            while(iterator.hasNext()){
                Section section = (Section) iterator.next();
        %>
        <tr <%if(i % 2 == 0){%> bgcolor="#CAE1FF"<%}%>>
            <td><%= section.getName()%></td>
            <td><%= section.getDir()%></td>
            <td><%= section.getAddress()%></td>
            <td><%= section.getTel()%></td>
            <td><a href = "updatesec.jsp?name=<%=section.getName()%>">修改</a></td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>
</body>
</html>
