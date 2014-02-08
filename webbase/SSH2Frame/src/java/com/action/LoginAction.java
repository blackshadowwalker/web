package com.action;

import java.util.List;
import java.util.Map;


import com.base.BaseAction;
import com.bean.RulerInfo;
import com.bean.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.service.LoginService;
import com.service.RulerService;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	Integer rulerId = 0;

	@Override
	protected String handle() throws Exception {
		if (method.equals("login")) {
			return login();
		}
		if (method.equals("logout")) {
			return logout();
		}
		return null;
	}

	private String logout() {
		session.clear();
		return "FAILE";
	}

	private String login() throws Exception {

		List<Integer> list = null;
		List<RulerInfo> infolist = null;
		
		 
	    String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    }  
		
	    if (user == null) {
			request.setAttribute("faile", "faile");
			return "FAILE";
		}
		
		user = loginService.login(user,ip);
		if (user == null) {
			request.setAttribute("faile", "faile");
			return "FAILE";
		} else {
			
			Integer roleId = user.getUserRole();
			list = rulerService.rulerRole(roleId);
			infolist = (List<RulerInfo>) rulerService.ruler(list);
			Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("user", user);
			session.put("infolist", infolist);
			return "SUCCESS";
		}
	}

	LoginService loginService;
	RulerService rulerService;
	UserInfo user;
	RulerInfo ruInfo;

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public RulerService getRulerService() {
		return rulerService;
	}

	public void setRulerService(RulerService rulerService) {
		this.rulerService = rulerService;
	}

	public RulerInfo getRuInfo() {
		return ruInfo;
	}

	public void setRuInfo(RulerInfo ruInfo) {
		this.ruInfo = ruInfo;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

}
