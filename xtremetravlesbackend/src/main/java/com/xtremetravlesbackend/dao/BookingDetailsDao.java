package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.BookingDetails;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.User;

public interface BookingDetailsDao {

	
	public BookingDetails get(int id);
	
	public List<BookingDetails> getBookingDetailByUserid(User user);
	
	public BookingDetails getBookingDetailByPnr(long pnr);
	
	public List<BookingDetails> getBookingDetailsByStatus(boolean status);

	boolean add(BookingDetails bookingDetails);

	boolean update(BookingDetails bookingDetails);

	boolean delete(BookingDetails bookingDetails);
}
