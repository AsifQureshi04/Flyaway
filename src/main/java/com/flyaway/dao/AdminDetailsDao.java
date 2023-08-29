package com.flyaway.dao;

import java.sql.*;
import com.flyaway.entities.*;
public class AdminDetailsDao {
	
	public static ResultSet getAllFlightdetails() throws SQLException {
		String query = "SELECT \r\n"
				+ "    fd.flightNo,\r\n"
				+ "    fd.airline,\r\n"
				+ "    fd.weekdays,\r\n"
				+ "    fd.src_airport_code,\r\n"
				+ "    fd.dest_airport_code,\r\n"
				+ "    MAX(CASE WHEN cf.fclass = 'Economy' THEN cf.fare END) AS economy_fare,\r\n"
				+ "    MAX(CASE WHEN cf.fclass = 'Business' THEN cf.fare END) AS business_fare,\r\n"
				+ "    MAX(CASE WHEN cf.fclass = 'Premium' THEN cf.fare END) AS premium_fare\r\n"
				+ "FROM\r\n"
				+ "    flyaway.flight_details fd\r\n"
				+ " LEFT JOIN\r\n"
				+ "    flyaway.class_fare cf ON fd.flightNo = cf.flightNo\r\n"
				+ "GROUP BY\r\n"
				+ "    fd.flightNo, fd.airline, fd.weekdays, fd.src_airport_code, fd.dest_airport_code;";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBConfig.getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();}

		return rs;
	}
	
	public static int adminAddFlight(BookFlight bookFlight) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			String query = "insert into flight_details(flightNo,airline,weekdays,src_airport_code,dest_airport_code) values(?,?,?,?,?)";
			con = DBConfig.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,bookFlight.getFlightNo());
			pstmt.setString(2,bookFlight.getAirline());
			pstmt.setString(3,bookFlight.getTraveldate());
			pstmt.setString(4,bookFlight.getFrom());
			pstmt.setString(5,bookFlight.getTo());
			rows = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rows;
	}
	
	public static int addFare(int flightNo, String fclass, float fare) {
		int row = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String query = "insert into class_fare(flightNo,fare,fclass) values(?,?,?)";
			con = DBConfig.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,flightNo);
			pstmt.setFloat(2,fare);
			pstmt.setString(3,fclass);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return row;
	}
}
