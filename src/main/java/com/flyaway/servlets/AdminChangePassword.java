package com.flyaway.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.PasswordDao;


@WebServlet("/AdminChangePassword")
public class AdminChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside AdminChangePassword");
		String email = (String)request.getParameter("email");
		String oldPassword = (String)request.getParameter("oldPassword"); 
		String newPassword = (String)request.getParameter("newPassword"); 
		HttpSession session = request.getSession();

//		String salt = BCrypt.gensalt();
//		String encryptPass = BCrypt.hashpw(newPassword,salt);
		
//		System.out.println("email = " + email);
//		System.out.println("oldPassword = " + oldPassword);
//		System.out.println("newPassword = " + newPassword);


	
			if(session.getAttribute("AdminEmail") != null) {
				System.out.println("authentication success");

				if(PasswordDao.changeAdminPassword(email,newPassword ) > 0) {
					System.out.println("changePassword success");			
					
					session.setAttribute("alert", "Password changed successfully!");
					response.sendRedirect("admindetailspage.jsp");
				}
				
			}else {
				System.out.println("authentication Failed");
				session.setAttribute("alert", "Old Password is incorrect");
				response.sendRedirect("adminforgotpassword.jsp");
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
