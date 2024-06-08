<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Rental.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>AgroFarm</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/style2.css">
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script src="js/slider.js"></script>
  <script src="language.js"></script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<script src="js/html5.js"></script>
<link rel="stylesheet" href="css/ie.css">
<style>
/* Style the dropdown container */
.dropdown {
	position: relative;
	display: inline-block;
	margin-left: 88%;
}

/* Style the dropdown button */

/* Style the dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: rgba(61, 57, 59, 0.66);
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	border: 20px;
	z-index: 1;
}

/* Style the dropdown links */
.dropdown-content a {
	color: white;
	font-weight: bold;
	padding: 14px 18px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: rgba(219, 207, 213, 0.16);
	color: black;
}

/* Show the dropdown content when the button is hovered over */
.dropdown:hover .dropdown-content {
	display: block;
}

.image {
	width: 40px;
	heigth: 40px;
	margin-left: 100px;
}
</style>
</head>
<body>
	<div class="main-bg">
	<div id="google_translate_element"></div>
		<!-- Header -->
		<div class="dropdown">
			<img class="image" alt="" src="images/person-circle.svg">
			<!-- <button class="dropbtn"></button>-->
			<div class="dropdown-content">
				<%
					String email = Email.getEmail();
				%>
				<a href="#"><%=email%></a> 
				<a href="viewprofile.jsp">View Profile</a> <a
					href="indexfront.html">Logout</a>
			</div>
		</div>
		<header>
		<div class="inner">
			<h1 class="logo">
				<a href="indexfront.html">Agrofarm - Agriculture company</a>
			</h1>
			<nav>
			<ul class="sf-menu">
				<li class="current"><a href="indexfront.html">home</a></li>
				<li><a href="product.jsp">Buy product</a></li>
				<li><a href="index.jsp">rental product</a>
				<li><a href="chatbotorg.html">Chatbot</a></li>



			</ul>
			</nav>
			<div class="clear"></div>
		</div>
		<div class="slider-container">
			<div class="mp-slider">
				<ul class="items">
					<li><img src="images/slide-1.jpg" alt="">
						<div class="banner mp-ban-1">
							<span class="row-1">putting our</span><span class="row-2">heart
								&amp; soul</span><span class="row-3">into the field</span>
						</div></li>
					<li><img src="images/slide-2.jpg" alt="">
						<div class="banner mp-ban-2">
							<span class="row-1">we have a strong</span><span class="row-2">agriculture</span><span
								class="row-3">heritage</span>
						</div></li>
					<li><img src="images/slide-3.jpg" alt="">
						<div class="banner mp-ban-3">
							<span class="row-1">growing clean</span><span class="row-2">and
								full of health</span><span class="row-3">products</span>
						</div></li>
				</ul>
			</div>
		</div>
		<a href="#" class="mp-prev"></a> <a href="#" class="mp-next"></a> </header>
		<!-- Content -->
		<section id="content">
		<div class="container_24">
			<div class="wrapper">
				<div class="grid_24 content-bg">
					<div class="wrapper">
						<div class="grid_16 suffix_1 prefix_1 alpha">
							<article class="indent-bot">
							<h2>Our products:</h2>
							<div class="wrapper hr-border-1">
								<div class="grid_4 alpha">
									<img src="images/page1-img1.jpg" class="img-indent-bot" alt="">
									<dl class="def-list-1">
										<dt>
											<a href="#">Tomatoes</a>
										</dt>
										<dd>Vivamus hendrerit mauris ut du gravida ut viverra
											lectus tincidunt.</dd>
									</dl>
								</div>
								<div class="grid_4">
									<img src="images/page1-img2.jpg" class="img-indent-bot" alt="">
									<dl class="def-list-1">
										<dt>
											<a href="#">Indian Eggplant</a>
										</dt>
										<dd>Vivamus hendrerit mauris ut du gravida ut viverra
											lectus tincidunt.</dd>
									</dl>
								</div>
								<div class="grid_4">
									<img src="images/page1-img3.jpg" class="img-indent-bot" alt="">
									<dl class="def-list-1">
										<dt>
											<a href="#">Cabbage</a>
										</dt>
										<dd>Vivamus hendrerit mauris ut du gravida ut viverra
											lectus tincidunt.</dd>
									</dl>
								</div>
								<div class="grid_4 omega">
									<img src="images/page1-img4.jpg" class="img-indent-bot" alt="">
									<dl class="def-list-1">
										<dt>
											<a href="#">Potatoes</a>
										</dt>
										<dd>Vivamus hendrerit mauris ut du gravida ut viverra
											lectus tincidunt.</dd>
									</dl>
								</div>
							</div>
							<div class="alignright">
								<a href="#" class="button">Read more</a>
							</div>
							</article>
							<article class="banner-box">
							<div class="inner">
								<h3>Need a useful advice from breeder?</h3>
								<h4>we want to raise your crops &amp; livestock!</h4>
								<blockquote class="quote indent-right">
									<strong>This website template has several pages: Home,
										Products, Technology, Pricing, Contacts</strong> (note that contact us
									form - doesn't work) Vivamus hendrerit mauris ut dui. gravida
									ut viverra lectus tincidunt. Cras mattis tempor eros nec
									tristique. Sed sed felis arcu, vel vehicula augue. Maecenas
									faucibus sagittis cursus. Fusce tincidunt, tellus eget
									tristique cursus, orci mi iaculis sem.
								</blockquote>
								<div class="alignright indent-right">
									<span class="author">John Smith <i>(breeder)</i></span>
								</div>
							</div>
							<img src="images/banner-box-img.png" alt=""
								class="banner-box-img"> </article>
						</div>
						<div class="grid_5 suffix_1 omega">
							<article class="indent-bot-1">
							<h2 class="heading-1">Welcome!</h2>
							<p class="p1">
								<strong> AgroPlus is one of Free website templates
									created by TemplateMonster.com team. </strong>
							</p>
							<p class="hr-border-1">This website template is optimized for
								1280X1024 screen resolution. It is also XHTML &amp; CSS valid.
								The PSD source files of this AgroPlus template are available for
								free for the registered members of TemplateMonster.com. Feel
								free to get them!</p>
							<div class="alignright">
								<a href="#" class="button">Read more</a>
							</div>
							</article>
							<article>
							<h2>Our programs:</h2>
							<ul class="list-1">
								<li><a href="#">Agronomic Practices</a></li>
								<li><a href="#">Biotechnology</a></li>
								<li><a href="#">Biotechnology Research</a></li>
								<li><a href="#">Benefits of Biotechnology</a></li>
								<li><a href="#">The Regulatory Process</a></li>
								<li><a href="#">Breeding</a></li>
								<li><a href="#">Learning Centers</a></li>
							</ul>
							</article>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		<!-- Footer -->
		<footer>
		<div class="container_24">
			<div class="wrapper">
				<div class="grid_24 footer-bg">
					<div class="hr-border-2"></div>
					<div class="wrapper">
						<div class="grid_7 suffix_1 prefix_1 alpha">
							<div class="copyright">
								&copy; 2023 <strong class="footer-logo">AgroFarm</strong>
								<div>
									Website Template by <a target="_blank"
										href="https://github.com/atharvpatil456/">Filter-H.com</a>
								</div>
							</div>
						</div>
						<div class="grid_4">
							<h5 class="heading-1">Archives:</h5>
							<ul class="footer-list">
								<li><a href="#">October 2023</a></li>
								<li><a href="#">September 2023</a></li>
								<li><a href="#">August 2023</a></li>
								<li><a href="#">July 2023</a></li>
							</ul>
						</div>
						<div class="grid_4">
							<h5 class="heading-1">Links:</h5>
							<ul class="footer-list">
								<li><a href="#">Documentation</a></li>
								<li><a href="#">Plugins</a></li>
								<li><a href="#">Suggest Ideas</a></li>
								<li><a href="#">Support Forum</a></li>
							</ul>
						</div>
						<div class="grid_4">
							<h5 class="heading-1">Support:</h5>
							<ul class="footer-list">
								<li><a href="#">Special Proposition</a></li>
								<li><a href="#">Free Phone</a></li>
								<li><a href="#">Solutions</a></li>
							</ul>
						</div>
						<div class="grid_2 suffix_1 omega">
							<ul class="social-list">
								<li><a href="#"><img src="images/social-icon-1.png"
										alt=""></a></li>
								<li><a href="#"><img src="images/social-icon-2.png"
										alt=""></a></li>
								<li><a href="#"><img src="images/social-icon-3.png"
										alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</footer>
	</div>
</body>
</html>
