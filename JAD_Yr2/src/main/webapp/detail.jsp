<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tour Detail Page</title>

<!-- font awesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/detail.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>

	<!-- tourDetail section starts  -->
	<section class="tourDetail" id="tourDetail">
		<h1 class="heading">
			<span>t</span> <span>o</span> <span>u</span> <span>r</span> <span
				class="space"></span> <span>d</span> <span>e</span> <span>t</span> <span>a</span>
			<span>i</span> <span>l</span>
		</h1>

		<div class="row">
			<div id="productInfo">
				<h2>Hang Zhou</h2>
				<div class="image">
					<img src="./images/china/hangzhou.jpg" alt="" />
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum
						asperiores dolorum enim sint quod ipsam distinctio molestias
						consectetur ducimus beatae, reprehenderit exercitationem!</p>
				</div>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="far fa-star"></i>
					<p>(2 ratings)</p>
				</div>
				<div class="price">
					$90.00 <span>$120.00</span>
				</div>
				<a href="#" class="btn">add favorite</a> <a href="#" class="btn">book
					now</a>
			</div>
			<div id="reviews">
				<h2>Reviews</h2>
				<div class="box">
					<h3>john deo</h3>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum
						asperiores dolorum enim sint quod ipsam distinctio molestias
						consectetur ducimus beatae, reprehenderit exercitationem!</p>
				</div>
				<div class="box">
					<h3>john deo</h3>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="far fa-star"></i>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum
						asperiores dolorum enim sint quod ipsam distinctio molestias
						consectetur ducimus beatae, reprehenderit exercitationem!</p>
				</div>
			</div>
		</div>
	</section>
	<!-- tourDetail section ends -->
	
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
