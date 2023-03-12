<!-- Silva T.U.D -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    	<style><%@include file="../css/header.css"%></style>
  </head>
  <body>
  	<!-- Administrator Page Navigation Bar -->
	<nav class="navbar fixed-top navbar-expand-lg" style="background-color: rgb(248, 249, 250);">
		<!-- Navigation Bar content -->
		<div class="container-fluid" style="background-color: rgb(248, 249, 250);">
			<a class="navbar-brand" href="#"><img alt="logo" src="images/logo.png" onerror="this.onerror=null;this.src='../images/logo.png';" style="width: 100px; height: 50px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent" >
				<ul class="navbar-nav mx-auto">
					<li class="nav-item">
						<a class="nav-link" href="/HospitalManagementSystem/">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="views/appointment.jsp">Appointment</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Lab Networks</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Pharmacy</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#about">About</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="views/contact.jsp">Contact Us</a>
					</li>
					<li class="nav-item">
						<a class="nav-link d-lg-none" href="views/login.jsp">Login</a>
					</li>
				</ul>
			</div>
			<a href="views/login.jsp" class="d-none d-lg-block"><button type="button" class="btn btn-outline-primary">Login</button></a>
		</div>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>