<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/book.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%if(loginStatus!=null&&loginStatus.equals("success")){%>
	<% 
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		String errCode = request.getParameter("errCode");
		int slotid;
		String startdate;
		String enddate;
		int availNo = 0;
	%>
	<!-- book section starts  -->
	<section class="book" id="book">
		<h1 class="heading">
			<span>b</span> <span>o</span> <span>o</span> <span>k</span> <span
				class="space"></span> <span>n</span> <span>o</span> <span>w</span>
		</h1>
		<%
		if(errCode!=null ){
  		out.print("<h1  style='color:red;font-size:25px;'>"+errCode+"</h1>");
		}
		%>
		<div class="row">
			<div class="image">
				<img src="./images/travel.svg" alt="" />
			</div>

			<form action="./payment.jsp">
				<div class="inputBox">
					<input type="hidden" id="tourid" name="tourid" value=<%=tourid %>>
				</div>
				<div class="inputBox">
					<h3>how many people</h3>
					<input type="number" value=1 min=1 name="numOfGuest"/>
				</div>
				<div class="inputBox">
					<h3>Time slot</h3>
					<select name="slots" id="slots">
						<!-- get data from db -->
						<%
							try{
								// Step1: Load JDBC Driver
						           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

						          // Step 2: Define Connection URL
						          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

						          // Step 3: Establish connection to URL
						          Connection conn = DriverManager.getConnection(connURL); 
						          // Step 4: Create Statement object
						          //Statement stmt = conn.createStatement();
						          String sqlstr="SELECT * FROM slots where tour_id=? AND available_no > 0";
						          System.out.println(sqlstr);
						          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
						          pstmt.setInt(1, tourid);

						          ResultSet rs = pstmt.executeQuery();
							      String msg="";
							      // Step 6: Process Result
							      
							      while (rs.next()) {
							          slotid = rs.getInt("slot_id");
							          startdate = rs.getString("start_date");
							          enddate = rs.getString("end_date");
							          availNo = rs.getInt("available_no");
							          msg+="<option value="+slotid+"> "+startdate+" to "+enddate+", available left:"+availNo+"</option>";
							      
							      }
							      if(msg.equals("")){
							    	  msg+="<option value='none'>No slots available</option>";
							      }
							      out.print(msg);
							      // Step 7: Close connection
							      conn.close();
							}catch(Exception e){
								System.out.print(e);
							}
						%>
					</select>
				</div>
				
				<input type="submit" class="btn" value="bookPay" name="pay"/>
				<input type="submit" class="btn" value="book" name="pay"/>
			</form>
		</div>
	</section>
	<!-- book section ends -->
	<%} %>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>