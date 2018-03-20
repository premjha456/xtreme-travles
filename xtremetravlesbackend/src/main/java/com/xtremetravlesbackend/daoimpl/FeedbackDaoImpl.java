package com.xtremetravlesbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.xtremetravlesbackend.dao.FeedbackDao;
import com.xtremetravlesbackend.dto.Feedback;
import com.xtremetravlesbackend.dto.User;


@Repository("feedbackDao")
@Transactional
public class FeedbackDaoImpl implements FeedbackDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<Feedback> getFeedbackList() {

		return sessionFactory
				.getCurrentSession()
				      .createQuery("From Feedback", Feedback.class)
				           .getResultList();
	}

	@Override
	public List<Feedback> getFeedbackListBySubject(String subject) {
		
		return sessionFactory
				.getCurrentSession()
				       .createQuery("Select * From Feedback Where subject=:subject",Feedback.class)
				              .setParameter("subject", subject)
				                    .getResultList();
	}

	@Override
	public List<Feedback> getFeedbackListByUserId(User user) {

		return sessionFactory
				.getCurrentSession()
				     .createQuery("Select * From Feedback Where user=:user", Feedback.class)
				             .setParameter("user", user)
				                 .getResultList();
	}

	@Override
	public Feedback get(int id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(Feedback.class, Integer.valueOf(id));
	}

}
