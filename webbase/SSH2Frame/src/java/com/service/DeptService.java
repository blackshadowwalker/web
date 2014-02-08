package com.service;

import java.util.List;
import net.sf.json.JSONArray;

import com.bean.Dept;
import com.bean.DeptInfo;

public interface DeptService {
	//public abstract List<DeptInfo> queryDept();
	public abstract JSONArray queryDept();
	public abstract JSONArray getDeptView(String deptName,String deptManager);
	public abstract String deptAdd(DeptInfo dept);
	public abstract List<Dept> deptBeforUpdate(int id);
	public abstract String deptUpdate(int id,Dept dept);
	public abstract List<DeptInfo> deptBeforDel(int id);
	public abstract boolean deptDel(int id);
	
}
