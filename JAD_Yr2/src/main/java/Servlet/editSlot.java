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
 * Servlet implementation class editSlot
 */
@WebServlet("/editSlot")
public class editSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editSlot() {
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
		int availNo;
		int slotId = Integer.parseInt(request.getParameter("slotId"));
		
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
	        	  String sqlstr = "UPDATE slots SET start_date=?, end_date=?, available_no=? WHERE slot_id=?";
	        	  PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	        	  pstmt.setString(1, startDate);
	        	  pstmt.setString(2, endDate);
	        	  pstmt.setInt(3, availNo);
	        	  pstmt.setInt(4, slotId);
		          pstmt.executeUpdate();
		          response.sendRedirect("cateTourEdit.jsp?success=Edit Slot Success!&slotId="+slotId);

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
