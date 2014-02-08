package com.dao;

import java.sql.Timestamp;

import org.hibernate.Query;
import org.hibernate.Session;

import com.base.BaseDao;
import com.bean.UserInfo;
import com.bean.UserLogin;

public class LoginDao extends BaseDao {
	
	public UserInfo login(UserInfo user,String ip) throws Exception{
		
		Session session = this.getSession();
		UserLogin userLogin = new UserLogin();
		Query query = session.createQuery("from UserInfo u where u.userName=:name and u.userPasswd=:pwd");
		query.setParameter("name", user.getUserName());
		query.setParameter("pwd", user.getUserPasswd());
		
		UserInfo user2=(UserInfo)query.uniqueResult();
		
		if(user2!=null){
			userLogin.setLoginId(user2.getUserId());
			userLogin.setLoginIp(ip);
			userLogin.setLoginTime(new Timestamp(System.currentTimeMillis()));
			session.save(userLogin);
			return user2;
		}
		else 
			return null;
	}
}
