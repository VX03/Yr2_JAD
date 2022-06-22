<!--  
Description: JAD CA1 Assignment
Class: DIT/2B/21
Group Number: 2
Author: LI KEHAN, Vernell
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/registerLogin.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<!-- register section starts  -->
	<section class="registerLogin" id="register">
		<h1 class="heading">
			<span>r</span> <span>e</span> <span>g</span> <span>i</span> <span>s</span>
			<span>t</span> <span>e</span> <span>r</span> <span class="space"></span>
			<span>n</span> <span>o</span> <span>w</span>
		</h1>
			<% 
  				String errCode = request.getParameter("errCode");
			
				if(errCode!=null && errCode.equals("nullInputValue")){
		  			out.print("<h1 style='color:red;font-size:25px;'> Please ensure all fields are entered...</h1>");
	  			}
				else if(errCode!=null && errCode.equals("invalidPhoneNo")){
		  			out.print("<h1 style='color:red;font-size:25px;'> Phone number must not contain Alphabets...</h1>");
				}
				else if(errCode!=null && errCode.equals("invalidPwd")){
		  			out.print("<h1 style='color:red;font-size:25px;'> Password is not the same...</h1>");
	  			}
				else if(errCode!=null && errCode.equals("duplicateError")){
		  			out.print("<h1 style='color:red;font-size:25px;'> There is an account with the same username or email...</h1>");
	  			}
				else if(errCode!=null && errCode.equals("unknownError")){
		  			out.print("<h1 style='color:red;font-size:25px;'> Unable to register account...</h1>");
	  			}
				
			%>
		<div class="row">
			<div class="image">
				<img src="./images/registerLoginImage.svg" alt="" />
				
			</div>
			<form action="./register" id="registerForm">
				<div class="userInput">
					<h3>User name</h3>
					<input type="text" placeholder="Enter your user name" name="name"/>
				</div>
				<div class="userInput">
					<h3>Phone number</h3>
					<input type="text" placeholder="Enter your phone number" name="phoneNo"/>
				</div>
				<div class="userInput">
					<h3>Email</h3>
					<input type="text" placeholder="Enter your email" name="email"/>
				</div>
				<div class="userInput">
					<h3>Password</h3>
					<input type="password" placeholder="Enter your password" name="password"/>
				</div>
				<div class="userInput">
					<h3>Confirm Password</h3>
					<input type="password" placeholder="Confirm your password" name="confirmPass"/>
				</div>
				<input type="submit" class="btn" value="register now" />
				<p>
					Already had an account? <a href="login.jsp">Login Here</a>.
				</p>
			</form>
		</div>
	</section>
	<!-- register section ends -->

	<!-- include footer -->
	<%@include file="footer.html"%>
</body>

</html>