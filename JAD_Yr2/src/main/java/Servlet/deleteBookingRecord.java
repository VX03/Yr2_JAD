// Description: JAD CA1 Assignment
// Class: DIT/2B/21
// Group Number: 2
// Author: LI KEHAN, Vernell

package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class deleteBookingRecord
 */
@WebServlet("/deleteBookingRecord")
public class deleteBookingRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteBookingRecord() {
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
		int noOfGuest;
		int recordid;
		int slotid;
		
		try {
			 noOfGuest = Integer.parseInt(request.getParameter("guestNum"));
			 recordid = Integer.parseInt(request.getParameter("recordId"));
			 slotid = Integer.parseInt(request.getParameter("slotId"));
			Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";	

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="DELETE FROM bookingrecord WHERE record_id=?";
	          
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          pstmt.setInt(1, recordid);

	          String sqlstr2="UPDATE slots SET available_no = available_no+? WHERE slot_id=?";
	          
	          PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
	          pstmt2.setInt(1, noOfGuest);
	          pstmt2.setInt(2, slotid);
	          
	          pstmt.executeUpdate();
	          pstmt2.executeUpdate();
	          conn.close();
	          
	          response.sendRedirect("bookHistory.jsp");
		}
		catch(Exception e) {
			System.out.print(e);
			 response.sendRedirect("bookHistory.jsp?errCode=updateFailed");
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
