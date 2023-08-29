package com.flyaway.servlets;

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

import com.flyaway.dao.AdminDetailsDao;
import com.flyaway.entities.BookFlight;


@WebServlet("/AddFareServlet")
public class AddFareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flightNo = Integer.parseInt(request.getParameter("flightNo"));
		String fclass = request.getParameter("fclass");
		float fare = Float.parseFloat(request.getParameter("fare"));
		List<BookFlight> list = new ArrayList<>();
		HttpSession session = request.getSession(true);
//		System.out.println(flightNo + " " + fare + " " + fclass);
		String alert = "Fare successfully added";
		int row = AdminDetailsDao.addFare(flightNo,fclass,fare);
		if(row>0) {
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
			session.setAttribute("alert",alert);
			response.sendRedirect("admindetailspage.jsp");

		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
