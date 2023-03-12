<!-- Silva T.U.D -->
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
<style>
	.error{
		color: red;
		font-weight: 500;
		margin-left: 20px;
}
</style>
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
					<li class="nav-item"><a class="nav-link" href="viewStaff.jsp">View</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="addStaff.jsp">Add</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="updateStaff.jsp">Update</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Delete</a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='adminHomePage.jsp'">Home</button>
		</div>
	</nav>

	<!-- Delete employee form -->
	<h1 style="font-family: Courgette; text-align: center; color: #0077b6;">Delete Staff Details</h1>

	<div class="container mt-5" style="margin-top: 50px;" id="id1">
		<!-- Check employee by employee id -->
		<form action="CheckEmpD" method="post"
			style="width: 100%; text-align: center;" id="checkEmp">
			<input type="text" class="form-control" id="id" name="id"
				placeholder="Employee ID" style="width: 30%; margin: auto;">

			<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning"
					style="margin: auto; padding: 5px 50px;">Search</button>
			</div>
		</form>
		<!-- Notification related to the employee id check -->
		<%
		if (request.getAttribute("id") == null) {
		%>
		<div></div>
		<%
		} else if ((Integer) request.getAttribute("id") == 0) {
		%>
		<div class="alert alert-success" role="alert" id="message"
			style="margin-top: 10px;">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">SORRY!!!</h4>
			<hr>
			<p>Employer ID not found.</p>
		</div>
		<%
		} else {
		%>
		<div class="alert alert-success" role="alert" id="message"
			style="margin-top: 10px;">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">SUCCESSFULL!!!</h4>
			<hr>
			<p>Employer ID found.</p>
		</div>
		<%
		}
		%>

		<hr>
		<!-- Delete employee details -->
		<form class="row" action="RemoveEmp" method="post" novalidate="novalidate">
			<!-- Notification related to the status of rmoving employee details -->
			<%
			String rmsg = (String) request.getAttribute("rmsg");
			if (rmsg == null) {
			%>
			<%
			} else if (rmsg == "Successful") {
			%>
			<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<h4 class="alert-heading">SUCCESSFUL!!!</h4>
				<hr>
				<p>Employee was removed successfully.</p>
			</div>
			<%
			} else {
			%>
			<%
			}
			%>
			<!-- Auto fill the details of the employee if exist -->
			<div class="col-md-6">
				Employee ID : <input type="text"
					class="form-control" id="id" name="id"
					<%if (request.getAttribute("id") == null || (Integer) request.getAttribute("id") == 0) {%>
					value="" 
					<%} 
					else 
					{%>
					value="<%=request.getAttribute("id")%>" 
					<%}%> 
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="designation" class="form-label">Designation</label> 
				<input type="text" class="form-control" id="designation" name="designation"
					<%if(request.getAttribute("designation") == null) { %> 
					value=""
					<%} 
					else { %>
					value="<%=request.getAttribute("designation")%>" 
					<% } %>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="name" class="form-label">Name</label> 
				<input type="text" class="form-control" id="name" name="name"
					<%if(request.getAttribute("name") == null) { %> 
					value=""
					<%} 
					else { %> 
					value="<%=request.getAttribute("name")%>"
					<% } %> 
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="nic" class="form-label">NIC</label> 
				<input type="text" class="form-control" id="nic" name="nic"
					<%if(request.getAttribute("nic") == null) { %> 
					value=""
					<%} 
					else { %> value="<%=request.getAttribute("nic")%>"
					<% } %> 
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="phone" class="form-label">Contact</label> 
				<input type="text" class="form-control" id="phone" name="phone"
					<%if(request.getAttribute("contact") == null) { %> 
					value=""
					<%} 
					else { %> value="<%=request.getAttribute("contact")%>" 
					<% } %>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="email" class="form-label">Email</label> 
				<input type="text" class="form-control" id="email" name="email"
					<%if(request.getAttribute("email") == null) { %> value=""
					<%} 
					else { %> value="<%=request.getAttribute("email")%>"
					<% } %> readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="address" class="form-label">Address</label>
				<textarea class="form-control" rows="5" cols="20" name="address" readonly="readonly">
					<%if(request.getAttribute("address") == null) { %> 
					<%} 
					else { %> <%=request.getAttribute("address")%> <%} %> 
				</textarea>
			</div>
			<br>
			<div>
				<button type="submit" class="btn btn-warning"
					style="margin: 10px auto; padding: 5px 50px; display: flex;">Delete</button>
			</div>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	
	<script src="../js/employeeForm.js"></script>
	
</body>
</html>