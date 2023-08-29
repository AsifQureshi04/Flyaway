package com.flyaway.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.CustomerDetails;
import com.flyaway.dao.DBConfig;
import com.flyaway.dao.LoginDao;
import com.flyaway.entities.TicketDetails;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			String fName = null;
			String lName = null;
			String pass = null;
			int customer_id = 0;
			long pNumber = 0;
			HttpSession session = request.getSession(true);

//			System.out.println("email = " + email + "password = " + password);
			try {
				Connection con = DBConfig.getConnection();
				ResultSet rs = LoginDao.validateUser(email,password,con);
				if(rs.next()) {
					 pass = rs.getString("pass");
					 fName = rs.getString("fName");
					 lName= rs.getString("lName");
					 customer_id = Integer.parseInt(rs.getString("customer_id"));
					 pNumber = Long.parseLong(rs.getString("PhoneNumber"));
				}
				if(password.equals(pass)) {
					session.setAttribute("fName",fName);
					session.setAttribute("lName",lName);
					session.setAttribute("email",email);
					session.setAttribute("customer_id",customer_id);
					session.setAttribute("pNumber",pNumber);
					if(session.getAttribute("flightNo") != null) {
						response.sendRedirect("bookingdetails.jsp");
					}
					else {
//						ResultSet rs1 = null;
						List<TicketDetails> details = new ArrayList<>();
						ResultSet rs1 = CustomerDetails.getCustomerDetails(email);
						 if(rs1.next()) {
							do{
								TicketDetails ticketDetails = new TicketDetails();
								ticketDetails.setStatus(rs1.getString("booking_status"));
								ticketDetails.setBooking_id(rs1.getInt("booking_id"));
								ticketDetails.setFlight_Number(rs1.getInt("flight_Number"));
								ticketDetails.setAirline(rs1.getString("airline"));
								ticketDetails.setFlight_class(rs1.getString("class"));
								ticketDetails.setCustomer_id(rs1.getInt("customer_id"));
								ticketDetails.setSrc(rs1.getString("source"));
								ticketDetails.setDest(rs1.getString("destination"));
								ticketDetails.setDate(rs1.getString("travel_date"));
								ticketDetails.setNo_of_passengers(rs1.getInt("No_of_passengers"));
								ticketDetails.setAmount(rs1.getFloat("total_fare"));
								details.add(ticketDetails);
								
//								System.out.println("Printing from CustomerDetailsServlet");
//
//								System.out.println(rs1.getString("booking_status"));
//								System.out.println(rs1.getInt("booking_id"));
//								System.out.println(rs1.getInt("flight_Number"));
//								System.out.println(rs1.getString("airline"));
//								System.out.println(rs1.getString("class"));
//								System.out.println(rs1.getInt("customer_id"));
//								System.out.println(rs1.getString("source"));
//								System.out.println(rs1.getString("destination"));
//								System.out.println(rs1.getString("travel_date"));
//								System.out.println(rs1.getInt("No_of_passengers"));
//								System.out.println(rs1.getFloat("total_fare"));
//								System.out.println();
								
							}while(rs1.next());
//							 request.setAttribute("rs",rs);
//							 RequestDispatcher dispatcher = request.getRequestDispatcher("/customerdetails.jsp");
//							 dispatcher.forward(request,response);
						 }else {
						 
						 }
						 request.setAttribute("details",details);
						 RequestDispatcher dispatcher = request.getRequestDispatcher("/customerdetails.jsp");
						 dispatcher.forward(request,response);
					}

				}else {
					request.setAttribute("errorMessage","Invalid email or password");
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		            dispatcher.forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
