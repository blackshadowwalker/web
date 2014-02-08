package com.service;

import com.bean.UserInfo;


public interface LoginService{
	public UserInfo login(UserInfo user,String ip) throws Exception;
}
