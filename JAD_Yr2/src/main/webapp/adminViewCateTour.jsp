<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin View Categories and Tours Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/adminCateTour.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>

	<!-- admin view section starts  -->
	<section class="adminView" id="adminView">
		<h1 class="heading">
			<span>a</span> <span>d</span> <span>m</span> <span>i</span> <span>n</span>
			<span class="space"></span> <span>v</span> <span>i</span> <span>e</span>
			<span>w</span>
		</h1>

		<div class="row">
			<div id="upcoming">
				<h2>View Categories</h2>
				<table>
					<tr>
						<th>Delete</th>
						<th>Edit</th>
						<th>Category Name</th>
						<th>Image Location</th>
					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td><input type="submit" class="btn" value="Edit" /></td>
						<td>China</td>
						<td>./imgaes/categories/china.jpg</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td><input type="submit" class="btn" value="Edit" /></td>
						<td>China</td>
						<td>./imgaes/categories/china.jpg</td>
					</tr>
				</table>
			</div>
			<div id="past">
				<h2>View Tours</h2>
				<table>
					<tr>
						<th>Delete</th>
						<th>Edit</th>
						<th>Tour Name</th>
						<th>Category</th>
						<th>Price</th>
						<th>Image Location</th>
					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td><input type="submit" class="btn" value="Edit" /></td>
						<td>Hang Zhou</td>
						<td>China</td>
						<td>$1678.00</td>
						<td>./images/china/hangzhou.jpg</td>
					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td><input type="submit" class="btn" value="Edit" /></td>
						<td>Hang Zhou</td>
						<td>China</td>
						<td>$1678.00</td>
						<td>./images/china/hangzhou.jpg</td>
					</tr>
				</table>
			</div>
	</section>
	<!-- admin view section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
