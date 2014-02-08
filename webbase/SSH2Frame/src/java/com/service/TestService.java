package com.service;

import java.util.List;

import com.bean.TSNvr;

public interface TestService {
	public abstract List<TSNvr> queryNvr(); 
	public abstract TSNvr getById(int id);
}
