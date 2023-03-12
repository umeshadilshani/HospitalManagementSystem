<!-- Silva T.U.D -->
<%@page import="java.awt.Window"%>
<%@page import="model.SysAdmin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
<link rel="stylesheet" href="../css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- Request parameters from the related sevlets -->
	<% String check = (String)request.getAttribute("check"); %>
	<% String count = (String)request.getAttribute("count"); %>
	<div class="container">
		<div class="form">
			<div class="btn">
				<button class="signUpBtn">SIGN UP</button>
				<button class="loginBtn">LOG IN</button>
			</div>
			<form action="SignUp" method="post" class="signUp" id="signUpValidate" 
			<%if(count	== "0") {%> style="display: none;" <% } %>>
				<!-- Display registration status -->
				<%if(check == "1"){ %>
					<div>
  						<h4 class="alert-heading" style="text-align: center; color: red">Registration Successful!!!</h4>
  						<hr>
  					</div>
				<%}else if(check == "0"){%>
					<div>
  						<h4 class="alert-heading" style="text-align: center; color: red">Sorry!!!<br>User ID not found.</h4>
  						<hr>
  					</div>
				<%}%>
				<div class="formGroup">
					<input type="text" name="txtId" id="id" placeholder="Employee ID" autocomplete="off">
				</div>
				<div class="formGroup">
					<input type="text" name="txtUsername" id="username" placeholder="Username" autocomplete="off">
				</div>
				<div class="formGroup">
					<input type="password" name="txtPassword" id="password" placeholder="Password" autocomplete="off">
				</div>
				<div class="formGroup">
					<input type="password" name="txtConfirmPassword" id="confirmPassword" placeholder="Confirm Password" autocomplete="off">
				</div>
				<div class="formGroup">
					<button class="btn2" type="submit">REGISTER</button>
				</div>
			</form>
			
			<form action="Login" method="post" class="login" id="loginValidate"
			<%if(count == "0") {%> style="display: block;" <% } else {%> style="display: none;" <% } %>>
				<!-- Notification related to the login status -->
				<%if(count == "0"){ %>
					<div>
  						<h4 class="alert-heading" style="text-align: center; color: red">Sorry!!!<br>Invalid username or password</h4>
  						<hr>
  					</div>
				<% } %>
				<div class="formGroup">
					<input type="text" name="txtUsername" id="username" placeholder="Username" autocomplete="off">
				</div>
				<div class="formGroup">
					<input type="password" name="txtPassword" id="password" placeholder="Password" autocomplete="off">
				</div>
				<div class="formGroup">
					<button class="btn2" type="submit">LOGIN</button>
				</div>
			</form>
		</div>
	</div>
	<a href="/HospitalManagementSystem/" style="text-decoration: none; color: white; text-align:center; display:block; margin-top: 30px; font-weight: 500; a:h">Back to Home Page</a>
	
	<!-- Show the link to create system admin account only if system admin account is not created -->
	<%
	if (SysAdmin.getInstance() == null) {
	%>
	<a href="addSysAdmin.jsp"
		style="text-decoration: none; color: white; text-align: center; display: block; margin-top: 30px; font-weight: 500; a: h">Add
		System Admin</a>
	<%
	} else {
	%>
	<%}%>

	<!-- Add javaScript files -->
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="../js/login.js"></script>
</body>
</html>