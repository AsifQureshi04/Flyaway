package com.flyaway.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.entities.TicketDetails;


@WebServlet("/BookingDetailsServlet")
public class BookingDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public BookingDetailsServlet() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int flightNo = Integer.parseInt(request.getParameter("flightNo"));
			String airline = request.getParameter("airline");
			String fClass = request.getParameter("class");
			HttpSession session = request.getSession();
//			System.out.println("email from BookingDetailsServlet = " + session.getAttribute("email"));
			session.setAttribute("flightNo",flightNo);
		    TicketDetails ticketDetails = (TicketDetails) session.getAttribute("ticketDetails");
		    float fare = Float.parseFloat(request.getParameter("fare"));
		    float tFare = fare * ticketDetails.getNo_of_passengers();
		    ticketDetails.setFlight_Number(flightNo);
		    ticketDetails.setAirline(airline);
		    ticketDetails.setFlight_class(fClass);
		    ticketDetails.setAmount(tFare);
		    ticketDetails.setFare(fare);
		    ticketDetails.setFare(Float.parseFloat(request.getParameter("fare")));
//		    
//		    System.out.println("flightNo = " + ticketDetails.getFlight_Number());
//		    System.out.println("Airline = " + ticketDetails.getAirline());
//		    System.out.println("flight class = " + ticketDetails.getFlight_class());
//		    System.out.println("Source = " + ticketDetails.getSrc());
//		    System.out.println("Destination = " + ticketDetails.getDest());
//		    System.out.println("Date = " + ticketDetails.getDate());
//		    System.out.println("No of passengers = " + ticketDetails.getNo_of_passengers());
//		    System.out.println("Amount = " + ticketDetails.getAmount());
//		    System.out.println("fare = " + ticketDetails.getFare());

		    
			request.setAttribute("ticketDetails",ticketDetails);
			if(session.getAttribute("email") != null)
				request.getRequestDispatcher("bookingdetails.jsp").forward(request, response);
			else request.getRequestDispatcher("register.jsp").forward(request, response);

//		    session.setAttribute("ticketDetails",ticketDetails);
	}
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
