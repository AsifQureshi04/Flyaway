package com.flyaway.servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.BookFlightDao;
import com.flyaway.dao.DBConfig;
import com.flyaway.entities.*;



@WebServlet("/BookFlightServlet")
public class BookFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String date = request.getParameter("date");
		int travellers = Integer.parseInt(request.getParameter("travellers"));
		TicketDetails ticketDetails = new TicketDetails();
		ticketDetails.setSrc(from);
		ticketDetails.setDest(to);
		ticketDetails.setNo_of_passengers(travellers);
		boolean flag = false;
		List<BookFlight> flightDetailsList = new ArrayList<>();
		String alert = "There are no flights flying from " + from + " to " + to + " on date " + date;
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
			LocalDate dt = LocalDate.parse(date,formatter);
			DayOfWeek dayOfWeek = dt.getDayOfWeek();
			String d = dt.toString() + " " +  "("+dayOfWeek.toString()+")";
			ticketDetails.setDate(d);
			HttpSession session = request.getSession();
			session.setAttribute("ticketDetails",ticketDetails);
			String day = dayOfWeek.toString().charAt(0) + (dayOfWeek.toString().substring(1,3)).toLowerCase();
			Connection con = DBConfig.getConnection();		 
			ResultSet rs = BookFlightDao.getFlightDetails(from,to,con);
			if(rs.next()) {
				System.out.println("ResultSet is not null");
				  do {
					  System.out.println("Inside do");
			            String weekday = rs.getString("weekdays");	                
			            if (weekday.indexOf(day) != -1) {
			            	flag = true;
			            	BookFlight bookFlight = new BookFlight();
			            	bookFlight.setFlightNo(rs.getInt("flightNo"));
			            	bookFlight.setAirline(rs.getString("airline"));
			            	bookFlight.setTraveldate(d);
			            	bookFlight.setFrom(rs.getString("src_airport_code"));
			            	bookFlight.setTo(rs.getString("dest_airport_code"));
			            	flightDetailsList.add(bookFlight);
			            } 
				  }while(rs.next());
				  	if(flag) {
				  		request.setAttribute("flightDetailsList", flightDetailsList);
					    RequestDispatcher dispatcher = request.getRequestDispatcher("/flightdetails.jsp");
					    dispatcher.forward(request, response);
				  	}else {
				  	  	session.setAttribute("alert", alert);
						response.sendRedirect("bookflight.jsp");
				  	}
						
			  }else {
				  	session.setAttribute("alert", alert);
					response.sendRedirect("bookflight.jsp"); 
//		            flag = false;
			  }
			rs.close();
//			if(flag) {
//				request.setAttribute("flightDetailsList", flightDetailsList);
//			    RequestDispatcher dispatcher = request.getRequestDispatcher("/flightdetails.jsp");
//			    dispatcher.forward(request, response);			
//			    }else {
//			    	alertMessage = "No flights available for the selected route and date.";
//			        request.setAttribute("alertMessage", alertMessage);
//			        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookflight.jsp");
//			        dispatcher.forward(request, response);
//			    }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
