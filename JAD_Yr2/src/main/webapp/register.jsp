<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/registerLogin.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>
	<!-- register section starts  -->
	<section class="registerLogin" id="register">
		<h1 class="heading">
			<span>r</span> <span>e</span> <span>g</span> <span>i</span> <span>s</span>
			<span>t</span> <span>e</span> <span>r</span> <span class="space"></span>
			<span>n</span> <span>o</span> <span>w</span>
		</h1>

		<div class="row">
			<div class="image">
				<img src="./images/registerLoginImage.svg" alt="" />
			</div>

			<form action="" id="registerForm">
				<div class="userInput">
					<h3>User name</h3>
					<input type="text" placeholder="Enter your user name" />
				</div>
				<div class="userInput">
					<h3>Email</h3>
					<input type="text" placeholder="Enter your email" />
				</div>
				<div class="userInput">
					<h3>Password</h3>
					<input type="text" placeholder="Enter your password" />
				</div>
				<div class="userInput">
					<h3>Confirm Password</h3>
					<input type="text" placeholder="Confirm your password" />
				</div>
				<input type="submit" class="btn" value="register now" />
				<p>
					Already had an account? <a href="login.jsp">Login Here</a>.
				</p>
			</form>
		</div>
	</section>
	<!-- register section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>

</html>