package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

public class FlightTestCase {

private static AnnotationConfigApplicationContext context;
		
	private static FlightDao flightDao;
	private static UserDao userDao;
		
	private Flight flight;
	private User user;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		flightDao = (FlightDao)context.getBean("flightDao");
		userDao = (UserDao)context.getBean("userDao");

	}
	
//	@Test
//	public void testAddBus() {
//		
//		user = userDao.getUserByEmail("jhaprem12345@gmail.com");
//		flight = new Flight();
//		flight.setFlightName("Air India");
//		flight.setFlightType("Non Stop");
//		flight.setFlightNo("A1-565");
//		flight.setBoardPoint("Delhi");
//		flight.setBoardTime("11:30");
//		flight.setDropPoint("Mumbai");
//		flight.setDropTime("4:30");
//		flight.setDate("4/5/2107");
//		flight.setMaxSeats(300);
//		flight.setSeatsAvailable(300);
//		flight.setFare(3500);
//		flight.setEnabled(true);
//		flight.setUser(user);
//		assertEquals("Successfully added a flight inside the table!",true,flightDao.add(flight));
//		
//		
//	}

//	@Test
//	public void testGetBus() {
//		
//		flight = flightDao.get(1);
//		
//		assertEquals("Successfully added a category inside the table!","Indigo",flight.getFlightName());
//		
//		
//	}

//	@Test
//	public void testUpdateBus() {
//		
//		flight = flightDao.get(3);
//		flight.setEnabled(true);
//		
//		assertEquals("Successfully added a category inside the table!",true,flightDao.update(flight));		
//	}
//	
	
//	@Test
//	public void testDeleteBus() {
//		
//		flight =flightDao.get(3);
//		assertEquals("Successfully added a category inside the table!",true,flightDao.delete(flight));
//	}
	
//	@Test
//	public void testGetBusList() {
//				
//		assertEquals("Successfully added a category inside the table!",4,busDao.list().size());
//		
//		
//	}

	@Test
	public void testAddBus() {
		
	
	
	user = userDao.getUserByEmail("jhaprem12345@gmail.com");
	
	List<Flight> flight=	flightDao.listFlightByAgentId(user);
	for (Flight flight2 : flight) {
		System.out.println(flight2);
	}
		assertEquals("Successfully added a category inside the table!",1,flightDao.listFlightByAgentId(user).size());
		
		
	}
	

}
