package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShowFareDetailsDao {
	
	public ShowFareDetailsDao() {}
	
	public static ResultSet getClassFares(int flightNo, Connection con) throws Exception{
		 String query = "SELECT * FROM class_fare WHERE flightNo = ?";
		 	
		    PreparedStatement pstmt = con.prepareStatement(query);
		    pstmt.setInt(1, flightNo);
		    	
		    ResultSet rs = pstmt.executeQuery();		    
		    return rs;
	}
}
