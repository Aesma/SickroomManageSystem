<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/30
  Time: 9:27
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
<h1>增加医护人员信息</h1>
<div>
    <form action = "adddocrequest.jsp" method = "post">
        <table>
            <tr>
                <td>姓名：</td>
                <td><input type = "text" name = "name"></td>
            </tr>
            <tr>
                <td>职称：</td>
                <td><input type = "text" name = "title"></td>
            </tr>
            <tr>
                <td>科室：</td>
                <!--<td><input type = "text" name = "section"></td>-->
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
                <td>年龄：</td>
                <td><input type = "text" name = "age"></td>
            </tr>
            <tr>
                <td><input type = "submit" value = "提交"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
