package com.flyaway.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.flyaway.dao.PasswordDao;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String)request.getParameter("email");
		String oldPassword = (String)request.getParameter("oldPassword"); 
		String newPassword = (String)request.getParameter("newPassword"); 
		
//		String salt = BCrypt.gensalt();
//		String encryptPass = BCrypt.hashpw(newPassword,salt);
		
//		System.out.println("email = " + email);
//		System.out.println("oldPassword = " + oldPassword);
//		System.out.println("newPassword = " + newPassword);


	
			if(PasswordDao.authenticate(email,oldPassword)) {
//				System.out.println("authentication success");

				if(PasswordDao.changePassword(email,newPassword ) > 0) {
//					System.out.println("changePassword success");			
					
					HttpSession session = request.getSession();
					session.setAttribute("alert", "Password changed successfully!");
					response.sendRedirect("customerdetails.jsp");
				}
				
			}else {
//				System.out.println("authentication Failed");
				HttpSession session = request.getSession();
				session.setAttribute("alert", "Old Password is incorrect");
				response.sendRedirect("forgot-password.jsp");
			}
		}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
