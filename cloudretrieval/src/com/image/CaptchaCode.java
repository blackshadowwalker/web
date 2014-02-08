package com.image;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CaptchaCode extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("image/jpeg");//������Ӧ����,������������������ΪͼƬ
        response.setHeader("Pragma", "No-cache");//������Ӧͷ��Ϣ�������������Ҫ���������
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        /*
        String qqurl = "";
        Enumeration names = request.getHeaderNames();
        while(names.hasMoreElements()){
        	String name = (String)names.nextElement();
        	String header = request.getHeader(name);
        	if(name.equals("referer"))
        		qqurl = header;
        	System.out.println(name+"="+header);
        }
        
        System.out.println("url="+request.getRequestURL());
        System.out.println("uri="+request.getRequestURI());
        System.out.println("LocalName="+request.getLocalName());
        System.out.println("RemoteAddr="+request.getRemoteAddr());
        System.out.println("qqurl="+qqurl);
        String qq = "";
        String indexStr ="user.qzone.qq.com";
        if(qqurl!=""){
	        int index = qqurl.indexOf(indexStr);
	        qq = qqurl.substring(index+indexStr.length()+1);
	        qq = qq.substring(0, qq.indexOf('/'));
	        System.out.println("QQ="+qq);
        }
        */
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//���ͼƬ����
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
