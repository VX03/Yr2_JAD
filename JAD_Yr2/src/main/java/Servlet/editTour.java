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
 * Servlet implementation class editTour
 */
@WebServlet("/editTour")
public class editTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editTour() {
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
		
		String title = request.getParameter("title");
		String imageLoc = request.getParameter("imageLoc");
		String detail = request.getParameter("detail");
		String brief = request.getParameter("brief");
		double price = Double.parseDouble(request.getParameter("price"));
		int categoryChoosen = Integer.parseInt(request.getParameter("category"));
		int cateId = Integer.parseInt(request.getParameter("cateId"));
		int tourId = Integer.parseInt(request.getParameter("tourId"));
		
		if(imageLoc == null || imageLoc.equals("")) {
			imageLoc = "./images/default.jpg";
		}
		
		//System.out.print("cateName:"+cateName+",imageLoc:"+imageLoc);
		
		try {
			 Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="UPDATE tour SET title=?,imageLoc=?,price=?,brief_description=?,detail_description=?,tourCateId=? WHERE tour_id=?";
	          String sqlstr2="UPDATE tourcategory SET tourNums=(SELECT count(*) numOfTour from tour where tourCateId=?) WHERE tourCateId=?";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
	          PreparedStatement pstmt3 = conn.prepareStatement(sqlstr2);
	          
	          pstmt.setString(1, title);
	          pstmt.setString(2, imageLoc);
	          pstmt.setDouble(3, price);
	          pstmt.setString(4, brief);
	          pstmt.setString(5, detail);
	          pstmt.setInt(6, categoryChoosen);
	          pstmt.setInt(7, tourId);
	          
	          pstmt2.setInt(1, categoryChoosen);
	          pstmt2.setInt(2, categoryChoosen);
	          
	          pstmt3.setInt(1, cateId);
	          pstmt3.setInt(2, cateId);
	          
	          pstmt.executeUpdate();
	          pstmt2.executeUpdate();
	          pstmt3.executeUpdate();
	          
	          conn.close();
	          System.out.print("excute successful");
//	          response.sendRedirect("detail.jsp?tourid="+tourid);
	          response.sendRedirect("cateTourEdit.jsp?success=success edit Tour!&tourId="+tourId);

		}
		catch(Exception e) {
			System.out.print(e);
	         //response.sendRedirect("register.jsp?errCode=unknownError");
			//response.sendRedirect("detail.jsp?tourid="+tourid);
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
