<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/registerLogin.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>

	<!-- register section starts  -->
	<section class="registerLogin" id="login">
		<h1 class="heading">
			<span>l</span> <span>o</span> <span>g</span> <span>i</span> <span>n</span>
			<span class="space"></span> <span>n</span> <span>o</span> <span>w</span>
		</h1>

		<div class="row">
			<form action="./login" id="loginForm">
			
		<% 
  		String errCode = request.getParameter("errCode");
			if(errCode!=null && errCode.equals("invalidLogin")){
	  		out.print("<h1> Sorry!!!  Unable to find account</h1>");
  		}
		%>
		
				<div class="userInput">
					<h3>Username</h3>
					<input type="text" placeholder="Enter your Username" name="name"/>
				</div>
				<div class="userInput">
					<h3>Password</h3>
					<input type="password" placeholder="Enter your password" name="password"/>
				</div>

				<input type="submit" class="btn" value="login" />
				<p>
					Does not have an account yet? <a href="register.jsp">Register Here</a>.
				</p>
			</form>
			<div class="image">
				<img src="./images/registerLoginImage.svg" alt="" />
			</div>
		</div>
	</section>
	<!-- register section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>

</html>