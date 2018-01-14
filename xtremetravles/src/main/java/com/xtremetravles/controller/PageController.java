package com.xtremetravles.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xtremetravles.util.FileUploadUtility;
import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

@Controller
public class PageController {

	@Autowired
	private BusDao busDao;
	
	@Autowired
	private FlightDao flightDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = {"/", "/home", "/index","/flight"})
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
	
	//add agent registration page
	@RequestMapping(value ="/register/user/agent",method=RequestMethod.GET)
	public ModelAndView reg(@RequestParam(name="case", required=false)String case1) {		
		ModelAndView mv = new ModelAndView("index");		
			
		User user = new User();
		mv.addObject("clickedRegister", true);
		mv.addObject("user", user);
		return mv;				
}

	
	//bus management submit button code
		@RequestMapping(value="/register/user/agent",method=RequestMethod.POST)
		public String handelAddBus(@Valid @ModelAttribute("user") User user1,BindingResult result,Model model,HttpServletRequest request){
						
			if(result.hasErrors()) {
				model.addAttribute("message", "Validation fails for registering the user!");
				model.addAttribute("clickedRegister",true);
			
				return "index";
	} 
			if(user1.getId()==0)
			{
		    userDao.add(user1);
			}
			else{
				
				userDao.update(user1);
			}
			
			if(!user1.getAddressProof().getOriginalFilename().equals("") ){
				FileUploadUtility.uploadAddressProof(request, user1.getAddressProof(), user1.getAddCode()); 
			 }
			
			if(!user1.getPanCardProof().getOriginalFilename().equals("") ){
				FileUploadUtility.uploadPanCardProof(request, user1.getPanCardProof(), user1.getPanCode()); 
			 }
			
			return "redirect:/login";
		}
		
	
	
	
	//add user registration page  
		@RequestMapping(value ="/registerUser",method=RequestMethod.GET)
		public ModelAndView regUserPage() {		
			ModelAndView mv = new ModelAndView("index");		
				
			User user = new User();
			mv.addObject("clickedRegisterUser", true);
			mv.addObject("user", user);
			return mv;				
	}
		
		
		
		//add normal user to the database   
				@RequestMapping(value ="/register/user/normal")
				public String regUser(@RequestParam("firstName") String fname,@RequestParam("lastName") String lname,@RequestParam("email") String email,@RequestParam("contactNumber") String contact,@RequestParam("password") String password,@RequestParam("role") String role,@RequestParam("active") boolean active) {		
					User user = new User();
					user.setFirstName(fname);
					user.setLastName(lname);
					user.setEmail(email);
					user.setContactNumber(contact);
					user.setPassword(password);
					user.setRole(role);
					user.setActive(active);
					
					userDao.add(user);
					
					return "redirect:/login";				
			}
		
				
				//provide login page to admin,user,agent  
				@RequestMapping(value ="/login")
				public ModelAndView feedLoginPage(@RequestParam(name="error", required = false) String error,@RequestParam(name="logout", required = false) String logout) {		
					ModelAndView mv = new ModelAndView("index");		
						
					mv.addObject("clickFeedLogin", true);
					if(error!=null) {
						mv.addObject("message", "Username and Password is invalid!");
					}
					
					if(logout!=null) {
						mv.addObject("logout", "You have logged out successfully!");
					}
					
					return mv;				
			}
					
					
				@RequestMapping(value="/logout")
				public String logout(HttpServletRequest request, HttpServletResponse response) {
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				    if (auth != null){    
				        new SecurityContextLogoutHandler().logout(request, response, auth);
				    }
					
					return "redirect:/login?logout='logout'";
				}	
				
				
}
