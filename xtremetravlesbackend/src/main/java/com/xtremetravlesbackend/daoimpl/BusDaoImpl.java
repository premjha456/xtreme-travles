package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.User;

@Repository("busDao")
@Transactional
public class BusDaoImpl implements BusDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Bus get(int id) {
  
		return sessionFactory.getCurrentSession().get(Bus.class, Integer.valueOf(id));
	}

	@Override
	public List<Bus> list() {
    return sessionFactory
		     .getCurrentSession()
		           .createQuery("FROM Bus", Bus.class)
		                   .getResultList();
	}

	@Override
	public boolean add(Bus bus) {

		try {
           sessionFactory
			   .getCurrentSession()
			         .persist(bus);
			return true;

		} catch (Exception e) {
        e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Bus bus) {
		try {
	           sessionFactory
				   .getCurrentSession()
				         .update(bus);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;

	}

	@Override
	public boolean delete(Bus bus) {
		
		bus.setActive(false);
		try {
	           sessionFactory
				   .getCurrentSession()
				         .update(bus);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;
	}

	@Override
	public List<Bus> listActiveBuses() {

return sessionFactory
		  .getCurrentSession()
		          .createQuery("FROM Bus WHERE active=:active", Bus.class)
		               .setParameter("active", true)
		                   .getResultList();
		}

	@Override
	public List<Bus> listBusByPlace(String bp,String dp,String date,int seat) {

		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Bus WHERE active=:active AND board_point=:board_point AND drop_point=:drop_point AND date=:date AND seats_available>=:seat", Bus.class)
				               .setParameter("active", true)
				                  .setParameter("board_point", bp)
				                      .setParameter("drop_point",dp)
				                           .setParameter("date",date)
				                               .setParameter("seat",seat) .getResultList();
	}

	@Override
	public List<Bus> listBusByAgentId(User user) {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Bus WHERE user=:user", Bus.class)
				                   .setParameter("user", user)
				                       .getResultList();

	}



}
