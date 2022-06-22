<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Booking History Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/bookHistory.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
	int userid = (int) session.getAttribute("userId");
	String startdate;
	String enddate;
	String country;
	String title;
	String paid;
	int numOfGuest;
	int recordId;
	int slotId;
	int tourId;
	double price;
	String destination;
	int availNo;
	%>
	<!-- history section starts  -->
	<section class="history" id="history">
		<h1 class="heading">
			<span>b</span> <span>o</span> <span>o</span> <span>k</span> <span
				class="space"></span> <span>h</span> <span>i</span> <span>s</span> <span>t</span>
			<span>o</span> <span>r</span> <span>y</span>
		</h1>

		<div class="row">
			<div id="upcoming">
				<h2>Upcoming Tours</h2>
				<table>
					<tr>
						<th>Delete</th>
						<th>Payment</th>
						<th>Country</th>
						<th>Destination</th>
						<th>Time Slot</th>
						<th>Number of people</th>
						<th>Price</th>
						
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
						String sqlstr = "SELECT * FROM bookingrecord br INNER JOIN slots s INNER JOIN tour t INNER JOIN tourcategory tc WHERE br.slot_id=s.slot_id AND t.tour_id=s.tour_id AND t.tourCateId=tc.tourCateId AND br.type='upcoming' AND br.user_id=?";
						System.out.println(sqlstr);
						PreparedStatement pstmt = conn.prepareStatement(sqlstr);
						pstmt.setInt(1, userid);

						ResultSet rs = pstmt.executeQuery();
						String msg = "";
						// Step 6: Process Result

						while (rs.next()) {
							msg += "<tr>";
							startdate = rs.getString("start_date");
							enddate = rs.getString("end_date");
							numOfGuest = rs.getInt("no_of_guest");
							recordId = rs.getInt("record_id");
							slotId = rs.getInt("slot_id");
							tourId = rs.getInt("tourCateId");
							country = rs.getString("name");
							destination = rs.getString("title");
							price = rs.getDouble("price");
							paid = rs.getString("paid");
							availNo = rs.getInt("available_no");
							if(paid!=null&&paid.equals("Not Paid")){
								msg += "<td><form action='./deleteBookingRecord'><input type='hidden' name='recordId' value="+recordId+"><input type='hidden' name='slotId' value="+slotId+"><input type='hidden' name='guestNum' value="+numOfGuest+"><input type='submit' class='btn' value='Delete' /></form></td>";
								msg += "<td><form action='./payment.jsp'><input type='hidden' name='availNo' value="+availNo+"><input type='hidden' name='recordId' value="+recordId+"><input type='hidden' name='tourid' value="+tourId+"><input type='hidden' name='slots' value="+slotId+"><input type='hidden' name='numOfGuest' value="+numOfGuest+"><input type='submit' class='btn' value='"+paid+"' /></form></td>";
							}
							else{
								msg += "<td></td>";
								msg += "<td>"+paid+"</td>";
							}
							
							msg += "<td>" + country + "</td>";
							msg += "<td>" + destination + "</td>";
							msg += "<td>" + startdate + " to " + enddate + "</td>";
							msg += "<td>" + numOfGuest + "</td>";
							msg += "<td>" + price + "</td>";
							
							msg += "</tr>";

						}

						out.print(msg);
						// Step 7: Close connection
						conn.close();

					} catch (Exception e) {
						
						System.out.println("ERorrrRRR:"+e);
					}
					%>
				</table>
			</div>
			<div id="past">
				<h2>Past Tours</h2>
				<table>
					<tr>
						<th>Country</th>
						<th>Destination</th>
						<th>Time Slot</th>
						<th>Number of people</th>
						<th>Price</th>
						<th>Payment</th>
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
						String sqlstr = "SELECT * FROM bookingrecord br INNER JOIN slots s INNER JOIN tour t INNER JOIN tourcategory tc WHERE br.slot_id=s.slot_id AND t.tour_id=s.tour_id AND t.tourCateId=tc.tourCateId AND br.type='past' AND br.user_id=?";
						System.out.println(sqlstr);
						PreparedStatement pstmt = conn.prepareStatement(sqlstr);
						pstmt.setInt(1, userid);

						ResultSet rs = pstmt.executeQuery();
						String msg = "";
						// Step 6: Process Result

						while (rs.next()) {
							
							startdate = rs.getString("start_date");
							enddate = rs.getString("end_date");
							numOfGuest = rs.getInt("no_of_guest");
							country = rs.getString("name");
							destination = rs.getString("title");
							numOfGuest = rs.getInt("no_of_guest");
							price = rs.getDouble("price");
							
							msg = "<tr>";
							msg += "<td>" + country + "</td>";
							msg += "<td>" + destination + "</td>";
							msg += "<td>" + startdate + " to " + enddate + "</td>";
							msg += "<td>" + numOfGuest + "</td>";
							msg += "<td>" + price + "</td>";
							msg += "<td>paied</td>";
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
	<!-- history section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
