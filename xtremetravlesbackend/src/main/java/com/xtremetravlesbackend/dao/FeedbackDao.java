package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.Feedback;
import com.xtremetravlesbackend.dto.User;

public interface FeedbackDao {

	public Feedback get(int id);
	
	public List<Feedback> getFeedbackList();
	
	public List<Feedback> getFeedbackListByUserId(User user);

	public boolean add(Feedback feedback);

}

