package com.flyaway.dao;

import java.sql.*;

import javax.servlet.http.HttpSession;


public class MainApplication {

	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println("Hello, Fetching data from product table ");
		try {
			Connection con = DBConfig.getConnection();
			Statement stmt = con.createStatement();
			System.out.println("Connection is established");
			String query = "SELECT * FROM flight_details WHERE src_airport_code = 'NEW DELHI' AND dest_airport_code = 'MUMBAI';\r\n"
					+ "";
			ResultSet rs = stmt.executeQuery(query);
			if(!rs.next())
				System.out.println("Result set is empty");
			System.out.println("flightNo"+ "\t" + "Airline" + "\t" + "weekdays" + "\t\t\t" + "src_airport_code" + "\t" + "dest_airport_code");
			while(rs.next()) {
				int flightNo = rs.getInt("flightNo");
				String airline = rs.getString("airline");
				String weekdays = rs.getString("weekdays");
				String src_airport_code = rs.getString("src_airport_code");
				String dest_airport_code = rs.getString("dest_airport_code");
				System.out.println(flightNo+ "\t\t" +airline + "\t" + weekdays + "\t" + src_airport_code + "\t\t" + dest_airport_code);
			}
			
			rs.close();
			stmt.close();
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}

} 
