<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/2
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html>
<head>
    <title>病房管理系统</title>
</head>
<frameset rows="20%,*" frameborder="no"  width="1000px">
    <frame src="../top.jsp">

    <frameset cols="20%,*">
        <frame src="../left.jsp">
        <frame src="../right.jsp" name="main_right">
    </frameset>
</frameset>
<jsp:include page="./User/checklogin.jsp"></jsp:include>
<body>

</body>
</html>
