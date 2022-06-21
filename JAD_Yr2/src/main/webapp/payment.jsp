<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Payment Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/payment.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>

	<!-- payment section starts  -->
	<section class="payment" id="payment">
		<h1 class="heading">
			<span>p</span> <span>a</span> <span>y</span> <span>m</span> <span>e</span>
			<span>n</span> <span>t</span>
		</h1>

		<div class="row">
			<form action="" id="paymentForm">
				<h1>Your Booking Details</h1>
				<div class="bookInfo">
					<h3>Tour Name:</h3>
					<p>Hang Zhou</p>
				</div>
				<div class="bookInfo">
					<h3>Number Of People:</h3>
					<p>2</p>
				</div>

				<div class="bookInfo">
					<h3>Start Date:</h3>
					<p>2022-05-10</p>
				</div>
				<div class="bookInfo">
					<h3>End Date:</h3>
					<p>2022-05-13</p>
				</div>
				<div class="bookInfo">
					<h3>Price:</h3>
					<p>$1280.00</p>
				</div>
				<h1>Enter Your Payment Infomation</h1>
				<div class="bookInfo">
					<h3>Enter Your card number:</h3>
					<input type="text" placeholder="Card Number" />
				</div>
				<div class="bookInfo">
					<h3>Enter Your card password:</h3>
					<input type="text" placeholder="Card Password" />
				</div>
				<input type="submit" class="btn" value="pay now" />
			</form>
		</div>
	</section>
	<!-- payment section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
