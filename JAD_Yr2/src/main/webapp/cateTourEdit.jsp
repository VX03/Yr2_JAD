<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Admin Edit Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/admin.css" />
</head>
<body>
	<%
		String title="";
		String name="";
		String imageLoc="./images/default.jpg";
		String brief="";
		String detail="";
		double price=0.0;
		int cateId=0;
		int cateIdSelect=0;
		int tourId=0;
	%>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<!-- admin edit section starts  -->
	<section class="admin" id="admin">
		<div class="row">
			<%if(null!=request.getParameter("cateId")){
				
				cateId = Integer.parseInt(request.getParameter("cateId"));
				try {
			          // Step1: Load JDBC Driver
			           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

			          // Step 2: Define Connection URL
			          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

			          // Step 3: Establish connection to URL
			          Connection conn = DriverManager.getConnection(connURL); 
			          // Step 4: Create Statement object
			          //Statement stmt = conn.createStatement();
			          String sqlstr="SELECT * FROM tourcategory WHERE tourCateId=?";
			          System.out.println(sqlstr);
			          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			          pstmt.setInt(1, cateId);
			          
			          ResultSet rs = pstmt.executeQuery();
			          
			          if(rs.next()) {
			        	  imageLoc = rs.getString("imageLoc");
			        	  name = rs.getString("name");
			        	  System.out.println("imageLoc:"+imageLoc+",name:"+name);
			          }
			          conn.close();
				}catch(Exception e) {
					System.out.println("Error"+e);
				}
				%>
			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>c</span> <span>a</span> <span>t</span>
				<span>e</span> <span>g</span> <span>o</span> <span>r</span> <span>y</span>
			</h1>
			
			<form action="" id="adminForm">
				<div class="userInput">
					<h3>Category Name</h3>
					<input type="text" placeholder="Enter category name" name="cateTitle" value='<%=name %>'/>
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location" name="imageLoc" value='<%=imageLoc %>'/>
				</div>
				<input type="submit" class="btn" value="Edit" />
			</form>
			<%} %>
			<%
				if(null!=request.getParameter("tourId")){
					tourId = Integer.parseInt(request.getParameter("tourId"));
					try {
				          // Step1: Load JDBC Driver
				           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

				          // Step 2: Define Connection URL
				          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

				          // Step 3: Establish connection to URL
				          Connection conn = DriverManager.getConnection(connURL); 
				          // Step 4: Create Statement object
				          //Statement stmt = conn.createStatement();
				          String sqlstr="SELECT * FROM tour t INNER JOIN tourcategory tc WHERE t.tourCateId=tc.tourCateId AND tour_id=?";
				          System.out.println(sqlstr);
				          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
				          pstmt.setInt(1, tourId);
				          
				          ResultSet rs = pstmt.executeQuery();
				          
				          if(rs.next()) {
				        	  imageLoc = rs.getString("imageLoc");
				        	  title = rs.getString("title");
				        	  cateId = rs.getInt("tourCateId");
				        	  price = rs.getDouble("price");
				        	  detail = rs.getString("detail_description");
				        	  brief = rs.getString("brief_description");
				        	  name = rs.getString("name");
				          }
				          conn.close();
					}catch(Exception e) {
						System.out.println("Error"+e);
					}
			%>
			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>t</span> <span>o</span> <span>u</span>
				<span>r</span>
			</h1>
			<form action="" id="adminForm">
				<div class="userInput">
					<h3>Tour Name</h3>
					<input type="text" placeholder="Enter tour name" value='<%=title %>' />
				</div>
				<div class="userInput">
					<h3>Choose Category</h3>
					<select name="category" class="userInput">
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
					cateIdSelect = rs.getInt("tourCateId");
					if(cateIdSelect==cateId)
						msg += "<option value='" + cateIdSelect+"' selected>"+ country + "</option>";
						else
							msg += "<option value='" + cateIdSelect+"'>"+ country + "</option>";	
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
					<input type="text" placeholder="Enter tour price" name="price" value='<%=String.format("%.2f", price) %>'/>
				</div>
				<div class="userInput">
					<h3>Brief Description</h3>
					<input type="text" placeholder="Enter brief description" name="brief" value='<%=brief %>'/>
				</div>
				<div class="userInput">
					<h3>Detail Description</h3>
					<input type="text" placeholder="Enter detail description" name="detail" value='<%=detail %>'/>
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location" name="imageLoc" value='<%=imageLoc %>'/>
				</div>
				<div class="userInput">
					<h3>Add Slot</h3>
					<input type="text" name="startDate" style="margin-bottom: 3%"
						placeholder="Enter start date" /> <input
						type="text" name="endDate" placeholder="Enter end date" />
				</div>
				<input type="submit" class="btn" value="Edit" />
			</form>

			<h1 class="heading">
				<span>a</span> <span>d</span> <span>d</span> <span class="space">
				</span> <span>s</span> <span>l</span> <span>o</span> <span>t</span>
			</h1>
			<form action="" id="adminForm">
				<div class="userInput">
					<h3>Tour Name</h3>
					<input type="text" name="tourName" placeholder="Enter tour name" />

					<h3>Start Date</h3>
					<input type="text" name="startDate" placeholder="Enter start date" />

					<h3>End Date</h3>
					<input type="text" name="endDate" placeholder="Enter end date" />
				</div>
				<input type="submit" class="btn" value="Add Slot" />
			</form>
		</div>
	</section>
	<!-- admin edit section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
