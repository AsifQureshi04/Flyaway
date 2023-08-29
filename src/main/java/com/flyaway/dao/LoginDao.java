package com.flyaway.dao;

import java.sql.*;

public class LoginDao {
	
	public static ResultSet validateUser(String email, String password, Connection con) throws SQLException {
		String query = "select pass, fName, lName, customer_id, PhoneNumber from register where email=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		
		ResultSet rs = pstmt.executeQuery();
//		if(rs.next())
//		 pass = rs.getString("pass");
		
		return rs;
	}
}
