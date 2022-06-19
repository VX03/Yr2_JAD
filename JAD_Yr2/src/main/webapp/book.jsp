<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/book.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	
	<!-- book section starts  -->
	<section class="book" id="book">
		<h1 class="heading">
			<span>b</span> <span>o</span> <span>o</span> <span>k</span> <span
				class="space"></span> <span>n</span> <span>o</span> <span>w</span>
		</h1>

		<div class="row">
			<div class="image">
				<img src="./images/travel.svg" alt="" />
			</div>

			<form action="">
				<div class="inputBox">
					<h3>travel destination</h3>
					<!-- redirect with place name -->
					<input type="text" placeholder="place name" />
				</div>
				<div class="inputBox">
					<h3>how many people</h3>
					<input type="number" placeholder="number of guests" />
				</div>
				<div class="inputBox">
					<h3>Time slot</h3>
					<select name="slots" id="slots">
						<!-- get data from db -->
						<option value="  "></option>
						<option value="  "></option>
						<option value="  "></option>
					</select>
				</div>

				<input type="submit" class="btn" value="book now" />
			</form>
		</div>
	</section>
	<!-- book section ends -->
	
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>