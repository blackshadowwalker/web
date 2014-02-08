package com.service.impl;

import com.bean.UserInfo;
import com.dao.LoginDao;
import com.service.LoginService;

public class LoginServiceImpl implements LoginService {

	@Override
	public UserInfo login(UserInfo user,String ip) throws Exception {
		return  loginDao.login(user,ip);
	}
	
	LoginDao loginDao;

	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	
}
