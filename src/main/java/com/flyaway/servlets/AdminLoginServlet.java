package com.flyaway.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.flyaway.entities.*;
import com.flyaway.dao.*;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AdminEmail = request.getParameter("email");
		String AdminPassword = request.getParameter("pass");
		HttpSession session = request.getSession(true);
		List<BookFlight> list = new ArrayList<>();
		if(AdminLoginDao.authenticate(AdminEmail,AdminPassword)) {
			session.setAttribute("AdminEmail",AdminEmail);
			ResultSet rs = null;
			try {
				rs = AdminDetailsDao.getAllFlightdetails();
				while(rs.next()) {
					BookFlight bookFlight = new BookFlight();
					bookFlight.setFlightNo(rs.getInt("flightNo"));
					bookFlight.setAirline(rs.getString("airline"));
					bookFlight.setFrom(rs.getString("src_airport_code"));
					bookFlight.setTo(rs.getString("dest_airport_code"));
					bookFlight.setTraveldate(rs.getString("weekdays"));
					bookFlight.setEconomy_fare(rs.getFloat("economy_fare"));
					bookFlight.setPremium_fare(rs.getFloat("premium_fare"));
					bookFlight.setBusiness_fare(rs.getFloat("business_fare"));
					list.add(bookFlight);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			session.setAttribute("list",list);
			response.sendRedirect("admindetailspage.jsp");
			
		}else {
			request.setAttribute("errorMessage","Invalid email or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
            dispatcher.forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
