<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<jsp:useBean id="sectionservice" class="service.SectionService"></jsp:useBean>
<%
    List list = sectionservice.getAllSectionName();
    Iterator iterator = list.iterator();
%>
<h1>增加房间病床信息</h1>
<div>
    <form action = "addroomrequest.jsp" method = "post">
        <table>
            <tr>
                <td>病房床号：</td>
                <td><input type = "text" name = "id"></td>
            </tr>
            <tr>
                <td>病床数：</td>
                <td><input type = "text" name = "number"></td>
            </tr>
            <tr>
                <td>科室：</td>
                <td>
                    <select name = "section" style="width: 173px; height: 23px">
                        <%
                            while (iterator.hasNext()){
                                String sectionNamne = (String)iterator.next();
                        %>
                        <option><%= sectionNamne %></option>
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
