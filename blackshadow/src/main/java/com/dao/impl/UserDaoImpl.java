package com.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dao.UserDao;
import com.domain.User;

public class UserDaoImpl implements UserDao {

	private static List<User> user=new ArrayList<User>();
	
	public UserDaoImpl()
	{
	}
	@Override
	public void deleteUser(long userId) {
		int i=0; 
		for(User u:user){
			if(u.getId()==userId)
				break;
			i++;
		}
		if(i>=user.size())
			;
		else
			user.remove(i);
	}

	@Override
	public List<User> listUser() {
		return user;
	}

	@Override
	public User listUserById(Long userId) {
		int i=0; 
		for(User u:user){
			if(u.getId()==userId)
				break;
			i++;
		}
		if(i>=user.size())
			return null;
		else
			return user.get(i);
	}

	@Override
	public void saveOrUpdateUser(User user) {
		int i=0; 
		for(User u:this.user){
			if(u.getId()==user.getId())
				break;
			i++;
		}
		if(i>=this.user.size())
			;
		else{
			this.user.remove(i);
		}
		Date d = new Date();
		user.setId(d.getTime());
		this.user.add(user);
	}
}
