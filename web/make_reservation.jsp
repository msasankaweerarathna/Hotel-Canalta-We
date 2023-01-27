<%-- 
    Document   : make_reservation
    Created on : Dec 25, 2021, 4:24:39 PM
    Author     : ManojKasun
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date now = new Date();
    String strDate = sdf.format(now);
   Date endDate;
Calendar c = Calendar.getInstance(); 
c.setTime(now); 
c.add(Calendar.DATE, 14);
endDate = c.getTime();
String last = sdf.format(endDate);
        
              
            
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
           response.sendRedirect("customer/login.jsp");  
        }
       
            %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel &mdash; Canalta  </title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="css/custom.css">

 <%
     String room_id = request.getParameter("r_id").toString();
     String room_cat = request.getParameter("r_cat").toString(); 
      String room_type = request.getParameter("r_type").toString(); 
    String price = request.getParameter("price").toString(); 
    %>
  </head>
  <body>

  <!-- START: header -->

  <header role="banner" class="probootstrap-header">
    <!-- <div class="container"> -->
    <div class="row">
        <a href="index.jsp.html" class="probootstrap-logo visible-xs"><img src="img/logo.png" class="hires" width="120" height="33" alt="Logo"></a>
        
        <a href="#" class="probootstrap-burger-menu visible-xs"><i>Menu</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="rooms.jsp">Our Rooms</a></li>
            <li class="hidden-xs probootstrap-logo-center"><a href="index.jsp"><img src="img/signature (1).png" class="hires" width="281" height="50" alt="Canalta-Hotel"></a></li>
            <li><a href="reservation.jsp">Make a Reservation</a></li>
            <li><a href="index.jsp#feedback">Customer Feedbacks</a></li>
            <li><a href="customer/login.jsp">My Account</a></li>
          </ul>
          <div class="extra-text visible-xs">
            <a href="#" class="probootstrap-burger-menu"><i>Menu</i></a>
           
          </div>
        </nav>
        </div>
    <!-- </div> -->
  </header>
  <!-- END: header -->

  
  <section class="probootstrap-section">
    <div class="container">
      <div class="row probootstrap-gutter60">
        <div class="col-md-8">
          <h2 class="mt0">Make My Reservation</h2>
          <form action="payment/paypal_checkout.jsp" method="post" class="probootstrap-form">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="fname">Customer Name</label>
                  <input type="text" class="form-control" disabled id="fname" value="<%=name%>" >
                   <input type="hidden" class="form-control"  id="fname" value="<%=name%>" name="fname">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">Phone Number</label>
                  <input type="text" class="form-control" disabled value="<%=phone%>" id="lname" name="phone">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" disabled id="email" value="<%=email%>" name="email">
            </div>
            
                       <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="fname">Room Type</label>
                  <input type="text" class="form-control" disabled id="fname" value="<%=room_type %>" >
                   <input type="hidden" class="form-control"  id="fname" value="<%=room_type %>" name="type">
                   <input type="hidden" class="form-control"  id="fname" value="<%=room_cat %>" name="cat">
                   <input type="hidden" class="form-control"  id="fname" value="<%=room_id %>" name="rid">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">Price</label>
                  <input type="text" class="form-control" disabled id="lname" value="<%=price %>" >
                   <input type="hidden" class="form-control"  id="lname" value="<%=price %>" name="price">
                </div>
              </div>
            </div>
                    <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="fname">In Date</label>
                  <input type="date" min="<%=strDate%>" max="<%=last%>" class="form-control" required id="in" name="in">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="lname">Days Need</label>
                  <input type="number" value="1" class="form-control" required id="out" name="out">
                </div>
              </div>
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-primary btn-lg" id="submit" name="submit" value="Book">
            </div>
          </form>
        </div>
        <div class="col-md-4">
          <h2 class="mt0">Need a Help</h2>
          <ul class="probootstrap-contact-info">
                <li><i class="icon-location2"></i> <span>122, main Street ,Colombo 06,<br> Sri Lanka</span></li>
              <li><i class="icon-mail"></i><span>info@Canalta.lk</span></li>
              <li><i class="icon-phone2"></i><span>+011-99994994</span></li>
            </ul>
         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.6558514248327!2d79.84083831525133!3d6.931673520205427!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259251b57a431%3A0x8f44e226d6d20a7e!2sGaladari%20Hotel!5e0!3m2!1sen!2slk!4v1640431147430!5m2!1sen!2slk" width="310" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>
    </div>
  </section>

    </body>
</html>
