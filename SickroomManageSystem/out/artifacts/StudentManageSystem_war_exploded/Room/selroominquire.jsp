<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Room" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 10:08
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
<h1><strong>病房床位信息查询结果</strong></h1>
<hr>
<jsp:useBean id = "room" class = "model.Room"></jsp:useBean>
<jsp:useBean id = "roomservice" class = "service.RoomService"></jsp:useBean>
<jsp:setProperty property="*" name="room"></jsp:setProperty>
<table>
    <tr>
        <td>病床房号</td>
        <td>病床数</td>
        <td>科室</td>
    </tr>
<%
    List list = roomservice.showRoom(room);
    Iterator iter = list.iterator();
    while(iter.hasNext()){
        int i = 0;
        Room r = (Room)iter.next();
%>
    <tr <%if(i % 2 == 0){%> bgcolor="#CAE1FF"<%}%>>
        <td><%=r.getId()%></td>
        <td><%=r.getNumber()%></td>
        <td><%=r.getSection()%></td>
    </tr>
</table>
<%
        i++;
    }
%>
</body>
</html>
