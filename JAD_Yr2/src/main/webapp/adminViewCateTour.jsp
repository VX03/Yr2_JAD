<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin View Categories and Tours Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/adminCateTour.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
		String name="";
		String imageLoc="";
		int tourNum;
		int id;
		String title="";
		String errCode = request.getParameter("errCode");
	%>
	<!-- admin view section starts  -->
	<section class="adminView" id="adminView">
		<h1 class="heading">
			<span>a</span> <span>d</span> <span>m</span> <span>i</span> <span>n</span>
			<span class="space"></span> <span>v</span> <span>i</span> <span>e</span>
			<span>w</span>
		</h1>
		
		<div class="row">
			<div id="upcoming">
				<h2>View Categories</h2>
				<%
				if(errCode!=null && errCode.equals("cateFailed")){
  					out.print("<h1 style='color:red;font-size:18px;'> Unable to delete category... </h1>");
				}
				%>
				<table>
					<tr>
						<th>Delete</th>
						<th>Edit</th>
						<th>Category Name</th>
						<th>Tour Numbers</th>
						<th>Image Location</th>
					</tr>
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
		      			// Step 5: Execute SQL Command
		      			String sqlStr = "SELECT * FROM tourcategory ORDER BY name asc";         
		      			ResultSet rs = stmt.executeQuery(sqlStr);

						String msg = "";
						// Step 6: Process Result

						while (rs.next()) {
							
							name = rs.getString("name");
							imageLoc = rs.getString("imageLoc");
							tourNum = rs.getInt("tourNums");
							id = rs.getInt("tourCateId");
							
							msg += "<tr>";
							msg += "<td><form action='./deleteCategory'><input type='hidden' name='cateId' value="+id+"><input type='submit' class='btn' value='Delete' /></form></td>";
							msg += "<td><a href='cateTourEdit.jsp?cateId="+id+"'><input type='submit' class='btn' value='Edit' /></a></td>";
							msg += "<td>" + name + "</td>";
							msg += "<td>" + tourNum + "</td>";
							msg += "<td>" + imageLoc + "</td>";
							msg += "</tr>";

						}

						out.print(msg);
						// Step 7: Close connection
						conn.close();

					} catch (Exception e) {
						System.out.print(e);
					}
					%>
					
				</table>
			</div>
			<div id="past">
			
				<h2>View Tours</h2>
				<%
			if(errCode!=null && errCode.equals("tourFailed")){
		  		out.print("<h1 style='color:red;font-size:18px;'> Unable to delete tour... </h1>");
				}
			%>
				<table>
                        <tr>
                            <th>Delete</th>
                            <th>Edit</th>
                            <th>Title</th>
                            <th>Category Name</th>
                            <th>Image Location</th>
                        </tr>
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
		      			// Step 5: Execute SQL Command
		      			String sqlStr = "SELECT * FROM tour t INNER JOIN tourcategory tc WHERE tc.tourCateId=t.tourCateId ORDER BY tc.name asc";         
		      			ResultSet rs = stmt.executeQuery(sqlStr);

						String msg = "";
						// Step 6: Process Result

						while (rs.next()) {
							
							name = rs.getString("name");
							imageLoc = rs.getString("imageLoc");
							title = rs.getString("title");
							id = rs.getInt("tour_id");
							
							msg += "<tr>";
							msg += "<td><form action='./deleteTour'><input type='hidden' name='tourId' value="+id+"><input type='submit' class='btn' value='Delete' /></form></td>";
							msg += "<td><a href='cateTourEdit.jsp?tourId="+id+"'><input type='submit' class='btn' value='Edit' /></a></td>";
							msg += "<td>" + title + "</td>";
							msg += "<td>" + name + "</td>";
							msg += "<td>" + imageLoc + "</td>";
							msg += "</tr>";

						}

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
	<!-- admin view section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
