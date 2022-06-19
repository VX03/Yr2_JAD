package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
				PrintWriter out = response.getWriter();
				HttpSession session = request.getSession();
				String email = request.getParameter("email");
				String pwd = request.getParameter("password");
				String name="";
				String userRole="";
				boolean found=false;
				
				try {
			          // Step1: Load JDBC Driver
			           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

			          // Step 2: Define Connection URL
			          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

			          // Step 3: Establish connection to URL
			          Connection conn = DriverManager.getConnection(connURL); 
			          // Step 4: Create Statement object
			          //Statement stmt = conn.createStatement();
			          String sqlstr="SELECT * FROM user WHERE email=? AND password=?";
			          System.out.println(sqlstr);
			          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			          pstmt.setString(1, email);
			          pstmt.setString(2, pwd);
			          
			          ResultSet rs = pstmt.executeQuery();
			          
			          if(rs.next()) {
			        	  out.print("Record Found<br>");
			        	  name = rs.getString("name");
			        	  pwd = rs.getString("password");
			        	  userRole = rs.getString("role");
			        	  System.out.println("Name: "+name+", pwd: "+pwd+",role"+userRole+"<br>");
			        	  found=true;
			          }
			          else {
			        	  System.out.print("Record not found");
			          }
			          
				}catch(Exception e) {
					System.out.println("Error"+e);
				}
				
				if(found) {
					session.setAttribute("name", name);
					session.setAttribute("role", userRole);
					session.setAttribute("loginStatus", "success");
					//session.setMaxInactiveInterval(3);
					response.sendRedirect("index.jsp");
					//out.print("login success");
				}else {
					response.sendRedirect("login.jsp?errCode=invalidLogin");
					out.print("login failed");
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
