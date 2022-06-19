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
 * Servlet implementation class addComment
 */
@WebServlet("/addComment")
public class addComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		int userid=(int)session.getAttribute("userId");
		
		String comment = request.getParameter("comment");
		
		System.out.print("tourid:"+tourid+",rating:"+rating+",comment:"+comment+",userid:"+userid);
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="INSERT INTO tourreview(comment,user_id,tour_id,rating) VALUES (?,?,?,?)";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          pstmt.setString(1, comment);
	          pstmt.setInt(2, userid);
	          pstmt.setInt(3, tourid);
	          pstmt.setInt(4, rating);
	          
	          pstmt.executeUpdate();
	          
	          conn.close();
	          
	          response.sendRedirect("detail.jsp?tourid="+tourid);
		}
		catch(Exception e) {
			System.out.print(e);
	         //response.sendRedirect("register.jsp?errCode=unknownError");
			response.sendRedirect("detail.jsp?tourid="+tourid);
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
