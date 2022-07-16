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

import Classes.User;
import dbAccess.UserAccess;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
				String name = request.getParameter("name");
				String pwd = request.getParameter("password");
				int userId = 0;
				String userRole="";
				User u = null;
				
				try {
			        UserAccess ua = new UserAccess();
			        u = ua.login(name, pwd);
				}catch(Exception e) {
					System.out.println("Error"+e);
				}
				
				if(u != null) {
					System.out.print("here");
					session.setAttribute("name", u.getUserName());
					session.setAttribute("userId", u.getUserId());
					session.setAttribute("role", u.getUserRole());
					session.setAttribute("loginStatus", "success");
					//session.setMaxInactiveInterval(3);
					response.sendRedirect("index.jsp");
					out.print("login success");
				}else {
					request.setAttribute("errCode", "invalidLogin");
		        	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        	rd.forward(request, response);
					out.print("login failed");
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
