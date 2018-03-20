package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.BookingDetails;
import com.xtremetravlesbackend.dto.User;

public interface BookingDetailsDao {

	
	public BookingDetails get(int id);
	
	public List<BookingDetails> getBookingDetailByUserid(User user);
	
	public List<BookingDetails> getBookingDetailsByStatus(boolean status);
	
}
