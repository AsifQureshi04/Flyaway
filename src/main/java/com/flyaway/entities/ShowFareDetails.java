package com.flyaway.entities;

public class ShowFareDetails {
	private int flightNo;
	private String airline;
	private String flightClass;
	private double fare;
	
	

	public ShowFareDetails() {
		
	}

	public ShowFareDetails(int flightNo, String flightClass, double fare) {
		super();
		this.flightNo = flightNo;
		this.flightClass = flightClass;
		this.fare = fare;
	}

	public int getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}

	public String getFlightClass() {
		return flightClass;
	}

	public void setFlightClass(String flightClass) {
		this.flightClass = flightClass;
	}

	
	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}
	
}
