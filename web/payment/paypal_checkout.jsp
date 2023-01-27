<%-- 
    Document   : paypal_checkout
    Created on : Dec 25, 2021, 7:01:53 PM
    Author     : ManojKasun
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    
      String c_name = request.getParameter("fname").toString(); 
       String price = request.getParameter("price").toString(); 
String days = request.getParameter("out").toString(); 
int p2 = Integer.parseInt(price);
int d2 = Integer.parseInt(days);
int total = p2*d2;

                     HttpSession session2=request.getSession(true);  
                     session2.setAttribute("c_name",request.getParameter("fname").toString()); 
                     HttpSession session3=request.getSession(true);  
                     session3.setAttribute("total_p",String.valueOf(total)); 
                     HttpSession session4=request.getSession(true);  
                     session4.setAttribute("r_type",request.getParameter("type").toString());
                     HttpSession session5=request.getSession(true);  
                     session5.setAttribute("room_id",request.getParameter("rid").toString());
                     HttpSession session6=request.getSession(true);  
                     session6.setAttribute("room_cat",request.getParameter("cat").toString());
                     
                      HttpSession session10=request.getSession(true);  
                     session10.setAttribute("check_in",request.getParameter("in").toString());
                      HttpSession session11=request.getSession(true);  
                     session11.setAttribute("days",request.getParameter("out").toString());
                     
  HttpSession session1=request.getSession(false);  
        String id=(String)session1.getAttribute("c_id"); 
        
          HttpSession session7=request.getSession(false);  
        String phone=(String)session7.getAttribute("c_phone"); 
        
          HttpSession session8=request.getSession(false);  
        String name=(String)session8.getAttribute("c_name"); 
           HttpSession session9=request.getSession(false);  
        String email=(String)session9.getAttribute("c_email"); 
        if(session1.getAttribute("c_id")!= null ){  
         
      
        
        }  
       
      
        else{
           response.sendRedirect("../customer/login.jsp");  
        }

    %>
<html lang="en">
  <head th:replace="fragments :: page_head('Checkout', 'none')"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel &mdash; Canalta  </title>
    <meta name="description" content="Free Bootstrap Theme by uicookies.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:300,400,700|Rubik:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../css/styles-merged.css">
    <link rel="stylesheet" href="../css/style.min.css">
    <link rel="stylesheet" href="../css/custom.css"/>


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
            <li class="active"><a href="../index.jsp.html">Home</a></li>
            <li><a href="../about.html">About</a></li>
            <li><a href="rooms.jsp">Our Rooms</a></li>
            <li class="hidden-xs probootstrap-logo-center"><a href="../index.jsp.html"><img src="../img/signature (1).png" class="hires" width="281" height="50" alt="Canalta-Hotel"></a></li>
            <li><a href="reservation.jsp">Make a Reservation</a></li>
            <li><a href="#feedback">Customer Feedbacks</a></li>
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

  <!-- END: header -->

  <section class="probootstrap-slider flexslider probootstrap-inner">
    <ul class="slides">
       <li style="background-image: url(../img/slider_2.jpg);" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="probootstrap-slider-text text-center">
                  <p><img src="../img/curve_white.svg" class="seperator probootstrap-animate" alt="Canalta"></p>
                  <h1 class="probootstrap-heading probootstrap-animate">Make Your Payment</h1>
                  <div class="probootstrap-animate probootstrap-sub-wrap">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</div>
                </div>
              </div>
            </div>
          </div>
        </li>
    </ul>
  </section>

  <section class="probootstrap-section">
      <div class="container-fluid">
          <div th:replace="navigation :: header_menu"></div>
          <div th:replace="navigation :: search_nav"></div>
          
          <div class="text-center">
             
              <div id="paypal-button-container"></div>
          </div>
      </div>
  </section>


  <div th:replace="fragments :: modal_dialog"></div>
  <div th:replace="navigation :: footer_menu"></div>




  <script src="../js/scripts.min.js"></script>
  <script src="../js/main.min.js"></script>
  <script src="../js/custom.js"></script>
  <script type="text/javascript" src="https://www.paypal.com/sdk/js?client-id=Abx_zXB_YsIFUWd1qkyTtO_8qvzwmIgHxphaXL3KuEBK_0vU4TQOc_-FUVhhW2u4HcMsloSEbCo6XnW3"></script>
  <script>
      paypal.Buttons({
          createOrder: function(data, actions){
              return actions.order.create({
                  intent: 'CAPTURE',
                  payer : {
                      name: {
                          given_name: "<%=c_name %>",
                          surname: "user"
                      },
                      address: {
                          address_line_1: "ad1 trhr ",
                          address_line_1: "ad1 rrgt",
                          admin_area_2: "fgh thg ggg",
                          admin_area_1: "ohiyot",
                          postal_code: "44688",
                          country_code: "LK"
                  },
                          email_address: "<%=email %>",
                  phone: {
                      phone_type: "MOBILE",
                      phone_number: {
                          national_number: "941234567"
              }
                      
          }
          },
          purchase_units: [{
                amount:{
                    value: "<%=total %>",
            currency_code: "USD"
        }
          }]   
  
          });
          },
          
   onApprove: function(data, actions) {
    // This function captures the funds from the transaction.
    return actions.order.capture().then(function(details) {
      // This function shows a transaction success message to your buyer.
            console.log(details);
 document.cookie = "TransactionId="+details.id;
      alert('Transaction completed by ' + details.id);
window.location.replace('http://localhost:8080/Hotel_Canalta_Web/payment/Continue.jsp');


    });
  },
  onCancel: function(data){
      alert("Payment Canceled Successfully!!");
  },
  onError: function(err){
      alert("Something Wrong with your payment. Plaese try again later!!!");
      
  }
   
      }).render("#paypal-button-container");
      

  </script>
  </body>
</html>