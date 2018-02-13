package com.xtremetravlesbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Cab;

public class CabTestCase {

private static AnnotationConfigApplicationContext context;
	
	
	private static CabDao cabDao;
	
	
	private Cab cab;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.xtremetravlesbackend");
		context.refresh();
		cabDao = (CabDao)context.getBean("cabDao");
	}
	
	
	@Test
	public void testAddCab() {
		
		cab = new Cab();
		cab.setCabName("Indica, Swift or similar");
		cab.setCabType("HATCHBACK");
		cab.setCabServiceProvider("Xtreme Travles Pvt Ltd");
		cab.setAminities("AC,4 Seats,2 Luggage");
	    cab.setBoardPoint("Mumbai");
	    cab.setDropPoint("Goa");
		cab.setFare(2000);
		cab.setActive(true);
		assertEquals("Successfully added a category inside the table!",true,cabDao.add(cab));
		
		
	}


}
