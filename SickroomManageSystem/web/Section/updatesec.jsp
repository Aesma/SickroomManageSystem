<%@ page import="model.Section" %><%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/27
  Time: 23:28
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
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<%
    String name = request.getParameter("name");
    Section section = sectionservice.getSectionByName(name);
    out.println("科名:" + section.getName());
    out.println("主任:" + section.getDir());
    out.println("地址:" + section.getAddress());
    out.println("电话:" + section.getTel());
%>
<hr>
<div>
    <form action = "upsecres.jsp" method = "post">
        <table>
            <tr>
                <td>科名</td>
                <td><input type = "text" name = "name" value = "<%=section.getName()%>" readonly = "true"></td>
            </tr>
            <tr>
                <td>主任</td>
                <td><input type = "text" name = "dir"  value = "<%=section.getDir()%>"/></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type = "text" name = "address" value = "<%=section.getAddress()%>"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type = "text" name = "tel" value = "<%=section.getTel()%>"></td>
            </tr>
            <tr>
                <td>
                    <input type = "submit" value = "修改">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
