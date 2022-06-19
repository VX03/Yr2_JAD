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
		
		<% 
			if(loginStatus!=null && loginStatus.equals("success"))
			{
		%>
			 <a href="bookHistory.jsp">booking</a> 
		<%
			} 
		%>
		
			<a href="category.jsp">Categories</a>
			
		<%
		//for login/login
			if(loginStatus!=null && loginStatus.equals("success"))
			{ 
				//for admin
				if(role.equals("Admin")){
		%>		
					<a href="Login.jsp" style="color:blue">Modify</a>
		<% 
				}
		%>
			<a href="Login.jsp" style="color:red">Logout</a>
		<%
			
			} else{
		%>
			<a href="register.jsp">Register</a> 
			<a href="login.jsp">Login</a>
		<%
			}
		%>
		</nav>

		<div class="icons">
			<i class="fas fa-user" id="user-btn"></i>
		</div>
	</header>

	<!-- header section ends -->
</body>
</html>