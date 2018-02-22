package com.xtremetravles.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Flight;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	
	@Autowired
	private BusDao busDao;
	
	@Autowired
	private FlightDao flightDao;
	
	//bus management first time after load and show  code
	@RequestMapping(value="/bus",method=RequestMethod.GET)
	public ModelAndView manageProducts(@RequestParam(name="case", required=false) String case1){
		
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("clickedManageBus", true);

		Bus bus = new Bus();
	
		mv.addObject("bus", bus);
		
		if (case1!=null) {
			
			if (case1.equals("bus")) {
				
				mv.addObject("message", "Bus Added Successfully");
			}
		}
		return mv;
	}
	
	
	//bus management submit button code
	@RequestMapping(value="/bus",method=RequestMethod.POST)
	public String handelAddBus(@Valid @ModelAttribute("bus") Bus bus1,BindingResult result,Model model){
		
		
		if(result.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the bus!");
			model.addAttribute("clickedManageBus",true);
		
			return "index";
} 
		if(bus1.getId()==0)
		{
	    busDao.add(bus1);
		}
		else{
			
			busDao.update(bus1);
		}
		return "redirect:/manage/bus?case=bus";
	}
	
	//bus management edit button code
	@RequestMapping("/{id}/bus")
	public ModelAndView manageBusEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("index");	
		mv.addObject("title","Bus Management");		
		mv.addObject("clickedManageBus",true);
		
		// Product nProduct = new Product();		
		mv.addObject("bus", busDao.get(id));

			
		return mv;
		
	}

	//bus management checkbox code
	@RequestMapping(value="/bus/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handelbusActivation(@PathVariable int id){
		
		Bus bus = busDao.get(id);
		 
		boolean state =bus.isActive();
		bus.setActive(!bus.isActive());
		
		busDao.update(bus);
		
		return (state)?"You have Successfully Deactivated the Bus"
				:"You have Successfully Activated the Bus";
	}
	
	
	
	
	
	//bus management first time after load and show  code
		@RequestMapping(value="/flight",method=RequestMethod.GET)
		public ModelAndView manageFlights(@RequestParam(name="case", required=false) String case1){
			
			ModelAndView mv = new ModelAndView("index");
			mv.addObject("clickedManageFlight", true);

			Flight flight = new Flight();
		
			mv.addObject("flight", flight);
			
			if (case1!=null) {
				
				if (case1.equals("flight")) {
					
					mv.addObject("message", "Bus Added Successfully");
				}
			}
			return mv;
		}
		
		
		//bus management submit button code
		@RequestMapping(value="/flight",method=RequestMethod.POST)
		public String handelAddFlight(@Valid @ModelAttribute("flight") Flight flight1,BindingResult result,Model model){
			
			
			if(result.hasErrors()) {
				model.addAttribute("message", "Validation fails for adding the flight!");
				model.addAttribute("clickedManageFlight",true);
			
				return "index";
	} 
			if(flight1.getId()==0)
			{
		    flightDao.add(flight1);
			}
			else{
				
				flightDao.update(flight1);
			}
			return "redirect:/manage/flight?case=flight";
		}
		
		//bus management edit button code
		@RequestMapping("/{id}/flight")
		public ModelAndView manageFlightEdit(@PathVariable int id) {		

			ModelAndView mv = new ModelAndView("index");	
			mv.addObject("title","Flight Management");		
			mv.addObject("clickedManageFlight",true);
			
			// Product nProduct = new Product();		
			mv.addObject("flight", flightDao.get(id));

				
			return mv;
			
		}

		//bus management checkbox code
		@RequestMapping(value="/flight/{id}/activation", method=RequestMethod.POST)
		@ResponseBody
		public String handelFlight1Activation(@PathVariable int id){
			
			Flight flight = flightDao.get(id);
			 
			boolean state =flight.isEnabled();
			flight.setEnabled(!flight.isEnabled());
			
			flightDao.update(flight);
			
			return (state)?"You have Successfully Deactivated the Flight"
					:"You have Successfully Activated the Flight";
		}
		

	
	
	
	
	
	
	
	
	
	
	
	
	

}
