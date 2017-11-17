<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Section" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/27
  Time: 23:17
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
<h1><strong>科室信息查询结果</strong></h1>
<jsp:useBean id = "section" class = "model.Section"></jsp:useBean>
<jsp:useBean id = "sectionservice" class = "service.SectionService"></jsp:useBean>
<jsp:setProperty property="*" name="section"></jsp:setProperty>
<table>
    <tr>
        <td>科名</td>
        <td>主任</td>
        <td>地址</td>
        <td>电话</td>
        <td>修改</td>
    </tr>
    <%
        List list = sectionservice.selectSection(section);
        Iterator iter = list.iterator();
        while(iter.hasNext()){
            Section sec = (Section)iter.next();
    %>
    <tr>
        <td><%=sec.getName()%></td>
        <td><%=sec.getDir()%></td>
        <td><%=sec.getAddress()%></td>
        <td><%=sec.getTel()%></td>
        <td><a href = "updatesec.jsp?name=<%=sec.getName()%>">修改</a></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>
