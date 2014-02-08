package com.dao;

import java.util.List;

import com.domain.TSPerson;

public interface ITSPersonDao {
	public void save(TSPerson transientInstance);
	public void delete(TSPerson persistentInstance);
	public TSPerson findById(Integer id);
	public List findByUserCode(Object userCode);
	public List findAll();
}
