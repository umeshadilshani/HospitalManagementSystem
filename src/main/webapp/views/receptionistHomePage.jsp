<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
</head>
<body style="margin-top: 100px;">
	RECEPTIONIST
	<%int id = (Integer) session.getAttribute("id"); 
	  String designation = (String)session.getAttribute("designation");
	%>
	Value<%=id %>
	Designation<%=designation %>
</body>
</html>