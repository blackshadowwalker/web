package com.service.impl;

import java.util.List;
import net.sf.json.JSONArray;


import com.bean.Dept;
import com.bean.DeptInfo;
import com.dao.DeptDao;
import com.service.DeptService;
public class DeptServiceImpl implements DeptService{

	DeptDao deptDao;
	public DeptDao getDeptDao() {
		return deptDao;
	}
	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}
	/*
	@Override
	public List<DeptInfo> queryDept(){
		return deptDao.queryAllDept();
		
	}
	*/
	
	@Override
	public JSONArray queryDept(){
		return deptDao.queryAllDept();
		
	}
	
	@Override
	public JSONArray getDeptView(String deptName,String deptManager){
		
		return deptDao.getDeptView(deptName,deptManager);
	}
	
	@Override
	public String deptAdd(DeptInfo dept){
		
		return deptDao.deptAdd(dept);
	}
	
	@Override
	public List<Dept> deptBeforUpdate(int id){
		
		return deptDao.deptBeforUpdate(id);
	}
	
	public String deptUpdate(int id,Dept dept){
		return deptDao.deptUpdate(id,dept);
	}
	
	@Override
	public List<DeptInfo> deptBeforDel(int id){
		
		return deptDao.deptBeforDel(id);
	}
	
	public boolean deptDel(int id){
		return deptDao.deptDel(id);
	}
	
	
}
