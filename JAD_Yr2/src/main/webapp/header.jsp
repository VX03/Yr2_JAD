<!--  
Description: JAD CA1 Assignment
Class: DIT/2B/21
Group Number: 2
Author: LI KEHAN, Vernell
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<!-- font awesome link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- custom css file link  -->
<link rel="stylesheet" href="./css/header.css" />
</head>
<body>
	<!-- header section starts  -->
	<%
	String loginStatus=(String)session.getAttribute("loginStatus");
	String role=(String)session.getAttribute("role");

	%>
	<header>
		<div id="menu-bar" class="fas fa-bars"></div>

		<a href="index.jsp" class="logo"><span>H</span>appy <span>T</span>rip</a>

		<nav class="navbar">
			<a href="index.jsp">home</a> 
			 <a	href="category.jsp">Categories</a> 
			 <%if(loginStatus!=null&&loginStatus.equals("success")){%>
				<a href="bookHistory.jsp">booking</a>
				<% if(role.equals("Admin")){%>
				<a href="admin.jsp" style="color:lightblue">Add</a>
				<a href="adminViewCateTour.jsp" style="color:lightblue">View</a>
				<a href="adminControlUser.jsp" style="color:lightblue">Membership</a>
				<a href="adminViewBooking.jsp" style="color:lightblue">Sales</a>
			 <%} %>
			 <a href="favorite.jsp" style="color:pink">Favorite</a>
			 	<a href="logout.jsp" style="color:red">Logout</a>
			 
			 <%}else{ %>
			 
			<a href="register.jsp">Register</a>
			 <a href="login.jsp">Login</a>
			<%} %>
		</nav>
		<%if(loginStatus!=null&&loginStatus.equals("success")){%>
		<a class="icons" href="profile.jsp">
			<i class="fas fa-user" id="user-btn"></i>
		</a>
		<%} %>
	</header>

	<!-- header section ends -->
</body>
</html>