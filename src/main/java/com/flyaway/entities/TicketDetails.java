package com.flyaway.entities;

import java.io.Serializable;

public class TicketDetails implements Serializable {
	private int booking_id;
	private int flight_Number;
	private String airline;
	private String flight_class;
	private String src;
	private String dest;
	private String date;
	private int No_of_passengers;
	private float amount;
	private float fare;
	private String status;
	private int customer_id;
	
	public TicketDetails() {

	}

	public TicketDetails(int booking_id, int flight_Number, String airline, String flight_class, String src,
			String dest, String date, int no_of_passengers, float amount) {
		
		this.booking_id = booking_id;
		this.flight_Number = flight_Number;
		this.airline = airline;
		this.flight_class = flight_class;
		this.src = src;
		this.dest = dest;
		this.date = date;
		No_of_passengers = no_of_passengers;
		this.amount = amount;
	}
		

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getFlight_Number() {
		return flight_Number;
	}

	public void setFlight_Number(int flight_Number) {
		this.flight_Number = flight_Number;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFlight_class() {
		return flight_class;
	}

	public void setFlight_class(String flight_class) {
		this.flight_class = flight_class;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getDest() {
		return dest;
	}

	public void setDest(String dest) {
		this.dest = dest;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getNo_of_passengers() {
		return No_of_passengers;
	}

	public void setNo_of_passengers(int no_of_passengers) {
		No_of_passengers = no_of_passengers;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public float getFare() {
		return fare;
	}

	public void setFare(float fare) {
		this.fare = fare;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	
	
}
