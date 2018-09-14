<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>
<head>
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<!-- style -->
	<link href='<c:url value="/resources/user/img/fevicon.jpg" />' rel="shortcut icon"/>
	
	<link href='<c:url value="/resources/user/css/font-awesome.css" />' rel="stylesheet"/>
	<link href='<c:url value="/resources/user/fi/flaticon.css" />' rel="stylesheet"/>
	<link href='<c:url value="/resources/user/css/main.css" />'rel="stylesheet"/>
	<link href='<c:url value="/resources/user/tuner/css/colorpicker.css" />' rel="stylesheet" type="text/css"/>
	<link href='<c:url value="/resources/user/tuner/css/styles.css"/>' rel="stylesheet" type="text/css"/>
	<link href='<c:url value="/resources/user/css/jquery.fancybox.css" />'rel="stylesheet" type="text/css" />
	<link href='<c:url value="/resources/user/css/owl.carousel.css"/>' rel="stylesheet"/>
	<link href='<c:url value="/resources/user/rs-plugin/css/settings.css" />' media="screen" rel="stylesheet" type="text/css"/>
	<link href='<c:url value="/resources/user/css/animate.css" />'rel="stylesheet"/>
	<!--styles -->
	<!-- java -->
	<!-- LIBRARY FONT-->
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:400,400italic,700,900,300">
    <link href='<c:url value="/resources/assets/font/font-icon/font-awesome-4.4.0/css/font-awesome.css"/>'rel="stylesheet">
    <link href= '<c:url value="/resources/assets/font/font-icon/font-svg/css/Glyphter.css"/>' rel="stylesheet"/>
    <!-- LIBRARY CSS-->
    <link href='<c:url value="/resources/assets/libs/animate/animate.css"/>'/>
    <link href='<c:url value="/resources/assets/libs/bootstrap-3.3.5/css/bootstrap.css"/>'/>
    <link href='<c:url value="/resources/assets/libs/owl-carousel-2.0/assets/owl.carousel.css"/>' rel="stylesheet"/>
    <link href='<c:url value="/resources/assets/libs/selectbox/css/jquery.selectbox.css"/>'rel="stylesheet"/>
    <link href='<c:url value="/resources/assets/libs/fancybox/css/jquery.fancybox.css"/>'/>
    <link href='<c:url value="/resources/assets/libs/fancybox/css/jquery.fancybox-buttons.css"/>' rel="stylesheet"/>
    <link href='<c:url value="/resources/assets/libs/media-element/build/mediaelementplayer.min.css"/>' rel="stylesheet"/>
    <link href='<c:url value="/resources/assets/css/color-1.css"/>' rel="stylesheet"/>
    <!-- STYLE CSS    --><!--link(type="text/css", rel='stylesheet', href='/resources/assets/css/color-1.css', id="color-skins")-->
    <link type="text/css" rel="stylesheet" href="#" id="color-skins">
   <script src='<c:url value="/resources/assets/libs/jquery/jquery-2.1.4.min.js"></c:url>'></script>
   <script src='<c:url value="/resources/assets/libs/js-cookie/js.cookie.js"></c:url>'></script>
    <script>if ((Cookies.get('color-skin') != undefined) && (Cookies.get('color-skin') != 'color-1')) {
        $('#color-skins').attr('href', '/resources/assets/css/' + Cookies.get('color-skin') + '.css');
    } else if ((Cookies.get('color-skin') == undefined) || (Cookies.get('color-skin') == 'color-1')) {
        $('#color-skins').attr('href', '/resources/assets/css/color-1.css');
    }
    </script>
	<!-- closejava -->
</head>
<body>
    <!-- manu -->
	<!-- page header -->
	<header class="only-color">
		<!-- header top panel -->
		<div class="page-header-top">
			<div class="grid-row clear-fix">
				<address>
					<a href="tel:+919173026598" class="phone-number"><i class="fa fa-phone"></i>+919173026598</a>
					<a href="mailto:hr@hntechno.com" class="email"><i class="fa fa-envelope-o"></i>hr@hntechno.com</a>
				</address>
				<div class="header-top-panel">
					
					<div id="top_social_links_wrapper">
					    <div class="share-toggle-button"><i class="share-icon fa fa-share-alt"></i></div>
					    <div class="cws_social_links"><a href="https://plus.google.com/" class="cws_social_link" title="Google +"><i class="share-icon fa fa-google-plus" style="transform: matrix(0, 0, 0, 0, 0, 0);"></i></a><a href="http://twitter.com/" class="cws_social_link" title="Twitter"><i class="share-icon fa fa-twitter"></i></a><a href="http://facebook.com" class="cws_social_link" title="Facebook"><i class="share-icon fa fa-facebook"></i></a><a href="http://dribbble.com" class="cws_social_link" title="Dribbble"><i class="share-icon fa fa-dribbble"></i></a></div>
					</div>
					<a href="#" class="search-open"><i class="fa fa-search"></i></a>
					<form action="#" class="clear-fix">
						<input type="text" placeholder="Search" class="clear-fix">
					</form>
					
				</div>
			</div>
		</div>
		<!-- / header top panel -->
		</header>		
		<!-- sticky menu -->
		<div class="sticky-wrapper">
			<div class="sticky-menu">
				<div class="grid-row clear-fix">
					<!-- logo -->
					
					<!-- / logo -->
					<nav class="main-nav">
						<ul class="clear-fix">
							<li>
								<a href="home.net" class="active">HOME</a>
							</li>
							<li class="megamenu">
								<a href = "aboutus.net">ABOUT US</a>
							</li>
							<li>
								<a href="services.net">SERVICES</a>
								<!-- sub menu -->
								<ul>
									<li><a href="WebDesigning.net">Web Designing & Developement</a></li>
									<li><a href="appdevlop.net">Application Developement</a></li>
									<li><a href="technology.net">Technologies</a></li>
                                    <li><a href="mobileapp.net">Mobile Application Developement</a></li>
								</ul>
								<!-- / sub menu -->
							</li>
							<li>
								<a href="userinquiry.net">INQUIRY</a>
							</li>
							<li>
								<a href="tranning.net">TRAINING</a>
								<ul>
								<%-- <c:forEach items="${list2}" var="l">
								 --%><li><a href="directtr.net">Direct Training</a></li>
									<li><a href="livetr.net">Live Project Training</a></li>
									<li><a href="onlinetr.net">Online Training</a></li>
                                    <%-- </c:forEach>
								 --%></ul>
							</li>
							 <li>
								<a href="userlanguage.net">LANGUAGE</a>
								<ul>
									<c:forEach items="${list8}" var="u" varStatus="count">
										<li><a href="particularlang.net?id=${u.lid}">${u.lang}</a></li>
								</c:forEach>
								</ul>
							</li>
                            
                            <li>
								<a href="usermaterial.net">MATERIAL</a>
							</li>
                           
							<li>
								<a href="contact.net">CONTACT US</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- sticky menu -->
		<!-- / menu -->
		



<div>
	<!-- revolution slider -->	
		<tiles:insertAttribute name="body"/>
            </div>
<footer>
		<div class="grid-row">
			<div class="grid-col-row clear-fix">
				<section class="grid-col grid-col-3 footer-contact-form">
						<h2 class="corner-radius">About Us</h2>
						<div>
							<p>Started with a vision of bridging the gap between skills required and talent created by colleges, today HN Techno is one of the IT Training and Finishing Schools with expertise in PHP Training, Java Training, Android Training, Web Design Training and ASP.Net. Today we have Software Development training centers in Ahmedabad. As one of the largest Software Development company in Gujarat.</p>
						</div>
				</section>
				<section class="grid-col grid-col-3 footer-contact-form">
						<h2 class="corner-radius">Latest Courses </h2>
						<ul class="cours_list" style="margin-left: 32%;" >
							<li>PHP</li>
							<li>Java</li>
							<li>Android</li>
                            <li>.Net</li>
							<li>Web Designing</li>
							<li>IOS</li>
						</ul>
				</section>
					
				<section class="grid-col grid-col-3 footer-contact-form">
						<h2 class="corner-radius">Address</h2>
								<p>+919173026598</p>
								<p>hr@hntechno.com</p>
								<p>www.hntechno.com</p>
								<p>
									G/3,Sagar Apartment,
									Nr. Kalasagar Mall,
									Inside Sur-sagar Tower,
									Ghatlodia,
                                    Ahmedabad-380061
                                </p>
							
							<div class="footer-social" style="margin-top: 20%;">
								<a href="" class="fa fa-twitter"></a>
								<a href="" class="fa fa-skype"></a>
								<a href="" class="fa fa-google-plus"></a>
								<a href="" class="fa fa-rss"></a>
								<a href="" class="fa fa-youtube"></a>
							</div>
					</section>
					
				<section class="grid-col grid-col-3 footer-contact-form">
						<h2 class="corner-radius">apply for Feedback</h2>
						<div class="email_server_responce"></div>
						<form action="php/contacts-process.php" class="contact-form" method="post" novalidate>
							<p><span class="your-name"><input type="text" name="name" value="" size="40" placeholder="Name" aria-invalid="false" required></span>
							</p>
							<p><span class="your-email"><input type="text" name="phone" value="" size="40" placeholder="Phone" aria-invalid="false" required></span> </p>
							<p><span class="your-message"><textarea name="message" placeholder="Comments" cols="40" rows="5" aria-invalid="false" required></textarea></span> </p>
							<button type="submit" class="cws-button bt-color-3 border-radius alt icon-right">Submit <i class="fa fa-angle-right"></i></button>
						</form>
					</section>
				
			</div>
		</div>
		<div class="footer-bottom">
			<div class="grid-row clear-fix">
				<div class="copyright">HnTechno<span></span> 2016 . All Rights Reserved</div>
				<nav class="footer-nav">
					<ul class="clear-fix">
						<li>
							<a href= "home.net" class="active">HOME</a>
						</li>
						<li>
							<a href="aboutus.net">About us</a>
						</li>
						<li>
							<a href="services.net">Services</a>
						</li>
						<li>
							<a href="userinquiry.net">Inquiry</a>
						</li>
						<li>
							<a href="tranning.net">Training</a>
						</li>
						<li>
							<a href="userlanguage.net">Language</a>
						</li>
						<li>
							<a href="usermaterial.net">Material</a>
						</li>
						<li>
							<a href="contact.net">Contact</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</footer>
	<!-- / footer -->
	<script src='<c:url value="/resources/user/js/jquery.min.js"></c:url>'></script>
	<script  src='<c:url value="/resources/user/js/jquery.validate.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jquery.form.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/TweenMax.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/main.js"></c:url>'></script>
	<!-- jQuery REVOLUTION Slider  -->
	<script src='<c:url value="/resources/user/rs-plugin/js/jquery.themepunch.tools.min.js"></c:url>' type="text/javascript"></script>
	<script src='<c:url value="/resources/user/rs-plugin/js/jquery.themepunch.revolution.min.js"></c:url>'type="text/javascript" ></script>
	<script src='<c:url value="/resources/user/js/jquery.isotope.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/owl.carousel.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jquery-ui.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jflickrfeed.min.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jquery.tweet.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jquery.fancybox.pack.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/jquery.fancybox-media.js"></c:url>'></script>
	<script src='<c:url value="/resources/user/js/retina.min.js"></c:url>'></script>
	<!-- java -->
	<script src='<c:url value="/resources/assets/libs/bootstrap-3.3.5/js/bootstrap.min.js"></c:url>'></script>

<script src='<c:url value="/resources/assets/libs/smooth-scroll/jquery-smoothscroll.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/owl-carousel-2.0/owl.carousel.min.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/appear/jquery.appear.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/count-to/jquery.countTo.js"></c:url>'></script>

<script src='<c:url value="/resources/assets/libs/wow-js/wow.min.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/selectbox/js/jquery.selectbox-0.2.min.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/fancybox/js/jquery.fancybox.js"></c:url>'></script>
<script src='<c:url value="/resources/assets/libs/fancybox/js/jquery.fancybox-buttons.js"></c:url>'></script>
<!-- MAIN JS-->
<script src='<c:url value="/resources/assets/js/main.js"></c:url>'></script>

	<!-- javaclose -->
	<script>
	$(document).ready(function(){
		if($('#owl-demo2').length){
			var owl = $("#owl-demo2");
			owl.owlCarousel({	
				autoPlay: 3000, //Set AutoPlay to 3 seconds
				itemsCustom : [
					[0, 1],
					[450, 1],
					[600, 2],
					[700, 3],
					[1000, 4],
					[1200, 4],
					[1400, 4],
					[1600, 4]
				],
				navigation : true
			});
		}		
	});		
	</script>
</body>
</html>