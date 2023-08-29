package com.flyaway.entities;

public class BookFlight {
	private int flightNo;
	private String from;
	private String to;
	private String travelDate;
	private int travellers;
	private String airline;
	private float economy_fare;
	private float premium_fare;
	private float business_fare;
	public BookFlight() {}

	public BookFlight(String from, String to, String travelDate, int travellers) {
		super();
		this.from = from;
		this.to = to;
		this.travelDate = travelDate;
		this.travellers = travellers;
	}
	
	
	public BookFlight(int flightNo, String airline, String from, String to, String travelDate) {
		super();
		this.flightNo = flightNo;
		this.airline = airline;
		this.from = from;
		this.to = to;
		this.travelDate = travelDate;
	}

	
	

	public float getEconomy_fare() {
		return economy_fare;
	}

	public void setEconomy_fare(float economy_fare) {
		this.economy_fare = economy_fare;
	}

	public float getPremium_fare() {
		return premium_fare;
	}

	public void setPremium_fare(float premium_fare) {
		this.premium_fare = premium_fare;
	}

	public float getBusiness_fare() {
		return business_fare;
	}

	public void setBusiness_fare(float business_fare) {
		this.business_fare = business_fare;
	}

	public int getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTraveldate() {
		return travelDate;
	}

	public void setTraveldate(String travelDate) {
		this.travelDate = travelDate;
	}

	public int getTravellers() {
		return travellers;
	}

	public void setTravellers(int travellers) {
		this.travellers = travellers;
	}

	
	
	
}
