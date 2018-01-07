package com.xtremetravles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Flight;

@Controller
public class PageController {

	@Autowired
	private BusDao busDao;
	
	@Autowired
	private FlightDao flightDao;
		
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedFlight", true);

		return mv;				
}

	
	@RequestMapping(value ="/flight/listFlight")
	public ModelAndView viewFlight(@RequestParam("boardPoint") String boardPoint,@RequestParam("dropPoint") String dropPoint) {		
		ModelAndView mv = new ModelAndView("index");		
		
		mv.addObject("boardPoint", boardPoint);
		mv.addObject("dropPoint", dropPoint);
		mv.addObject("clickedViewFlight", true);

		return mv;				
}

	
	@RequestMapping("/flight/{id}/flightReview")
	public ModelAndView reviewFlight(@PathVariable int id){
		ModelAndView mv = new ModelAndView("index");
		
		Flight flight= flightDao.get(id);
		mv.addObject("flight", flight);
		mv.addObject("clickedReviewFlight", true);

		return mv;
		
	}
	
	@RequestMapping("/flight/confirmBooking")
	public ModelAndView confirmFlightBook(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,@RequestParam("gender") String gender,@RequestParam("email") String email,@RequestParam("phone") String phone){
		ModelAndView mv = new ModelAndView("index");
		Flight flight =flightDao.get(id);
		String product =flight.getFlightName()+"("+flight.getFlightType()+")"+"----"+flight.getBoardPoint()+"("+flight.getBoardTime()+")"+" TO "+flight.getDropPoint()+"("+flight.getDropTime()+")";
		System.out.println(email);
		mv.addObject("flight", flight);
		mv.addObject("name", name);
		mv.addObject("age", age);
		mv.addObject("gender", gender);
		mv.addObject("email", email);
		mv.addObject("phone", phone);
		mv.addObject("productInfo", product);
		mv.addObject("surl", "http://localhost:8080/xtremetravles/bus/booking/payment/success");
		mv.addObject("furl", "http://localhost:8080/xtremetravles/bus/booking/payment/fail");
		mv.addObject("curl", "http://localhost:8080/xtremetravles/bus/booking/payment/cancel");
        
		mv.addObject("clickedConfirmBooking", true);

		return mv;
		
	}

	
	@RequestMapping(value ="/bus")
	public ModelAndView bus() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedBus", true);

		return mv;				
}
	
	@RequestMapping("/bus/listBus")
	public ModelAndView viewBus(@RequestParam("boardPoint") String boardPoint,@RequestParam("dropPoint") String dropPoint){
		ModelAndView mv = new ModelAndView("index");		

		mv.addObject("boardPoint", boardPoint);
		mv.addObject("dropPoint", dropPoint);
		mv.addObject("clickedListBus", true);

		return mv;
	}
	
	
	@RequestMapping("/bus/{id}/busReview")
	public ModelAndView reviewBus(@PathVariable int id){
		ModelAndView mv = new ModelAndView("index");
		
		Bus bus= busDao.get(id);
		mv.addObject("bus", bus);
		mv.addObject("clickedReviewBus", true);

		return mv;
		
	}
	

	@RequestMapping("/bus/confirmBooking")
	public ModelAndView confirmBook(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,@RequestParam("gender") String gender,@RequestParam("email") String email,@RequestParam("phone") String phone,@RequestParam("seatNo") String seatNo){
		ModelAndView mv = new ModelAndView("index");
		Bus bus =busDao.get(id);
		String product =bus.getBusName()+"("+bus.getBusType()+")"+"----"+bus.getBoardPoint()+"("+bus.getBoardTime()+")"+" TO "+bus.getDropPoint()+"("+bus.getDropTime()+")";
		System.out.println(email);
		mv.addObject("bus", bus);
		mv.addObject("name", name);
		mv.addObject("age", age);
		mv.addObject("gender", gender);
		mv.addObject("email", email);
		mv.addObject("phone", phone);
		mv.addObject("productInfo", product);
		mv.addObject("surl", "http://localhost:8080/xtremetravles/bus/booking/payment/success");
		mv.addObject("furl", "http://localhost:8080/xtremetravles/bus/booking/payment/fail");
		mv.addObject("curl", "http://localhost:8080/xtremetravles/bus/booking/payment/cancel");
		mv.addObject("seatNo", seatNo);
        
		mv.addObject("clickedConfirmBooking", true);

		return mv;
		
	}

	@RequestMapping(value ="/cabs")
	public ModelAndView cabs() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedCab", true);

		return mv;				
}
	
	@RequestMapping(value ="/deals")
	public ModelAndView deals() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedDeals", true);

		return mv;				
}
	
	@RequestMapping(value ="/hotels")
	public ModelAndView hotels() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedHotels", true);

		return mv;				
}
}
