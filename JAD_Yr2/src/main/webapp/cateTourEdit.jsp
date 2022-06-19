<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Admin Edit Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/admin.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>

	<!-- admin edit section starts  -->
	<section class="admin" id="admin">
		<div class="row">
			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>c</span> <span>a</span> <span>t</span>
				<span>e</span> <span>g</span> <span>o</span> <span>r</span> <span>y</span>
			</h1>
			<form action="" id="adminForm">
				<div class="userInput">
					<h3>Category Name</h3>
					<input type="text" placeholder="Enter category name" />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location" />
				</div>
				<input type="submit" class="btn" value="Edit" />
			</form>

			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>t</span> <span>o</span> <span>u</span>
				<span>r</span>
			</h1>
			<form action="" id="adminForm">
				<div class="userInput">
					<h3>Tour Name</h3>
					<input type="text" placeholder="Enter tour name" />
				</div>
				<div class="userInput">
					<h3>Choose Category</h3>
					<select name="category" class="userInput">
						<!-- get data from db -->
						<option value="  "></option>
						<option value="  "></option>
						<option value="  "></option>
					</select>
				</div>
				<div class="userInput">
					<h3>Price</h3>
					<input type="text" placeholder="Enter tour price" />
				</div>
				<div class="userInput">
					<h3>Brief Description</h3>
					<input type="text" placeholder="Enter brief description" />
				</div>
				<div class="userInput">
					<h3>Detail Description</h3>
					<input type="text" placeholder="Enter detail description" />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location" />
				</div>
				<input type="submit" class="btn" value="Edit" />
			</form>
		</div>
	</section>
	<!-- admin edit section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
