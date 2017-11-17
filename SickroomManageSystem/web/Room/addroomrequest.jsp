<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:56
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
<jsp:useBean id = "room" class = "model.Room"></jsp:useBean>
<jsp:useBean id = "roomservice" class = "service.RoomService"></jsp:useBean>
<jsp:setProperty name = "room" property = "*"></jsp:setProperty>
<%
    if(!roomservice.checkSection(room)) {
        out.println("增加病房床位失败.");
        out.println("请检查输入内容：病床房号是否为5，是否填写了科室，该病房是否属于所填写的科室。");
    }else if(roomservice.addRoomBed(room)){
        out.println("增加病房床位" + room.getId() + "成功");
    }else{
        out.println("增加病房床位失败.");
    }
%>
<meta http-equiv="refresh" content="5;url=../right.jsp">
</body>
</html>
