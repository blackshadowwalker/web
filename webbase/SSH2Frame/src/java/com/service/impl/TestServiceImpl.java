package com.service.impl;

import java.util.List;

import com.bean.TSNvr;
import com.dao.TestDao;
import com.service.TestService;

public class TestServiceImpl implements TestService {
	TestDao testDao;

	public TestDao getTestDao() {
		return testDao;
	}
	public void setTestDao(TestDao testDao) {
		this.testDao = testDao;
	}


	@Override
	public List<TSNvr> queryNvr() {
		return testDao.queryAllNvr();
	}
	@Override
	public TSNvr getById(int id) {
		return testDao.getById(id);
	}
}
