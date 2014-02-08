package com.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends baseAction {
	private User user ;
	public String login(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
		System.out.println("login");
		if(user==null)
			return INPUT;
		String ret = SUCCESS;
		System.out.println("action method@login  "+user.getUsername()+"@"+user.getPassword());
		if(!user.getUsername().trim().equals("admin")){
			this.addFieldError("user.username", "Username Invalid");
			ret = INPUT;
			return ret;
		}
		if(!user.getPassword().trim().equals("1")){
			this.addFieldError("user.password", "Password Invalid");
			ret = INPUT;
		}
		request.getSession().setAttribute("user", user);
		return ret;
	}
	
	public String smallLogin(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get( ServletActionContext.HTTP_RESPONSE);
		
		String target = (String)request.getParameter("target");
		System.out.println("smallLogin target="+target);
		request.setAttribute("target", target);
		
		if(user==null)
			return "smallINPUT";;
		String ret = "smallSUCCESS";
		System.out.println("action method@login  "+user.getUsername()+"@"+user.getPassword());
		if(!user.getUsername().trim().equals("admin")){
			this.addFieldError("user.username", "Username Invalid");
			ret = "smallINPUT";
			return ret;
		}
		if(!user.getPassword().trim().equals("1")){
			this.addFieldError("user.password", "Password Invalid");
			ret = "smallINPUT";
		}
		request.getSession().setAttribute("user", user);
		return ret;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String execute() throws Exception {
		
		return super.execute();
	}
}
