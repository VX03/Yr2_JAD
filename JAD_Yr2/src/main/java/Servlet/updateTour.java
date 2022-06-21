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
 * Servlet implementation class updateTour
 */
@WebServlet("/updateTour")
public class updateTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateTour() {
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

		int tourid = 0;
		String cardNo;
		String cardPass;
		int recordId;
		try {
			cardNo = request.getParameter("cardNo");
			cardPass = request.getParameter("cardPass");
			recordId = Integer.parseInt(request.getParameter("recordId"));
			
			 Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          
	          String sqlstr2="UPDATE bookingRecord SET paid=? WHERE record_id=?";

	          PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
	          if(cardNo==null||cardPass==null||cardNo.equals("")||cardPass.equals("")) {
	        	  pstmt2.setString(1, "Not Paid");
	          }else {
	        	  pstmt2.setString(1, "Paid");
	          }
	          pstmt2.setInt(2, recordId);
	          pstmt2.executeUpdate();
          
	          conn.close();
	          System.out.print("excute successful");
	          //response.sendRedirect("detail.jsp?tourid="+tourid);
	          response.sendRedirect("bookHistory.jsp");
		}
		catch(Exception e) {
			System.out.print(e);
	         //response.sendRedirect("register.jsp?errCode=unknownError");
			//response.sendRedirect("detail.jsp?tourid="+tourid);
			
			response.sendRedirect("bookHistory.jsp?errCode=fail");
		}
	}

	/**;
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
