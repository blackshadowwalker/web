package com.service;

import java.util.List;

import com.bean.User;
import com.bean.UserInfo;

public interface UserService {
	public List<User> query(UserInfo userInfo) throws Exception;
	public String beforeAdd() throws Exception;
	public String add(UserInfo userInfo) throws Exception;
	public UserInfo beforeUpdate(int id) throws Exception;
	public String update(UserInfo userInfo) throws Exception;
	public String delete(UserInfo userInfo) throws Exception;
}
