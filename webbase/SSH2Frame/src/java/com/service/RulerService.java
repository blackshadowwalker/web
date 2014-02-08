package com.service;

import java.util.List;

import com.bean.RulerInfo;

public interface RulerService {

	public List<RulerInfo> ruler(List<Integer> list);
		
	public List<Integer> rulerRole(int roleId);
	
	public List<RulerInfo> query(RulerInfo rulerInfo);

	public String delete(int id);
	
	public String add(RulerInfo rulerInfo);
	
	public List<RulerInfo> beforeUpdate(int id);

	public String update(int id, RulerInfo rulerInfo);
}
