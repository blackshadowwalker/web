package com.action;

import java.util.List;

import com.base.BaseAction;
import com.bean.RoleInfo;
import com.service.RoleService;

public class RoleAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Override
	protected String handle() throws Exception {
		if(super.method.equals("query")){
			return query();
		}else if(super.method.equals("beforeUpdate")){
			return beforeUpdate();
		}else if(super.method.equals("update")){
			return update();
		}else if(super.method.equals("delete")){
			return delete();
		}else if(super.method.equals("beforeAdd")){
			return beforeAdd();
		}else if(super.method.equals("add")){
			return add();
		}
		return null;
	}

	private String add() throws Exception{
		String result=roleService.add(roleInfo, str);
		roleInfo=null;
		if(result.equals("ok"))
			return query();
		else return "error";
	}

	private String beforeAdd() throws Exception {
		String str=roleService.beforeAdd();
		request.setAttribute("str", str);
		return "Add";
	}

	private String delete() throws Exception {
		int id=roleInfo.getRoleId();
		String result=roleService.delete(id);
		roleInfo=null;
		if(result.equals("ok"))
			return query();
		else 
			return "error";
	}

	private String update() throws Exception {
		String result=roleService.update(roleInfo, str);
		roleInfo=null;
		if(result.equals("ok"))
			return query();
		else return "error";
	}

	private String beforeUpdate() throws Exception {
		int id = roleInfo.getRoleId();
		String str=roleService.beforeUpdate(id);
		request.setAttribute("str", str);
		return "Update";
	}

	private String query() throws Exception {
		list=roleService.query(roleInfo);
		
		return "List";
	}
	
	RoleService roleService;
	List<RoleInfo> list;
	RoleInfo roleInfo;
	String str;

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<RoleInfo> getList() {
		return list;
	}

	public void setList(List<RoleInfo> list) {
		this.list = list;
	}

	public RoleInfo getRoleInfo() {
		return roleInfo;
	}

	public void setRoleInfo(RoleInfo roleInfo) {
		this.roleInfo = roleInfo;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	
	
}
