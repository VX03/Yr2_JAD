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
 * Servlet implementation class editCategory
 */
@WebServlet("/editCategory")
public class editCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editCategory() {
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
		String cateName;
		String imageLoc;
		int cateId = Integer.parseInt(request.getParameter("cateId"));
		
		
		try {
			cateName = request.getParameter("name");
			imageLoc = request.getParameter("imageLoc");
		
			if(imageLoc == null || imageLoc.equals("")) {
				imageLoc = "./images/default.jpg";
			}
		
			System.out.print("cateName:"+cateName+",imageLoc:"+imageLoc);
			 Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          String sqlstr="UPDATE tourcategory SET name=?,imageLoc=? WHERE tourCateId=?";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          
	          pstmt.setString(1, cateName);
	          pstmt.setString(2, imageLoc);
	          pstmt.setInt(3, cateId);

	          pstmt.executeUpdate();
	          
	          conn.close();
	          System.out.print("excute successful");
//	          response.sendRedirect("detail.jsp?tourid="+tourid);
	          response.sendRedirect("cateTourEdit.jsp?success=success edit category!&cateId="+cateId);

		}
		catch(Exception e) {
			System.out.print(e);
			response.sendRedirect("cateTourEdit.jsp?errCode=failed edit category!&cateId="+cateId);

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
