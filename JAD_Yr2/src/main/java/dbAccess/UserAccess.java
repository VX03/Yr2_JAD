package dbAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserAccess {
	public int register(String username,String pwd,String email,String phoneNo) {
		int n = 0;
		try {
			// Step1: Load JDBC Driver
	           Class.forName("com.mysql.cj.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="insert into user(name,role,password,email,phone_no) values (?,?,?,?,?)";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          pstmt.setString(1, username);
	          pstmt.setString(2, "Public");
	          pstmt.setString(3, pwd);
	          pstmt.setString(4, email);
	          pstmt.setString(5, phoneNo);
	          
	           n = pstmt.executeUpdate();
	          
	          conn.close();

		}
		catch(java.sql.SQLIntegrityConstraintViolationException e) {
	         //response.sendRedirect("register.jsp?errCode=duplicateError");
		}
		catch(Exception e) {
			System.out.print(e);
		}
		
		return n;
		
	}// end of register
}
