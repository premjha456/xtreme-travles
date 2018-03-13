package com.xtremetravles.controller;

import javax.servlet.http.HttpSession;
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

import com.xtremetravles.model.UserModel;
import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Cab;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private  HttpSession session;

	@Autowired
	private BusDao busDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private FlightDao flightDao;
	
	
	@Autowired
	private CabDao cabDao;
	
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
		UserModel userModel=(UserModel)session.getAttribute("userModel");
		User user =userDao.getUserById(userModel.getId());
		bus1.setUser(user);
		
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
	
	
	
	
	
	//flight management first time after load and show  code
		@RequestMapping(value="/flight",method=RequestMethod.GET)
		public ModelAndView manageFlights(@RequestParam(name="case", required=false) String case1){
			
			ModelAndView mv = new ModelAndView("index");
			mv.addObject("clickedManageFlight", true);

			Flight flight = new Flight();
		
			mv.addObject("flight", flight);
			
			if (case1!=null) {
				
				if (case1.equals("flight")) {
					
					mv.addObject("message", "Flight Added Successfully");
				}
			}
			return mv;
		}
		
		
		//flight management submit button code
		@RequestMapping(value="/flight",method=RequestMethod.POST)
		public String handelAddFlight(@Valid @ModelAttribute("flight") Flight flight1,BindingResult result,Model model){
			
			
			if(result.hasErrors()) {
				model.addAttribute("message", "Validation fails for adding the flight!");
				model.addAttribute("clickedManageFlight",true);
			
				return "index";
	} 
			UserModel userModel=(UserModel)session.getAttribute("userModel");
			User user =userDao.getUserById(userModel.getId());
			flight1.setUser(user);
			
			if(flight1.getId()==0)
			{
		    flightDao.add(flight1);
			}
			else{
				
				flightDao.update(flight1);
			}
			return "redirect:/manage/flight?case=flight";
		}
		
		//flight management edit button code
		@RequestMapping("/{id}/flight")
		public ModelAndView manageFlightEdit(@PathVariable int id) {		

			ModelAndView mv = new ModelAndView("index");	
			mv.addObject("title","Flight Management");		
			mv.addObject("clickedManageFlight",true);
			
			// Product nProduct = new Product();		
			mv.addObject("flight", flightDao.get(id));

				
			return mv;
			
		}

		//flight management checkbox code
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
		
		
		
		//cab management first time after load and show  code
				@RequestMapping(value="/cab",method=RequestMethod.GET)
				public ModelAndView manageCabs(@RequestParam(name="case", required=false) String case1){
					
					ModelAndView mv = new ModelAndView("index");
					mv.addObject("clickedManageCab", true);

					Cab cab = new Cab();
				
					mv.addObject("cab", cab);
					
					if (case1!=null) {
						
						if (case1.equals("cab")) {
							
							mv.addObject("message", "Cab Added Successfully");
						}
					}
					return mv;
				}
				
				
				//cab management submit button code
				@RequestMapping(value="/cab",method=RequestMethod.POST)
				public String handelAddCab(@Valid @ModelAttribute("cab") Cab cab1,BindingResult result,Model model){
					
					
					if(result.hasErrors()) {
						model.addAttribute("message", "Validation fails for adding the cab!");
						model.addAttribute("clickedManageCab",true);
					
						return "index";
			} 
					UserModel userModel=(UserModel)session.getAttribute("userModel");
					User user =userDao.getUserById(userModel.getId());
					cab1.setUser(user);
					
					if(cab1.getId()==0)
					{
				    cabDao.add(cab1);
					}
					else{
						
						cabDao.update(cab1);
					}
					return "redirect:/manage/cab?case=cab";
				}
				
				//cab management edit button code
				@RequestMapping("/{id}/cab")
				public ModelAndView manageCabEdit(@PathVariable int id) {		

					ModelAndView mv = new ModelAndView("index");	
					mv.addObject("title","Cab Management");		
					mv.addObject("clickedManageCab",true);
					
					// Product nProduct = new Product();		
					mv.addObject("cab", cabDao.get(id));

						
					return mv;
					
				}

				//cab management checkbox code
				@RequestMapping(value="/cab/{id}/activation", method=RequestMethod.POST)
				@ResponseBody
				public String handelCabActivation(@PathVariable int id){
					
					Cab cab = cabDao.get(id);
					 
					boolean state =cab.isActive();
					cab.setActive(!cab.isActive());
					
					cabDao.update(cab);
					
					return (state)?"You have Successfully Deactivated the Flight"
							:"You have Successfully Activated the Flight";
				}

}
