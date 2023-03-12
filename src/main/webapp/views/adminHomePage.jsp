<!-- Silva T.U.D -->

<!-- Import classes and files -->
<%@page import="model.Ward"%>
<%@page import="service.WardServiceImpl"%>
<%@page import="model.Stock"%>
<%@page import="service.StockServiceImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EmployeeServiceImpl"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Hope</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
    <style><%@include file="../css/header.css"%></style>
    <style><%@include file="../css/adminHomePage.css"%></style>
    
    <!-- Styles for error messages -->
    <style>
		.error{
			color: red;
			font-weight: 500;
			margin-left: 20px;
		}
     </style>
</head>
  
  	
     
<body style="margin-top: 50px;">
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
					<li class="nav-item"><a class="nav-link" href="viewStaff.jsp">Staff</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="surgeon.jsp">Surgeon</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#wards">Wards</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#stocks">Stocks</a>
					</li>
				</ul>
			</div>

			<!-- Display profile picture and the toggle dropdown -->
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



	<!-- Image slider -->
	<div id="slider" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item text-center bg-cover active slide-1"
				style="height: 500px;">
				<div
					class="container h-100 d-flex align-items-center justify-content-center">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<h6 class="text-white">WELCOME TO HOPE</h6>
							<h1 class="display-3 my-3 fw-bold text-white">We care for
								you</h1>
						</div>
					</div>
				</div>
			</div>

			<div class="carousel-item text-center bg-cover slide-2"
				style="height: 500px;">
				<div
					class="container h-100 d-flex align-items-center justify-content-center">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<h6 class="text-white">WARD MANAGEMENT</h6>
							<h1 class="display-3 my-3 fw-bold text-white">We care for
								you</h1>
							<a href="#wards" class="btn1 btn-brand">Wards</a>
						</div>
					</div>
				</div>
			</div>

			<div class="carousel-item text-center bg-cover slide-3"
				style="height: 500px;">
				<div
					class="container h-100 d-flex align-items-center justify-content-center">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<h6 class="text-white">PHARMACY</h6>
							<h1 class="display-3 my-3 fw-bold text-white">We care for
								you</h1>
							<a href="#stocks" class="btn1 btn-brand">Pharmaceuticals</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#slider" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#slider" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<!-- Display stocks -->
	<section class="about" id="stocks">
		<div class="container" style="margin-top: 100px;">
			<div class="row gy-4 align-items-center">
				<div class="col-lg-5">
					<img src="../images/aSlide3.jpg" alt="">
				</div>
				<div class="col-lg-7">
					<h1>Stocks</h1>
					<div class="divider my-3"></div>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Nemo nesciunt voluptates doloribus quidem. Dignissimos, asperiores
						molestias?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Consequatur adipisci velit corporis debitis blanditiis hic, ipsam
						magni exercitationem ullam quibusdam a ad!</p>
				</div>
			</div>
		</div>
	</section>


	<!-- Display available stock -->
	<div class="stock container-lg" style="margin-bottom: 50px;">
		<div>
			<%
			StockServiceImpl stock = new StockServiceImpl();
			ArrayList<Stock> stockList = stock.getAllStock();
			int count = stockList.size();

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
							<th scope="col">Unit Price</th>
							<th scope="col">Quantity</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<%
						for (int i = 0; i < count; i++) {
						%>
						<tr>
							<th scope="row"><%=stockList.get(i).getS_id()%></th>
							<td><%=stockList.get(i).getS_sname()%></td>
							<td><%=stockList.get(i).getS_price()%></td>
							<td><%=stockList.get(i).getS_quantity()%></td>
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
		</div>
	</div>

	<hr style="width: 90%; margin: 80px auto;">

	<!-- Display ward details -->
	<section class="about" id="wards">
		<div class="container">
			<div class="row gy-4 align-items-center">
				<div class="col-lg-7">
					<h1>Wards</h1>
					<div class="divider my-3"></div>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Nemo nesciunt voluptates doloribus quidem. Dignissimos, asperiores
						molestias?</p>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Consequatur adipisci velit corporis debitis blanditiis hic, ipsam
						magni exercitationem ullam quibusdam a ad!</p>
				</div>
				<div class="col-lg-5">
					<img src="../images/aSlide3.jpg" alt="">
				</div>
			</div>
		</div>
	</section>


	<!-- Display available wards -->
	<div style="margin-bottom: 50px;" id="wards" class="container-lg">
		<div>
			<%
			WardServiceImpl ward = new WardServiceImpl();
			ArrayList<Ward> wardList = ward.getAllWards();
			int count1 = wardList.size();

			if (count1 == 0) {
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
							<th scope="col">Bed Count</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<%
						for (int i = 0; i < count1; i++) {
						%>
						<tr>
							<th scope="row"><%=wardList.get(i).getW_id()%></th>
							<td><%=wardList.get(i).getW_name()%></td>
							<td><%=wardList.get(i).getW_bed()%></td>
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