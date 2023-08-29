package com.flyaway.servlets;

import com.flyaway.entities.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.*;

@WebServlet("/AdminAddFlightServlet")
public class AdminAddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flightNo = Integer.parseInt(request.getParameter("flightNo"));
		String airline = request.getParameter("flight");
		String src = request.getParameter("from");
		String dest = request.getParameter("to");
		String[] days = request.getParameterValues("days");
		String s = "";
		String alert = "Flight successfully added";
		for(String str : days) {
			s = s+str.substring(0,3) + "_";
		}
		
		s = s.substring(0,s.length()-1);
		BookFlight bookFlight = new BookFlight();
		bookFlight.setFlightNo(flightNo);
		bookFlight.setAirline(airline);
		bookFlight.setFrom(src);
		bookFlight.setTo(dest);
		bookFlight.setTraveldate(s);
		List<BookFlight> list = new ArrayList<>();

		int rows = AdminDetailsDao.adminAddFlight(bookFlight);
		if(rows>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alert",alert);
			ResultSet rs = null;
			try {
				rs = AdminDetailsDao.getAllFlightdetails();
				while(rs.next()) {
					BookFlight bookFlight1 = new BookFlight();
					bookFlight1.setFlightNo(rs.getInt("flightNo"));
					bookFlight1.setAirline(rs.getString("airline"));
					bookFlight1.setFrom(rs.getString("src_airport_code"));
					bookFlight1.setTo(rs.getString("dest_airport_code"));
					bookFlight1.setTraveldate(rs.getString("weekdays"));
					bookFlight1.setEconomy_fare(rs.getFloat("economy_fare"));
					bookFlight1.setPremium_fare(rs.getFloat("premium_fare"));
					bookFlight1.setBusiness_fare(rs.getFloat("business_fare"));
					list.add(bookFlight1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			session.setAttribute("list",list);
			response.sendRedirect("admindetailspage.jsp");			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
