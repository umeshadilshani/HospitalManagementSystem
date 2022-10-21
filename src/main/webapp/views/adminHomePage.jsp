<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    	<style><%@include file="../css/header.css"%></style>
    	<style><%@include file="../css/adminHomePage.css"%></style>
  </head>
  
    <style>
  	    .error{
		   color: red;
		   font-weight: 500;
		   margin-left: 20px;
	   }
     </style>
	<body style="margin-top: 50px;">
  	
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
						<a class="nav-link" href="#staff">Staff</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#appointment">Appointment</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#lab">Lab Networks</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#pharmacy">Pharmacy</a>
					</li>
				</ul>
			</div>

			<!-- Example split danger button -->
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
	
	
	
	
	<!-- Image slider -->
	 <div id="slider" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item text-center bg-cover active slide-1" style="height: 500px;">
                <div class="container h-100 d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h6 class="text-white">WELCOME TO HOPE</h6>
                            <h1 class="display-3 my-3 fw-bold text-white">We care for you</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-item text-center bg-cover slide-2"  style="height: 500px;">
                <div class="container h-100 d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h6 class="text-white">LAB NETWORK</h6>
                            <h1 class="display-3 my-3 fw-bold text-white">We care for you</h1>
                            <a href="#" class="btn1 btn-brand">Lab Reports</a>
                        </div>
                    </div>
                </div>
            </div>

			<div class="carousel-item text-center bg-cover slide-3"  style="height: 500px;">
                <div class="container h-100 d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <h6 class="text-white">PHARMACY</h6>
                            <h1 class="display-3 my-3 fw-bold text-white">We care for you</h1>
                            <a href="#" class="btn1 btn-brand">Pharmaceuticals</a>
                        </div>
                    </div>
                </div>
            </div>
			
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#slider" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#slider" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


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
	
	
	
	<!-- Staff -->    
    <section id="staff">
    	<h1 style="text-align: center;">Our Staff</h1>

        <hr style="width: 90%; margin: 10px auto;">
        </section>
        
        <nav id="manageStaff">
		<div class="nav nav-tabs" id="nav-tab" role="tablist" style="background-color: #00b4d8; height: 50px;">
			<button class="nav-link active" id="nav-view-tab" data-bs-toggle="tab" data-bs-target="#nav-view" type="button" role="tab" aria-controls="nav-view" aria-selected="true" style="color: #0077b6; font-weight: bold;">View</button>
			<button class="nav-link" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add" type="button" role="tab" aria-controls="nav-add" aria-selected="false" style="color: #0077b6; font-weight: bold;">Add</button>
			<button class="nav-link" id="nav-update-tab" data-bs-toggle="tab" data-bs-target="#nav-update" type="button" role="tab" aria-controls="nav-update" aria-selected="false" style="color: #0077b6; font-weight: bold;">Update</button>
			<button class="nav-link" id="nav-delete-tab" data-bs-toggle="tab" data-bs-target="#nav-delete" type="button" role="tab" aria-controls="nav-delete" aria-selected="false" style="color: #0077b6; font-weight: bold;">Delete</button>
		</div>
	</nav>
		<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-view" role="tabpanel" aria-labelledby="nav-view-tab" tabindex="0">
			<!-- Displaying all administrator details -->
			<%EmployeeServiceImpl ad = new EmployeeServiceImpl();
			ArrayList<Employee> userList = ad.getAllUsers();
			int count = userList.size();
	
			if(count == 0) {%>
				<h1>No results</h1>
	
			<%}
			else {%>
				<div class="container-fluid" style="margin-top: 50px;">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">NIC</th>
							<th scope="col">Address</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<%for(int i = 0; i < count; i++) { %>
							<tr>
								<th scope="row"><%=userList.get(i).getId()%></th>
								<td><%=userList.get(i).getName()%></td>
								<td><%=userList.get(i).getNic()%></td>
								<td><%=userList.get(i).getAddress()%></td>
								<td><%=userList.get(i).getEmail()%></td>
								<td><%=userList.get(i).getPhone()%></td>
							</tr>
						<%} %>
					</tbody>
				</table>
				</div>
			<%} %>
		
		
		</div>
		<div class="tab-pane fade" id="nav-add" role="tabpanel" aria-labelledby="nav-add-tab" tabindex="0">
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
				<h4 class="alert-heading">SUCCESSFULL!!!</h4>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<hr>
				<p>New Administrator details were added successfully</p>
			</div>
			<%
			} else {
			%>
			<div>Die</div>
			<%}%>
			
			<!-- Add new Administrator -->
	<div class="container mt-5">
		<form class="row" action="AddEmp" method="post" id="addEmployee" novalidate="novalidate">
			<div class="col-md-6">
				<label for="name" class="form-label">Name</label> 
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-md-6">
				<label for="occupation" class="form-label">Occupation</label> 
				<select name="occupation" id="occupation" class="form-control">
					<option value="admin" selected="selected">Admin</option>
					<option value="doctor">Doctor</option>
					<option value="nurse">Nurse</option>
					<option value="labassisstant">Lab Assistant</option>
					<option value="pharmacist">Pharamacist</option>
					<option value="receptionist">Receptionist</option>
				</select>
			</div>
			<div class="col-md-6">
				<label for="nic" class="form-label">NIC</label> 
				<input type="text" class="form-control" id="nic" name="nic">
			</div>
			<div class="col-md-6">
				<label for="email" class="form-label">Email</label> 
				<input type="email" class="form-control" id="email" name="email">
			</div>
			<div class="col-md-6">
				<label for="address" class="form-label">Address</label> 
				<textarea class="form-control" rows="5" cols="20" name="address"></textarea>
			</div>
			<div class="col-md-6">
				<label for="contact" class="form-label">Contact number</label> 
				<input type="text" class="form-control" id="contact" name="contact">
			</div>
			<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning" style="margin: auto; padding: 5px 50px;">Add</button>
			</div>
		</form>
	</div>
</div>
		

		<div class="tab-pane fade" id="nav-update" role="tabpanel"
			aria-labelledby="nav-update-tab" tabindex="0" >
			<div style="margin-top: 50px;" id="id1">
			<form action="CheckEmp" method="post" style="width: 100%; text-align: center;" id="checkEmp">
				<input type="text" class="form-control" id="id" name="id" placeholder="Admin ID" style="width: 30%;
				margin: auto;">
				
				<div style="margin-top: 15px">
				<button type="submit" class="btn btn-warning" style="margin: auto; padding: 5px 50px;">Search</button>
			</div>
			</form>
			<hr>
			<form class="row" action="UpdateEmp" method="post" novalidate="novalidate" id="updateEmp">
			<%if (request.getAttribute("id") == null) {
			%>
			<div></div>
			<% } else if((Integer)request.getAttribute("id") == 0) {%>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SORRY!!!</h4>
				<hr>
				<p>Employer ID not found.</p>
				</div>
			<% } else { %>
				<div class="alert alert-success" role="alert" id="message">
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
					<h4 class="alert-heading">SUCCESSFULL!!!</h4>
				<hr>
				<p>Employer ID found.</p>
			</div>
			<% } %>
			

							<div class="col-md-6">
								Employee ID : <input type="text"
									class="form-control" id="id" name="id" <%if(request.getAttribute("id") == null || (Integer)request.getAttribute("id") == 0) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("id")%>" <% } %> 
									readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="designation" class="form-label">Designation</label> 
								<input type="text" class="form-control" id="designation" name="designation" 
								<%if(request.getAttribute("designation") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("designation")%>" <% } %> 
								readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="name" class="form-label">Name</label> 
								<input type="text" class="form-control" id="name" name="name" 
								<%if(request.getAttribute("name") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("name")%>" <% } %> 
								 readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="nic" class="form-label">NIC</label> 
								<input type="text" class="form-control" id="nic" name="nic" <%if(request.getAttribute("nic") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("nic")%>" <% } %> readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">Contact</label> 
								<input type="text" class="form-control" id="phone" name="phone" <%if(request.getAttribute("contact") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("contact")%>" <% } %> >
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> 
								<input type="text" class="form-control" id="email" name="email" <%if(request.getAttribute("email") == null) { %> value="" <%} 
								else { %> value="<%=request.getAttribute("email")%>" <% } %> >
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label">Address</label> 
								<textarea class="form-control" rows="5" cols="20" name="address"><%if(request.getAttribute("address") == null) { %> <%} 
								else { %> <%=request.getAttribute("address")%> <% } %> </textarea>
							</div>
							<br>
							<div>
								<button type="submit" class="btn btn-warning" style="margin: 10px auto; padding: 5px 50px; display: flex;">Update</button>
							</div>
						</form>
		</div>
		</div>
		
		<div class="tab-pane fade" id="nav-delete" role="tabpanel"
			aria-labelledby="nav-delete-tab" tabindex="0">
			
		</div>
		</div>
			 <hr style="width: 90%; margin: 10px auto;">
 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	
	<script src="../js/employeeForm.js"></script>

</body>
</html>