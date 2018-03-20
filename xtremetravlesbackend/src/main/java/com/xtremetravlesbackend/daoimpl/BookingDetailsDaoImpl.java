package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.BookingDetailsDao;
import com.xtremetravlesbackend.dto.BookingDetails;
import com.xtremetravlesbackend.dto.User;

@Repository("bookingDao")
@Transactional
public class BookingDetailsDaoImpl implements BookingDetailsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public BookingDetails get(int id) {
		return sessionFactory.getCurrentSession().get(BookingDetails.class, Integer.valueOf(id));
	}

	@Override
	public List<BookingDetails> getBookingDetailByUserid(User user) {
		return sessionFactory
				.getCurrentSession()
				     .createQuery("Select * From BookingDetails Where user=:user", BookingDetails.class)
				         .setParameter("user", user)
				              .getResultList();
	}

	@Override
	public List<BookingDetails> getBookingDetailsByStatus(boolean status) {
		return sessionFactory
				.getCurrentSession()
				     .createQuery("Select * From BookingDetails Where status=:status", BookingDetails.class)
				         .setParameter("status", status)
				              .getResultList();
	}

}
