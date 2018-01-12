package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dto.Bus;

public class BusTestCase {

	private static AnnotationConfigApplicationContext context;
	
	
	private static BusDao busDao;
	
	
	private Bus bus;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		busDao = (BusDao)context.getBean("busDao");
	}
	
	
	@Test
	public void testAddBus() {
		
		bus = new Bus();
		
		bus.setBusName("Vrl");
		bus.setBusType("Slepeer");
		bus.setAminities("Wifi-Bootel-Tv");
		bus.setBusRegNo("Mh02123");
		bus.setBoardPoint("Mumbai");
		bus.setBoardTime("11:30");
		bus.setDropPoint("Banglore");
		bus.setDropTime("5:00");
		bus.setMaxSeats(40);
		bus.setSeatsAvailable(40);
		bus.setPrice(1000);
		bus.setActive(true);
		
		assertEquals("Successfully added a category inside the table!",true,busDao.add(bus));
		
		
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
	
	
	}
	
	
