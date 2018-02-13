package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.CabDao;
import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.Cab;

@Repository("cabDao")
@Transactional
public class CabDaoImpl implements CabDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Cab get(int id) {

		return sessionFactory.getCurrentSession().get(Cab.class,Integer.valueOf(id));
	}

	@Override
	public List<Cab> list() {
 
			    return sessionFactory
					     .getCurrentSession()
					           .createQuery("FROM Cab", Cab.class)
					                   .getResultList();
	}

	@Override
	public boolean add(Cab cab) {

		try {
			  sessionFactory.getCurrentSession().persist(cab);
			  return true;

		} catch (Exception e) {
            e.printStackTrace();
		}
	  
	  return false;
	}

	@Override
	public boolean update(Cab cab) {
		try {
			  sessionFactory.getCurrentSession().update(cab);
			  return true;

		} catch (Exception e) {
          e.printStackTrace();
		}
	  
	  return false;

	}

	@Override
	public boolean delete(Cab cab) {
		
		cab.setActive(false);
		try {
			  sessionFactory.getCurrentSession().update(cab);
			  return true;

		} catch (Exception e) {
          e.printStackTrace();
		}
	  
	  return false;

	}

	@Override
	public List<Cab> listActiveCabs() {
		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Cab WHERE active=:active", Cab.class)
				               .setParameter("active", true)
				                   .getResultList();
	}

	@Override
	public List<Cab> listCabByPlace(String bp, String dp) {

		return sessionFactory
				  .getCurrentSession()
				          .createQuery("FROM Cab WHERE active=:active AND board_point=:board_point AND drop_point=:drop_point", Cab.class)
				               .setParameter("active", true)
				                  .setParameter("board_point", bp)
				                      .setParameter("drop_point",dp)
				                          .getResultList();
	}
	}
	