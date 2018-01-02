package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Bus {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="bus_name")
	private String busName; 
	@Column(name="bus_type")
	private String busType; 
	private String aminities;
	@Column(name="bus_reg_no")
	private String busRegNo;
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
	private double price;
	@Column(name="is_enabled")
	private boolean isEnabled;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getAminities() {
		return aminities;
	}
	public void setAminities(String aminities) {
		this.aminities = aminities;
	}
	public String getBusRegNo() {
		return busRegNo;
	}
	public void setBusRegNo(String busRegNo) {
		this.busRegNo = busRegNo;
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
	public boolean isEnabled() {
		return isEnabled;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Bus [id=" + id + ", busName=" + busName + ", busType=" + busType + ", aminities=" + aminities
				+ ", busRegNo=" + busRegNo + ", boardPoint=" + boardPoint + ", boardTime=" + boardTime + ", dropPoint="
				+ dropPoint + ", dropTime=" + dropTime + ", maxSeats=" + maxSeats + ", seatsAvailable=" + seatsAvailable
				+ ", price=" + price + ", isEnabled=" + isEnabled + "]";
	}
	
	

}
