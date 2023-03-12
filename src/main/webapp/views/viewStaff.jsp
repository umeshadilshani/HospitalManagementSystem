<!-- Silva T.U.D -->
<%@page import="model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EmployeeServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<style><%@include file="../css/header.css"%></style>
<style><%@include file="../css/adminHomePage.css"%></style>
</head>
<body style="margin-top: 100px;">
	<!-- Navigation Bar -->
	<nav class="navbar fixed-top navbar-expand-lg"
		style="background-color: rgb(248, 249, 250);">
		<!-- Navigation Bar content -->
		<div class="container-fluid"
			style="background-color: rgb(248, 249, 250);">
			<a class="navbar-brand" href="#"><img alt="logo"
				src="../images/logo.png" style="width: 100px; height: 50px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link" href="#">View</a></li>
					<li class="nav-item"><a class="nav-link" href="addStaff.jsp">Add</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="updateStaff.jsp">Update</a></li>
					<li class="nav-item"><a class="nav-link"
						href="deleteStaff.jsp">Delete</a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='adminHomePage.jsp'">Home</button>
		</div>
	</nav>

	<h1 style="font-family: Courgette; text-align: center; color: #0077b6;">Staff Details</h1>

	<!-- Displaying all administrator details -->
	<%
	EmployeeServiceImpl ad = new EmployeeServiceImpl();
	ArrayList<Employee> userList = ad.getAllUsers();
	int count = userList.size();

	if (count == 0) {
	%>
	<h1>No results</h1>

	<%
	} else {
	%>
	<div class="container-fluid" style="margin-top: 40px; width: 95%;">
		<table class="table table-striped table-hover"
			style="background-color: #a2d2ff; border-radius: 8px;">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">NIC</th>
					<th scope="col">Address</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<%
				for (int i = 0; i < count; i++) {
				%>
				<tr>
					<th scope="row"><%=userList.get(i).getId()%></th>
					<td><%=userList.get(i).getName()%></td>
					<td><%=userList.get(i).getNic()%></td>
					<td><%=userList.get(i).getAddress()%></td>
					<td><%=userList.get(i).getEmail()%></td>
					<td><%=userList.get(i).getPhone()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	}
	%>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	
	<script src="../js/employeeForm.js"></script>
</body>
</html>