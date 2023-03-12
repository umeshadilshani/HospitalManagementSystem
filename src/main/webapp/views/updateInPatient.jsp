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
			<button type="button" class="btn btn-primary my-0"
				onclick="location.href='nurseHomePage.jsp'">Home</button>
		</div>
	</nav>

	<div style="margin-top: 90px;" id="id1">
		<!-- Check details of a speific inpatient -->
		<form action="CheckInPatientU" method="post"
			style="width: 100%; text-align: center;" id="checkInPatientU">
			<input type="text" class="form-control" id="ip_id" name="ip_id"
				placeholder="Patient ID" style="width: 30%; margin: auto;">

			<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning"
					style="margin: auto; padding: 5px 50px;">Search</button>
			</div>
		</form>
		<hr>
		<%
		if (request.getAttribute("ip_idu") == null) {
		%>
		<div></div>
		<%
		} else if ((Integer) request.getAttribute("ip_idu") == 0) {
		%>
		<div class="alert alert-success" role="alert" id="message">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">SORRY!!!</h4>
			<hr>
			<p>ID not found.</p>
		</div>
		<%
		} else {
		%>
		<div class="alert alert-success" role="alert" id="message">
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
			<h4 class="alert-heading">SUCCESSFULL!!!</h4>
			<hr>
			<p>ID found.</p>
		</div>
		<!-- Update inpatient details form -->
		<form class="row" action="UpdateInPatient" method="post"
			novalidate="novalidate" id="updateInPatient">
			<div class="col-md-6">
				Patient ID : <input type="text" class="form-control" id="ip_id"
					name="ip_id"
					<%if (request.getAttribute("ip_idu") == null || (Integer) request.getAttribute("ip_idu") == 0) {%>
					value="" <%} else {%>
					value="<%=request.getAttribute("ip_idu")%>" <%}%>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="ip_name" class="form-label">Patient Name</label> <input
					type="text" class="form-control" id="ip_name" name="ip_name"
					<%if (request.getAttribute("ip_nameu") == null) {%> value=""
					<%} else {%>
					value="<%=request.getAttribute("ip_nameu")%>" <%}%>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="ip_ward" class="form-label">Quantity</label> <input
					type="text" class="form-control" id="ip_ward" name="ip_ward"
					<%if (request.getAttribute("ip_wardu") == null) {%> value=""
					<%} else {%>
					value="<%=request.getAttribute("ip_wardu")%>" <%}%>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				Bed Number : <input type="text" class="form-control" id="ip_bed"
					name="ip_bed"
					<%if (request.getAttribute("ip_bedu") == null || (Integer) request.getAttribute("ip_bedu") == 0) {%>
					value="" <%} else {%>
					value="<%=request.getAttribute("ip_bedu")%>" <%}%>
					readonly="readonly">
			</div>
			<div class="col-md-6">
				<label for="ip_status" class="form-label">Patient Status</label> <input
					type="text" class="form-control" id="ip_status" name="ip_status"
					<%if (request.getAttribute("ip_statusu") == null) {%> value=""
					<%} else {%>
					value="<%=request.getAttribute("ip_statusu")%>" <%}%>>
			</div>
			<br>
			<div>
				<button type="submit" class="btn btn-warning"
					style="margin: 10px auto; padding: 5px 50px; display: flex;">Update</button>
			</div>
		</form>
		<%
		}
		%>
	</div>

	<!-- Notification related to the update status -->
	<%
	if (request.getAttribute("ucount") == null) {
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
	<script src="../js/unurse.js"></script>
</body>
</html>