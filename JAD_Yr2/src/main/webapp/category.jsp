<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Category Page</title>
<link rel="stylesheet" href="./css/category.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	
	<!-- category section starts  -->
	<section class="category" id="category">
		<h1 class="heading">
			<span>c</span> <span>a</span> <span>t</span> <span>e</span> <span>g</span>
			<span>o</span> <span>r</span> <span>i</span> <span>e</span> <span>s</span>
		</h1>

		<div class="box-container">

			<%
		String imageLoc;
		String name;
		
		
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
		      String sqlStr = "SELECT * FROM tourcategory";         
		      ResultSet rs = stmt.executeQuery(sqlStr);
		      String msg="<div class='box-container'>";
		      // Step 6: Process Result
		      
		      while (rs.next()) {
		          imageLoc = rs.getString("imageLoc");
		          name = rs.getString("name");
		          
		          // here need think the redirect
		          msg+="<div class='box'><img src='" + imageLoc + "' alt='' /><div class='content'><h3>" + name +
		        		  "</h3>" +
		        		  "<a href='tourList.jsp?cateName=" + name + "' class='btn'>see more</a></div></div>";
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
	<!-- category section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
