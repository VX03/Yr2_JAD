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
 * Servlet implementation class addTour
 */
@WebServlet("/addTour")
public class addTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTour() {
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
		
		try {
			double price = Double.parseDouble(request.getParameter("price"));
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			String imageLoc = request.getParameter("imageLoc");
			String title = request.getParameter("title");
			String briefDescrip = request.getParameter("brief");
			String detailDescrip = request.getParameter("detail");
			
			
			if(imageLoc == null || imageLoc.equals("")) {
				imageLoc = "./images/default.jpg";
			}
			 Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers

	          // Step 2: Define Connection URL
	          String connURL = "jdbc:mysql://localhost/"+System.getenv("dbName")+"?user=root&password="+System.getenv("dbPass")+"&serverTimezone=UTC";

	          // Step 3: Establish connection to URL
	          Connection conn = DriverManager.getConnection(connURL); 
	          // Step 4: Create Statement object
	          //Statement stmt = conn.createStatement();
	          
	          String sqlstr="INSERT INTO tour(brief_description,detail_description,imageLoc,price,title,tourCateId) VALUES (?,?,?,?,?,?)";
	          String sqlstr2="UPDATE tourcategory SET tourNums=tourNums+1 WHERE tourCateId=?";
	         
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          PreparedStatement pstmt2 = conn.prepareStatement(sqlstr2);
	          pstmt.setString(1, briefDescrip);
	          pstmt.setString(2, detailDescrip);
	          pstmt.setString(3, imageLoc);
	          pstmt.setDouble(4, price);
	          pstmt.setString(5, title);
	          pstmt.setInt(6, categoryId);
	          pstmt.executeUpdate();

	          
	          pstmt2.setInt(1, categoryId);
	          pstmt2.executeUpdate();
          
	          conn.close();
	          System.out.print("excute successful");
	          //response.sendRedirect("detail.jsp?tourid="+tourid);
	          response.sendRedirect("admin.jsp?addTourMsg=add tour success");
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
