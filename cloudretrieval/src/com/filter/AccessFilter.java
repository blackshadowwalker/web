package com.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccessFilter implements Filter
{
	private FilterConfig filterConfig = null;
	public void destroy()
	{
	}

	public String getIpAddr(HttpServletRequest request) { 
		String ip = request.getHeader("x-forwarded-for"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{ 
			ip = request.getHeader("Proxy-Client-IP");
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{ 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) 
		{ 
			ip = request.getRemoteAddr(); 
		} 
		return ip; 
	}
	public static void main(String[] args){
	}

	public boolean checkAddress(HttpServletRequest req, HttpServletResponse resp){

		ServletContext sc = filterConfig.getServletContext();
		String accessAddrParameter = sc.getInitParameter("accessAddr");
		if(accessAddrParameter==null || accessAddrParameter.isEmpty())
			return true;
		System.out.println("accessAddr="+accessAddrParameter);
		String accessAddrs[] = accessAddrParameter.split(",");
		List<String> accessAddrList = new ArrayList<String>();
		if(accessAddrs.length<1){
			accessAddrList.add(accessAddrParameter);
		}else{
			int i=accessAddrs.length-1;
			while(i>=0)
				accessAddrList.add(accessAddrs[i--]);
		}
		String userIP = getIpAddr(req);
		System.out.println("RemoteAddr="+userIP);
		int j=accessAddrList.size()-1;
		while(j>=0)
			if(userIP.matches(accessAddrList.get(0)))
			return true;
			
		return false;

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) 
	throws IOException, ServletException
	{
		String browserDet = ((HttpServletRequest) request).getHeader("User-Agent").toLowerCase();
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		/*
		Enumeration hnames = req.getHeaderNames();
		while(hnames.hasMoreElements()){
			String name = (String)hnames.nextElement();
			String value = req.getHeader(name);
			System.out.println(name+"="+value);
		}
		System.out.println("***************************");
		*/
		String thisPath = req.getContextPath();
		// IP access Fileter
		if(!checkAddress(req, resp))
			return ;
		chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException
	{
		filterConfig = arg0;
	}

}
