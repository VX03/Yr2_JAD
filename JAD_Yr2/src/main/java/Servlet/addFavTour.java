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
 * Servlet implementation class addFavTour
 */
@WebServlet("/addFavTour")
public class addFavTour extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addFavTour() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		
		int userId;
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		try {
			

			userId = (int) session.getAttribute("userId");

			System.out.print("tourid:" + tourId + ",userid:" + userId);
			Class.forName("com.mysql.jdbc.Driver"); // can be omitted for newer version of drivers

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/" + System.getenv("dbName") + "?user=root&password="
					+ System.getenv("dbPass") + "&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			// Statement stmt = conn.createStatement();
			String sqlstr = "INSERT INTO favoritetour(user_id,tour_id) VALUES (?,?)";
			System.out.println(sqlstr);
			PreparedStatement pstmt = conn.prepareStatement(sqlstr);

			pstmt.setInt(1, userId);
			pstmt.setInt(2, tourId);

			pstmt.executeUpdate();

			conn.close();
			response.sendRedirect("detail.jsp?tourid="+tourId);
			//response.sendRedirect("detail.jsp?");
		} catch (Exception e) {
			System.out.print(e);
			// response.sendRedirect("register.jsp?errCode=unknownError");
			response.sendRedirect("detail.jsp?tourid="+tourId);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
