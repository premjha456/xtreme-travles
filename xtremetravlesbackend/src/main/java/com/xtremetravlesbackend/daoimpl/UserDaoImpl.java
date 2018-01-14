package com.xtremetravlesbackend.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean add(User user) {
		try {
	           sessionFactory
				   .getCurrentSession()
				         .persist(user);
				return true;

			} catch (Exception e) {
	        e.printStackTrace();
			}
			return false;

	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(User user) {
		// TODO Auto-generated method stub
		return false;
	}

}
