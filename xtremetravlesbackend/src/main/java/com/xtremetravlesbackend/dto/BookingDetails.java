package com.xtremetravlesbackend.dto;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.engine.internal.Cascade;

@Entity
public class BookingDetails {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id; 
	
	private long pnr;
	private String transactionId;
	
	@ManyToOne(cascade={CascadeType.ALL})
	private User user;
	
	private String passengerName;
	private String passengerPhone;
	
	@ManyToOne(cascade={CascadeType.ALL})
	private Bus bus;
	
	@ManyToOne(cascade={CascadeType.ALL})
	private Flight flight;
	@ManyToOne(cascade={CascadeType.ALL})
	private Cab cab;
	@Column(name="seat_nos")
	private String seatNos;
	private double fare;
	@Column(name="booking_date")
	private String date;
	private boolean status;
	private boolean paymentStatus;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getPnr() {
		return pnr;
	}
	public void setPnr(long pnr) {
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
	
	
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public boolean isPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(boolean paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
	public String getPassengerName() {
		return passengerName;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public String getPassengerPhone() {
		return passengerPhone;
	}
	public void setPassengerPhone(String passengerPhone) {
		this.passengerPhone = passengerPhone;
	}
	@Override
	public String toString() {
		return "BookingDetails [id=" + id + ", pnr=" + pnr + ", transactionId=" + transactionId + ", user=" + user
				+ ", bus=" + bus + ", flight=" + flight + ", cab=" + cab + ", seatNos=" + seatNos + ", fare=" + fare
				+ ", date=" + date + ", status=" + status + ", paymentStatus=" + paymentStatus + "]";
	}
	
	
	

}
