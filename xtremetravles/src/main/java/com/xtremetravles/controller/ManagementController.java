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
import com.xtremetravlesbackend.dto.Bus;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	
	@Autowired
	private BusDao busDao;
	
	@RequestMapping(value="/bus",method=RequestMethod.GET)
	public ModelAndView manageProducts(@RequestParam(name="case", required=false) String case1){
		
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("clickedManageBus", true);

		Bus bus = new Bus();
	
		bus.setActive(true);
		mv.addObject("bus", bus);
		
		if (case1!=null) {
			
			if (case1.equals("bus")) {
				
				mv.addObject("message", "Bus Added Successfully");
			}
		}
		return mv;
	}
	
	

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
	
	
	@RequestMapping("/{id}/bus")
	public ModelAndView manageBusEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("index");	
		mv.addObject("title","Bus Management");		
		mv.addObject("clickedManageBus",true);
		
		// Product nProduct = new Product();		
		mv.addObject("bus", busDao.get(id));

			
		return mv;
		
	}

	
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

}
