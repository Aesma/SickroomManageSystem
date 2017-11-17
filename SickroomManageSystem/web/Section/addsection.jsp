<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/10/27
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<body>
<h1>增加科室信息</h1>
<div>
    <form action = "addsecrequest.jsp" method = "post">
        <table>
            <tr>
                <td>科名：</td>
                <td><input type = "text" name = "name"></td>
            </tr>
            <tr>
                <td>主任：</td>
                <td><input type = "text" name = "dir"></td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><input type = "text" name = "address"></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><input type = "text" name = "tel"></td>
            </tr>
            <tr>
                <td><input type = "submit" value = "提交"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
