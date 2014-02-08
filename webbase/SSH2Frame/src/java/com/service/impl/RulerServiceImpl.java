package com.service.impl;

import java.util.List;

import com.bean.RulerInfo;
import com.dao.RulerDao;
import com.service.RulerService;

public class RulerServiceImpl implements RulerService{

	RulerDao rulerDao;
	@Override
	public List<Integer> rulerRole(int rr) {
		
		return rulerDao.rulerRole(rr);
	}
	

	@Override
	public List<RulerInfo> ruler(List<Integer> list) {
		
		return rulerDao.ruler(list);
	}
	

	public RulerDao getRulerDao() {
		return rulerDao;
	}

	public void setRulerDao(RulerDao rulerDao) {
		this.rulerDao = rulerDao;
	}


	@Override
	public List<RulerInfo> query(RulerInfo rulerInfo) {
		
		return rulerDao.query(rulerInfo);
	}


	@Override
	public String delete(int id) {
		
		return rulerDao.delete(id);
	}


	@Override
	public String add(RulerInfo rulerInfo) {
		
		return rulerDao.add(rulerInfo);
	}


	@Override
	public List<RulerInfo> beforeUpdate(int id) {
		
		return rulerDao.beforeUpdate(id);
	}


	@Override
	public String update(int id, RulerInfo rulerInfo) {
		
		return rulerDao.update(id,rulerInfo);
	}



	

	
}
