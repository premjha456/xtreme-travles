package com.xtremetravlesbackend.dao;

import java.util.List;

import com.xtremetravlesbackend.dto.Cab;

public interface CabDao {

	public Cab get(int id);
	public List<Cab> list();
	public boolean add(Cab bus);
	public boolean update(Cab bus);
	public boolean delete(Cab bus);
	public List<Cab> listActiveCabs();
	public List<Cab> listCabByPlace(String bp, String dp);

}
