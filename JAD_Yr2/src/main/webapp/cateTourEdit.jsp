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

	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
	if (role != null && role.equals("Admin")) {
	%>

	<%
	String title = "";
	String name = "";
	String imageLoc = "./images/default.jpg";
	String brief = "";
	String detail = "";
	double price = 0.0;
	int cateId = 0;
	int cateIdSelect = 0;

	int tourId = 0;
	int slotId = 0;
	int slotNo = 0;
	String slotEndDate = "";
	String slotStartDate = "";
	%>

	<!-- admin edit section starts  -->
	<section class="admin" id="admin">
		<%
		// print add category msg
		String success = request.getParameter("success");
		if (success != null) {
			out.print("<h2 style='color: green; margin-top: 10px;'>" + success + "</h2>");
			System.out.println(success);
		}

		String errCode = request.getParameter("errCode");
		if (errCode != null) {
			out.print("<h2 style='color: red; margin-top: 10px;'>" + errCode + "</h2>");
			System.out.println(errCode);
		}
		%>
		<div class="row">
			<%
			if (request.getParameter("cateId") != null) {

				cateId = Integer.parseInt(request.getParameter("cateId"));
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
					String sqlstr = "SELECT * FROM tourcategory WHERE tourCateId=?";
					System.out.println(sqlstr);
					PreparedStatement pstmt = conn.prepareStatement(sqlstr);
					pstmt.setInt(1, cateId);

					ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
				imageLoc = rs.getString("imageLoc");
				name = rs.getString("name");
				System.out.println("imageLoc:" + imageLoc + ",name:" + name);
					}
					conn.close();
				} catch (Exception e) {
					System.out.println("Error" + e);
				}
			%>
			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>c</span> <span>a</span> <span>t</span>
				<span>e</span> <span>g</span> <span>o</span> <span>r</span> <span>y</span>
			</h1>

			<form action="./editCategory" id="adminForm">
				<input type="hidden" name="cateId" value='<%=cateId%>' />
				<div class="userInput">
					<h3>Category Name</h3>
					<input type="text" placeholder="Enter category name" name="name"
						value='<%=name%>' />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location"
						name="imageLoc" value='<%=imageLoc%>' />
				</div>
				<input type="submit" class="btn" value="Edit" />
			</form>
			<%
			}
			%>

			<%
			if (null != request.getParameter("tourId")) {
				tourId = Integer.parseInt(request.getParameter("tourId"));
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
					String sqlstr = "SELECT * FROM tour t INNER JOIN tourcategory tc WHERE t.tourCateId=tc.tourCateId AND tour_id=?";
					System.out.println(sqlstr);
					PreparedStatement pstmt = conn.prepareStatement(sqlstr);
					pstmt.setInt(1, tourId);

					ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
				imageLoc = rs.getString("imageLoc");
				title = rs.getString("title");
				cateId = rs.getInt("tourCateId");
				price = rs.getDouble("price");
				detail = rs.getString("detail_description");
				brief = rs.getString("brief_description");
				name = rs.getString("name");
					}
					conn.close();
				} catch (Exception e) {
					System.out.println("Error" + e);
				}
			%>
			<h1 class="heading">
				<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
					class="space"> </span> <span>t</span> <span>o</span> <span>u</span>
				<span>r</span>
			</h1>
			<form action="./editTour" id="adminForm">
				<input type="hidden" name="tourId" value='<%=tourId%>' /> <input
					type="hidden" name="cateId" value='<%=cateId%>' />
				<div class="userInput">
					<h3>Tour Name</h3>
					<input type="text" placeholder="Enter tour name" value='<%=title%>'
						name="title" />
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

							String msg = "";
							// Step 6: Process Result

							while (rs.next()) {
								String country = rs.getString("name");
								cateIdSelect = rs.getInt("tourCateId");
								if (cateIdSelect == cateId)
							msg += "<option value='" + cateIdSelect + "' selected>" + country + "</option>";
								else
							msg += "<option value='" + cateIdSelect + "'>" + country + "</option>";
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
					<input type="text" placeholder="Enter tour price" name="price"
						value='<%=String.format("%.2f", price)%>' />
				</div>
				<div class="userInput">
					<h3>Brief Description</h3>
					<input type="text" placeholder="Enter brief description"
						name="brief" value='<%=brief%>' />
				</div>
				<div class="userInput">
					<h3>Detail Description</h3>
					<input type="text" placeholder="Enter detail description"
						name="detail" value='<%=detail%>' />
				</div>
				<div class="userInput">
					<h3>Image Location</h3>
					<input type="text" placeholder="Enter image location"
						name="imageLoc" value='<%=imageLoc%>' />
				</div>

				<input type="submit" class="btn" value="Edit" />
			</form>

			<h1 class="heading">
				<span>a</span> <span>d</span> <span>d</span> <span class="space">
				</span> <span>s</span> <span>l</span> <span>o</span> <span>t</span>
			</h1>
			<form action="./addSlot" id="adminForm">
				<div class="userInput">
					<input type="hidden" name="title" placeholder="Enter tour name"
						value='<%=tourId%>' />
					<h3>Number of Seats</h3>
					<input type="number" name="availNo"
						placeholder="Available Number of Seats" min='0' />
					<h3>Start Date</h3>
					<input type="text" name="startdate" placeholder="Enter start date" />

					<h3>End Date</h3>
					<input type="text" name="enddate" placeholder="Enter end date" />
				</div>
				<input type="submit" class="btn" value="Add Slot" />
			</form>
		</div>
		<table>
			<tr>
				<th>Delete</th>
				<th>Edit</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Available Slots Left</th>
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
				String sqlstr = "SELECT * FROM slots WHERE tour_id=?";
				System.out.println(sqlstr);
				PreparedStatement pstmt = conn.prepareStatement(sqlstr);

				pstmt.setInt(1, tourId);

				ResultSet rs = pstmt.executeQuery();

				String msg = "";
				// Step 6: Process Result

				while (rs.next()) {
					slotId = rs.getInt("slot_id");
					tourId = rs.getInt("tour_id");
					slotNo = rs.getInt("available_no");
					slotStartDate = rs.getString("start_date");
					slotEndDate = rs.getString("end_date");

					msg += "<tr>";
					msg += "<td><form action='./deleteSlot'><input type='hidden' name='slotId' value=" + slotId
					+ "><input type='hidden' name='tourId' value=" + tourId
					+ "><input type='submit' class='btn' value='Delete' style='margin-top: 0'/></form></td>";
					msg += "<td><a href='cateTourEdit.jsp?slotId=" + slotId
					+ "'><input type='submit' class='btn' value='Edit' style='margin-top: 0'/></a></td>";
					msg += "<td>" + slotStartDate + "</td>";
					msg += "<td>" + slotEndDate + "</td>";
					msg += "<td>" + slotNo + "</td>";
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
		<%
		}
		%>
		<%
		if (request.getParameter("slotId") != null) {

			slotId = Integer.parseInt(request.getParameter("slotId"));
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
				String sqlstr = "SELECT * FROM slots WHERE slot_id=?";
				System.out.println(sqlstr);
				PreparedStatement pstmt = conn.prepareStatement(sqlstr);
				pstmt.setInt(1, slotId);

				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
			slotId = rs.getInt("slot_id");
			tourId = rs.getInt("tour_id");
			slotNo = rs.getInt("available_no");
			slotStartDate = rs.getString("start_date");
			slotEndDate = rs.getString("end_date");
				}
				conn.close();
			} catch (Exception e) {
				System.out.println("Error" + e);
			}
		%>
		<h1 class="heading">
			<span>e</span> <span>d</span> <span>i</span> <span>t</span> <span
				class="space"> </span> <span>s</span> <span>l</span> <span>o</span>
			<span>t</span>
		</h1>

		<form action="./editSlot" id="adminForm">
			<input type="hidden" name="slotId" value='<%=slotId%>' /> <input
				type="hidden" name="tourId" value='<%=tourId%>' />
			<div class="userInput">
				<h3>Available Seats</h3>
				<input type="number" name="availNo" value='<%=slotNo%>' min='0' />
			</div>
			<div class="userInput">
				<h3>Start Date</h3>
				<input type="text" name="startdate" value='<%=slotStartDate%>' />
			</div>
			<div class="userInput">
				<h3>End Date</h3>
				<input type="text" name="enddate" value='<%=slotEndDate%>' />
			</div>
			<input type="submit" class="btn" value="Edit" />
		</form>
		<%
		}
		%>
	</section>

	<!-- admin edit section ends -->

	<%
	} else {
	response.sendRedirect("index.jsp");
	}
	%>

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
