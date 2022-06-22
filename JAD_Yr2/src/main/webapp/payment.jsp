<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Payment Page</title>

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/payment.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%if(loginStatus!=null&&loginStatus.equals("success")){%>
	<%
	int tourid=0;
	int numOfGuest=0;
	int slots=0;
	int recordId=0;
	String startdate="";
	String enddate="";
	String title="";
	int availNo=0;
	double price=0.00;
	String directPg = "";
	String pay;
	pay = request.getParameter("pay");
	
	try{
	tourid = Integer.parseInt(request.getParameter("tourid"));
	numOfGuest = Integer.parseInt(request.getParameter("numOfGuest"));
	slots = Integer.parseInt(request.getParameter("slots"));//slotid
	availNo = Integer.parseInt(request.getParameter("availNo"));
	recordId = Integer.parseInt(request.getParameter("recordId"));
	directPg="./updateTour";
	}catch(Exception e){
		directPg="./bookTour";
	}
	if(pay!=null&&!pay.equals("bookPay")){
		response.sendRedirect("bookTour?tourid="+tourid+"&numOfGuest="+numOfGuest+"&slots="+slots+"&availNo="+availNo+"&pay="+"book");
	}
	
	%>
	
	<!-- payment section starts  -->
	<section class="payment" id="payment">
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
	          String sqlstr="SELECT * FROM slots s INNER JOIN tour t WHERE s.tour_id = t.tour_id AND s.slot_id=?";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          pstmt.setInt(1, slots);

	          ResultSet rs = pstmt.executeQuery();
		      String msg="";
		      // Step 6: Process Result
		      
		      	  rs.next();
		      	  price = rs.getDouble("price");
		          startdate = rs.getString("start_date");
		          enddate = rs.getString("end_date");
		          title = rs.getString("title");
		          availNo = rs.getInt("available_no");
		          System.out.print(availNo);
		          System.out.print(numOfGuest);
		          
		      // Step 7: Close connection
		      conn.close();
		}catch(Exception e){
			System.out.print(e);
		}
	%>
		
		
		<h1 class="heading">
			<span>p</span> <span>a</span> <span>y</span> <span>m</span> <span>e</span>
			<span>n</span> <span>t</span>
		</h1>

		<div class="row">
			<form action=<%=directPg %> id="paymentForm">
			
			
				<h1>Your Booking Details</h1>
				<div class="bookInfo">
					<h3>Tour Name:</h3>
					<p><%= title %></p>
				</div>
				<div class="bookInfo">
					<h3>Number Of People:</h3>
					<p><%= numOfGuest %></p>
				</div>

				<div class="bookInfo">
					<h3>Start Date:</h3>
					<p><%=startdate %></p>
				</div>
				<div class="bookInfo">
					<h3>End Date:</h3>
					<p><%=enddate %></p>
				</div>
				<div class="bookInfo">
					<h3>Price:</h3>
					<p>$<%=String.format("%.2f", price*numOfGuest) %></p>
				</div>
				<input type="hidden" id="tourid" name="tourid" value=<%=tourid %>>
				<input type="hidden" name="numOfGuest" value=<%=numOfGuest %>>
				<input type="hidden" name="slots" value=<%=slots %>>
				<input type="hidden" name="availNo" value=<%=availNo %>>
				<input type="hidden" name="recordId" value=<%=recordId %>>
				<h1>Enter Your Payment Infomation</h1>
				<h3>Input only confirmation of going. If not, leave it blank.</h3>
				<div class="bookInfo">
					<h3>Enter Your card number:</h3>
					<input type="text" placeholder="Card Number" name="cardNo"/>
				</div>
				<div class="bookInfo">
					<h3>Enter Your card password:</h3>
					<input type="text" placeholder="Card Password" name="cardPass"/>
				</div>
				<div class="btn">
					<input type="submit" class="btn" value="bookPay" name="pay"/>
				</div>
			</form>
		</div>
	</section>
	<!-- payment section ends -->
	<%}else {
		response.sendRedirect("index.jsp");
	}%>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
