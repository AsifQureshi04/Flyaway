package com.flyaway.servlets;

import java.io.IOException;
import com.flyaway.entities.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.DBConfig;
import com.flyaway.dao.RegisterDao;

import java.sql.*;
import java.util.Random;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("confirmPassword");
		String pNumber = request.getParameter("phone");
		int customer_id = (new Random()).nextInt(9000) + 1000;
//		System.out.println(fName + ", " + lName + ", " + email + ", " + password + ", " + cpassword + ", " + pNumber);
		try {
			Connection con = DBConfig.getConnection();
			if(RegisterDao.emailExists(email,con)) {
				request.setAttribute("errorMessage","Email alrready exists. Please use a different email.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
				dispatcher.forward(request,response);
			}else {
				Register register = new Register();
				register.setfName(fName);
				register.setlName(lName);
				register.setEmail(email);
				register.setPassword(password);
				register.setcPassword(cpassword);
				register.setPhoneNumber(pNumber);
				register.setId(customer_id);
				
				int rowsAffected = RegisterDao.insertRegistrationDetails(register,con);
				System.out.println("Affected rows = " + rowsAffected);
				if(rowsAffected>0) {
					HttpSession session = request.getSession();
				    TicketDetails ticketDetails = (TicketDetails) session.getAttribute("ticketDetails");
				    session.setAttribute("fName",fName);
				    session.setAttribute("lName",lName);
				    session.setAttribute("email",email);
				    session.setAttribute("pNumber",pNumber);
				    session.setAttribute("customer_id",customer_id);
					response.sendRedirect("bookingdetails.jsp");
				}
			}		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
