package com.xtremetravles.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.QueryParam;

import org.omg.PortableServer.POAPackage.ServantNotActive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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

import com.xtremetravles.model.UserModel;
import com.xtremetravles.util.FileUploadUtility;
import com.xtremetravlesbackend.dao.BookingDetailsDao;
import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.BookingDetails;
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
	
	@Autowired
	private BookingDetailsDao bookingDao;
	
//	@Autowired
//	MailSender mailSender;
//	
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
		session.setAttribute("flightsession", flight);
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
        System.out.println(session.getAttribute("flightsession"));
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
				session.setAttribute("bussession", bus);
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
		//to check session
        System.out.println(session.getAttribute("bussession"));
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
		System.out.println(putime);
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
		session.setAttribute("cabsession", cab);	
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
        System.out.println(session.getAttribute("cabsession"));
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
	
		
		
				
				@RequestMapping("/payu/booking/payment/success")
				public ModelAndView paymentSuccess(@RequestParam("txnid") String id,@RequestParam("status") String status,@RequestParam("firstname") String firstname,@RequestParam("phone") String phone,@RequestParam("amount") String amount,@RequestParam("productinfo") String productInfo,HttpSession session){
					 
					ModelAndView mv = new ModelAndView("index2");
					BookingDetails bookingDetails = new BookingDetails();
					
					
					Random random = new Random();
					long pnr=random.nextInt(1_000_000_000) + (random.nextInt(90) + 10) * 1_000_000_000L;
					bookingDetails.setPnr(pnr);
					mv.addObject("pnr", pnr);
					
					bookingDetails.setTransactionId(id);
					
					bookingDetails.setPassengerName(firstname);
					bookingDetails.setPassengerPhone(phone);
					UserModel u=(UserModel) session.getAttribute("userModel");
					User user = userDao.getUserById(u.getId());
					
					bookingDetails.setUser(user);
					
					if (session.getAttribute("bussession")!=null) {
						
						Bus bus=(Bus)session.getAttribute("bussession");
						mv.addObject("bus", bus);
						List ll= (List) session.getAttribute("busSeatList");
						bookingDetails.setNoOfPassenger(ll.size());
		                   mv.addObject("noOfPassenger", ll.size());
		                   System.out.println("Session:"+session.getAttribute("bussession"));
						 System.out.println(bus);
						bookingDetails.setBus(bus);
		                   bookingDetails.setSeatNos(session.getAttribute("busSeatList").toString());
		                   bookingDetails.setFare((double)session.getAttribute("busFare"));
		                   bookingDetails.setPickUp(bus.getBoardTime());

						
					}
					
                   
                   if (session.getAttribute("flightsession")!=null) {
	
	               Flight flight=(Flight)session.getAttribute("flightsession");
	
	               List ll= (List) session.getAttribute("flightSeatList");
					bookingDetails.setNoOfPassenger(ll.size());
	                   mv.addObject("noOfPassenger", ll.size());
	                   
	                   mv.addObject("flight", flight);
	                bookingDetails.setFlight(flight);
	                   bookingDetails.setSeatNos(session.getAttribute("flightSeatList").toString());
	                   bookingDetails.setFare((double)session.getAttribute("flightFare"));
	                   bookingDetails.setPickUp(flight.getBoardTime());

}
					
                   
                   if (session.getAttribute("cabsession")!=null) {
                		
    	               Cab cab=(Cab)session.getAttribute("cabsession");
    	               mv.addObject("cab", cab);
	                   bookingDetails.setSeatNos(null);
    	                bookingDetails.setCab(cab);
    	                   bookingDetails.setFare((double)session.getAttribute("cabFare"));
    	                   bookingDetails.setPickUp((String) session.getAttribute("cabPickup"));
    	
    }
                   
                   LocalDate date = LocalDate.now();
                   bookingDetails.setDate(date.toString());
                   mv.addObject("bookDate", date);
                   bookingDetails.setStatus(true);
                   bookingDetails.setPaymentStatus(true);
                   
                   bookingDao.add(bookingDetails);
                   mv.addObject("clickedPaymentSuccess", true);

					return mv;
				}


				@RequestMapping("/payu/booking/payment/fail")
				public ModelAndView paymentFail(){
					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedPaymentFail", true);

					return mv;
				}

				
				@RequestMapping("/payu/booking/payment/cancel")
				public ModelAndView paymentCancel(){
					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedPaymentCancel", true);

					return mv;
				}

				@RequestMapping("/getTicket")
				public ModelAndView getTicket(@RequestParam("to") String to){					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedGetTicket", true);
					if (to.equals("print")) {
						mv.addObject("url","/printTicket");
					}
					else if (to.equals("cancel")) {
						mv.addObject("url","/cancelTicket");
		
					}
					

					return mv;
				}
				
				@RequestMapping("/printTicket")
				public ModelAndView printETicket(@RequestParam("pnrno") long pnr){
					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedEPrintTicket", true);
					BookingDetails details=bookingDao.getBookingDetailByPnr(pnr);
					
					mv.addObject("pnr", details.getPnr());
					mv.addObject("txnid", details.getTransactionId());
					mv.addObject("fname", details.getPassengerName());
					mv.addObject("phone", details.getPassengerPhone());
					mv.addObject("bus", details.getBus());
					mv.addObject("flight", details.getFlight());
					mv.addObject("cab", details.getCab());
					mv.addObject("seatNo", details.getSeatNos());
					mv.addObject("bkdate", details.getDate());
					mv.addObject("noOfPassenger",details.getNoOfPassenger());
					mv.addObject("fare", details.getFare());
					mv.addObject("cabPickup", session.getAttribute("cabPickup"));
					System.out.println(session.getAttribute("cabPickup"));
					if (details.isStatus()==true && details.isPaymentStatus()==true ) {
						mv.addObject("status","Booked" );	
						mv.addObject("paystatus", "Payment Successful ");

					}
					else if (details.isStatus()==false || details.isPaymentStatus()==false ) {
						mv.addObject("status","Canceled" );	
						mv.addObject("paystatus", "Payment UnSuccessful ");

					}
					
					System.out.println(details);

					return mv;
				}
				

				@RequestMapping("/cancelTicket")
				public ModelAndView cancelETicket(@RequestParam("pnrno") long pnr){
					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedCancelTicket", true);
					BookingDetails details=bookingDao.getBookingDetailByPnr(pnr);
					
					mv.addObject("pnr", details.getPnr());
					mv.addObject("txnid", details.getTransactionId());
					mv.addObject("fname", details.getPassengerName());
					mv.addObject("phone", details.getPassengerPhone());
					mv.addObject("bus", details.getBus());
					mv.addObject("flight", details.getFlight());
					mv.addObject("cab", details.getCab());
					mv.addObject("seatNo", details.getSeatNos());
					mv.addObject("bkdate", details.getDate());
					mv.addObject("fare", details.getFare());
					if (details.isStatus()==true && details.isPaymentStatus()==true ) {
						mv.addObject("status","Booked" );	
						mv.addObject("paystatus", "Payment Successful ");

					}
					else if (details.isStatus()==false || details.isPaymentStatus()==false ) {
						mv.addObject("status","Canceled" );	
						mv.addObject("paystatus", "Payment UnSuccessful ");

					}
					
					System.out.println(details);

					return mv;
				}
				
				@RequestMapping("/{pnr}/cancelTicket")
				public ModelAndView processcancelETicket(@PathVariable("pnr") long pnr){
					 
					ModelAndView mv = new ModelAndView("index2");
					mv.addObject("clickedProcessCancelTicket", true);
					BookingDetails details=bookingDao.getBookingDetailByPnr(pnr);
					
					if (details.isStatus()==true && details.isPaymentStatus()==true ) {
						
						System.out.println("in if");
						details.setStatus(false);
						details.setPaymentStatus(false);
						bookingDao.update(details);
						mv.addObject("message","Your Ticket has been Canceled Successfully" );	

						
					}
					
					else if (details.isStatus()==false || details.isPaymentStatus()==false ) {
						mv.addObject("message","Your Ticket is Already Canceled" );	
						System.out.println("in else if");

					}
					
					System.out.println(details);

					return mv;
				}

				
}
