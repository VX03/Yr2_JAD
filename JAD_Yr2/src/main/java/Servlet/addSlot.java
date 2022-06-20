package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addSlot
 */
@WebServlet("/addSlot")
public class addSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSlot() {
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
		
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		int tourId = Integer.parseInt(request.getParameter("title"));
		int availNo = Integer.parseInt(request.getParameter("availNo"));
		try {
			if(startDate != null && endDate != null) {
					Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

		          // Step 2: Define Connection URL
		          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

		          // Step 3: Establish connection to URL
		          Connection conn = DriverManager.getConnection(connURL); 
	        	  String sqlstr3 = "INSERT INTO slots(start_date, end_date,available_no, tour_id) VALUES (?, ?, ?, ?)";
	        	  PreparedStatement pstmt3 = conn.prepareStatement(sqlstr3);
	        	  pstmt3.setString(1, startDate);
	        	  pstmt3.setString(2, endDate);
	        	  pstmt3.setInt(3, availNo);
	        	  pstmt3.setInt(4, tourId);
		          pstmt3.executeUpdate();
		          response.sendRedirect("cateTourEdit.jsp?insertSlot=success insert Slot!&tourId="+tourId);

	          }
		}catch(Exception e) {
			System.out.print(e);
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
