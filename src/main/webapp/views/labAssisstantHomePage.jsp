<%@page import="model.Report"%>
<%@page import="service.ReportDBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hope</title>
<style><%@include file="../css/labAssistantHome.css"%></style>

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
	<div class="form-container">
	<%   	  
   	  if(request.getParameter("val1") == null){
   	  }
   	  else if(Integer.parseInt(request.getParameter("val1")) > 0){
   		  int id1 = Integer.parseInt(request.getParameter("val1"));
   		  ReportDBUtil rd = new ReportDBUtil();
   		  boolean isTrue = rd.DeleteReport(id1);
   		  
   		  if(isTrue == true){%>
   		  	<script type="text/javascript">window.alert("Deletion Successful");</script>
   		  <%
   		  }else{%>
   			<script type="text/javascript">window.alert("Unsuccessful");</script> 
   		  <%
   		  }
   	  }else{
   	  }
   			 %>
   			 
   			 <%String msg1 = (String)request.getAttribute("msg1");
    		if(msg1 == null){
   			 }
   			 else if(msg1 == "Success"){ %>
   			 	<script type="text/javascript">window.alert("Added Successful");</script>
   			<%
   			 }else{%>
   				<script type="text/javascript">window.alert("Unsuccessful");</script> 
   			<%
   			 }
   			 %>
   			 
   			 
   			  <%String msg = (String)request.getAttribute("msg");
    		if(msg == null){
   			 }
   			 else if(msg == "Success"){ %>
   			 	<script type="text/javascript">window.alert("Updated Successful");</script>
   			<%
   			 }else{%>
   				<script type="text/javascript">window.alert("Unsuccessful");</script> 
   			<%
   			 }
   			 %>
                <br><input type="button" name="send" class="btn-submit" value="Add report" onclick="location.href ='addLabReports.jsp'"/>
                <br>
                <br>
                
                <table id="tbl-student" class="table table-responsive table-bordered" style="cellpadding: 0; width: 100%;">
                
                    <thead>
                        <tr class="text-white">
                               <th>Report Id</th>
                               <th>Patient name</th>
                               <th>Age</th>
                               <th>Gender</th>
                               <th>Edit</th>
                               <th>Delete</th>
                        </tr>  
                       
                        <%
                        ReportDBUtil reportLDBUtil = new ReportDBUtil();
        				ArrayList<Report> reportList = reportLDBUtil.getAllReports();
        				int count = reportList.size();
						for (int i = 0; i < count; i++) {
						%>
							<tr class="text-white">
								<th scope="row"><%=reportList.get(i).getReport_id()%></th>
								<td><%=reportList.get(i).getName()%></td>
								<td><%=reportList.get(i).getAge() %></td>
								<td><%=reportList.get(i).getAge() %></td>
								<td><button class="update" name="update" onclick="location.href = 'updateReport.jsp?val=<%=reportList.get(i).getReport_id()%>'">Update</button></td>
								<td><button class = "delete" name="delete" onclick="location.href = 'labAssisstantHomePage.jsp?val1=<%=reportList.get(i).getReport_id()%>'">Delete</button></td>
							</tr>
						<%
						}
						%>
       
                       
                        
               
                </table>
                
               
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