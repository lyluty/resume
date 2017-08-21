<!DOCTYPE html>
<!--  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
-->

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> orderList </title>
<meta name="author" content="">
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="icon" href="../include/images/favicon.png" sizes="32x32"/>
<link href="../include/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href="../include/css/ionicons.min.css" rel="stylesheet" type="text/css">
<link href="../include/css/slick.css" rel="stylesheet" type="text/css">
<link href="../include/css/animate.css" rel="stylesheet" type="text/css">
<link href="../include/css/animsition.min.css" rel="stylesheet" type="text/css">
<link href="../include/css/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="../include/css/style.css" rel="stylesheet" type="text/css">
<script src="../include/js/modernizr-custom.js"></script>

<link rel='stylesheet' href='include/css/calendar/fullcalendar.css' />
<script src='include/css/calendar/jquery.min.js'></script>

<script src='include/css/calendar/moment.min.js'></script>
<script src='include/css/calendar/fullcalendar.js'></script>
<script>
		$(document).ready(function() {
		
		    // page is now ready, initialize the calendar...
		
		    $('#calendar').fullCalendar({
		    	height: 800,
		        selectable: true,
		        select: function(start, end, jsEvent, view) {
		            // start contains the date you have selected
		            // end contains the end date. 
		            // Caution: the end date is exclusive (new since v2).
		            var allDay = !start.hasTime() && !end.hasTime();
		            alert(["Event Start date: " + moment(start).format(),
		                   "Event End date: " + moment(end).format(),
		                   "AllDay: " + allDay].join("\n"));
		       }

		    	// put your options and callbacks here
		    });

		});
 
</script>


<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="animsition"> 
  <!-- nav start -->
  <button class="action action--open" aria-label="Open Menu"><span class="icon icon--menu"></span></button>
  <nav id="ml-menu" class="menu">
    <button class="action action--close" aria-label="Close Menu"><span class="icon icon--cross"></span></button>
    <div class="menu__wrap">
      <ul data-menu="main" class="menu__level">
        <li class="menu__item"><a class="menu__link" data-submenu="submenu-1" href="#">Home</a></li>
        <li class="menu__item"><a class="menu__link" data-submenu="submenu-2" href="#">About</a></li>
        <li class="menu__item"><a class="menu__link" data-submenu="submenu-3" href="#">Services</a></li>
        <li class="menu__item"><a class="menu__link" href="portfolio.html">Portfolio</a></li>
        <li class="menu__item"><a class="menu__link menu__link--current" href="blog.html">Blog</a></li>
        <li class="menu__item"><a class="menu__link" href="testimonials.html">Testimonials</a></li>
        <li class="menu__item"><a class="menu__link" href="contact-us.html">Contact us</a></li>
        <li class="menu__item"><a class="menu__link" data-submenu="submenu-4" href="#">Pages</a></li>
      </ul>
      <!-- Submenu 1 -->
      <ul data-menu="submenu-1" class="menu__level">
        <li class="menu__item"><a class="menu__link" href="index.html">Slider</a></li>
        <li class="menu__item"><a class="menu__link" href="index2.html">Image</a></li>
        <li class="menu__item"><a class="menu__link" href="index3.html">Video</a></li>
      </ul>
      <!-- Submenu 2 -->
      <ul data-menu="submenu-2" class="menu__level">
        <li class="menu__item"><a class="menu__link" href="about-us.html">About us</a></li>
        <li class="menu__item"><a class="menu__link" href="team.html">Our Team</a></li>
        <li class="menu__item"><a class="menu__link" href="history.html">History</a></li>
      </ul>
      
      <!-- Submenu 3 -->
      <ul data-menu="submenu-3" class="menu__level">
        <li class="menu__item"><a class="menu__link" href="services.html">All Services</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">Graphic Design</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">Web Design</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">Web Development</a></li>
        <li class="menu__item"><a class="menu__link" data-submenu="submenu-3-1" href="#">App Development</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">e-Commerce</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">SEO</a></li>
      </ul>
      
      <!-- Submenu 3-1 -->
      <ul data-menu="submenu-3-1" class="menu__level">
        <li class="menu__item"><a class="menu__link" href="service-single.html">Android</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">iPhone</a></li>
        <li class="menu__item"><a class="menu__link" href="service-single.html">Windows</a></li>
      </ul>
      
      <!-- Submenu 4 -->
      <ul data-menu="submenu-4" class="menu__level">
        <li class="menu__item"><a class="menu__link" href="service-single.html">Service Single</a></li>
        <li class="menu__item"><a class="menu__link" href="blog-single.html">Blog Single</a></li>
        <li class="menu__item"><a class="menu__link" href="team-single.html">Team Single</a></li>
        <li class="menu__item"><a class="menu__link" href="portfolio-single.html">Portfolio Single</a></li>
        <li class="menu__item"><a class="menu__link" href="404.html">404</a></li>
      </ul>
    </div>
  </nav>
  <!-- nav end --> 
  <!-- header start -->
  <header>
    <div class="header-upper"><a class="logo" href="index.html"><img src="../include/images/logo.png" alt="" /></a> </div>
    <div class="header-lower">
      <ul class="quick-contact">
        <li><b>EMAIL :</b> <a href="mailto:#"><i class="ion ion-email visible-xs"></i><span>service@your-domain.com</span></a></li>
        <li><b>PHONE :</b> <a href="tel:#"><i class="ion ion-android-call visible-xs"></i><span>+91 9876 543 210</span></a></li>
        <li class="social-links"><b>GET SOCIAL :</b> <a href="#" target="_blank"><i class="ion ion-social-facebook"></i></a><a href="#" target="_blank"><i class="ion ion-social-twitter"></i></a><a href="#" target="_blank"><i class="ion ion-social-googleplus"></i></a><a href="#" target="_blank"><i class="ion ion-social-instagram"></i></a></li>
      </ul>
      <p class="copyright">&copy; 2017. All right reserved.</p>
    </div>
  </header>
  <!-- header end --> 
  <!-- main-container start -->
  <div class="main-container-outer">
    <div class="container">
      <div class="top-bar-container">
        <div class="container">
          <div class="top-bar">
            <ul class="breadcrumb">
              <li><a href="index.html">Home</a></li>
              <li><span>Blog</span></li>
            </ul>
          </div>
          <!-- Share start -->
          <div class="share-box">
            <ul class="share-list">
              <li><a href="" class="addthis_button_facebook"><span><i class="ion ion-social-facebook"></i></span></a></li>
              <li><a href="" class="addthis_button_twitter"><span><i class="ion ion-social-twitter"></i></span></a></li>
              <li><a href="" class="addthis_button_google_plusone_share"><span><i class="ion ion-social-googleplus"></i></span></a></li>
              <li><a href="" class="addthis_button_linkedin"><span><i class="ion ion-social-linkedin"></i></span></a></li>
            </ul>
            <a href="#" class="share-trigger"><i class="ion ion-share"></i> SHARE</a> </div>
          
          <!-- Share end --> 
        </div>
      </div>
      <div class="main-container">
        <div class="inner-banner parallax" data-parallax-speed="5"  style="background-image:url(../include/images/project-slide1.jpg);">
          <h2>Blog</h2>
        </div>
        
        <!-- Content Holder Start -->
        <div class="content-holder">
          <h3 class="content-title">Order List</h3>
          <p class="large-para"> 뭐라 쓸지 고민좀.. </p>
          <p> 두줄은 아니라도 괜찮겠지</p>
        </div>
        <!-- Content Holder End --> 
        
        <!-- Content Holder Start -->
        <div class="content-holder">
        
        <!-- 내용 기재  -->
        
        <div id='calendar' style="width: 60%; display: inline-block;"></div>
        
        <h1>Order Service getList</h1>
<hr style="border: solid 2px black;"/>
		<div>
		<table border="1" width= "1100px">
				<tr align="center">
					<td>ord_id</td>
					<td>pdt_id</td>
					<td>ord_pdtAmount</td>
					<td>ord_total</td>
					<td>ord_paymentMethod</td>
					<td>ord_date</td>
					<td>ord_state</td>
					<td>tbl_id</td>
				</tr>
				
		<c:forEach var="order"  items="${orderList}">
					<tr align="center">
						<td>${order.ord_id}</td>
						<td>${order.pdt_id}</td>
						<td>${order.ord_pdtAmount}</td>
						<td>${order.ord_total}</td>
						<td>${order.ord_paymentMethod}</td>
						<td>${order.ord_date}</td>
						<td>${order.ord_state}</td>
						<td>${order.tbl_id}</td>
					</tr>
		</c:forEach>
			</table>
		</div>
		<hr/>
        
        
        <!--  
        <div style="float:center; width:700px;" id="calendar"></div>
        
        $(document).ready(function(){
        	$("#calendar").fullCalendar({
        		
        		defaultDate: "sysdate"
        		, editable: true
        
      		  });
    	 });
        -->
        
   
          <div class="pagination-container">
            <ul class="pagination">
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
            </ul>
          </div>
        </div>
        <!-- Content Holder End -->
        
        <div class="quote-box">
          <h6>Want to discuss with  Employee ?</h6>
          <a href="contact-us.html" class="btn btn-default">LET'S TALK</a> </div>
      </div>
    </div>
  </div>
  <!-- main-container end --> 
  <!-- footer start -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="social-links"> <a href="#" target="_blank"><i class="ion ion-social-facebook"></i></a><a href="#" target="_blank"><i class="ion ion-social-twitter"></i></a><a href="#" target="_blank"><i class="ion ion-social-googleplus"></i></a><a href="#" target="_blank"><i class="ion ion-social-instagram"></i></a></div>
          <p class="copyright">&copy; 2017. All right reserved.</p>
        </div>
      </div>
    </div>
  </footer>
  <!-- footer end --> 
</div>
<script type="text/javascript" src="../include/js/jquery-2.2.2.min.js"></script> 
<script type="text/javascript" src="../include/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="../include/js/animsition.min.js"></script> 
<script type="text/javascript" src="../include/js/jquery.validate.js"></script> 
<script type="text/javascript" src="../include/js/classie.js"></script> 
<script type="text/javascript" src="../include/js/main.js"></script> 
<script type="text/javascript" src="../include/js/waypoint.js"></script> 
<script type="text/javascript" src="../include/js/slick.min.js"></script> 
<script type="text/javascript" src="../include/js/jquery.countTo.js"></script> 
<script type="text/javascript" src="../include/js/imagesloaded.js"></script> 
<script type="text/javascript" src="../include/js/masonry-3.1.4.js"></script> 
<script type="text/javascript" src="../include/js/masonry.filter.js"></script> 
<script type="text/javascript" src="../include/js/jquery.magnific-popup.min.js"></script> 
<script type="text/javascript" src="../include/js/jquery.vide.js"></script> 
<script type="text/javascript" src="../include/js/simple.parallax.js"></script>
<script type="text/javascript" src="../include/js/custom.js"></script> 
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> 
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-576b8f979487378e"></script>
</body>
</html>