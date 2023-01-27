<%-- 
    Document   : rooms
    Created on : Dec 25, 2021, 2:00:10 PM
    Author     : ManojKasun
--%>

<%@page import="models.GetAvailableUSRModel"%>
<%@page import="models.GetAvailableFRModel"%>
<%@page import="models.GetAvailableGDRModel"%>
<%@page import="models.GetAvailableCoupleRoomsModel"%>
<%@page import="models.GetAvailableClassicRoomsModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% GetAvailableClassicRoomsModel cl = new GetAvailableClassicRoomsModel(); %>
<% GetAvailableCoupleRoomsModel cp = new GetAvailableCoupleRoomsModel(); %>
<% GetAvailableGDRModel gd = new GetAvailableGDRModel(); %>
<% GetAvailableUSRModel us = new GetAvailableUSRModel(); %>
<% GetAvailableFRModel fr = new GetAvailableFRModel(); %>
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

    <style>
        .h_name{
            color: yellow;
            font-weight: bold;
        }
        .badge-success{
            background-color: green;
        }.badge-danger{
             background-color: red;
        }
    </style>
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
  <section class="probootstrap-slider flexslider probootstrap-inner">
    <ul class="slides">
       <li style="background-image: url(img/slider_2.jpg);" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="probootstrap-slider-text text-center">
                  <p><img src="img/curve_white.svg" class="seperator probootstrap-animate" alt="Free HTML5 Bootstrap Template"></p>
                  <h1 class="probootstrap-heading probootstrap-animate">Best Rooms</h1>
                  <div class="probootstrap-animate probootstrap-sub-wrap">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</div>
                </div>
              </div>
            </div>
          </div>
        </li>
    </ul>
  </section>
  
  <section class="probootstrap-section">
    <div class="container">
      <div class="row">

        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="probootstrap-room">
                  <a href="#"><img src="img/rooms/r1.jpg" alt="Room" class="img-responsive"></a>
                  <div class="text">
                    <h3>Classic Room</h3>
                    <p>Starting from <strong>$80.00/Night</strong><br><% if(cl.isAvalable){ %><span class="badge badge-success">Available</span><% }else { %>
                    <span class="badge badge-danger">Currently Unavailable<% }%></span></p>
                    <div class="post-meta">
                      <ul>
                        <li><span class="review-rate">4.7</span> <i class="icon-star"></i> 252 Reviews</li>
                        <li><i class="icon-user2"></i> 3 Guests</li>
                        <br><li>  
                              <form action="make_reservation.jsp" method="post">
                                  <input type="hidden" name="r_type" value="Classic Room">
                                    <input type="hidden" name="r_cat" value="Rooms">
                                      <input type="hidden" name="r_id" value="3">
                                  <input type="hidden" name="price" value="80">
                                <% if(cl.isAvalable){ %>
                                  <button type="submit" class="btn btn-info">Book now</button>
                                  <% } else {%> 
                                  <button type="submit" disabled="" class="btn btn-info">Book now</button>
                                  <% } %>
                              </form>
                              </li>
                      </ul>
                    </div>
                  </div>
                </div>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
           <div class="probootstrap-room">
                  <a href="#"><img src="img/rooms/r2.jpg" alt="Room" class="img-responsive"></a>
                  <div class="text">
                    <h3>Grand Deluxe Room</h3>
                    <p>Starting from <strong>$90.00/Night</strong><br><% if(gd.isAvalable){ %><span class="badge badge-success">Available</span><% }else { %>
                    <span class="badge badge-danger">Currently Unavailable<% }%></span></p>
                    <div class="post-meta">
                      <ul>
                        <li><span class="review-rate">4.7</span> <i class="icon-star"></i> 100 Reviews</li>
                        <li><i class="icon-user2"></i> 3 Guests</li>
                         <br><li>  
                              <form action="make_reservation.jsp" method="post">
                                  <input type="hidden" name="r_type" value="Grand Deluxe Room">
                                   <input type="hidden" name="r_cat" value="Rooms">
                                      <input type="hidden" name="r_id" value="4">
                                  <input type="hidden" name="price" value="90">
                                   <% if(gd.isAvalable){ %>
                                  <button type="submit" class="btn btn-info">Book now</button>
                                  <% } else {%> 
                                  <button type="submit" disabled="" class="btn btn-info">Book now</button>
                                  <% } %>
                              </form>
                              </li>
                      </ul>
                    </div>
                  </div>
                </div>
        </div>
        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="probootstrap-room">
                  <a href="#"><img src="img/rooms/r5.jpg" alt="room" class="img-responsive"></a>
                  <div class="text">
                    <h3>Ultra Superior Room</h3>
                    <p>Starting from <strong> $100.00/Night</strong><br><% if(us.isAvalable){ %><span class="badge badge-success">Available</span><% }else { %>
                    <span class="badge badge-danger">Currently Unavailable<% }%></span></p>
                    <div class="post-meta">
                      <ul>
                        <li><span class="review-rate">4.7</span> <i class="icon-star"></i> 310 Reviews</li>
                        <li><i class="icon-user2"></i> 3 Guests</li>
                        <br><li>  
                              <form action="make_reservation.jsp" method="post">
                                  <input type="hidden" name="r_type" value="Ultra Superior Room">
                                   <input type="hidden" name="r_cat" value="Rooms">
                                      <input type="hidden" name="r_id" value="5">
                                  <input type="hidden" name="price" value="100">
                                  <% if(us.isAvalable){ %>
                                  <button type="submit" class="btn btn-info">Book now</button>
                                  <% } else {%> 
                                  <button type="submit" disabled="" class="btn btn-info">Book now</button>
                                  <% } %>
                              </form>
                              </li>
                      </ul>
                    </div>
                  </div>
                </div>
        </div>

        <div class="col-md-4 col-sm-6 col-xs-12">
           <div class="probootstrap-room">
                  <a href="#"><img src="img/rooms/r4.jpg" alt="Room" class="img-responsive"></a>
                  <div class="text">
                    <h3>Couple Room</h3>
                    <p>Starting from <strong>$65.00/Night</strong><br><% if(cp.isAvalable){ %><span class="badge badge-success">Available</span><% }else { %>
                    <span class="badge badge-danger">Currently Unavailable<% }%></span></p>
                    <div class="post-meta">
                      <ul>
                        <li><span class="review-rate">4.2</span> <i class="icon-star"></i> 211 Reviews</li>
                        <li><i class="icon-user2"></i> 2 Guests</li>
                         <br><li>  
                               <form action="make_reservation.jsp" method="post">
                                  <input type="hidden" name="r_type" value="Couple Room">
                                   <input type="hidden" name="r_cat" value="Rooms">
                                      <input type="hidden" name="r_id" value="6">
                                  <input type="hidden" name="price" value="65">
                                   <% if(cp.isAvalable){ %>
                                  <button type="submit" class="btn btn-info">Book now</button>
                                  <% } else {%> 
                                  <button type="submit" disabled="" class="btn btn-info">Book now</button>
                                  <% } %>
                              </form>
                              </li>
                      </ul>
                    </div>
                  </div>
                </div>
        </div>
        <div class="clearfix visible-sm-block" id="family"></div>
        <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="probootstrap-room">
                  <a href="#"><img src="img/rooms/r5.jpg" alt="" class="img-responsive"></a>
                  <div class="text">
                    <h3>Family Room</h3>
                    <p>Starting from <strong>$150.00/Night</strong><br><% if(fr.isAvalable){ %><span class="badge badge-success">Available</span><% }else { %>
                    <span class="badge badge-danger">Currently Unavailable<% }%></span></p>
                    <div class="post-meta">
                      <ul>
                        <li><span class="review-rate">4.1</span> <i class="icon-star"></i> 310 Reviews</li>
                        <li><i class="icon-user2"></i> 7 Guests</li>
                        <br><li>  
                            <form action="make_reservation.jsp"   method="post">
                                  <input type="hidden" name="r_type" value="Family Room">
                                   <input type="hidden" name="r_cat" value="Rooms">
                                      <input type="hidden" name="r_id" value="7">
                                  <input type="hidden" name="price" value="150">
                                    <% if(fr.isAvalable){ %>
                                  <button type="submit" class="btn btn-info">Book now</button>
                                  <% } else {%> 
                                  <button type="submit" disabled="" class="btn btn-info">Book now</button>
                                  <% } %>
                              </form>
                              </li>
                      </ul>
                    </div>
                  </div>
                </div>
        </div>
             
     
        <div class="clearfix visible-sm-block"></div>

      </div>

      <div class="row">
        <div class="col-md-12 text-center">
          <h2>Why Choose Us?</h2>
          <p class="mb50"><img src="img/curve.svg" class="svg" alt="Free HTML5 Bootstrap Template"></p>
        </div>
        <div class="col-md-4">
          <div class="service left-icon left-icon-sm probootstrap-animate">
            <div class="icon">
              <i class="icon-check"></i>
            </div>
            <div class="text">
              <h3>1+ Million Hotel Rooms</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
        <div class="col-md-4">
          <div class="service left-icon left-icon-sm probootstrap-animate">
            <div class="icon">
              <i class="icon-check"></i>
            </div>
            <div class="text">
              <h3>Food &amp; Drinks</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
        <div class="col-md-4">
          <div class="service left-icon left-icon-sm probootstrap-animate">
            <div class="icon">
              <i class="icon-check"></i>
            </div>
            <div class="text">
              <h3>Airport Taxi</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="probootstrap-section probootstrap-section-dark">
    <div class="container">
      <div class="row mb30">
        <div class="col-md-8 col-md-offset-2 probootstrap-section-heading text-center">
          <h2>Explore our Services</h2>
          <p class="lead">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          <p><img src="img/curve.svg" class="svg" alt="Free HTML5 Bootstrap Template"></p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="service left-icon probootstrap-animate">
            <div class="icon">
              <img src="img/flaticon/svg/001-building.svg" class="svg" alt="Free HTML5 Bootstrap Template by uicookies.com">
            </div>
            <div class="text">
              <h3>1+ Million Hotel Rooms</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
        <div class="col-md-4">
          <div class="service left-icon probootstrap-animate">
            <div class="icon">
              <img src="img/flaticon/svg/003-restaurant.svg" class="svg" alt="Free HTML5 Bootstrap Template by uicookies.com">
            </div>
            <div class="text">
              <h3>Food &amp; Drinks</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
        <div class="col-md-4">
          <div class="service left-icon probootstrap-animate">
            <div class="icon">
              <img src="img/flaticon/svg/004-parking.svg" class="svg" alt="Free HTML5 Bootstrap Template by uicookies.com">
            </div>
            <div class="text">
              <h3>Airport Taxi</h3>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
            </div>  
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="probootstrap-half">
    <div class="image" style="background-image: url(img/slider_2.jpg);"></div>
    <div class="text">
      <div class="probootstrap-animate fadeInUp probootstrap-animated">
        <h2 class="mt0">Best 5 Star hotel</h2>
        <p><img src="img/curve_white.svg" class="seperator" alt="Free HTML5 Bootstrap Template"></p>
        <div class="row">
          <div class="col-md-6">
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>    
          </div>
          <div class="col-md-6">
            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>    
          </div>
        </div>
        <p><a href="#" class="link-with-icon white">Learn More <i class=" icon-chevron-right"></i></a></p>
      </div>
    </div>
  </section>

  
 <!-- START: footer -->
  <footer role="contentinfo" class="probootstrap-footer">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="probootstrap-footer-widget">
            <p class="mt40"><img src="img/logo.png" class="hires"  alt="logo"></p>
            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
            <p><a href="#" class="link-with-icon">Learn More <i class=" icon-chevron-right"></i></a></p>
          </div>
        </div>
      
        <div class="col-md-4">
          <div class="probootstrap-footer-widget">
            <h3>Contact</h3>
            <ul class="probootstrap-contact-info">
                <li><i class="icon-location2"></i> <span>122, main Street ,Colombo 06,<br> Sri Lanka</span></li>
              <li><i class="icon-mail"></i><span>info@Canalta.lk</span></li>
              <li><i class="icon-phone2"></i><span>+011-99994994</span></li>
            </ul>
            
          </div>
        </div>
      </div>
     
    </div>
  </footer>
  <!-- END: footer -->

  <script src="js/scripts.min.js"></script>
  <script src="js/main.min.js"></script>
  <script src="js/custom.js"></script>


  </body>
</html>
