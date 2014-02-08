package com.service.impl;

import com.dao.RightDao;
import com.service.RightService;

public class RightServiceImpl implements RightService {

	@Override
	public String getRights(int roleId,int rulerId) throws Exception {
		return rightDao.getRights(roleId,rulerId);
	}
	RightDao rightDao ;
	public RightDao getRightDao() {
		return rightDao;
	}
	public void setRightDao(RightDao rightDao) {
		this.rightDao = rightDao;
	}
	
	
}
