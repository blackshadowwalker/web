package com.servlet;

import java.io.*;
import java.net.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class IPServlet extends HttpServlet {

	private String ipurl = ( "http://int.dpool.sina.com.cn//iplookup//iplookup.php?format=json&ip=");

	public static void main(String args[]) throws MalformedURLException{

		IPServlet l =new IPServlet();
		System.out.println(l.GetIPInfo("114.249.225.95"));

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

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.addHeader("Access-Control-Allow-Origin", "*");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		
		String ip = req.getParameter("ip");
		String callback = req.getParameter("callback");
		if(ip==null || ip.isEmpty()){
			ip = getIpAddr(req);
		}
		
		String info = GetIPInfo(ip);
		
		JSONObject jsonmsg = JSONObject.fromObject(info);
		if(jsonmsg.getLong("ret")==1)
			jsonmsg.put("ip", ip);
		System.out.println(jsonmsg);
		PrintWriter out = resp.getWriter();
		out.println(jsonmsg);
		out.close();
		
	}

	
	public String GetIPInfo(String ip){
		String msg = "";
		URL url = null;
		try {
			url = new URL(ipurl+ip);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}
		try {
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			conn.setConnectTimeout(1000 * 5);
			conn.connect();  
			// 获取文件大小  
			int length = conn.getContentLength();  
			InputStream is = conn.getInputStream(); 
			BufferedInputStream bis = new BufferedInputStream(is); 
			byte buffer[] = new byte[1024];  
			
			String temp;
			int len=-1;
			while((len =bis.read(buffer))!=-1){ 
				temp = new String(buffer);
				msg += temp;
			}
		//	System.out.println(msg.trim());

		} catch (IOException e) {
			e.printStackTrace();
		}
		return msg;
	}
	
}
