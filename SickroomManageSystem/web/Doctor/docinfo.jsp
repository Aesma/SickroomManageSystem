<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.NurseInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/31
  Time: 11:12
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
<h1>医护人员查询结果</h1>
<jsp:useBean id = "nurseservice" class = "service.NurseService"></jsp:useBean>
<jsp:useBean id = "nurse" class = "model.Nurse"></jsp:useBean>
<jsp:setProperty property="*" name="nurse"></jsp:setProperty>
<table>
    <tr>
        <td>姓名</td>
        <td>科室</td>
        <td>职称</td>
        <td>病人</td>
    </tr>
<%
    if(nurse.getName() != ""){
        List list = nurseservice.getNurseInfoByName(nurse.getName());
        if(list != null){
            Iterator iter = list.iterator();
            while (iter.hasNext()){
                NurseInfo info = (NurseInfo) iter.next();
%>
    <tr>
        <td><%=info.getName()%></td>
        <td><%=info.getSection()%></td>
        <td><%=info.getTitle()%></td>
        <td><%=info.getPaitent()%></td>
    </tr>
    <%
                }
            }
        }
    %>
</table>
</body>
</html>
