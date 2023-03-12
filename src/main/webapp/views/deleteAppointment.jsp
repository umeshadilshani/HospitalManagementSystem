<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <title>Hope</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/datepicker.css">
    <link rel="stylesheet" href="../assets/css/style.css">
  </head>

    <body>
      <div class="inner-layer">
      	 <%String msg = (String)request.getAttribute("msg");
    		if(msg == null){
   			 }
   			 else if(msg == "Success"){ %>
   			 	<script type="text/javascript">window.alert("Successful");</script>
   			<%
   			 }else{%>
   				<script type="text/javascript">window.alert("Unsuccessful");</script> 
   			<%
   			 }
   			 %>
   			 
          <div class="container">
            <div class="row no-margin">
                <div class="col-sm-7">
                    <div class="content">
                        <h1>Book You Slot Now and Save your time</h1>
                        <p>We believe the heart of healthcare is service to others</p>
                        <h2>For Help Call : +94 11 23456</h2>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="form-data">
                        <div class="form-head">
                            <h2>Delete Appointemnt</h2>
                        </div>
                        <div class="form-body">
                        <form action="DeletePatientServlet" method="post"> 
                            <div class="row form-row">
                              <input type="text" placeholder="Enter ID" class="form-control" name="id">
                            </div>
                    
                             <div class="row form-row">
                               <button class="btn btn-success btn-appointment">
                                 Delete Appointment
                               </button>
                               
                            </div>
						</form>
                        </div>
                    </div>
                </div>
            </div>
          </div>
      </div>
      
    </body>
  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../assets/js/jquery-3.3.1.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/bootstrap-datepicker.js"></script>

    <script>
      $(document).ready(function(){
          $("#dat").datepicker();
      })
    </script>
    
  </body>
</html>
