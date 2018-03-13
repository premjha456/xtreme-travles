package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.FlightDao;
import com.xtremetravlesbackend.dto.Flight;
import com.xtremetravlesbackend.dto.User;

@Repository("flightDao")
@Transactional
public class FlightDaoImpl implements FlightDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Flight get(int id) {
		return sessionFactory.getCurrentSession().get(Flight.class, Integer.valueOf(id));	
		}

	@Override
	public List<Flight> list() {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Flight WHERE is_enabled=:is_enabled", Flight.class)
				               .setParameter("is_enabled", true)
				                   .getResultList();

	}

	@Override
	public boolean add(Flight flight) {

		try {
	           sessionFactory
				   .getCurrentSession()
				         .persist(flight);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;

	
	}

	@Override
	public boolean update(Flight flight) {
		
		try {
	           sessionFactory
				   .getCurrentSession()
				         .update(flight);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;


	}

	@Override
	public boolean delete(Flight flight) {
		flight.setEnabled(false);
		try {
	           sessionFactory
				   .getCurrentSession()
				         .update(flight);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;

	}

	@Override
	public List<Flight> listActiveFlights() {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Flight WHERE is_enabled=:is_enabled", Flight.class)
				               .setParameter("is_enabled", true)
				                   .getResultList();
	}

	@Override
	public List<Flight> listFlightsByPlace(String bp, String dp,String date) {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Flight WHERE is_enabled=:is_enabled AND board_point=:board_point AND drop_point=:drop_point AND date=:date", Flight.class)
				               .setParameter("is_enabled", true)
				                  .setParameter("board_point", bp)
				                      .setParameter("drop_point",dp)
				                          .setParameter("date",date)
				                              .getResultList();	
		
	}

	@Override
	public List<Flight> listFlightByAgentId(User user) {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Flight WHERE user=:user", Flight.class)
				               .setParameter("user", user)
				                       .getResultList();


	}

}
