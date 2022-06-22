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
<title>logout</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>