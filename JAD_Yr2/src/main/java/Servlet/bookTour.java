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
 * Servlet implementation class bookTour
 */
@WebServlet("/bookTour")
public class bookTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookTour() {
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
		boolean checkNum=true;
		int noOfGuest;
		int slotid;
		int userid;
		int tourid = 0;
		
		try {
			tourid = Integer.parseInt(request.getParameter("tourid"));
			noOfGuest = Integer.parseInt(request.getParameter("numOfGuest"));
			slotid = Integer.parseInt(request.getParameter("slots"));
			userid=(int)session.getAttribute("userId");

			
			Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";	

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="INSERT INTO bookingrecord(slot_id,user_id,no_of_guest,type) VALUES (?,?,?,?)";
	          
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          pstmt.setInt(1, slotid);
	          pstmt.setInt(2, userid);
	          pstmt.setInt(3, noOfGuest);
	          pstmt.setString(4, "upcoming");
	          
	          String sqlstr2="UPDATE slots SET available_no = available_no-? WHERE slot_id=? AND available_no-?>=0";
	          
	          PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
	          pstmt2.setInt(1, noOfGuest);
	          pstmt2.setInt(2, slotid);
	          pstmt2.setInt(3, noOfGuest);
	          
	          pstmt.executeUpdate();
	          pstmt2.executeUpdate();
	          conn.close();
	          
	          response.sendRedirect("bookHistory.jsp");
		}
		catch(NumberFormatException e) {
			if(request.getParameter("slots").equals("none")) {
				response.sendRedirect("book.jsp?tourid="+tourid+"&errCode="+"noSlotsError");
			}
			else {
			 response.sendRedirect("book.jsp?tourid="+tourid+"&errCode="+"numError");
			}
		}
		catch(Exception e) {
			System.out.print(e);
			 response.sendRedirect("book.jsp?tourid="+tourid+"&errCode="+"updateFailed");
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
