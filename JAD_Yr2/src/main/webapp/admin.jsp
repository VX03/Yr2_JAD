<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Admin Management Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/admin.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	
	<% if(role!=null && role.equals("Admin")){%>
	
	<!-- admin section starts  -->
	<section class="admin" id="admin">
	<%
	// print add category msg
	String addCateMsg = request.getParameter("addCateMsg");
	if(addCateMsg != null) {
		out.print("<h2 style='color: green'>" + addCateMsg + "</h2>");
		System.out.println(addCateMsg);
	}
	
	// print add tour msg
	String addTourMsg = request.getParameter("addTourMsg");
	if(addTourMsg != null) {
		out.print("<h2 style='color: green'>" + addTourMsg + "</h2>");
		System.out.println(addTourMsg);
	}
	%>
		<div class="row">
			<h1 class="heading">
				<span>a</span> <span>d</span> <span>d</span> <span class="space">
				</span> <span>c</span> <span>a</span> <span>t</span> <span>e</span> <span>g</span>
				<span>o</span> <span>r</span> <span>y</span>
			</h1>
			<form action="./addCategory" id="adminForm">
				<div class="userInput">
					<h3>Category Name</h3>
					<input type="text" name="cateName" placeholder="Enter category name" />
				</div>
				<div class="userInput">
					<h3>Tour Number</h3>
					<input type="number" name="tourNums" placeholder="Enter tour number" />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" name="imageLoc" placeholder="Enter image location" />
				</div>
				<input type="submit" class="btn" value="Add" />
			</form>

			<h1 class="heading">
				<span>a</span> <span>d</span> <span>d</span> <span class="space">
				</span> <span>t</span> <span>o</span> <span>u</span> <span>r</span>
			</h1>
			
			<form action="./addTour" id="adminForm">
				<div class="userInput">
					<h3>Tour Name</h3>
					<input type="text" name ="title" placeholder="Enter tour name" />
				</div>
				<div class="userInput">
					<h3>Choose Category</h3>
					<select name="categoryId" class="userInput">
					
				<% 
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
				Statement stmt = conn.createStatement();
				String sqlStr = "SELECT name, tourCateId FROM tourcategory";
				System.out.println(sqlStr);
				ResultSet rs = stmt.executeQuery(sqlStr);

				String msg="";
				// Step 6: Process Result

				while (rs.next()) {
					String country=rs.getString("name");
					int cateId = rs.getInt("tourCateId");
					msg += "<option value='" + cateId;
					msg+="'>" + country + "</option>";
					System.out.println(rs.getString("name"));
					
				}

				System.out.println(msg);
				out.print(msg);
				// Step 7: Close connection
				conn.close();
			} catch (Exception e) {
				out.println("Error :" + e);
			}
			%>	 
			
												
					</select>
				</div>
				<div class="userInput">
					<h3>Price</h3>
					<input type="text" name ="price" placeholder="Enter tour price" />
				</div>
				<div class="userInput">
					<h3>Brief Description</h3>
					<input type="text" name ="brief" placeholder="Enter brief description" />
				</div>
				<div class="userInput">
					<h3>Detail Description</h3>
					<input type="text" name ="detail" placeholder="Enter detail description" />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" name ="imageLoc" placeholder="Enter image location" />
				</div>				
				<input type="submit" class="btn" value="Add" />
			</form>
		</div>
	</section>
	<!-- admin section ends -->
	<%}else{
		response.sendRedirect("index.jsp");
	} %>

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
