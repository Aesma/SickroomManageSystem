<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Room" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:42
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
<jsp:include page="../User/checklogin.jsp"></jsp:include>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<h1>查看病房床位信息</h1>
<form action = "selroominquire.jsp" method = "post">
    <table>
        <tr>
            <td>病房床号</td>
            <td><input type = "text" name = "id"/></td>
        </tr>
        <tr>
            <td>病床数</td>
            <td><input type = "text" name = "number"/></td>
        </tr>
        <tr>
            <td>科室</td>
            <td><input type = "text" name = "section"/></td>
        </tr>
        <tr>
            <td><input type = "submit" value = "查询"/></td>
        </tr>
    </table>
</form>
<hr>
<h2>查看所有病房床位信息</h2>
<jsp:useBean id="roomservice" class="service.RoomService"></jsp:useBean>
<%
    List list = roomservice.getAllRoom();
    Iterator iterator = list.iterator();
%>
<div class = "show_doc">
    <table>
        <tr>
            <td>病房床号</td>
            <td>病床数</td>
            <td>科室</td>
        </tr>
        <%
            int i = 0;
            while(iterator.hasNext()){
                Room room = (Room) iterator.next();
        %>
        <tr <%if(i % 2 == 0){%> bgcolor="#CAE1FF"<%}%>>
            <td><%= room.getId()%></td>
            <td><%= room.getNumber()%></td>
            <td><%= room.getSection()%></td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>
<hr>
</body>
</html>
