<!--  
Description: JAD CA1 Assignment
Class: DIT/2B/21
Group Number: 2
Author: LI KEHAN, Vernell
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

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
	<%if(loginStatus!=null&&loginStatus.equals("success")){%>
	<!-- favorite tour section starts  -->
	<section class="favoriteTour" id="favoriteTour">
		<h1 class="heading">
			<span>f</span> <span>a</span> <span>v</span> <span>o</span> <span>r</span>
			<span>i</span> <span>t</span> <span>e</span> <span class="space">
			</span> <span>l</span> <span>i</span> <span>s</span> <span>t</span>
		</h1>

		<%
		// should come from redirect, these two variable
		//String cateName = request.getParameter("cateName");
		int userId=(int)session.getAttribute("userId");
		int tourCateId = 1;
		int avgRating = 0;
		%>
		
		<div class="box-container">

			<%
			String imageLoc;
			String briefDescrip;
			String title;
			Double price;
			int tourid;

			try {
				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver"); //can be omitted for newer version of drivers

				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/" + System.getenv("dbName") + "?user=root&password="
				+ System.getenv("dbPass") + "&serverTimezone=UTC";

				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);
				// Step 4: Create Statement object
				//Statement stmt = conn.createStatement();				
				String sqlstr = "SELECT * FROM favoritetour f, tour t WHERE f.tour_id = t.tour_id AND user_id = ?;";
				PreparedStatement pstmt = conn.prepareStatement(sqlstr);

				System.out.println(sqlstr);
							
				pstmt.setInt(1, userId);

				ResultSet rs = pstmt.executeQuery();

				String msg = "<div class='box-container'>";
				// Step 6: Process Result

				while (rs.next()) {
					imageLoc = rs.getString("imageLoc");
					briefDescrip = rs.getString("brief_description");
					title = rs.getString("title");
					price = rs.getDouble("price");
					tourid = rs.getInt("tour_id");
					System.out.print(imageLoc + "-----------------------");

					// ---------------------------------here is the stars part
					String sqlstr2 = "SELECT avg(rating) avgRating FROM jad_ca_database.tourreview where tour_id=?;";
					PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
					pstmt2.setInt(1, tourid);
					ResultSet rs2 = pstmt2.executeQuery();
					rs2.next();

					avgRating = (int) rs2.getDouble("avgRating");
					System.out.print("average rating:" + avgRating);

					msg += "<div class='box'><img src='" + imageLoc
					+ "' alt='./images/default.jpg' /><div class='content'><h3><i class='fas fa-map-marker-alt'></i> "
					+ title + "</h3><p>" + briefDescrip + "</p>" + "<div class='stars'>";

					for (int i = 1; i <= 5; i++) {
				if (i <= avgRating) {

					msg += "<i class='fas fa-star'></i>";

				} else {

					msg += "<i class='far fa-star'></i>";

				}
					}

					msg += "</div>" + "<div class='price'>$" + String.format("%.2f", price) + "</div>"
					+ "<form action='./deleteFavTour'><input type='hidden' class='btn' name='tourId' value="+tourid+" /><input type='submit' class='btn' value='delete favorite'/></form></div></div>";
				}
				// ------------------------------------- star part ends

				msg += "</div>";
				out.print(msg);
				// Step 7: Close connection
				conn.close();
			} catch (Exception e) {
				out.println("Error :" + e);
			}
			%>

		</div>
	</section>
	<!-- favoriteTour section ends -->
	<%}else {
		response.sendRedirect("index.jsp");
	}%>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
