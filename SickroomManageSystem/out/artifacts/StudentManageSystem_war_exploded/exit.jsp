<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("user");
%>
<jsp:include page = "checklogin.jsp"></jsp:include>
<jsp:forward page = "index.jsp"></jsp:forward>