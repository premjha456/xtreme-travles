package com.xtremetravles.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.omg.PortableServer.POAPackage.ServantNotActive;
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
import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Cab;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

@Controller
public class PageController {

	@Autowired
	private  HttpSession session;
	
	@Autowired
	private BusDao busDao;
	
	@Autowired
	private FlightDao flightDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CabDao cabDao;
	@RequestMapping(value = {"/", "/home", "/index","/flight"})
	public ModelAndView index() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedFlight", true);
		mv.addObject("title", "Book Domestic Flight Tickets");

		return mv;				
}

	
	@RequestMapping(value ="/flight/listFlight")
	public ModelAndView viewFlight(@RequestParam("boardPoint") String boardPoint,@RequestParam("dropPoint") String dropPoint,@RequestParam("date") String date,@RequestParam("adults") String adult,@RequestParam("childs") String child,@RequestParam("class") String travelClass) {		
		ModelAndView mv = new ModelAndView("index");		
		mv.addObject("title", "Flight Search");
		mv.addObject("boardPoint", boardPoint);
		mv.addObject("dropPoint", dropPoint);
		mv.addObject("date", date);
	    int requiredSeats=Integer.valueOf(adult)+Integer.valueOf(child);
		mv.addObject("requiredSeats", requiredSeats);
	    mv.addObject("travelClass", travelClass);
		mv.addObject("clickedViewFlight", true);
		return mv;				
}

	
	@RequestMapping("/book/flight/{id}/{travelClass}/{requiredSeats}/flightReview")
	public ModelAndView reviewFlight(@PathVariable int id,@PathVariable String travelClass,@PathVariable int requiredSeats){
		ModelAndView mv = new ModelAndView("index");
		
		Flight flight= flightDao.get(id);
		mv.addObject("flight", flight);		
		mv.addObject("travelClass", travelClass);
		mv.addObject("requiredSeats", requiredSeats);
		int tClass=0;
		if(travelClass.equals("Economy")){
			tClass=1;
		}
		else if (travelClass.equals("Business")) {
			tClass=5;
		}
		double f=tClass*requiredSeats*flight.getFare();
		
		session.setAttribute("flightFare", f);
		session.setAttribute("flight", flight);
		List<Integer> flightSeatList=new ArrayList<Integer>();
		for (int i = 1; i <=requiredSeats; i++) {
			int a=(flight.getMaxSeats()-flight.getSeatsAvailable())+i;	
			System.out.println(a);
			flightSeatList.add(new Integer(a));
		}
		session.setAttribute("flightSeatList", flightSeatList);
		System.out.println(flightSeatList);	
		if(flight.getSeatsAvailable()>0){
			
			flight.setSeatsAvailable(flight.getSeatsAvailable()-requiredSeats);
			flightDao.update(flight); 
            
		}
		
		mv.addObject("clickedReviewFlight", true);
		mv.addObject("title", "Flight Review");
		return mv;
		
	}
	
	@RequestMapping("/book/flight/confirmBooking")
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
		mv.addObject("surl", "http://localhost:8080/xtremetravles/payu/booking/payment/success");
		mv.addObject("furl", "http://localhost:8080/xtremetravles/payu/booking/payment/fail");
		mv.addObject("curl", "http://localhost:8080/xtremetravles/payu/booking/payment/cancel");
        
		mv.addObject("clickedConfirmFlightBooking", true);
		mv.addObject("title", "Confirm Booking");
		return mv;
		
	}

	
	@RequestMapping(value ="/bus")
	public ModelAndView bus() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedBus", true);

		return mv;				
}
	
	@RequestMapping("/bus/listBus")
	public ModelAndView viewBus(@RequestParam("boardPoint") String boardPoint,@RequestParam("dropPoint") String dropPoint,@RequestParam("date") String date,@RequestParam("seat") int seat){
		ModelAndView mv = new ModelAndView("index");		

		mv.addObject("boardPoint", boardPoint);
		mv.addObject("dropPoint", dropPoint);
		mv.addObject("date", date);
		mv.addObject("seat", seat);
		mv.addObject("clickedListBus", true);

		return mv;
	}
	
	
	@RequestMapping("/book/bus/{id}/{requiredSeats}/busReview")
	public ModelAndView reviewBus(@PathVariable int id,@PathVariable int requiredSeats){
		ModelAndView mv = new ModelAndView("index");
				Bus bus= busDao.get(id);
				
				mv.addObject("bus", bus);
				mv.addObject("clickedReviewBus", true);
		  
//				Connection con=null;  
//			    StringBuffer seatNo=new StringBuffer();
//
//				try{  
//				    Class.forName("org.h2.Driver");  
//				    con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/xtremetravels","prem","prem");  
//				    PreparedStatement ps=con.prepareStatement("select * from seatlayout where busId=?"); 
//				    ps.setInt(1,id );
//				    ResultSet rs=ps.executeQuery(); 
//				    System.out.println("Inside Query");
//				    String s="";
//				    String set="";
//				    while(rs.next()){  
//				    	System.out.println(s);
//				    	seatNo.append("[");
//				    	for (int i = 1; i <= 5; i++) {
//					    	s= "s"+i;
//						   set  = rs.getString(s);
//						   System.out.println(s+"-"+set);
//					    	if(set.equals("b")){
//					    		seatNo.append(i);
//					    		if (i<5) {
//					    			seatNo.append(",");
//								}
//						       }
//						}
//				    	seatNo.append("]");
//				    	}  
//				    System.out.println(seatNo);
//				}catch(Exception e){System.out.println(e);} 
//
//				mv.addObject("seatNo", seatNo.toString());

				
				double f=requiredSeats*bus.getPrice();
				
				session.setAttribute("busFare", f);
				session.setAttribute("bus", bus);
				List<Integer> busSeatList=new ArrayList<Integer>();
				for (int i = 1; i <=requiredSeats; i++) {
					int a=(bus.getMaxSeats()-bus.getSeatsAvailable())+i;	
					System.out.println(a);
					busSeatList.add(new Integer(a));
				}
				session.setAttribute("busSeatList", busSeatList);
				System.out.println(busSeatList);	
				if(bus.getSeatsAvailable()>0){
					
					bus.setSeatsAvailable(bus.getSeatsAvailable()-requiredSeats);
					busDao.update(bus); 
		            
				}
				
		
		return mv;
		
	}
	

	@RequestMapping("/book/bus/confirmBooking")
	public ModelAndView confirmBusBook(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,@RequestParam("gender") String gender,@RequestParam("email") String email,@RequestParam("phone") String phone){
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
		mv.addObject("surl", "http://localhost:8080/xtremetravles/payu/booking/payment/success");
		mv.addObject("furl", "http://localhost:8080/xtremetravles/payu/booking/payment/fail");
		mv.addObject("curl", "http://localhost:8080/xtremetravles/payu/booking/payment/cancel");
        
		mv.addObject("clickedConfirmBusBooking", true);
		mv.addObject("title", "Confirm Booking");

		return mv;
		
	}

	@RequestMapping(value ="/cabs")
	public ModelAndView cabs() {		
		ModelAndView mv = new ModelAndView("index");		
			
		mv.addObject("clickedCab", true);

		return mv;				
}
	
	
	@RequestMapping(value ="/cab/listCab")
	public ModelAndView listCabs(@RequestParam("boardPoint") String boardPoint,@RequestParam("dropPoint") String dropPoint,@RequestParam("date") String date,@RequestParam("putime") String putime) {		
		ModelAndView mv = new ModelAndView("index");		
		
		mv.addObject("boardPoint", boardPoint);
		mv.addObject("dropPoint", dropPoint);
		mv.addObject("date", date);
		session.setAttribute("cabPickup", putime);
		mv.addObject("clickedListCab", true);

		return mv;				
}

	@RequestMapping("/book/cab/{id}/cabReview")
	public ModelAndView reviewCab(@PathVariable int id){
		ModelAndView mv = new ModelAndView("index");
		
		Cab cab = cabDao.get(id);
		mv.addObject("cab", cab);
		mv.addObject("clickedReviewCab", true);
		mv.addObject("title", "Cab Review");
		
		double f=cab.getFare();
		
		session.setAttribute("cabFare", f);
		session.setAttribute("cab", cab);
		
		return mv;
		
	}
	
	@RequestMapping("/book/cab/confirmBooking")
	public ModelAndView confirmCabBook(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,@RequestParam("gender") String gender,@RequestParam("email") String email,@RequestParam("phone") String phone){
		ModelAndView mv = new ModelAndView("index");
		Cab cab =cabDao.get(id);
		String product =cab.getCabName()+"("+cab.getCabType()+")"+"--"+cab.getAminities()+"--"+"----"+cab.getBoardPoint()+" TO "+cab.getDropPoint();
		System.out.println(email);
		mv.addObject("cab", cab);
		mv.addObject("name", name);
		mv.addObject("age", age);
		mv.addObject("gender", gender);
		mv.addObject("email", email);
		mv.addObject("phone", phone);
		mv.addObject("productInfo", product);
		mv.addObject("surl", "http://localhost:8080/xtremetravles/payu/booking/payment/success");
		mv.addObject("furl", "http://localhost:8080/xtremetravles/payu/booking/payment/fail");
		mv.addObject("curl", "http://localhost:8080/xtremetravles/payu/booking/payment/cancel");
        
		mv.addObject("clickedConfirmCabBooking", true);
		mv.addObject("title", "Confirm Booking");

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
				@RequestMapping(value="/login")
				public ModelAndView feedLoginPage(@RequestParam(name="error", required = false) String error,@RequestParam(name="logout", required = false) String logout) {		
					ModelAndView mv = new ModelAndView("index");	
					
					if(error!=null) {
						mv.addObject("message", "Username and Password is invalid!");
					}
					
					if(logout!=null) {
						mv.addObject("logout", "You have logged out successfully!");
					}
					
					mv.addObject("clickFeedLogin", true);
					return mv;				
			}
					
			
				
			
				@RequestMapping(value="/logout")
				public String logout(HttpServletRequest request, HttpServletResponse response) {
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				    if (auth != null){    
				        new SecurityContextLogoutHandler().logout(request, response, auth);
				    }
					
					return "redirect:/login?logout=logout";
				}	
				
				@RequestMapping(value="/access-denied")
				public ModelAndView accessDenied() {
					ModelAndView mv = new ModelAndView("error");		
					mv.addObject("errorTitle", "Aha! Caught You.");		
					mv.addObject("errorDescription", "You are not authorized to view this page!");		
					mv.addObject("title", "403 Access Denied");		
					return mv;
				}
				
}
