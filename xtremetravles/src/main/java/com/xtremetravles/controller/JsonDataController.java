package com.xtremetravles.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Cab;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private BusDao busDao;
	
	@Autowired
	private  FlightDao flightDao;
	
	@Autowired
	private  UserDao userDao;
	
	@Autowired
	private CabDao cabDao;
	
	
	
	@RequestMapping("/all/bus")
	@ResponseBody
	public List<Bus> getAllBus(){
		
		return busDao.listActiveBuses();
	}
	
	
	@RequestMapping("/{boardPoint}/{dropPoint}/{date}/bus")
	@ResponseBody
	public List<Bus> getBusByPlace(@PathVariable String boardPoint,@PathVariable String dropPoint,@PathVariable String date){
		
		return busDao.listBusByPlace(boardPoint,dropPoint,date);
	}
	
	
	@RequestMapping("/agent/{id}/all/bus")
	@ResponseBody
	public List<Bus> getAllBusAgent(@PathVariable int id){
		
		User user=userDao.getUserById(id);
		return busDao.listBusByAgentId(user);
	}
	
	
	
	@RequestMapping("/all/flight")
	@ResponseBody
	public List<Flight> getAllFlight(){
		
		return flightDao.listActiveFlights();
	}
	
	@RequestMapping("/{boardPoint}/{dropPoint}/{date}/flight")
	@ResponseBody
	public List<Flight> getFlightByPlace(@PathVariable String boardPoint,@PathVariable String dropPoint,@PathVariable String date){
		
		return flightDao.listFlightsByPlace(boardPoint,dropPoint,date);
	}
	
	
	@RequestMapping("/agent/{id}/all/flight")
	@ResponseBody
	public List<Flight> getAllFlightAgent(@PathVariable int id){
		
		User user=userDao.getUserById(id);
		return flightDao.listFlightByAgentId(user);
	}
	
	
	@RequestMapping("/all/cabs")
	@ResponseBody
	public List<Cab> getAllCabs(){
		
		return cabDao.listActiveCabs();
	}
	
	
	@RequestMapping("/{boardPoint}/{dropPoint}/{date}/cabs")
	@ResponseBody
	public List<Cab> getCabByPlace(@PathVariable String boardPoint,@PathVariable String dropPoint,@PathVariable String date){
		List<Cab> cc= cabDao.listCabByPlace(boardPoint,dropPoint,date);
		for (Cab cab : cc) {
			System.out.println(cab);
		}
		return cabDao.listCabByPlace(boardPoint,dropPoint,date);
	}
	
	
	@RequestMapping("/agent/{id}/all/cab")
	@ResponseBody
	public List<Cab> getAllCabAgent(@PathVariable int id){
		
		User user=userDao.getUserById(id);
		return cabDao.listCabsByAgentId(user);
	}
	
	
}
