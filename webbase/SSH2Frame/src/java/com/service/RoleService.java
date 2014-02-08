package com.service;

import java.util.List;

import com.bean.RoleInfo;


public interface RoleService {
	public List<RoleInfo> query(RoleInfo roleInfo) throws Exception;
	public String beforeUpdate(int id) throws Exception;
	public String update(RoleInfo roleInfo,String str) throws Exception;
	public String delete(int id) throws Exception;
	public String beforeAdd() throws Exception;
	public String add(RoleInfo roleInfo,String str) throws Exception;
}
