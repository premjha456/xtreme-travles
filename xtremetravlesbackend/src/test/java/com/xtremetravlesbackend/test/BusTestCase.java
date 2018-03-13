package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.User;

public class BusTestCase {

	private static AnnotationConfigApplicationContext context;
	
	
	private static BusDao busDao;
	private static UserDao userDao;
	
	private User user;
	private Bus bus;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		busDao = (BusDao)context.getBean("busDao");
		userDao = (UserDao)context.getBean("userDao");

	}
	
	
//	@Test
//	public void testAddBus() {
//		
//		bus = new Bus();
//		user = userDao.getUserByEmail("jhaprem12345@gmail.com");
//		bus.setBusName("Vrl");
//		bus.setBusType("Slepeer");
//		bus.setAminities("Wifi-Bootel-Tv");
//		bus.setBusRegNo("Mh02123");
//		bus.setBoardPoint("Mumbai");
//		bus.setBoardTime("11:30");
//		bus.setDropPoint("Banglore");
//		bus.setDropTime("5:00");
//		bus.setDate("4/5/2017");
//		bus.setMaxSeats(40);
//		bus.setSeatsAvailable(40);
//		bus.setPrice(1000);
//		bus.setActive(true);
//		bus.setUser(user);
//
//		assertEquals("Successfully added a category inside the table!",true,busDao.add(bus));
//		
//		
//	}

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
	@Test
	public void testGetBusByAgent() {
		
		user = userDao.getUserByEmail("jhaprem12345@gmail.com");
		
	List<Bus> bus=	busDao.listBusByAgentId(user);
	for (Bus bus2 : bus) {
		System.out.println(bus2);
	}
		assertEquals("Successfully added a category inside the table!",1,busDao.listBusByAgentId(user).size());
		
		
	}
	

	
	}
	
	
