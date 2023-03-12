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
<style><%@include file="../css/header.css"%></style>
<style><%@include file="../css/stock.css"%></style>
</head>
<body>
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
						href="updateStock.jsp">Update Stock</a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='pharmacistHomePage.jsp'">Home</button>
		</div>
	</nav>
	
	<!-- Check stock details -->
	<div style="margin-top: 90px;" id="id1">
			<form action="CheckMedU" method="post" style="width: 100%; text-align: center;" id="checkMed">
				<input type="text" class="form-control" id="s_id" name="s_id" placeholder="Medicine ID" style="width: 30%;
				margin: auto;">
				
				<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning" style="margin: auto; padding: 5px 50px;">Search</button>
			</div>
			</form>
			<hr>
			<!-- Notification related to the check of status -->
			<%if (request.getAttribute("s_idu") == null) {
			%>
			<div></div>
			<% } else if((Integer)request.getAttribute("s_idu") == 0) {%>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SORRY!!!</h4>
				<hr>
				<p>ID not found.</p>
				</div>
			<% } else { %>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SUCCESSFULL!!!</h4>
				<hr>
				<p>ID found.</p>
			</div>
			<!-- Update stock details -->
			<form class="row" action="UpdateMed" method="post" novalidate="novalidate" id="updateMed">
				<div class="col-md-6">
								Medicine ID : <input type="text"
									class="form-control" id="s_id" name="s_id" <%if(request.getAttribute("s_idu") == null || (Integer)request.getAttribute("s_idu") == 0) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("s_idu")%>" <% } %> 
									readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="s_name" class="form-label">Medicine Name</label> 
								<input type="text" class="form-control" id="s_name" name="s_name" 
								<%if(request.getAttribute("s_nameu") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("s_nameu")%>" <% } %> 
								readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="s_quantity" class="form-label">Quantity</label> 
								<input type="text" class="form-control" id="s_quantity" name="s_quantity" <%if(request.getAttribute("s_quantityu") == null || (Integer)request.getAttribute("s_quantityu") == 0) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("s_quantityu")%>" <% } %> >
							</div>
							<div class="col-md-6">
								<label for="s_price" class="form-label">Unit Price</label> 
								<input type="text" class="form-control" id="s_price" name="s_price" <%if(request.getAttribute("s_priceu") == null || (Double)request.getAttribute("s_priceu") == 0) { %> value="" <%} 
								else { %> value="<%=(Double)request.getAttribute("s_priceu")%>" <% } %> >
							</div>
							<br>
							<div>
								<button type="submit" class="btn btn-warning" style="margin: 10px auto; padding: 5px 50px; display: flex;">Update</button>
							</div>
						</form>
			<% } %>
		</div>
		
		<!-- Notification related to the update status -->
		<%if (request.getAttribute("ucount") == null) {
			%>
			<div></div>
			<% } else if((Integer)request.getAttribute("ucount") == 0) {%>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SORRY!!!</h4>
				<hr>
				<p>Try Again</p>
				</div>
			<% } else { %>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SUCCESSFULL!!!</h4>
				<hr>
				<p>Record was updated successfully</p>
			</div>
			<% } %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="../js/stock.js"></script>
</body>
</html>