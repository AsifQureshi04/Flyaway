package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flyaway.entities.TicketDetails;

public class CustomerDetails {
	
	public static ResultSet getCustomerDetails(String email) {
		ResultSet rs = null;
		String query = "SELECT bd.* FROM booking_details bd JOIN register r ON bd.customer_id = r.customer_id WHERE r.email = ?";
		PreparedStatement pstmt = null;
		Connection con = null;
		try {
			con = DBConfig.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return rs;
	}
}
