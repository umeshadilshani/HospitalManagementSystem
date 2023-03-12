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
      	 <%
    		if(request.getAttribute("msg") == null){
   			 }
   			 else if((Integer)request.getAttribute("msg") == 1){ %>
   			 	<script type="text/javascript">window.alert("Successful");</script>
   			<%
   			 }else{%>
   				<script type="text/javascript">window.alert("Unsuccessful");</script> 
   			<%
   			 }
   			 %>
   			 
          <div class="container">
            <div class="row no-margin">
                <div class="col-sm-12">
                    <div class="form-data">
                        <div class="form-head">
                            <h2>Update Card</h2>
                        </div>
                        <div class="form-body">
                        <form action="UpdateCard" method="post"> 
                            <div class="row form-row">
                              <input type="text" placeholder="Enter ID" class="form-control" name="id">
                            </div>
                           <div class="row form-row">
                              <input id="text" type="text" placeholder="Enter diagnosis" class="form-control" name="diagnosis">
                            </div>
                            
                            
                             <div class="row form-row">
                               <button class="btn btn-success btn-appointment">
                                 Update Card
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
  </body>
</html>
