<%-- 
    Document   : signup
    Created on : Dec 25, 2021, 3:28:28 PM
    Author     : ManojKasun
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

      <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            
        
              
            
        HttpSession session1=request.getSession(false);  
        String id=(String)session1.getAttribute("c_id"); 
        
          HttpSession session2=request.getSession(false);  
        String phone=(String)session2.getAttribute("c_phone"); 
        
          HttpSession session3=request.getSession(false);  
        String name=(String)session3.getAttribute("c_name"); 
           HttpSession session4=request.getSession(false);  
        String email=(String)session4.getAttribute("c_email"); 
        if(session1.getAttribute("c_id")== null ){  
         
      
        
        }  
       
      
        else{
           response.sendRedirect("dashboard.jsp");  
        }
       
            %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Customer Sign up </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Create An Account </h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Haven't an account?</h3>
                        <form action="../CustomerSignupController" method="POST" class="signin-form">
                            <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Name" name="name" required>
		      		</div>
		      		<div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" name="email" required>
		      		</div>
                            <div class="form-group">
                                <input type="text" min="10" max="12" class="form-control" placeholder="NIC" name="nic" required>
		      		</div>
                               <div class="form-group">
                                   <input type="number"  minlength="9" maxlength="9"  class="form-control" placeholder="Phone Number" name="phone" required>
                                <small><font color='red'><b>Format: </b> 771234567</font></small>
		      		</div>
                                <div class="form-group">
                                <input type="text"  class="form-control" placeholder="Country" name="country" required>
		      		</div>
	            <div class="form-group">
                        <input id="password-field" type="password" class="form-control" name="pass" placeholder="Password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
	            </div>
	
	          </form>
	          <p class="w-100 text-center">&mdash; Or Log in Or back To Home &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="../index.jsp" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-home mr-2"></span> Home</a>
	          	<a href="login.jsp" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-add mr-2"></span> Log in</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

