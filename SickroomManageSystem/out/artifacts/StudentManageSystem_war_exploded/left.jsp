<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
    body {
    width: 200px;
    margin: 0 auto;
    }</style>
</head>
<jsp:include page = "User/checklogin.jsp"></jsp:include>
<body>
<ul>
    <li><a href = "../Section/addsection.jsp" target = "main_right">录入科室信息</a></li>
    <li><a href = "../Section/showsection.jsp" target = "main_right">查看科室信息</a></li>
    <li><a href = "../Room/addroom.jsp" target = "main_right">录入病房信息</a></li>
    <li><a href = "../Room/showroom.jsp" target = "main_right">查看病房信息</a></li>
    <li><a href = "../Doctor/adddoc.jsp" target = "main_right">录入医护人员信息</a></li>
    <li><a href = "../Doctor/showdoc.jsp" target = "main_right">查看医护人员信息</a></li>
    <li><a href = "../Paitents/addpaitent.jsp" target = "main_right">录入病历信息</a></li>
    <li><a href = "../Paitents/showpaitent.jsp" target = "main_right">查看病历信息</a></li>
    <li><a href = "../User/exit.jsp" target = "_top">退出登录</a></li>
</ul>
</body>
</html>
