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
  	<nav class="navbar fixed-top navbar-expand-lg" style="background-color: rgb(248, 249, 250);">
		<!-- Navigation Bar content -->
		<div class="container-fluid" style="background-color: rgb(248, 249, 250);">
			<a class="navbar-brand" href="#"><img alt="logo" src="../images/logo.png" style="width: 100px; height: 50px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='adminHomePage.jsp'">Home</button>
		</div>
	</nav>

	<h1 style="font-family: Courgette; text-align: center; color: #0077b6;">Add
		Surgeon</h1>
	<!-- Notification about the add new administrator -->
	<%
	String c = (String) request.getAttribute("count");
	%>
	<%
	if (c == null) {
	%>
	<div></div>
	<%
	} else if (c == "1") {
	%>
	<div class="alert alert-success" role="alert" id="message">
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
		<h4 class="alert-heading">SUCCESSFULL!!!</h4>
		<hr>
		<p>New details were added successfully</p>
	</div>
	<%
	} else {
	%>
	<div class="alert alert-success" role="alert" id="message">
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
		<h4 class="alert-heading">SORRY!!!</h4>
		<hr>
		<p>Error!!!Try again.</p>
	</div>
	<%
	}
	%>

	<!-- Add new Administrator -->
	<div class="container mt-5">
		<form class="row" action="AddSurgeon" method="post" id="addSurgeon"
			novalidate="novalidate">
			<div class="col-md-6">
				<label for="name" class="form-label">Name</label> <input type="text"
					class="form-control" id="name" name="name">
			</div>
			<div class="col-md-6">
				<label for="occupation" class="form-label">Occupation</label> <input
					type="text" class="form-control" id="occupation" name="occupation"
					value="Surgeon" readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="nic" class="form-label">NIC</label> <input type="text"
					class="form-control" id="nic" name="nic">
			</div>
			<div class="col-md-6">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email">
			</div>

			<div class="col-md-6">
				<label for="speciality" class="form-label">Speciality</label> <input
					type="text" class="form-control" id="speciality" name="speciality">
			</div>
			<div class="col-md-6">
				<label for="service" class="form-label">Service</label> <input
					type="text" class="form-control" id="service" name="service">
			</div>
			<div class="col-md-6">
				<label for="address" class="form-label">Address</label>
				<textarea class="form-control" rows="5" cols="20" name="address"></textarea>
			</div>
			<div class="col-md-6">
				<label for="contact" class="form-label">Contact number</label> <input
					type="text" class="form-control" id="contact" name="contact">
			</div>
			<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning"
					style="margin: auto; padding: 5px 50px;">Add</button>
			</div>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	
	<script src="../js/surgeon.js"></script>
</body>
</html>