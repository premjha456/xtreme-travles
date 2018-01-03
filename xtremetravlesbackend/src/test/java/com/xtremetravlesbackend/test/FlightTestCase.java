package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dto.Flight;

public class FlightTestCase {

private static AnnotationConfigApplicationContext context;
		
	private static FlightDao flightDao;
		
	private Flight flight;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		flightDao = (FlightDao)context.getBean("flightDao");
	}
//	
//	@Test
//	public void testAddBus() {
//		
//		flight = new Flight();
//		flight.setFlightName("Air India");
//		flight.setFlightType("Non Stop");
//		flight.setFlightNo("A1-565");
//		flight.setBoardPoint("Delhi");
//		flight.setBoardTime("11:30");
//		flight.setDropPoint("Mumbai");
//		flight.setDropTime("4:30");
//		flight.setMaxSeats(300);
//		flight.setSeatsAvailable(300);
//		flight.setFare(3500);
//		flight.setEnabled(true);
//		
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

	@Test
	public void testUpdateBus() {
		
		flight = flightDao.get(3);
		flight.setEnabled(true);
		
		assertEquals("Successfully added a category inside the table!",true,flightDao.update(flight));		
	}
	
	
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

}
