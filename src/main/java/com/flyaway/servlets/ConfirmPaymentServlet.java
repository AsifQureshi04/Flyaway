package com.flyaway.servlets;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.dao.ConfirmPaymentDao;
import com.flyaway.entities.*;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ConfirmPaymentServlet ");
		String chname = request.getParameter("CHName");
		String cnumber = request.getParameter("CNumber");
		HttpSession session = request.getSession();
		TicketDetails ticketDetails = (TicketDetails) session.getAttribute("ticketDetails");
		session.setAttribute("CHName",chname);
		session.setAttribute("CNumber",cnumber);
		int customer_id = (int)session.getAttribute("customer_id");
		boolean flag = ConfirmPaymentDao.confirmPayment(ticketDetails,customer_id);
//		System.out.println("flag = " + flag);
		int booking_id = 0;
		booking_id = ConfirmPaymentDao.getBookingId();
		session.setAttribute("booking_id",booking_id);
		 Enumeration<String> attributeNames = session.getAttributeNames();
		 
		    // Loop through the enumeration to retrieve each attribute value
		    while ( attributeNames.hasMoreElements()) {
		        String attributeName = attributeNames.nextElement();
		        Object attributeValue = session.getAttribute(attributeName);
		        System.out.println("Attribute Name: " + attributeName);
		        // Do something with the attribute name and value
		        System.out.println("Attribute Value: " + attributeValue);
		    }
		    
		    response.sendRedirect("ConfirmPayment.jsp");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
