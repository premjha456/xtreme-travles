package com.xtremetravles.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Flight;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private BusDao busDao;
	
	@Autowired
	private  FlightDao flightDao;
	
	@RequestMapping("/all/bus")
	@ResponseBody
	public List<Bus> getAllBus(){
		
		return busDao.listActiveBuses();
	}
	
	
	@RequestMapping("/{boardPoint}/{dropPoint}/bus")
	@ResponseBody
	public List<Bus> getBusByPlace(@PathVariable String boardPoint,@PathVariable String dropPoint){
		
		return busDao.listBusByPlace(boardPoint,dropPoint);
	}
	
	
	@RequestMapping("/admin/all/bus")
	@ResponseBody
	public List<Bus> getAllBusAdmin(){
		
		return busDao.list();
	}
	
	
	
	@RequestMapping("/all/flight")
	@ResponseBody
	public List<Flight> getAllFlight(){
		
		return flightDao.listActiveFlights();
	}
	
	@RequestMapping("/{boardPoint}/{dropPoint}/flight")
	@ResponseBody
	public List<Flight> getFlightByPlace(@PathVariable String boardPoint,@PathVariable String dropPoint){
		
		return flightDao.listFlightsByPlace  (boardPoint,dropPoint);
	}
	
}
