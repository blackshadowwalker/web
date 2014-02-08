package com.action;

import java.util.List;

import com.base.BaseAction;
import com.bean.TSNvr;
import com.service.TestService;

public class TestAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	TestService testService;
	List<TSNvr> list;
	TSNvr nvr;
	
	@Override
	protected String handle() throws Exception {
		if(method.equals("query")){
			return query();
		}if(method.equals("getById")){
			return getById();
		}
		return null;
	}
	
	private String getById() {
		
		nvr=testService.getById(nvr.getId());
		return "getById";
	}

	private String query() {
		list=testService.queryNvr();
		return "List";
	}

	
	
	//spring 注入
	public TestService getTestService() {
		return testService;
	}

	
	public void setTestService(TestService testService) {
		this.testService = testService;
	}


	public List<TSNvr> getList() {
		return list;
	}


	public void setList(List<TSNvr> list) {
		this.list = list;
	}
	
	public TSNvr getNvr() {
		return nvr;
	}

	public void setNvr(TSNvr nvr) {
		this.nvr = nvr;
	}

}
