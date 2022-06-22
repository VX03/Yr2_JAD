// Description: JAD CA1 Assignment
// Class: DIT/2B/21
// Group Number: 2
// Author: LI KEHAN, Vernell

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
		String startDate;
		String endDate;
		int tourId = Integer.parseInt(request.getParameter("title"));
		int availNo;
		
		try {
			startDate = request.getParameter("startdate");
			endDate = request.getParameter("enddate");
			availNo = Integer.parseInt(request.getParameter("availNo"));
			
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
		          response.sendRedirect("cateTourEdit.jsp?success=success insert Slot!&tourId="+tourId);

	          }
			}catch(com.mysql.cj.jdbc.exceptions.MysqlDataTruncation e) {
				System.out.print(e);
				response.sendRedirect("cateTourEdit.jsp?errCode=Incorrect values for date(s)!&tourId="+tourId);
			}
		catch(Exception e) {
			System.out.print(e.getClass().getName());
			response.sendRedirect("cateTourEdit.jsp?errCode=Incorrect values for date(s)!&tourId="+tourId);
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
