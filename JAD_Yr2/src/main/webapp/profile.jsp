<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/profile.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	
	<!-- profile section starts  -->
	<section class="profile" id="profile">
		<h1 class="heading">
			<span>p</span> <span>r</span> <span>o</span> <span>f</span> <span>i</span>
			<span>l</span> <span>e</span>
		</h1>

		<div class="container">
			<div id="imgContainer">
				<img src="./images/profileImg.png" /> <input type="submit" class="btn"
					value="change image" />
			</div>
			<form action="" id="profileForm">
				<div class="userInfo">
					<h3>User name:</h3>
					<p>Lily</p>
				</div>
				<div class="userInfo">
					<h3>contact number:</h3>
					<p>89898989</p>
				</div>

				<div class="userInfo">
					<h3>email:</h3>
					<p>lily@gmail.com</p>
				</div>
				<div class="userInfo">
					<h3>password:</h3>
					<p>pass123456</p>
				</div>
				<div class="userInfo">
					<h3>card number:</h3>
					<p>4540 7865 9089 7865</p>
				</div>

				<input type="submit" class="btn" value="edit" />
			</form>
		</div>
	</section>
	<!-- profile section ends -->
	
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
