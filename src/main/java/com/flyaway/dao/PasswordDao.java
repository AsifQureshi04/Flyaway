package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

import org.mindrot.jbcrypt.BCrypt;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordDao {
	
	public static int changePassword(String email, String newPassword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String salt = BCrypt.gensalt();
		String encryptPass = BCrypt.hashpw(newPassword,salt);
		
		try {
			con = DBConfig.getConnection();
			String query = "update register set pass = ?, cpass = ? , encryptpass = ?  WHERE email = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,newPassword);
			pstmt.setString(2,newPassword);
			pstmt.setString(3,encryptPass);
			pstmt.setString(4,email);
			row = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null)
				   con.close();
				if(pstmt != null)
				   pstmt.close();
				if(rs != null)
				   rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	
	public static int changeAdminPassword(String email, String newPassword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
//		String salt = BCrypt.gensalt();
//		String encryptPass = BCrypt.hashpw(newPassword,salt);
		
		try {
			con = DBConfig.getConnection();
			String query = "update adminlogindetails set password = ?  WHERE EmailId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,newPassword);
			pstmt.setString(2,email);
			row = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null)
				   con.close();
				if(pstmt != null)
				   pstmt.close();
				if(rs != null)
				   rs.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	
	public static boolean authenticate(String username, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = DBConfig.getConnection();
			String query = "select pass from register where email=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,username);
			rs = pstmt.executeQuery();
			
			String pass = "";
			if(rs.next())
			 pass = rs.getString("pass");
			
			if (password.equals(pass)) {
				flag = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

}
