package com.flyaway.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.CustomerDetails;
import com.flyaway.entities.*;
import java.util.*;

@WebServlet("/CustomerDetailsServlet")
public class CustomerDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		ResultSet rs = null;
		List<TicketDetails> details = new ArrayList<>();
		try {
			 rs = CustomerDetails.getCustomerDetails(email);
			 if(rs.next()) {
				do{
					TicketDetails ticketDetails = new TicketDetails();
					ticketDetails.setStatus(rs.getString("booking_status"));
					ticketDetails.setBooking_id(rs.getInt("booking_id"));
					ticketDetails.setFlight_Number(rs.getInt("flight_Number"));
					ticketDetails.setAirline(rs.getString("airline"));
					ticketDetails.setFlight_class(rs.getString("class"));
					ticketDetails.setCustomer_id(rs.getInt("customer_id"));
					ticketDetails.setSrc(rs.getString("source"));
					ticketDetails.setDest(rs.getString("destination"));
					ticketDetails.setDate(rs.getString("travel_date"));
					ticketDetails.setNo_of_passengers(rs.getInt("No_of_passengers"));
					ticketDetails.setAmount(rs.getFloat("total_fare"));
					details.add(ticketDetails);
					
//					 System.out.println("Printing from CustomerDetailsServlet");
//
//					System.out.println(rs.getString("booking_status"));
//					System.out.println(rs.getInt("booking_id"));
//					System.out.println(rs.getInt("flight_Number"));
//					System.out.println(rs.getString("airline"));
//					System.out.println(rs.getString("class"));
//					System.out.println(rs.getInt("customer_id"));
//					System.out.println(rs.getString("source"));
//					System.out.println(rs.getString("destination"));
//					System.out.println(rs.getString("travel_date"));
//					System.out.println(rs.getInt("No_of_passengers"));
//					System.out.println(rs.getFloat("total_fare"));
//					System.out.println();
					
				}while(rs.next());
//				 request.setAttribute("rs",rs);
//				 RequestDispatcher dispatcher = request.getRequestDispatcher("/customerdetails.jsp");
//				 dispatcher.forward(request,response);
			 }else {
			 
			 }
			 request.setAttribute("details",details);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/customerdetails.jsp");
			 dispatcher.forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
