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
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbAccess.UserAccess;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo");
		String pwd = request.getParameter("password");
		String confirmPwd = request.getParameter("confirmPass");
		
		int n = 0;
		
		boolean checkPage=false;
		String page="";
		String[] checkNull = {username, email, phoneNo, pwd, confirmPwd};
		
		for(int i=0; i<checkNull.length; i++) {
			if(checkNull[i]==null || checkNull[i].equals("")) {
				page="null";
				checkPage=true;
				break;
			}
		}

		if (phoneNo.matches(".*[a-zA-Z]+.*") == true) {
			page="phone";
			checkPage=true;
		}
		
		if(pwd.equals(confirmPwd) && checkPage==false) {
			//response.sendRedirect("login.jsp");
			try {
				UserAccess ua = new UserAccess(); 
				n = ua.register(username, pwd, email, phoneNo);
				System.out.print("n: "+n);
		        if(n == 1)
		        	response.sendRedirect("login.jsp");
		        else
		        {
		        	request.setAttribute("errCode", "duplicateError");
		        	RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		        	rd.forward(request, response);
		        }
			}
			catch(Exception e) {
				request.setAttribute("errCode", "unknownError");
	        	RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
	        	rd.forward(request, response);
			}
		}
		else {
			if(checkPage && page.equals("phone")) {
				request.setAttribute("errCode", "invalidPhoneNo");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			else if(checkPage && page.equals("null")) {
				request.setAttribute("errCode", "nullInputValue");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("errCode", "invalidPwd");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
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
