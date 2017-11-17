<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.SectionInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 8:47
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
<h1>科查询结果</h1>
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<jsp:useBean id = "section" class = "model.Section"></jsp:useBean>
<jsp:setProperty property="name" name="section"></jsp:setProperty>
<table>
    <tr>
        <td>科名</td>
        <td>主任</td>
        <td>病房</td>
        <td>剩余病床数</td>
    </tr>
</table>
<%
    List list = sectionservice.getSectionInfomationByName(section.getName());
    Iterator iter = list.iterator();
    while (iter.hasNext()){
        SectionInfo info = (SectionInfo) iter.next();
%>
<table>
    <tr>
        <td><%=section.getName()%></td>
        <td><%=info.getDoctor()%></td>
        <td><%=info.getRoomID()%></td>
        <td><%=info.getBedNum()%></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
