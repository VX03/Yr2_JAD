<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Favorite List Page</title>

<!-- font awesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/favorite.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>

	<!-- favorite tour section starts  -->
	<section class="favoriteTour" id="favoriteTour">
		<h1 class="heading">
			<span>f</span> <span>a</span> <span>v</span> <span>o</span> <span>r</span>
			<span>i</span> <span>t</span> <span>e</span> <span class="space">
			</span> <span>l</span> <span>i</span> <span>s</span> <span>t</span>
		</h1>

		<div class="box-container">
			<div class="box">
				<img src="./images/default.jpg" alt="" />
				<div class="content">
					<h3>
						<i class="fas fa-map-marker-alt"></i> Hang Zhou
					</h3>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Veritatis, nam!</p>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<div class="price">$90.00</div>
					<a href="#" class="btn">Delete Favorite</a>
				</div>
			</div>

			<div class="box">
				<img src="./images/default.jpg" alt="" />
				<div class="content">
					<h3>
						<i class="fas fa-map-marker-alt"></i> Hang Zhou
					</h3>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Veritatis, nam!</p>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<div class="price">$90.00</div>
					<a href="#" class="btn">Delete Favorite</a>
				</div>
			</div>

			<div class="box">
				<img src="./images/default.jpg" alt="" />
				<div class="content">
					<h3>
						<i class="fas fa-map-marker-alt"></i> Hang Zhou
					</h3>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Veritatis, nam!</p>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<div class="price">$90.00</div>
					<a href="#" class="btn">Delete Favorite</a>
				</div>
			</div>

			<div class="box">
				<img src="./images/default.jpg" alt="" />
				<div class="content">
					<h3>
						<i class="fas fa-map-marker-alt"></i> Hang Zhou
					</h3>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Veritatis, nam!</p>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<div class="price">$90.00</div>
					<a href="#" class="btn">Delete Favorite</a>
				</div>
			</div>
		</div>
	</section>
	<!-- favoriteTour section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
