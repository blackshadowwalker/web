package com.filter;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageFilter implements Filter
{
	private FilterConfig filterConfig = null;
	private static String IMAGE_TYPES = "*.jpg;*.png;*.gif;*.jpeg;*.ico;*.bmp";
	String filePath ="";
	
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		String phyPath = request.getRealPath("/");
		phyPath = phyPath.replaceAll("\\\\", "/");
		String thisPath = request.getContextPath();
		String uri = request.getRequestURI();
		int index = uri.lastIndexOf(".");
		if(index<1){
			chain.doFilter(req, resp);
			return;
		}
		String fileType = uri.substring(index);
		/*
		if(IMAGE_TYPES.indexOf(fileType)<1){
			chain.doFilter(req, resp);
			return;
		}
		*/
		if(uri.indexOf(thisPath)==0){
			//the image inside of the project
			filePath = phyPath+uri.substring(thisPath.length()+1);
		}else{
			// the image outside of the project
			filePath = phyPath.substring(0, phyPath.lastIndexOf(thisPath))+uri;
		}
		File file = new File(filePath);
		if(!file.exists()){
			String fwd = "/images/base/404insets.png?"+new Date();
			System.out.println("===="+filePath+"== is not exist! fwd="+fwd);
			req.getRequestDispatcher(fwd).forward(req, resp);
		}
		else
			chain.doFilter(req, resp);
		System.out.println("===="+filePath+"========URI="+uri+"============================");
		/*
		Enumeration hnames = request.getHeaderNames();
		while(hnames.hasMoreElements()){
			String name = (String)hnames.nextElement();
			String value = request.getHeader(name);
			System.out.println(name+"="+value);
		}
		*/
	//	String referer=req.getHeader("referer");
	//	req.getRequestDispatcher("/images/error.jpg").forward(req, resp);
		
	}

	
	
	public void destroy()
	{
		
	}

	
	public void init(FilterConfig arg0) throws ServletException
	{
		filterConfig = arg0;
	}

}
