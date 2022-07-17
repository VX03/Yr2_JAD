package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbAccess.UserAccess;

/**
 * Servlet implementation class editUser
 */
@WebServlet("/editUser")
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int n = 0;
		boolean checkPage = false;
		try {
		HttpSession session = request.getSession();
		int userid=(int)session.getAttribute("userId");
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo");
		String pwd = request.getParameter("pwd");
		String checkpwd = request.getParameter("checkpwd");
		
		String[] checkNull = {username, email, phoneNo, pwd, checkpwd};
		
		for(int i=0; i<checkNull.length; i++) {
			if(checkNull[i]==null || checkNull[i].trim().equals("")) {
				request.setAttribute("errCode", "nullInputValue");
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
		    	rd.forward(request, response);
				break;
			}
		}

		if (phoneNo.matches(".*[a-zA-Z]+.*") == true) {
			checkPage = true;
			request.setAttribute("errCode", "invalidPhoneNo");
		}
		else if(!pwd.equals(checkpwd)) {
			request.setAttribute("errCode", "invalidPwd");
		}
		else if(!checkPage){
			UserAccess ua = new UserAccess();
			n = ua.editUser(userid, username, email, phoneNo);
		}
		if(n != 1) {
			request.setAttribute("errCode", "duplicateError");		}
		}
		catch(Exception e) {
			System.out.print(e);
			request.setAttribute("errCode", "unknownError");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
    	rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
