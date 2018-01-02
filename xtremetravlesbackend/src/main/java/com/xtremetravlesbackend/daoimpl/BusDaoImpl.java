package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.BusDao;
import com.xtremetravlesbackend.dto.Bus;

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
		          .createQuery("FROM Bus WHERE is_enabled=:is_enabled", Bus.class)
		               .setParameter("is_enabled", true)
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
		
		bus.setEnabled(false);
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
		          .createQuery("FROM Bus WHERE is_enabled=:is_enabled", Bus.class)
		               .setParameter("is_enabled", true)
		                   .getResultList();
		}

	@Override
	public List<Bus> listBusByPlace(String bp,String dp) {

		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Bus WHERE is_enabled=:is_enabled AND board_point=:board_point AND drop_point=:drop_point", Bus.class)
				               .setParameter("is_enabled", true)
				                  .setParameter("board_point", bp)
				                      .setParameter("drop_point",dp)
				                          .getResultList();
	}



}