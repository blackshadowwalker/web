package com.action;

import java.util.List;

import com.base.BaseAction;
import com.bean.User;
import com.bean.UserInfo;
import com.service.UserService;

public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Override
	protected String handle() throws Exception {
		if(super.method.equals("query")){
			return query();
		}else if(super.method.equals("beforeAdd")){
			return beforeAdd();
		}else if(method.equals("add")){
			return add();
		}else if(method.equals("beforeUpdate")){
			return beforeUpdate();
		}else if(method.equals("update")){
			return update();
		}else if(method.equals("delete")){
			return delete();
		}
		return null;
	}

	private String delete() throws Exception {
		userService.delete(userInfo);
		userInfo=null;
		return query();
	}

	private String update() throws Exception {
		userService.update(userInfo);
		userInfo=null;
		return query();
	}

	private String beforeUpdate() throws Exception {
		request.setAttribute("str", userService.beforeAdd());
		int id=Integer.parseInt(request.getParameter("userId"));
		userInfo=userService.beforeUpdate(id);
		if(userInfo==null)
			return "error";
		else 
			return "Update";
	}

	private String add() throws Exception {
		String result=userService.add(userInfo);
		userInfo=null;
		if(result.equals("ok"))
			return query();
		else 
			return "error";
	}

	private String beforeAdd() throws Exception {
		request.setAttribute("str", userService.beforeAdd());
		return "Add";
	}

	private String query() throws Exception {
		list=userService.query(userInfo);
		return "List";
	}
	
	UserService userService;
	List<User> list;
	UserInfo userInfo;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
}	
