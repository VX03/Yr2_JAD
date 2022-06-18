<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Tour List Page</title>
<!-- font awesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="./css/tourList.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.html"%>
	
	<!-- tour list section starts  -->
	<section class="tourList" id="tourList">
		<h1 class="heading">
		
		<%
		// should come from redirect, these two variable
		String cateName = "China";
		int tourCateId = 1;
		
		for(int i = 0; i < cateName.length(); i++) {
			out.print("<span>" + cateName.charAt(i) + "</span> ");
		}
		%>
			
		</h1>

		<div class="box-container">

		<%
		String imageLoc;
		String briefDescrip;
		String title;
		Double price;
		
		try {
		      // Step1: Load JDBC Driver
		       Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers
		
		      // Step 2: Define Connection URL
		      //String connURL = "jdbc:mysql://localhost/jad_ca_database?user=root&password=usesql&serverTimezone=UTC";
		       String connURL = "jdbc:mysql://localhost/" + System.getenv("dbName") + "?user=root&password=" + System.getenv("dbPass") + "&serverTimezone=UTC";
		
		      // Step 3: Establish connection to URL
		      Connection conn = DriverManager.getConnection(connURL); 
		      // Step 4: Create Statement object
		      Statement stmt = conn.createStatement();
		      // Step 5: Execute SQL Command
		      String sqlStr = "SELECT * FROM tour where tourCateId = " + tourCateId;         
		      ResultSet rs = stmt.executeQuery(sqlStr);
		      String msg="<div class='box-container'>";
		      // Step 6: Process Result
		      
		      while (rs.next()) {
		          imageLoc = rs.getString("imageLoc");
		          briefDescrip = rs.getString("brief_description");
		          title = rs.getString("title");
		          price = rs.getDouble("price");
		          
		          
		          msg+="<div class='box'><img src='" + imageLoc + "' alt='' /><div class='content'><h3><i class='fas fa-map-marker-alt'></i> " + title +
		        		  "</h3><p>" + briefDescrip + "</p>" +
		        		  "<div class='stars'>" +
                          "<i class='fas fa-star'></i>" +
                          "<i class='fas fa-star'></i>" +
                          "<i class='fas fa-star'></i>" +
                          "<i class='fas fa-star'></i>" +
                          "<i class='far fa-star'></i>" +
                          "</div><div class='price'>$" + price + "<span>$" + String.format("%.2f", price*1.1) + "</span></div>" +
                          "<a href='#' class='btn'>book now</a></div></div>";
		      }
		      
		      msg+="</div>";
		      out.print(msg);
		      // Step 7: Close connection
		      conn.close();
		 } catch (Exception e) {
			 out.println ("Error :" + e);
		 } 
		 %>

		</div>
	</section>
	<!-- tour list section ends -->
	
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
