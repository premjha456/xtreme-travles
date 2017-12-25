package com.xtremetravles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedFlight", true);

		return mv;				
}

	@RequestMapping(value ="/bus")
	public ModelAndView bus() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedBus", true);

		return mv;				
}
	
	@RequestMapping(value ="/cab")
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
