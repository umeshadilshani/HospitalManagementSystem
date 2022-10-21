<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
</head>
<body style="margin-top: 100px;">
	<%@include file="header.jsp"%>
	
	<%
	String name = (String) session.getAttribute("name");
	%>
	
	value = <%=name %>
</body>
</html>