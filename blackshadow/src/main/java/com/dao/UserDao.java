package com.dao;

import java.util.List;

import com.domain.User;

public interface UserDao {
	public void saveOrUpdateUser(User user);
	public void deleteUser(long userId);
	public List<User> listUser();
	public User listUserById(Long userId);
}
