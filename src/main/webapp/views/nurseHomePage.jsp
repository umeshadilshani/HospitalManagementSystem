<!-- Silva T.U.D -->
<%@page import="model.InPatient"%>
<%@page import="service.InPatientServiceImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<style><%@include file="../css/header.css"%></style>
<style><%@include file="../css/adminHomePage.css"%></style>
<style><%@include file="../css/nurseHomePage.css"%></style>
<style>
	.error {
		color: red;
		font-weight: 500;
		margin-left: 20px;
	}
</style>
</head>
<body style="margin-top: 100px;">
	<!-- Get session details -->
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
					<li class="nav-item"><a class="nav-link" href="#ward">Ward</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="updateInPatient.jsp">Update Patient</a></li>
				</ul>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn">
					<%
					if (profilepic.equals("")) {
					%>
					<img alt="avatar" src="../images/defaultprofile.jpg"
						style="width: 100px; height: 50px;">
					<%
					} else {
					%>
					<img src="../images/<%=profilepic%>" alt="<%=profilepic%>"
						style="width: 100px; height: 50px;">
					<%
					}
					%>
				</button>
				<button type="button"
					class="btn dropdown-toggle dropdown-toggle-split"
					data-bs-toggle="dropdown" aria-expanded="false">
					<span class="visually-hidden">Toggle Dropdown</span>
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
						data-bs-target="#myModal">Profile</a></li>
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
						<h5 class="modal-title" style="text-align: center;"><%=name.toUpperCase()%></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body"
						style="background-color: #edf2fb; border-radius: 0 0 5px 5px;">
						<form action="AddImage" method="post"
							enctype="multipart/form-data" id="imageUpload">
							<%
							if (profilepic.equals("")) {
							%>
							<img alt="avatar" src="../images/defaultprofile.jpg"
								style="width: 200px; height: 200px; display: flex; margin: auto;">
							<%
							} else if (profilepic.equals(null)) {
							%>
							<img src="../images/<%=profilepic%>" alt="<%=profilepic%>"
								style="width: 200px; height: 200px; display: flex; margin: auto;">
							<%
							} else {
							%>
							<img src="../images/<%=profilepic%>" alt="<%=profilepic%>"
								style="width: 200px; height: 200px; display: flex; margin: auto;">
							<%
							}
							%>

							<div
								style="display: flex; align-items: center; justify-content: center;">
								<input type="file" name="image"> <input type="submit"
									value="Change Image">
							</div>
						</form>
						<hr>
						<form class="row" action="UpdateProfile" method="post"
							novalidate="novalidate" id="updateProfile">
							<div class="col-md-6">
								Employee ID : <input type="text" class="form-control" id="id"
									name="id" value="<%=id%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="designation" class="form-label">Designation</label>
								<input type="text" class="form-control" id="designation"
									name="designation" value="<%=designation%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">NIC</label> <input
									type="text" class="form-control" id="nic" name="nic"
									value="<%=nic%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">Contact</label> <input
									type="text" class="form-control" id="phone" name="phone"
									value="<%=phone%>">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="text" class="form-control" id="email" name="email"
									value="<%=email%>">
							</div>
							<div class="col-md-6">
								<label for="username" class="form-label">Username</label> <input
									type="text" class="form-control" id="username" name="username"
									value="<%=username%>">
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label">Address</label>
								<textarea class="form-control" rows="5" cols="20" name="address"><%=address%></textarea>
							</div>
							<br>
							<div>
								<button type="submit" class="btn btn-warning"
									style="margin: 10px auto; padding: 5px 50px; display: flex;">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Reserve beds for patients by searching using the ward name-->
	<div class="inPatientForm">
		<div style="margin-top: 50px;">
			<form action="CheckWard" method="post"
				style="width: 100%; text-align: center;" id="checkWard">
				<input type="text" class="form-control" id="w_name" name="w_name"
					placeholder="Ward Name" style="width: 30%; margin: auto;">
				<div style="margin-top: 15px">
					<button type="submit" class="btn btn-warning"
						style="margin: auto; padding: 5px 50px;">Search</button>
				</div>
			</form>
		</div>

		<%
		String addMsg = (String) request.getAttribute("addMsg");
		if (addMsg == null) {
		} else if (addMsg == "Try Again") {
		%>
		<div class="alert alert-success" role="alert" id="message">
			<h4 class="alert-heading">Try Again!!!</h4>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<hr>
			<p>Failed to add patient details...</p>
		</div>
		<%
		} else if (addMsg == "Successful") {
		%>
		<div class="alert alert-success" role="alert" id="message">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">Successful!!!</h4>
			<hr>
			<p>New Patient Details were added Successfully...</p>
		</div>
		<%
		}
		%>

		<!-- Check available beds -->
		<%
		Integer bedCount = (Integer) request.getAttribute("bedCount");
		if (bedCount == null) {
		} else if (bedCount == 0) {
		%>
		<div class="alert alert-success" role="alert" id="message">
			<h4 class="alert-heading">Try Again!!!</h4>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<hr>
			<p>Ward Name does not found...</p>
		</div>
		<%
		} else if (bedCount > 0) {
		String wardName = (String) request.getAttribute("wardName");
		ArrayList<Integer> beds = new ArrayList<>();
		InPatientServiceImpl impService = new InPatientServiceImpl();
		beds = impService.getAllBeds(wardName, "Admit");
		ArrayList<Integer> freeBeds = new ArrayList<>();
		for (int count = 1; count <= bedCount; count++) {
			if (beds.contains(count)) {
			} else {
				freeBeds.add(count);
			}
		}
		%>
		<div class="alert alert-success" role="alert" id="message">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">Successful!!!</h4>
		</div>

		<div class="container mt-5">
			<form class="row" action="AddInPatient" method="post"
				id="addInPatient" novalidate="novalidate">
				<div class="col-md-6">
					<label for="ip_name" class="form-label text-white">Name</label> <input
						type="text" class="form-control" id="ip_name" name="ip_name">
				</div>
				<div class="col-md-6">
					<label for="ip_ward" class="form-label text-white">Ward Name</label> <input
						type="text" class="form-control" id="ip_ward" name="ip_ward"
						value="<%=wardName%>" readonly="readonly">
				</div>
				<div class="col-md-6">
					<label for="ip_bed" class="form-label text-white">Bed Number</label> <select
						name="ip_bed" id="ip_bed" class="form-control">
						<%
						for (int no = 0; no < freeBeds.size(); no++) {
						%>
						<option value="<%=freeBeds.get(no)%>" <%if (no == 0) {%>
							selected="selected" <%}%>><%=freeBeds.get(no)%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="col-md-6">
					<label for="ip_status" class="form-label text-white">Status</label> <input
						type="text" class="form-control" id="ip_status" name="ip_status"
						value="Admit" readonly="readonly">
				</div>
				<div style="margin-top: 15px">
					<button type="submit" class="btn btn-warning"
						style="margin: auto; padding: 5px 50px;">Add Patient</button>
				</div>
			</form>
		</div>
		<%} %>
	</div>

	<!-- InPatient list -->
	<%
	InPatientServiceImpl ips = new InPatientServiceImpl();
	ArrayList<InPatient> ipList = ips.getAllInPatient();

	int count = ipList.size();

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
					<th scope="col">Ward</th>
					<th scope="col">Bed</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<%
				for (int i = 0; i < count; i++) {
				%>
				<tr>
					<th scope="row"><%=ipList.get(i).getIp_id()%></th>
					<td><%=ipList.get(i).getIp_name()%></td>
					<td><%=ipList.get(i).getIp_ward()%></td>
					<td><%=ipList.get(i).getIp_bed()%></td>
					<td><%=ipList.get(i).getIp_status()%></td>
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
	<script src="../js/nurse.js"></script>
	
	<%@include file="footer.jsp"%>
</body>
</html>