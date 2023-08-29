package com.flyaway.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyaway.dao.DBConfig;
import com.flyaway.dao.ShowFareDetailsDao;
import com.flyaway.entities.*;
import java.util.*;

@WebServlet("/ShowFareDetailsServlet")
public class ShowFareDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ShowFareDetailsServlet");
		String fNo = request.getParameter("flightNo");
		String airline = request.getParameter("airline");
		System.out.println(fNo);
		int flightNo = Integer.parseInt(fNo);
		boolean flag = false;
		String alertMessage = "";
		List<ShowFareDetails> fareDetailsList = new ArrayList<>(); 
		
		try {
			Connection con = DBConfig.getConnection();
			ResultSet rs = ShowFareDetailsDao.getClassFares(flightNo,con);
			if(rs.next()) {
				System.out.println("ResultSet is not empty");
				do {
					flag = true;
					ShowFareDetails showFareDetails = new ShowFareDetails();
					showFareDetails.setFlightNo(rs.getInt("flightNo"));
					showFareDetails.setAirline(airline);
					showFareDetails.setFlightClass(rs.getString("fclass"));
					showFareDetails.setFare(rs.getInt("fare"));
					fareDetailsList.add(showFareDetails);
				}while(rs.next());
			}else {
				
			}
			
//			for(ShowFareDetails detail : fareDetailsList) {
//				System.out.println("flightNo = " + detail.getFlightNo());
//				System.out.println("Airline = " + detail.getAirline());
//				System.out.println("Flight Class = " + detail.getFlightClass());
//				System.out.println("Fare = " + detail.getFare());
//			}
			
			rs.close();
			if(flag) {
				request.setAttribute("fareDetailsList", fareDetailsList);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/showfaredetails.jsp");
			    dispatcher.forward(request, response);
//		        response.sendRedirect("/showfaredetails.jsp");

			    }else {
//			    	alertMessage = "No flights available for the selected route and date.";
//			        request.setAttribute("alertMessage", alertMessage);
//			        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookflight.jsp");
//			        dispatcher.forward(request, response);
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
