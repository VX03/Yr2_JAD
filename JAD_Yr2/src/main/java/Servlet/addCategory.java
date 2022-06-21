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
 * Servlet implementation class addCategory
 */
@WebServlet("/addCategory")
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCategory() {
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
		
		
		try {
			cateName = request.getParameter("cateName");
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
	          String sqlstr="INSERT INTO tourcategory(name,imageLoc,tourNums) VALUES (?,?,?)";
	          System.out.println(sqlstr);
	          PreparedStatement pstmt = conn.prepareStatement(sqlstr);
	          
	          pstmt.setString(1, cateName);
	          pstmt.setString(2, imageLoc);
	          pstmt.setInt(3, 0);

	          pstmt.executeUpdate();
	          
	          conn.close();
	          System.out.print("excute successful");
//	          response.sendRedirect("detail.jsp?tourid="+tourid);
	          response.sendRedirect("admin.jsp?addCateMsg=success add category!");

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
