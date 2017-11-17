<%--
  Created by IntelliJ IDEA.
  User: Rengar
  Date: 2017/6/3
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    if(user == null){
%>
<jsp:forward page = "index.jsp"></jsp:forward>
<%
    }
%>