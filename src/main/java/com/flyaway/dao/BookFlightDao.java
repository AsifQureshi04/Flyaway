package com.flyaway.dao;

import java.sql.*;

public class BookFlightDao {

	
	public BookFlightDao(){}
	
	
	public static ResultSet getFlightDetails(String src, String dest, Connection con) throws Exception{
		 String query = "SELECT * FROM flight_details WHERE src_airport_code = ? AND dest_airport_code = ?";
		 	
		    PreparedStatement pstmt = con.prepareStatement(query);
		    pstmt.setString(1, src);
		    pstmt.setString(2, dest);
		    	
		    ResultSet rs = pstmt.executeQuery();		    
		    return rs;
	}
}
