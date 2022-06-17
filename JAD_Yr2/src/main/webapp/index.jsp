<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/index.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>

	<!-- home section starts  -->
	<section class="home" id="home">
		<div class="content">
			<h3>Travel the way you wish to go</h3>
			<p>dicover new places with us!</p>
			<a href="#" class="btn">discover more</a>
		</div>

		<div class="video-container">
			<video src="./images/background.mp4" loop autoplay muted></video>
		</div>
	</section>

	<!-- home section ends -->






	<!--  
	<a href='listMembers.jsp'><button>Back to List Members</button></a>
-->



	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>