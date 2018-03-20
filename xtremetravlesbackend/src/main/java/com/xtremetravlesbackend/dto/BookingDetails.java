package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

public class BookingDetails {

	
	@Id
	private int id; 
	
	private String pnr;
	@ManyToOne
	private User user;
	@ManyToOne
	private Bus bus;
	@ManyToOne
	private Flight flight;
	@ManyToOne
	private Cab cab;
	@Column(name="seat_nos")
	private String seatNos;
	private double fare;
	private boolean status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPnr() {
		return pnr;
	}
	public void setPnr(String pnr) {
		this.pnr = pnr;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Bus getBus() {
		return bus;
	}
	public void setBus(Bus bus) {
		this.bus = bus;
	}
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	public Cab getCab() {
		return cab;
	}
	public void setCab(Cab cab) {
		this.cab = cab;
	}
	public String getSeatNos() {
		return seatNos;
	}
	public void setSeatNos(String seatNos) {
		this.seatNos = seatNos;
	}
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "BookingDetails [id=" + id + ", pnr=" + pnr + ", user=" + user + ", bus=" + bus + ", flight=" + flight
				+ ", cab=" + cab + ", seatNos=" + seatNos + ", fare=" + fare + ", status=" + status + "]";
	}


}
