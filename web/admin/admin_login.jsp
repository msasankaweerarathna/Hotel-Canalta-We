<%-- 
    Document   : login
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
        String id=(String)session1.getAttribute("a_id"); 
        

        if(session1.getAttribute("a_id")== null ){  
         
      
        
        }  
       
      
        else{
           response.sendRedirect("index.jsp");  
        }
       
            %>
<html lang="en">
  <head>
  	<title>Admin Login </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="../customer/css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(../customer/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Admin Login </h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Use your Admin Credintels</h3>
                        <form action="../AdminLoginController" method="POST" class="signin-form">
		      		<div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" name="email" required>
		      		</div>
	            <div class="form-group">
                        <input id="password-field" type="password" class="form-control" placeholder="Password" name="pass" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<label class="checkbox-wrap checkbox-primary">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or back To Home &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="../index.jsp" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-home mr-2"></span> Home</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

  <script src="../customer/js/jquery.min.js"></script>
  <script src="../customer/js/popper.js"></script>
  <script src="../customer/js/bootstrap.min.js"></script>
  <script src="../customer/js/main.js"></script>

	</body>
</html>

