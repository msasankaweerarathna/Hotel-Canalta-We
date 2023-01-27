<%-- 
    Document   : dashboard
    Created on : Dec 25, 2021, 3:28:46 PM
    Author     : ManojKasun
--%>

<%@page import="java.sql.DriverManager"%>
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

    <style>
        .nm{
            color: yellow;
        }
        .wl{
            color: #a6e1ec;
        }
    </style>
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
            <li><a href="my_feedbacks.jsp">My Feedbacks</a></li>
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
       <li style="background-image: url(../img/dbg.png);" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="probootstrap-slider-text text-center">
                  <p><img src="../img/curve_white.svg" class="seperator probootstrap-animate" alt="Canalta"></p>
                  <h1 class="probootstrap-heading probootstrap-animate">Customer Dashboard</h1>
                  <div class="probootstrap-animate probootstrap-sub-wrap"><h3><span class="wl">Welcome</span>&nbsp; &nbsp;   <b><span class="nm"><%=name%></span></b></h3></div>
                </div>
              </div>
            </div>
          </div>
        </li>
    </ul>
  </section>
  
  <section class="probootstrap-section">
      <center><h2>My Reservations</h2> </center>
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Room Category</th>
      <th scope="col">Room Type</th>
      <th scope="col">Check in</th>
      <th scope="col">Days</th>
      <th scope="col">Transaction ID</th>
       <th scope="col">Total</th>
         <th scope="col">Reserved On</th>
          <th scope="col">Status</th>
           <th scope="col">Cancel Reservation</th>
    </tr>
  </thead>
  <tbody>
       <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelCanalta","root","");
statement=connection.createStatement();
String sql ="select * from reservations where email ='"+session4.getAttribute("c_email")+"' ";

resultSet = statement.executeQuery(sql);
 int i = 1;
while(resultSet.next()){
   
%>      
                
      
      
      
      
    <tr>
      <th scope="row"><%=resultSet.getString(1)%></th>
      <td><%=resultSet.getString(2)%></td>
      <td><%=resultSet.getString(3)%></td>
      <td><%=resultSet.getString(6)%></td>
      <td><%=resultSet.getString(7)%></td>
      <td><%=resultSet.getString(10)%></td>
      <td><%=resultSet.getString(4)%></td>
      <td><%=resultSet.getString(11)%></td>
      <td><%=resultSet.getString(12)%></td>
      <td>
          <form action="../CancelReservationController" method="post">
              <input type="hidden" name="id" value="<%=resultSet.getString(1)%>">
              <input type="hidden" name="date" value="<%=resultSet.getString(6)%>">
              <input type="submit" class="btn btn-danger" value="Cancel">
              
          </form>
      </td>
    </tr>
  <% 
   
}

} catch (Exception e) {
e.printStackTrace();
}
%>
  </tbody>
</table>
  </section>

 



 




  <script src="../js/scripts.min.js"></script>
  <script src="../js/main.min.js"></script>
  <script src="../js/custom.js"></script>


  </body>
</html>