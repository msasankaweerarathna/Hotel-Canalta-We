<%-- 
    Document   : Continue
    Created on : Dec 25, 2021, 9:08:09 PM
    Author     : ManojKasun
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%



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
        
        HttpSession session5=request.getSession(false);  
        String total=(String)session5.getAttribute("total_p"); 
                    HttpSession session6=request.getSession(false);  
       String r_type=(String)session6.getAttribute("r_type"); 
                     HttpSession session7=request.getSession(false);  
        String rid=(String)session7.getAttribute("room_id"); 
                    HttpSession session8=request.getSession(false);  
        String rcat=(String)session8.getAttribute("room_cat"); 
         HttpSession session9=request.getSession(false);  
         String check_in =(String)session8.getAttribute("check_in"); 
 HttpSession session10=request.getSession(false);  
         String days =(String)session8.getAttribute("days"); 
        
        if(session1.getAttribute("c_id")!= null ){  
         
      
        
        }  
       
      
        else{
           response.sendRedirect("../customer/login.jsp");  
        }
       
            %>
<!DOCTYPE html>

<html lang="en">
  <head >
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel &mdash; Canalta  </title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
     
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles-merged.css">
    <link rel="stylesheet" href="../css/style.min.css">
    <link rel="stylesheet" href="../css/custom.css"/>

    <style>
        .cl{
            margin-left: 20%;
        }
    </style>
  </head>
  <body>

  <!-- START: header -->

  <header role="banner" class="probootstrap-header">
    <!-- <div class="container"> -->
    <div class="row">
        <a href="../index.jsp" class="probootstrap-logo visible-xs"><img src="../img/logo.png" class="hires" width="120" height="33" alt="Logo"></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs"><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li class="active"><a href="../index.jsp">Home</a></li>
            <li><a href="../about.html">About</a></li>
            <li><a href="../rooms.jsp">Our Rooms</a></li>
            <li class="hidden-xs probootstrap-logo-center"><a href="../index.jsp"><img src="../img/signature (1).png" class="hires" width="281" height="50" alt="Canalta-Hotel"></a></li>
            <li><a href="../reservation.jsp">Make a Reservation</a></li>
            <li><a href="../index.jsp#feedback">Customer Feedbacks</a></li>
            <li><a href="../customer/login.jsp">My Account</a></li>
          </ul>
          <div class="extra-text visible-xs">
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
           
          </div>
        </nav>
        </div>
    <!-- </div> -->
  </header>
  <!-- END: header -->

  <!-- END: header -->

  <section class="probootstrap-slider flexslider probootstrap-inner">
    <ul class="slides">
       <li style="background-image: url(../img/slider_2.jpg);" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="probootstrap-slider-text text-center">
                  <p><img src="../img/curve_white.svg" class="seperator probootstrap-animate" alt="Canalta"></p>
                  <h1 class="probootstrap-heading probootstrap-animate">Complete Your Reservation</h1>
                  <div class="probootstrap-animate probootstrap-sub-wrap">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</div>
                </div>
              </div>
            </div>
          </div>
        </li>
    </ul>
  </section>
 


  <h1>
      
     <%
          String TransactionId = "";
         Cookie cookie = null;
         Cookie[] cookies = null;

         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();

         if( cookies != null ) {
          
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                  if (cookie.getName().equals("TransactionId")) {
                    TransactionId =  cookie.getValue();
                }
                  else{
                      
                  }
   
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
      %>
  </h1>

   
  <div id="printableArea" class="col-md-6 cl">
      
      <center><h2>Transaction Details</h2></center>
      
      <table class="table table-striped">

  <tbody>
    
    <tr>
      <th scope="row">Customer Name: </th>

      <td><%=name%></td>
    </tr>
 <tr>
      <th scope="row">Customer Email: </th>

      <td><%=email%></td>
    </tr>
     <tr>
      <th scope="row">Customer Mobile: </th>

      <td><%=phone%></td>
    </tr>
    <tr>
      <th scope="row">Transaction Id:</th>

      <td> <%=TransactionId  %></td>

    </tr>
    <tr>
      <th scope="row">Amount: </th>
 <td><%=total%></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Room Category: </th>
 <td><%=rcat%></td>
    </tr>
    <tr>
      <th scope="row">Room Type: </th>

      <td><%=r_type%></td>
    </tr>
     <tr>
      <th scope="row">Check in: </th>

      <td><%=check_in%></td>
    </tr>
    
         <tr>
      <th scope="row">Days: </th>

      <td><%=days%></td>
    </tr>
  </tbody>
</table>

  
</div>
  
      <div class="col-md-10">
          <form action="../reservation_controller" method="POST">
              <input type="hidden" name="c_email" value="<%=email%>">
               <input type="hidden" name="c_phone" value="<%=phone%>">
          <input type="hidden" name="trans_id" value="<%=TransactionId  %>">
          <input type="hidden" name="c_name" value="<%=name%>">
          <input type="hidden" name="amount" value="<%=total%>">
           <input type="hidden" name="roomcat" value="<%=rcat%>">
           <input type="hidden" name="roomt" value="<%=r_type%>">
            <input type="hidden" name="roomid" value="<%=rid%>">
            <input type="hidden" name="days" value="<%=days%>">
            <input type="hidden" name="checkin" value="<%=check_in%>">
          <input type="button" onclick="printDiv('printableArea')" class="btn btn-primary" style="margin-left:25%;margin-top:13px;" value="Print a Recept" />  
            <input type="submit"  class="btn btn-success offset-8" style="margin-left:5%;margin-top:13px;" value="Complete Reservation" />  
      </form>
      
      </div>

    
    

    

    <script>function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}</script>

  <script src="../js/scripts.min.js"></script>
  <script src="../js/main.min.js"></script>
  <script src="../js/custom.js"></script>
 
  </body>
</html>