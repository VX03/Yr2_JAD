<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Booking History Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/bookHistory.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>

	<!-- history section starts  -->
	<section class="history" id="history">
		<h1 class="heading">
			<span>b</span> <span>o</span> <span>o</span> <span>k</span> <span
				class="space"></span> <span>h</span> <span>i</span> <span>s</span> <span>t</span>
			<span>o</span> <span>r</span> <span>y</span>
		</h1>

		<div class="row">
			<div id="upcoming">
				<h2>Upcoming Tours</h2>
				<table style="width: 100%">
					<tr>
						<th>Country</th>
						<th>Destination</th>
						<th>Time Slot</th>
						<th>Number of people</th>
						<th>Price</th>
						<th>Payment</th>
					</tr>
					<tr>
						<td>China</td>
						<td>Hang Zhou</td>
						<td>2022-05-14 --- 2022-05-16</td>
						<td>2</td>
						<td>$1568.00</td>
						<td>paied</td>
					</tr>
					<tr>
						<td>China</td>
						<td>Hang Zhou</td>
						<td>2022-05-14 --- 2022-05-16</td>
						<td>2</td>
						<td>$1568.00</td>
						<td>paied</td>
					</tr>
				</table>
			</div>
			<div id="past">
				<h2>Past Tours</h2>
				<table style="width: 100%">
					<tr>
						<th>Country</th>
						<th>Destination</th>
						<th>Time Slot</th>
						<th>Number of people</th>
						<th>Price</th>
						<th>Payment</th>
					</tr>
					<tr>
						<td>China</td>
						<td>Hang Zhou</td>
						<td>2022-05-14 --- 2022-05-16</td>
						<td>2</td>
						<td>$1568.00</td>
						<td>paied</td>
					</tr>
					<tr>
						<td>China</td>
						<td>Hang Zhou</td>
						<td>2022-05-14 --- 2022-05-16</td>
						<td>2</td>
						<td>$1568.00</td>
						<td>paied</td>
					</tr>
				</table>
			</div>
	</section>
	<!-- history section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
