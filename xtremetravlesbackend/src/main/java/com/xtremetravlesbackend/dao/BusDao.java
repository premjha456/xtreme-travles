package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.Bus;
import com.xtremetravlesbackend.dto.User;

public interface BusDao {

	public Bus get(int id);
	public List<Bus> list();
	public boolean add(Bus bus);
	public boolean update(Bus bus);
	public boolean delete(Bus bus);
	public List<Bus> listActiveBuses();
	public List<Bus> listBusByPlace(String bp, String dp,String date);
	public List<Bus> listBusByAgentId(User user);
	
}
