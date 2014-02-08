package com.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FlowStatistics implements Filter {
	
	static long count = 0;
	static Website website = new Website();

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

	public void destroy() {	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		String browserDet = ((HttpServletRequest) req).getHeader("User-Agent").toLowerCase();
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;

		String thisFilerName = "flowStatistics/";
		String currentURL = request.getRequestURI(); //取得根目录所对应的绝对路径: 
		String targetURL = currentURL.substring(
				currentURL.indexOf(thisFilerName, 1)+thisFilerName.length(), 
				currentURL.length()); //截取到当前文件名用于比较 
		
		count  ++;
		String userIP = getIpAddr(request);
		System.out.println("doGet RemoteAddr="+userIP +"  count="+count +" targetURL="+targetURL+"  currentURL="+currentURL);
		
		
		website.addIp(userIP);
		
	//	chain.doFilter(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher("/images/la.gif?"+(new Date()));   
		rd.forward(request,response); 
	//	PrintWriter out = response.getWriter();
	//	out.println("/images/la.gif?");
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public static Website getWebsite() {
		return website;
	}

	public static void setWebsite(Website website) {
		FlowStatistics.website = website;
	}

	

}
