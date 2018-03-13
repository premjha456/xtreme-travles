package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

public interface FlightDao {

	public Flight get(int id);
	public List<Flight> list();
	public boolean add(Flight flight);
	public boolean update(Flight flight);
	public boolean delete(Flight flight);
	public List<Flight> listActiveFlights();
	public List<Flight> listFlightsByPlace(String bp, String dp,String date);
	public List<Flight> listFlightByAgentId(User user);
	
}
