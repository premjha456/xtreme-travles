package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;


@Entity
public class Bus {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="bus_name")
	@NotBlank(message="Plese Enter Bus Name")
	private String busName; 
	@Column(name="bus_type")
	@NotBlank(message="Plese Enter Bus Type")
	private String busType; 
	@NotBlank(message="Plese Enter Aminites")
	private String aminities;
	@Column(name="bus_reg_no")
	@NotBlank(message="Plese Enter Bus Reg No")
	private String busRegNo;
	@Column(name="board_point")
	@NotBlank(message="Plese Enter BoardPoint")
	private String boardPoint;
	@Column(name="board_time")
	@NotBlank(message="Plese Enter BoardTime")
	private String boardTime; 
	@Column(name="drop_point")
	@NotBlank(message="Plese Enter DropPoint")
	private String dropPoint; 
	@Column(name="drop_time")
	@NotBlank(message="Plese Enter DropTime")
	private String dropTime;
	@Column(name="date")
	@NotBlank(message="Plese Enter Date")
	private String date;
	@ManyToOne
	private User user;	
	@Column(name="max_seats")
	@Min(value=1)
	private int maxSeats;
	@Column(name="seats_available")
	private int seatsAvailable;
	@Min(value=1)
	private double price;
	@Column(name="active")
	private boolean active;
	
	
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
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "Bus [id=" + id + ", busName=" + busName + ", busType=" + busType + ", aminities=" + aminities
				+ ", busRegNo=" + busRegNo + ", boardPoint=" + boardPoint + ", boardTime=" + boardTime + ", dropPoint="
				+ dropPoint + ", dropTime=" + dropTime + ", date=" + date + ", user=" + user + ", maxSeats=" + maxSeats
				+ ", seatsAvailable=" + seatsAvailable + ", price=" + price + ", active=" + active + "]";
	}
	
	
	
	

}
