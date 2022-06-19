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
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo");
		String pwd = request.getParameter("password");
		String confirmPwd = request.getParameter("confirmPass");
		
		boolean checkPage=false;
		String page="";
		String[] checkNull = {username, email, phoneNo, pwd, confirmPwd};
		
		for(int i=0; i<checkNull.length; i++) {
			if(checkNull[i]==null || checkNull[i].equals("")) {
				page="register.jsp?errCode=nullInputValue";
				checkPage=true;
				break;
			}
		}

		if (phoneNo.matches(".*[a-zA-Z]+.*") == true) {
			page="register.jsp?errCode=invalidPhoneNo";
			checkPage=true;
		}
		
		if(pwd.equals(confirmPwd) && checkPage==false) {
			//response.sendRedirect("login.jsp");
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
		          
		          pstmt.executeUpdate();
		          
		          conn.close();
		          
		          response.sendRedirect("login.jsp");
			}
			catch(java.sql.SQLIntegrityConstraintViolationException e) {
		         response.sendRedirect("register.jsp?errCode=duplicateError");
			}
			catch(Exception e) {
				System.out.print(e);
		         response.sendRedirect("register.jsp?errCode=unknownError");
			}
		}
		else {
			if(page!=null && !page.equals("")) {
				response.sendRedirect(page);
			}
			else {
				response.sendRedirect("register.jsp?errCode=invalidPwd");
			}
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
