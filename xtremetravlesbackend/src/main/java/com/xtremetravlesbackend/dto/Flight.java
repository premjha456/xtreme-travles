package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Flight {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="flight_name")
	private String flightName; 
	@Column(name="flight_type")
	private String flightType; 
	@Column(name="flight_no")
	private String flightNo;
	@Column(name="board_point")
	private String boardPoint;
	@Column(name="board_time")
	private String boardTime; 
	@Column(name="drop_point")
	private String dropPoint; 
	@Column(name="drop_time")
	private String dropTime; 
	@Column(name="max_seats")
	private int maxSeats;
	@Column(name="seats_available")
	private int seatsAvailable;
	private double fare;
	@Column(name="is_enabled")
	private boolean isEnabled;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public String getFlightType() {
		return flightType;
	}
	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public String getBoardPoint() {
		return boardPoint;
	}
	public void setBoardPoint(String boardPoint) {
		this.boardPoint = boardPoint;
	}
	public String getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(String boardTime) {
		this.boardTime = boardTime;
	}
	public String getDropPoint() {
		return dropPoint;
	}
	public void setDropPoint(String dropPoint) {
		this.dropPoint = dropPoint;
	}
	public String getDropTime() {
		return dropTime;
	}
	public void setDropTime(String dropTime) {
		this.dropTime = dropTime;
	}
	public int getMaxSeats() {
		return maxSeats;
	}
	public void setMaxSeats(int maxSeats) {
		this.maxSeats = maxSeats;
	}
	public int getSeatsAvailable() {
		return seatsAvailable;
	}
	public void setSeatsAvailable(int seatsAvailable) {
		this.seatsAvailable = seatsAvailable;
	}
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
	public boolean isEnabled() {
		return isEnabled;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	@Override
	public String toString() {
		return "Flight [id=" + id + ", flightName=" + flightName + ", flightType=" + flightType + ", flightNo="
				+ flightNo + ", boardPoint=" + boardPoint + ", boardTime=" + boardTime + ", dropPoint=" + dropPoint
				+ ", dropTime=" + dropTime + ", maxSeats=" + maxSeats + ", seatsAvailable=" + seatsAvailable + ", fare="
				+ fare + ", isEnabled=" + isEnabled + "]";
	}
	
}
