package com.flyaway.dao;

import java.sql.*;

public class AdminLoginDao {
	
	@SuppressWarnings("null")
	public static boolean authenticate(String email, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass = "";
		try {
			con = DBConfig.getConnection();
			String query = "select password from adminlogindetails where EmailId=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			if(rs.next())
				pass = rs.getString("password");
		}catch(Exception ex) {
			ex.printStackTrace();
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
		return password.equals(pass);
	}
}
