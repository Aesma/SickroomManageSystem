<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
</head>
<body>
    <h1>增加学生信息</h1>
    <div>
        <form action = "addstudent.jsp" method = "post">
            <table>
                <tr>
                    <td>学号：</td>
                    <td><input type = "text" name = "id"></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type = "text" name = "name"></td>
                </tr>
                <tr>
                    <td>院系</td>
                    <td><input type = "text" name = "faculty"></td>
                </tr>
                <tr>
                    <td>专业：</td>
                    <td><input type = "text" name = "major"></td>
                </tr>
                <tr>
                    <td><input type = "submit" value = "提交"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
