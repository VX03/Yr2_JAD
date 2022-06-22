<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Control Users Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/adminControlUser.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
		int cusUserId=0;
		String username="";
		String phoneNo="";
		String email="";
	%>
	<% if(role!=null && role.equals("Admin")){%>
	<!-- adminControl section starts  -->
	<section class="adminControl" id="adminControl">
		<h1 class="heading">
			<span>m</span> <span>a</span> <span>n</span> <span>a</span> <span>g</span>
			<span>e</span> <span class="space"></span> <span>u</span> <span>s</span>
			<span>e</span> <span>r</span> <span>s</span>
		</h1>
		<%
			String success = request.getParameter("success");
			if(success!=null){
				out.print("<h2 style='color: green'>"+success+"</h2>");
			}
			String errCode = request.getParameter("errCode");
			if(errCode!=null){
				out.print("<h2 style='color: red'>"+errCode+"</h2>");
			}
		%>
		<div class="row">
			<div id="userTable">
				<h2>Registered Users</h2>
				<table style="width: 100%">
					<tr>
						<th>Delete</th>
						<th>User Name</th>
						<th>Phone Number</th>
						<th>Email</th>
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
					      String sqlStr = "SELECT * FROM user WHERE role='Public'";         
					      ResultSet rs = stmt.executeQuery(sqlStr);
						
						String msg = "";
						// Step 6: Process Result
						while (rs.next()) {
							
							cusUserId = rs.getInt("user_id");
							username = rs.getString("name");
							email = rs.getString("email");
							phoneNo = rs.getString("phone_no");
							
							msg += "<tr>";
							msg += "<td><form action='./deleteUser'><input type='hidden' name='userId' value="+cusUserId+"><input type='submit' class='btn' value='Delete' /></form></td>";
							msg += "<td>" + username + "</td>";
							msg += "<td>" + email + "</td>";
							msg += "<td>" + phoneNo + "</td>";
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
	<!-- adminControl section ends -->
	<%}else{
		response.sendRedirect("index.jsp");
	} %>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>