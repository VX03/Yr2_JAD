<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin View Booking History Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/bookHistory.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
		String title;
		String cateName;
		double sales;
	%>
		<% if(role!=null && role.equals("Admin")){%>
	<!-- history section starts  -->
	<section class="history" id="history">
		<h1 class="heading">
			<span>v</span> <span>i</span> <span>e</span> <span>w</span> <span
				class="space"></span> <span>b</span> <span>o</span> <span>o</span> <span>k</span>
			<span>i</span> <span>n</span> <span>g</span> <span>s</span>
		</h1>

		<div class="row">
			<div id="upcoming">
				<h2>Booking Sales</h2>
				<table style="width: 100%">
					<tr>
						<th>Category</th>
						<th>Title</th>
						<th>Total Sales ($)</th>
					</tr>
					<%
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
					      String sqlStr = "SELECT distinct title,name,sum(price*no_of_guest) sales "+
					      " FROM bookingrecord br inner join slots s inner join tour t inner join tourcategory tc "+
					   	  "where br.slot_id=s.slot_id and s.tour_id=t.tour_id and t.tourCateId=tc.tourCateId and br.paid='Paid'"+
					      " group by title order by name desc"; 
					      
					      ResultSet rs = stmt.executeQuery(sqlStr);
						
						String msg = "";
						// Step 6: Process Result
						while (rs.next()) {
							
							title = rs.getString("title");
							cateName = rs.getString("name");
							sales = rs.getDouble("sales");
							
							msg += "<tr>";
							msg += "<td>" + cateName + "</td>";
							msg += "<td>" + title + "</td>";
							msg += "<td>" +  String.format("%.2f", sales) + "</td>";
							msg += "</tr>";

						}
						//System.out.print(msg);
						out.print(msg);
						// Step 7: Close connection
						conn.close();

					} catch (Exception e) {
						System.out.print(e);
					}
					%>
				</table>
			</div>
	</section>

	<!-- history section ends -->
	<%}else{
		response.sendRedirect("index.jsp");
	} %>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
