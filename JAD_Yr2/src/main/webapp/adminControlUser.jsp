<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Control Users Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/adminControlUser.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>

	<!-- adminControl section starts  -->
	<section class="adminControl" id="adminControl">
		<h1 class="heading">
			<span>m</span> <span>a</span> <span>n</span> <span>a</span> <span>g</span>
			<span>e</span> <span class="space"></span> <span>u</span> <span>s</span>
			<span>e</span> <span>r</span> <span>s</span>
		</h1>

		<div class="row">
			<div id="userTable">
				<h2>Registered Users</h2>
				<table style="width: 100%">
					<tr>
						<th>Delete</th>
						<th>User Id</th>
						<th>User Name</th>

					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td>2</td>
						<td>U1</td>

					</tr>
					<tr>
						<td><input type="submit" class="btn" value="Delete" /></td>
						<td>2</td>
						<td>U1</td>
					</tr>
				</table>
			</div>
	</section>
	<!-- adminControl section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>