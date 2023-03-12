<!-- Silva T.U.D -->
<%@page import="model.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.StockServiceImpl"%>
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
<style><%@include file="../css/stock.css"%></style>

</head>
<body style="margin-top: 70px;">
	<!-- Navigation Bar -->
	<nav class="navbar fixed-top navbar-expand-lg"
		style="background-color: rgb(248, 249, 250);">
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
					<li class="nav-item"><a class="nav-link"
						href="pharmacistHomePage.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href=""
						data-bs-toggle="modal" data-bs-target="#myModal">Add Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="updateStock.jsp">Update
							Stock</a></li>
					<li class="nav-item"><a class="nav-link" href=""
						data-bs-toggle="modal" data-bs-target="#removeModal">Delete
							Stock</a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='pharmacistHomePage.jsp'">Home</button>
		</div>
	</nav>

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
	<div class="modal fade" id="myModal" tabindex="-1"
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
	<div class="stock text-white">
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



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="../js/stock.js"></script>
</body>
</html>