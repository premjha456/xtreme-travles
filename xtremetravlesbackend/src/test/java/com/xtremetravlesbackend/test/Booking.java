package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.BookingDetailsDao;
import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.BookingDetails;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.User;

public class Booking {

	private static AnnotationConfigApplicationContext context;
	
	
	private static BookingDetailsDao bookingDao;
	private static UserDao userDao;
	
	private User user;
	private BookingDetails bookingDetails;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		bookingDao = (BookingDetailsDao)context.getBean("bookingDao");
		userDao = (UserDao)context.getBean("userDao");

	}
	
	
	@Test
	public void testAddBus() {
		
		bookingDetails = new BookingDetails();
		bookingDetails.setPnr(12345);
		bookingDetails.setTransactionId("aaaaa");
		bookingDetails.setPassengerName("Jyoti");
		bookingDetails.setPassengerPhone("9878787878");
		bookingDetails.setUser(new User());
		bookingDetails.setBus(new Bus());
		bookingDetails.setSeatNos("1010");
		bookingDetails.setStatus(true);
		bookingDetails.setPaymentStatus(true);
		bookingDetails.setDate("qqqqq");
		bookingDetails.setFare(100.10);
		assertEquals("Successfully added a category inside the table!",true,bookingDao.add(bookingDetails));
		
		
	}

//	@Test
//	public void testGetBus() {
//		
//		bus = busDao.get(2);
//		
//		assertEquals("Successfully added a category inside the table!","Vrl",bus.getBusName());
//		
//		
//	}

//	@Test
//	public void testUpdateBus() {
//		
//		bus = busDao.get(2);
//		bus.setBusName("Neeta Volvo");
//		
//		assertEquals("Successfully added a category inside the table!",true,busDao.update(bus));
//		
//		
//	}
//	
	
//	@Test
//	public void testDeleteBus() {
//		
//		bus =busDao.get(3);
//		assertEquals("Successfully added a category inside the table!",true,busDao.delete(bus));
//		
	
//	@Test
//	public void testGetBusList() {
//				
//		assertEquals("Successfully added a category inside the table!",4,busDao.list().size());
//		
//		
//	}
//	@Test
//	public void testGetBusByAgent() {
//		
//		user = userDao.getUserByEmail("jhaprem12345@gmail.com");
//		
//	List<Bus> bus=	busDao.listBusByAgentId(user);
//	for (Bus bus2 : bus) {
//		System.out.println(bus2);
//	}
//		assertEquals("Successfully added a category inside the table!",1,busDao.listBusByAgentId(user).size());
//		
//		
//	}
//	
//
//	
	}
	
	
