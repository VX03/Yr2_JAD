<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>
</head>
<body>
<h1>testing</h1>
<%int id;
String name;
try {
      // Step1: Load JDBC Driver
       Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

      // Step 2: Define Connection URL
      //String connURL = "jdbc:mysql://localhost/jad_ca_database?user=root&password=usesql&serverTimezone=UTC";
       String connURL = "jdbc:mysql://localhost/"+System.getenv("db")+"?user=root&password=usesql&serverTimezone=UTC";

      // Step 3: Establish connection to URL
      Connection conn = DriverManager.getConnection(connURL); 
      // Step 4: Create Statement object
      Statement stmt = conn.createStatement();
      // Step 5: Execute SQL Command
      String sqlStr = "SELECT * FROM user";         
      ResultSet rs = stmt.executeQuery(sqlStr);
      String msg="<table border=1>";
      // Step 6: Process Result
      msg+="<th>id</th><th>name</th>";
      while (rs.next()) {
          id = rs.getInt("user_id");
          name = rs.getString("name");
         msg+="<tr><td>" + id + "</td><td>" + name +"</td></tr>";
      }
      msg+="</table>";
      out.print(msg);
      // Step 7: Close connection
      conn.close();
 } catch (Exception e) {
	 out.println ("Error :" + e);
 } %>
</body>
</html>