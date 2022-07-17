<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dbAccess.*" %>
<%@ page import="Classes.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile Page</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="./css/profile.css" />
</head>
<body>
	<!-- include header -->
	<%@include file="header.jsp"%>
	<%
		if(loginStatus!=null&&loginStatus.equals("success")){
			
			int userid=(int)session.getAttribute("userId");
			UserAccess ua = new UserAccess();
			User u = ua.getUser(userid);
	%>
	<!-- profile section starts  -->
	<section class="profile" id="profile">
		<h1 class="heading">
			<span>p</span> <span>r</span> <span>o</span> <span>f</span> <span>i</span>
			<span>l</span> <span>e</span>
		</h1>
			<% 
  				String errCode = (String)request.getAttribute("errCode");
			
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
		  			out.print("<h1 style='color:red;font-size:25px;'> Unable to edit user...</h1>");
	  			}
				
			%>
		<div class="container">
			<div id="imgContainer">
				<img src="./images/profileImg.png" /> <input type="submit" class="btn"
					value="change image" />
			</div>
			<form action="" id="profileForm" onsubmit="return check(this);">
				<div class="userInfo">
					<h3>User name:</h3>
					<input type="text" value="<%=u.getUserName() %>" name="username"/>
				</div>
				
				<div class="userInfo">
					<h3>contact number:</h3>
					<input type="text" value="<%=u.getPhone() %>" name="phoneNo"/>
				</div>

				<div class="userInfo">
					<h3>email:</h3>
					<input type="text" value="<%=u.getEmail() %>" name="email"/>
				</div>

				<input type="text" value="<%=u.getPassword() %>" name="pwd" style="display:none"/>
				<input type="text" name="checkpwd" style="display:none"/>
				<input type="submit" class="btn" value="edit"/>
			</form>
		</div>
	</section>
	<!-- profile section ends -->
	
	<script>
		function check(form){
			var nulls = checkNull(form.username.value,form.phoneNo.value,form.email.value)
			if(!nulls){
				alert("Please input all fields")
				return;
			}
			
			var b = checkPhone(form.phoneNo.value)
			if(!b){
				alert("Please input a valid phone number");
				return;
			}
			
			var n = prompt("What is the password?");
			form.checkpwd.value = n;
			
			if(n ==<%=u.getPassword() %>){
				form.action="./editUser"
			}
			else if(n=="" || n==null);
			else{
				alert("Wrong password");
			}
		}
		function checkPhone(phone){
			return /^[0-9]+$/.test(phone);
		}
		function checkNull(username, phone, email){
			if(username.trim()==="" ||phone.trim()===""||email.trim()===""){
				return false;
			}
			else return true;
		}
	</script>
		<%}else {
		response.sendRedirect("index.jsp");
	}%>
	<!-- include footer -->
	<%@include file="footer.html"%>
</body>
</html>
