<%@page import="model.Patient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.PatientDBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Hope</title>
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
    <style><%@include file="../css/header.css"%></style>
    <style><%@include file="../css/adminHomePage.css"%></style>
</head>
<!-- Styles for error messages -->
    <style>
  	    .error{
		   color: red;
		   font-weight: 500;
		   margin-left: 20px;
	   }
     </style>
     
	<body style="margin-top: 80px;">
  	
  	<!-- Requesting user details set from sessions -->
	<% 
		int id = (Integer) session.getAttribute("id"); 
		String designation = (String) session.getAttribute("designation"); 
   		String name = (String) session.getAttribute("name");
    	String nic = (String) session.getAttribute("nic"); 
    	String phone = (String) session.getAttribute("phone"); 
    	String email = (String) session.getAttribute("email"); 
    	String address = (String) session.getAttribute("address"); 
    	String username = (String) session.getAttribute("username"); 
    	String profilepic = (String) session.getAttribute("profilepic"); 
	%>
	
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
			<div class="collapse navbar-collapse" id="navbarSupportedContent" >
				<ul class="navbar-nav mx-auto">
					<li class="nav-item">
						<a class="nav-link" href="#appointments">Appointments</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="updateAppointment.jsp">Update</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="deleteAppointment.jsp">Delete</a>
					</li>
				</ul>
			</div>

			<!-- Display profile picture and the toggle dropdown -->
			<div class="btn-group">
				<button type="button" class="btn">
					<%if(profilepic.equals("")){ %>
						<img alt="avatar" src="../images/defaultprofile.jpg" style="width: 100px; height: 50px;">
					<% } else { %>
						<img src="../images/<%=profilepic%>" alt="<%=profilepic%>" style="width: 100px; height: 50px;">
					<% } %>
				</button>
				<button type="button"
					class="btn dropdown-toggle dropdown-toggle-split"
					data-bs-toggle="dropdown" aria-expanded="false">
					<span class="visually-hidden">Toggle Dropdown</span>
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#myModal">Profile</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/HospitalManagementSystem/">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	
	<!-- Update Profile Modal Box -->
	<div class="container mt-5">
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #edf2fb">
						<h5 class="modal-title" style="text-align: center;"><%=name.toUpperCase() %></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" style="background-color: #edf2fb; border-radius: 0 0 5px 5px;">
						<form action="AddImage" method="post" enctype="multipart/form-data" id="imageUpload">
							<%
							if (profilepic.equals("")) {
							%>
							<img alt="avatar" src="../images/defaultprofile.jpg"
								style="width: 200px; height: 200px; display: flex; margin: auto;">
							<%
							} else {
							%>
							<img src="../images/<%=profilepic%>" alt="<%=profilepic%>"
								style="width: 200px; height: 200px; display: flex; margin: auto;">
							<% } %>

							<div style="display: flex; align-items: center; justify-content: center;">
								<input type="file" name="image">
   								<input type="submit" value="Change Image">
   							</div>
						</form>
						<hr>
						<form class="row" action="UpdateProfile" method="post" novalidate="novalidate" id="updateProfile">
							<div class="col-md-6">
								Employee ID : <input type="text"
									class="form-control" id="id" name="id" value="<%=id%>"
									readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="designation" class="form-label">Designation</label> 
								<input type="text" class="form-control" id="designation" name="designation" value="<%=designation%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">NIC</label> 
								<input type="text" class="form-control" id="nic" name="nic" value="<%=nic %>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">Contact</label> 
								<input type="text" class="form-control" id="phone" name="phone" value="<%=phone %>">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> 
								<input type="text" class="form-control" id="email" name="email" value="<%=email %>">
							</div>
							<div class="col-md-6">
								<label for="username" class="form-label">Username</label> 
								<input type="text" class="form-control" id="username" name="username" value="<%=username%>">
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label">Address</label> 
								<textarea class="form-control" rows="5" cols="20" name="address"><%=address %></textarea>
							</div>
							<br>
							<div>
								<button type="submit" class="btn btn-warning" style="margin: 10px auto; padding: 5px 50px; display: flex;">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <!-- Display appointments -->
    <h3 style="text-align: center; color: blue;">Appointment Details</h3>
	<div class="stock container-lg" style="margin-bottom: 80px;">
		<div>
			<%
				PatientDBUtil patDBUtil = new PatientDBUtil();
				ArrayList<Patient> patientList = patDBUtil.getAllPatients();
				int count = patientList.size();

				if (count == 0) {
			%>
			<h1>No results</h1>

			<%
			} else {
			%>
				<div class="container-fluid" style="margin-top: 50px;">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Phone</th>
								<th scope="col">Email</th>
								<th scope="col">Date</th>
								<th scope="col">Doctor Name</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
						<%
							for (int i = 0; i < count; i++) {
						%>
							<tr>
								<th scope="row"><%=patientList.get(i).getId()%></th>
								<td><%=patientList.get(i).getName()%></td>
								<td><%=patientList.get(i).getPhone() %></td>
								<td><%=patientList.get(i).getEmail() %></td>
								<td><%=patientList.get(i).getDate() %></td>
								<td><%=patientList.get(i).getDoctorName() %></td>
							</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%} %>
		</div>
	</div>
	
	
 	<!-- Import script files -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="../js/employeeForm.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>