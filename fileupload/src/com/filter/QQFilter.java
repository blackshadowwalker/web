package com.filter;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QQFilter implements Filter {

	private int width = 150;//图片宽
	private int height = 30;//图片高

	public void destroy() {
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;

		Enumeration names = request.getHeaderNames();
		while(names.hasMoreElements()){
			String name = (String) names.nextElement();
			String value = request.getHeader(name);
			//System.out.println(name+"="+value);
		}
		
		String openid = request.getParameter("openid"); 
        String openkey = request.getParameter("openkey");
        System.out.println("openid="+openid+"  openkey="+openkey);        
		String referer = request.getHeader("referer");
		String qq ="";
		if(referer!=null)
		{
			String httpqq = "http://user.qzone.qq.com/";
			qq = (String) referer.substring(httpqq.length(), referer.indexOf("/infocenter"));
			System.out.println("QQ="+qq+"  referer="+referer);
		}

		response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		
		 BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        Graphics g = image.getGraphics();//产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
        g.fillRect(0, 0, width, height);
        g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
        g.setColor(new Color(0, 110, 133));
        g.drawString(qq, 1, 16);
        
        g.dispose();
        try {
            ImageIO.write(image, "JPEG", response.getOutputStream());//将内存中的图片通过流动形式输出到客户端
        } catch (Exception e) {
            e.printStackTrace();
        }


	}

	public void init(FilterConfig arg0) throws ServletException {

	}



}
