<%@ page import="model.Room" %>
<%@ page import="model.Nurse" %>
<%@ page import="service.RoomService" %>
<%@ page import="service.NurseService" %>
<%@ page import="service.SickService" %><%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 11:19
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
<jsp:useBean id = "paitent" class = "model.Sick"></jsp:useBean>
<jsp:useBean id = "sickservice" class = "service.SickService"></jsp:useBean>
<jsp:setProperty name = "paitent" property = "*"></jsp:setProperty>
<%
    Room room = new Room();
    room.setId(paitent.getRoom());
    room.setSection(paitent.getSection());
    RoomService roomService = new RoomService();
    if(!roomService.checkSection(room)){
        out.println("增加病人信息失败.");
        out.println("请检查：该房间是否属于该科室.");
    }
    Nurse nurse = new Nurse();
    nurse.setName(paitent.getDoctor());
    nurse.setSection(paitent.getSection());
    NurseService nurseService = new NurseService();
    if(!nurseService.checkSection(nurse)){
        out.println("增加病人信息失败.");
        out.println("请检查：该医生是否属于该科室.");
    }else if(sickservice.addPaitent(paitent)){
        out.println("增加病人" + paitent.getName() + "成功,病历号为" + paitent.getId());
    }else {
        out.println("增加病例信息失败.");
    }
%>
</body>
</html>
