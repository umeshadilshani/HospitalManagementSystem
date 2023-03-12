<!-- Silva T.U.D -->
<%@page import="model.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.StockServiceImpl"%>
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
<style><%@include file="../css/header.css"%></style>
<style><%@include file="../css/adminHomePage.css"%></style>
<style><%@include file="../css/stock.css"%></style>
<style>
.error {
	color: red;
	font-weight: 500;
	margin-left: 20px;
}
</style>
</head>
<body style="margin-top: 80px;">
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
					<li class="nav-item"><a class="nav-link" href=""
						data-bs-toggle="modal" data-bs-target="#myModal1">Add Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="updateStock.jsp">Update
							Stock</a></li>
					<li class="nav-item"><a class="nav-link" href=""
						data-bs-toggle="modal" data-bs-target="#removeModal">Delete
							Stock</a></li>
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
	
	
	<!-- Status of the adding new stocks -->
	<%
	String msg = (String) request.getAttribute("msg");
	if (msg == null) {
	%>
	<%
	} else if (msg == "Successful") {
	%>
	<div class="alert alert-success" role="alert" id="message">
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
		<h4 class="alert-heading">SUCCESSFUL!!!</h4>
		<hr>
		<p>New stock was added successfully.</p>
	</div>
	<%
	} else {
	%>
	<div class="alert alert-success" role="alert" id="message">
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
		<h4 class="alert-heading">SORRY!!!</h4>
		<hr>
		<p>Try Again.</p>
	</div>
	<%
	}
	%>


	<!-- Add Stock -->
	<div class="modal fade" id="myModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #edf2fb">
					<h5 class="modal-title" style="text-align: center;">Add Stock</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body"
					style="background-color: #edf2fb; border-radius: 0 0 5px 5px;">
					<form class="row" action="AddStock" method="post"
						novalidate="novalidate" id="AddStock">
						<div class="mb-3">
							<label for="s_name" class="form-label">Medicine Name</label> <input
								type="text" class="form-control" id="s_name" name="s_name">
						</div>
						<div class="mb-3">
							<label for="s_quantity" class="form-label">Quantity</label> <input
								type="text" class="form-control" id="s_quantity"
								name="s_quantity">
						</div>
						<div class="mb-3">
							<label for="s_price" class="form-label">Unit Price</label> <input
								type="text" class="form-control" id="s_price" name="s_price">
						</div>
						<div>
							<button type="submit" class="btn btn-warning"
								style="margin: 10px auto; padding: 5px 50px; display: flex;">Add
								Stock</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Remove Stock -->
	<div class="modal fade" id="removeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #edf2fb">
					<h5 class="modal-title" style="text-align: center;">Remove Stock</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body"
					style="background-color: #edf2fb; border-radius: 0 0 5px 5px;">
					<form class="row" action="RemoveStock" method="post"
						novalidate="novalidate" id="removeStock">
						<div class="mb-3">
							<label for="s_id" class="form-label">Medicine ID</label> <input
								type="text" class="form-control" id="s_id" name="s_id">
						</div>
						<div>
							<button type="submit" class="btn btn-warning"
								style="margin: 10px auto; padding: 5px 50px; display: flex;">Delete
								Stock</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Notification related to the removing of stock -->
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
		<p>Stock was removed successfully.</p>
	</div>
	<%
	} else {
	%>
	<div class="alert alert-success" role="alert" id="message">
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
		<h4 class="alert-heading">SORRY!!!</h4>
		<hr>
		<p>Try Again.</p>
	</div>
	<%
	}
	%>

	<!-- Search Medicine -->
	<div style="margin: 100px 0 20px 0; background-color: white;">
		<form action="CheckMed" method="post"
			style="width: 100%; text-align: center;" id="checkMed">
			<input type="text" class="form-control" id="s_id" name="s_id"
				placeholder="Medicine ID" style="width: 30%; margin: auto;">

			<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning"
					style="margin: auto; padding: 5px 50px;">Search</button>
			</div>
		</form>
	</div>

	<%if (request.getAttribute("s_id") == null) {
			%>
			<div></div>
			<% } else if((Integer)request.getAttribute("s_id") == 0) {%>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SORRY!!!</h4>
				<hr>
				<p>ID not found.</p>
				</div>
			<% } else { %>
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
						<tr>
							<th scope="row"><%=request.getAttribute("s_id")%></th>
							<td><%=request.getAttribute("s_name")%></td>
							<td><%=request.getAttribute("s_quantity")%></td>
							<td><%=request.getAttribute("s_price")%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			
			
	<!-- Display available stock -->
	<div class="stock text-white" style="margin-bottom: 50px;">
		<h2 style="text-align: center;">Stock</h2>
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
				<table class="table text-white">
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
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

	<script src="../js/employeeForm.js"></script>
	<script src="../js/stock.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>