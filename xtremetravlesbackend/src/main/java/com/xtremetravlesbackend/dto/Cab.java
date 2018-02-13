package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Cab {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="cab_name")
	@NotBlank(message="Plese Enter Bus Name")
	private String cabName; 
	@Column(name="cab_type")
	@NotBlank(message="Plese Enter Bus Type")
	private String cabType; 
	@NotBlank(message="Plese Enter Aminites")
	private String aminities;
	@Column(name="cab_service_provider")
	@NotBlank(message="Plese Enter Service Provider")
	private String cabServiceProvider;
	@Column(name="board_point")
	@NotBlank(message="Plese Enter BoardPoint")
	private String boardPoint;
	@Column(name="drop_point")
	@NotBlank(message="Plese Enter DropPoint")
	private String dropPoint; 
	@Min(value=1)
	private double fare;
	@Column(name="active")
	private boolean active;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCabName() {
		return cabName;
	}
	public void setCabName(String cabName) {
		this.cabName = cabName;
	}
	public String getCabType() {
		return cabType;
	}
	public void setCabType(String cabType) {
		this.cabType = cabType;
	}
	public String getAminities() {
		return aminities;
	}
	public void setAminities(String aminities) {
		this.aminities = aminities;
	}
	public String getCabServiceProvider() {
		return cabServiceProvider;
	}
	public void setCabServiceProvider(String cabServiceProvider) {
		this.cabServiceProvider = cabServiceProvider;
	}
	
	
	public String getBoardPoint() {
		return boardPoint;
	}
	public void setBoardPoint(String boardPoint) {
		this.boardPoint = boardPoint;
	}
	public String getDropPoint() {
		return dropPoint;
	}
	public void setDropPoint(String dropPoint) {
		this.dropPoint = dropPoint;
	}
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "Cab [id=" + id + ", cabName=" + cabName + ", cabType=" + cabType + ", aminities=" + aminities
				+ ", cabServiceProvider=" + cabServiceProvider + ", boardPoint=" + boardPoint + ", dropPoint="
				+ dropPoint + ", fare=" + fare + ", active=" + active + "]";
	}
	
	
	
	
}
