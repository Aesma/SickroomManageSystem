<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<jsp:useBean id="roomservice" class="service.RoomService"></jsp:useBean>
<jsp:useBean id="sectionservice" class="service.SectionService"></jsp:useBean>
<jsp:useBean id="docservice" class="service.NurseService"></jsp:useBean>
<jsp:useBean id="sickservice" class="service.SickService"></jsp:useBean>
<%
    List secList = sectionservice.getAllSectionName();
    Iterator iter1 = secList.iterator();
    List roomList = roomservice.getAllRoomID();
    Iterator iter2 = roomList.iterator();
    List docList = docservice.getAllDoctorName();
    Iterator iter3 = docList.iterator();
    int newID = sickservice.getPaitentID() + 1;
%>
<h1>增加病人信息</h1>
<div>
    <form action = "addsickrequest.jsp" method = "post">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type = "text" name = "name"></td>
            </tr>
            <tr>
                <td>病历号：</td>
                <td><input type = "text" name = "id" value="<%= newID%>" readonly="true"></td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type = "text" name = "age"></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <select name = "sex" style="width: 173px; height: 23px">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>诊断：</td>
                <td><input type = "text" name = "dia"></td>
            </tr>
            <tr>
                <td>主治医生：</td>
                <td>
                    <select name = "doctor" style="width: 173px; height: 23px">
                        <%
                            while (iter3.hasNext()){
                                String docNamne = (String)iter3.next();
                        %>
                        <option><%= docNamne%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>科室：</td>
                <td>
                    <select name = "section" style="width: 173px; height: 23px">
                        <%
                            while (iter1.hasNext()){
                                String sectionNamne = (String)iter1.next();
                        %>
                        <option><%= sectionNamne%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>病房床号：</td>
                <td>
                    <select name = "room" style="width: 173px; height: 23px">
                        <%
                            while (iter2.hasNext()){
                                String roomID = (String)iter2.next();
                        %>
                        <option><%= roomID%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type = "submit" value = "提交"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
