package com.base;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bean.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RightService;

public abstract class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	protected HttpServletRequest request;
	protected HttpServletResponse  response;
	protected String method = null;
	protected int rulerId = 0;
	String rights = null;
	protected Map<String, Object> session = null;
	
	@Override
	public String execute() throws Exception {
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		request.setCharacterEncoding("utf-8");
		
		method = request.getParameter("method");

		if(request.getParameter("rulerId")!=null && !(request.getParameter("rulerId")).equals("")){
			rulerId = Integer.parseInt(request.getParameter("rulerId"));
		}	
		session = ActionContext.getContext().getSession();
		if(session.get("user")==null && !method.equals("login") && !method.equals("logout")){
			return "error";
		}
		if(session.get("user")!=null && !method.equals("login") && !method.equals("logout")){
			UserInfo user = (UserInfo) session.get("user");
			/*System.out.println("-------------------------------");
			System.out.println(user.getUserId());
			System.out.println(user.getUserName());
			System.out.println(user.getUserPasswd());
			System.out.println(user.getUserRole());
			System.out.println("----------------------------------");*/
			if(rulerId==0){
				if(request.getSession().getAttribute("r_id")!=null)
					rulerId=(Integer)request.getSession().getAttribute("r_id");
				if(rulerId==0)
					return "error";
			}
			rights = rightService.getRights(user.getUserRole(), rulerId);
			if(rights==null) {
				return "error";
			}
			
			//System.out.println(rights);
			if((rights.indexOf("u")<0 && method.equals("update"))||(rights.indexOf("i")<0 && method.equals("insert"))||
					(rights.indexOf("v")<0 && method.equals("view"))||(rights.indexOf("d")<0 && method.equals("delete"))){
				return "error";
			}
			if(method.equals("query")){
				request.setAttribute("u", rights.indexOf("u"));
				request.setAttribute("v", rights.indexOf("v"));
				request.setAttribute("i", rights.indexOf("i"));
				request.setAttribute("d", rights.indexOf("d"));
			}
			request.setAttribute("r_id", rulerId);
			request.getSession().setAttribute("r_id", rulerId);
		}
		return handle();
	}

	protected abstract String handle() throws Exception;
	
	RightService rightService;
	public RightService getRightService() {
		return rightService;
	}

	public void setRightService(RightService rightService) {
		this.rightService = rightService;
	}
	
	
}