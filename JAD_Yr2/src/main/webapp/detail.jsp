<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	
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
	<%@include file="header.jsp"%>
	<%
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		String imageLoc="";
		String detailDescrip="";
		String title="";
		Double price=0.00;
	%>
	<!-- tourDetail section starts  -->
	<section class="tourDetail" id="tourDetail">
		<h1 class="heading">
			<span>t</span> <span>o</span> <span>u</span> <span>r</span> <span
				class="space"></span> <span>d</span> <span>e</span> <span>t</span> <span>a</span>
			<span>i</span> <span>l</span>
		</h1>

		<div class="row">
			<div id="productInfo">
			<%
	try{
		// Step1: Load JDBC Driver
    	Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

   		// Step 2: Define Connection URL
   		String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

   		// Step 3: Establish connection to URL
   		Connection conn = DriverManager.getConnection(connURL); 
   		// Step 4: Create Statement object
   		//Statement stmt = conn.createStatement();
   		String sqlstr="SELECT * FROM tour WHERE tour_id=?";
   		PreparedStatement pstmt = conn.prepareStatement(sqlstr);
   		pstmt.setInt(1, tourid);

   		ResultSet rs = pstmt.executeQuery();
   		
		rs.next();
	    title = rs.getString("title");
		imageLoc= rs.getString("imageLoc");
   		detailDescrip = rs.getString("detail_description");
   		price = rs.getDouble("price");
   		
   		
	}catch(Exception e){
		System.out.print(e);
	}
	%>
				<h2><%= title %></h2>
				<div class="image">
					<img src=<%=imageLoc %> alt="" />
					<p><%=detailDescrip %></p>
				</div>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="far fa-star"></i>
					<p>(2 ratings)</p>
				</div>
				<div class="price">
					$<%=price %>
				</div>
				<a href="#" class="btn">book now</a>
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
