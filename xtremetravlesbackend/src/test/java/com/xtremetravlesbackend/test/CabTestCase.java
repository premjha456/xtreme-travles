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
		cab.setCabName("Innova, Xylo or similar");
		cab.setCabType("SUV");
		cab.setCabServiceProvider("Xtreme Travles Pvt Ltd");
		cab.setAminities("AC,6 Seats,4 Luggage");
	    cab.setBoardPoint("Mumbai");
	    cab.setDropPoint("Goa");
	    cab.setDate("5/5/2017");
	    cab.setCabNo("Mh03 us 1234");
		cab.setFare(4000);
		cab.setActive(true);
		assertEquals("Successfully added a category inside the table!",true,cabDao.add(cab));
		
		
	}


}
