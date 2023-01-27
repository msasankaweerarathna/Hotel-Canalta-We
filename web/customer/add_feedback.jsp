<%-- 
    Document   : add_feedback
    Created on : Dec 25, 2021, 3:28:58 PM
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
        if(session1.getAttribute("c_id")!= null ){  
         
      
        
        }  
       
      
        else{
           response.sendRedirect("login.jsp");  
        }
       
            %>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel &mdash; Canalta  </title>
  
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles-merged.css">
    <link rel="stylesheet" href="../css/style.min.css">
    <link rel="stylesheet" href="../css/custom.css">

    <!--[if lt IE 9]>
      <script src="js/vendor/html5shiv.min.js"></script>
      <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

  <!-- START: header -->

  <header role="banner" class="probootstrap-header">
    <!-- <div class="container"> -->
    <div class="row">
        <a href="../index.jsp.html" class="probootstrap-logo visible-xs"><img src="../img/logo.png" class="hires" width="120" height="33" alt="Logo"></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs"><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li ><a href="../index.jsp">Home</a></li>
            <li ><a href="about.html">About</a></li>
            <li><a href="../rooms.jsp">Our Rooms</a></li>
            <li class="hidden-xs probootstrap-logo-center"><a href="../index.jsp"><img src="../img/signature (1).png" class="hires" width="281" height="50" alt="Canalta-Hotel"></a></li>
            <li><a href="../reservation.jsp">Make a Reservation</a></li>
            <li><a href="dashboard.jsp">Dashboard</a></li>
          <li><a href="add_feedback.jsp">Give a feedback</a></li>
          <li><a href="#">&nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;</a></li>
          <li><a href="#">&nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;</a></li>
           <li><a href="#">&nbsp;  &nbsp;  &nbsp;&nbsp;  &nbsp;  &nbsp;</a></li>
           <li><a href="../logout" class="text-danger">LOGOUT</a></li>
          </ul>
          <div class="extra-text visible-xs">
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
           
          </div>
        </nav>
        </div>
    <!-- </div> -->
  </header>
  <!-- END: header -->

  <section class="probootstrap-slider flexslider probootstrap-inner">
    <ul class="slides">
       <li style="background-image: url(../img/slider_2.jpg);" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="probootstrap-slider-text text-center">
                  <p><img src="../img/curve_white.svg" class="seperator probootstrap-animate" alt="Canalta"></p>
                  <h1 class="probootstrap-heading probootstrap-animate">Give a feedback</h1>
                  <div class="probootstrap-animate probootstrap-sub-wrap">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</div>
                </div>
              </div>
            </div>
          </div>
        </li>
    </ul>
  </section>
  <section class="probootstrap-section  col-md-4" style="margin-left: 33%;">
      <form action="../AddFeedbackController" method="POST">
  <div class="form-group">
    <label for="exampleFormControlInput1">Name</label>
    <input type="text" disabled class="form-control"  id="exampleFormControlInput1" value="<%=name %>">
    <input type="hidden"  class="form-control"  id="exampleFormControlInput1"  name="name" value="<%=name %>">
      <input type="hidden"  class="form-control"  id="exampleFormControlInput1"  name="c_id" value="<%=id %>">
  </div>
  
  <div class="form-group form-check-inline">
      <label for="exampleFormControlSelect2">give Your Rate </label> <br>
     <input class="form-check-input" type="radio" name="rate" id="inlineRadio1" value="1">
  <label class="form-check-label" for="inlineRadio1">1</label>&nbsp;&nbsp;  &nbsp; 
  
 <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="2">
  <label class="form-check-label" for="inlineRadio2">2</label>&nbsp;&nbsp;  &nbsp; 
  
<input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="3">
  <label class="form-check-label" for="inlineRadio2">3</label>&nbsp;&nbsp;  &nbsp; 
  
  <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="4">
  <label class="form-check-label" for="inlineRadio2">4</label>&nbsp;&nbsp;  &nbsp; 

  <input class="form-check-input" type="radio" name="rate" id="inlineRadio2" value="5">
  <label class="form-check-label" for="inlineRadio2">5</label>&nbsp;&nbsp;  &nbsp; 

  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Additional remarks</label>
    <textarea class="form-control" name="comm" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
       <div class="form-group">
           <input type="submit" value="Submit" class="btn btn-success">
  </div>
</form>
      

  </section>
  
  


 




  <script src="../js/scripts.min.js"></script>
  <script src="../js/main.min.js"></script>
  <script src="../js/custom.js"></script>


  </body>
</html>
