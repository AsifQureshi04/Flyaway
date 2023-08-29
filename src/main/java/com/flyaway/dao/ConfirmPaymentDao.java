package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.flyaway.entities.TicketDetails;

public class ConfirmPaymentDao {
	
	public static boolean confirmPayment(TicketDetails ticketDetails, int id) {
		Connection con = null;
		int flightNo = ticketDetails.getFlight_Number();
		String fclass = ticketDetails.getFlight_class();
		String date = ticketDetails.getDate();
		int passengers = ticketDetails.getNo_of_passengers();
		float fare = ticketDetails.getAmount();
		String airline = ticketDetails.getAirline();
		String source = ticketDetails.getSrc();
		String dest = ticketDetails.getDest();
		String status = "Confirmed";
		 date = date.substring(0,date.indexOf('('));
		int affectedRows = 0;
		try {
			con = DBConfig.getConnection();
			String query = "insert into booking_details(flight_Number,class,travel_date,No_of_passengers,total_fare,customer_id,airline,source,destination,booking_status)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1,flightNo);
			pstmt.setString(2,fclass);
			pstmt.setString(3,date);
			pstmt.setInt(4,passengers);
			pstmt.setFloat(5,fare);
			pstmt.setInt(6,id);
			pstmt.setString(7,airline);
			pstmt.setString(8,source);
			pstmt.setString(9,dest);
			pstmt.setString(10,status);
			
			affectedRows = pstmt.executeUpdate();
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return affectedRows>0;
	}
	
	public static int getBookingId() {
	    String query = "SELECT booking_id FROM booking_details ORDER BY booking_id DESC LIMIT 1;";
		Connection con = null;
		int fid = 0;
		ResultSet rs = null;
		Statement stmt = null;	
		try {
			con = DBConfig.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				fid = rs.getInt("booking_id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null)
				   con.close();
				if(rs != null)
				   rs.close();
				if(stmt != null)
				   stmt.close();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		return fid;
	}
}
