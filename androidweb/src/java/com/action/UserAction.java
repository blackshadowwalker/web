package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends baseAction implements ModelDriven<User> {
	private User user = new User();
	private List<User> userList = new ArrayList<User>();
	private UserDao userDAO = new UserDaoImpl();
	
	public User getModel() {
		return user;
	}
	public String saveOrUpdate(){
		userDAO.saveOrUpdateUser(user);
		return SUCCESS;
	}
	public String list(){
		userList = userDAO.listUser();
		System.out.println("list.size="+userList.size());
		return SUCCESS;
	}
	public String edit(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
		user = userDAO.listUserById(Long.parseLong(request. getParameter("id")));
		return SUCCESS;
	}
	public String delete(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
		userDAO.deleteUser(Long.parseLong( request.getParameter("id")));
		return SUCCESS;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	
	
	
}
