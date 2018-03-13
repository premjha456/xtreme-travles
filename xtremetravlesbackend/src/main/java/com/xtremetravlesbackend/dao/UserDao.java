package com.xtremetravlesbackend.dao;

import com.xtremetravlesbackend.dto.User;

public interface UserDao {

	public boolean add(User user);
	public boolean update(User user);
	public boolean delete(User user);
    public User  getUserByEmail(String username);
    public User  getUserById(int id);

}
