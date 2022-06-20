<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tour Detail Page</title>

<!-- font awesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/detail.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		String bookPg = "book.jsp?tourid="+tourid;
		String imageLoc="";
		String detailDescrip="";
		String title="";
		String comment="";
		String user="";
		int rating=0;
		int rate=0;
		Double price=0.00;
		
	%>
	<!-- tourDetail section starts  -->
	<section class="tourDetail" id="tourDetail">
		<h1 class="heading">
			<span>t</span> <span>o</span> <span>u</span> <span>r</span> <span
				class="space"></span> <span>d</span> <span>e</span> <span>t</span> <span>a</span>
			<span>i</span> <span>l</span>
		</h1>

		<div class="row">
			<div id="productInfo">
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
   		String sqlstr="SELECT * FROM tour WHERE tour_id=?";
   		String sqlstr2 ="SELECT avg(rating) rate FROM jad_ca_database.tourreview where tour_id=?;";
   		PreparedStatement pstmt = conn.prepareStatement(sqlstr);
   		PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
   		pstmt.setInt(1, tourid);
   		pstmt2.setInt(1, tourid);

   		ResultSet rs = pstmt.executeQuery();
   		ResultSet rs2 = pstmt2.executeQuery();
   		
		rs.next();
		rs2.next();
		
		rate = (int)rs2.getDouble("rate");
		System.out.print("rate:"+rate);
	    title = rs.getString("title");
		imageLoc= rs.getString("imageLoc");
   		detailDescrip = rs.getString("detail_description");
   		price = rs.getDouble("price");
   		
   		conn.close();
	}catch(Exception e){
		System.out.print(e);
	}
	%>
				<h2><%= title %></h2>
				<div class="image">
					<img src=<%=imageLoc %> alt="./images/default.jpg" />
					<p><%=detailDescrip %></p>
				</div>
				
				<div class="price">
					$<%=price %>
				</div>
				<div class='stars'>
					<%
					for(int i=1;i <= 5; i++){
						if(i<=rate){
					%>
							<i class='fas fa-star'></i>
					<% 
						}
						else{
					%>
							<i class='far fa-star'></i>
					<% 
						}
					}
					%>
				</div>
				<%if(loginStatus!=null && loginStatus.equals("success")){ %>
				<a href=<%=bookPg %> class="btn">book now</a>
				<%} %>
			</div>
			<div id="reviews">
				<h2>Reviews</h2>
				
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
			   		String sqlstr="SELECT tr.comment,u.name,tr.rating FROM tourreview tr INNER JOIN tour t INNER JOIN user u where tr.user_id=u.user_id and tr.tour_id=t.tour_id and tr.tour_id=?";
			   		PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			   		pstmt.setInt(1, tourid);

			   		ResultSet rs = pstmt.executeQuery();
			   		String msg="";
					while(rs.next()){
					    user = rs.getString("name");
					    rating = rs.getInt("rating");
					    comment = rs.getString("comment");
					    
						msg+="<div class='box'>";
						msg+="<h3>"+user+"</h3>";
						msg+="<div class='stars'>";
						for(int i=1;i <= 5; i++){
							if(i<=rating){
								msg+="<i class='fas fa-star'></i>";
							}
							else{
								msg+="<i class='far fa-star'></i>";
							}
						}
						msg+="</div>";
						msg+="<p>"+comment+"</p>";
						msg+="</div>";
					}
					
			   		out.print(msg);
			   		conn.close();
				}catch(Exception e){
					System.out.print(e);
				}
				%>
			</div>
			
			<%if(loginStatus!=null && loginStatus.equals("success")){ %>
			<form action="./addComment" id="commentForm">
                    <h2>Write your review and rating</h2>
                    <div class="star-rating" id="rating" name="rating">
                        <!-- <div class="thanks-msg">Thanks for your feedback !!!</div> -->
                        <div class="star-input">
                            <input
                                type="radio"
                                name="rating"
                                id="rating-5"
                                value=5
                            />
                            <label for="rating-5" class="fas fa-star"></label>
                            <input
                                type="radio"
                                name="rating"
                                id="rating-4"
                                value=4
                            />
                            <label for="rating-4" class="fas fa-star"></label>
                            <input
                                type="radio"
                                name="rating"
                                id="rating-3"
                                value=3
                            />
                            <label for="rating-3" class="fas fa-star"></label>
                            <input
                                type="radio"
                                name="rating"
                                id="rating-2"
                                value=2
                            />
                            <label for="rating-2" class="fas fa-star"></label>
                            <input
                                type="radio"
                                name="rating"
                                id="rating-1"
                                value=1
                            />
                            <label for="rating-1" class="fas fa-star"></label>
                        </div>
                    </div>
                    <textarea
                        placeholder="Write your review here!"
                        name="comment"
                        id=""
                        cols="30"
                        rows="10"
                    ></textarea>
                    <input type="hidden" id="tourid" name="tourid" value=<%=tourid %>>
                    <input type="submit" class="btn" value="send review" />
                </form>
			<%} %>
		</div>
	</section>
	<!-- tourDetail section ends -->
	
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>