package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flyaway.entities.Register;

public class RegisterDao {
	
	public static int insertRegistrationDetails(Register register, Connection con) throws SQLException {
		String query = "insert into register(fName,lName,email,pass,cpass,PhoneNumber,customer_id) values(?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,register.getfName());
		pstmt.setString(2,register.getlName());
		pstmt.setString(3,register.getEmail());
		pstmt.setString(4,register.getPassword());
		pstmt.setString(5,register.getcPassword());
		pstmt.setString(6,register.getPhoneNumber());
		pstmt.setInt(7,register.getId());
		
		
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected;
	}
	
	public static boolean emailExists(String email, Connection con) throws SQLException {
		boolean exists = false;
		String query = "select * from register where email=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			exists = true;
		}
		
		rs.close();
	
		return exists;
	}
}
