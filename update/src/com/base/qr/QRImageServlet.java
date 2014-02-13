package com.base.qr;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.base.FileUtil;
import com.base.qr.QRCodeUtil;

/*
 * Input :  text
 * Output : QRCode image
 * e.g:
 *  http://10.168.1.110/TeleframeService/qrservice?text=http://www.baidu.com&logo="logo/logo.jpg"
 *  http://10.168.1.110/TeleframeService/qrservice?text=http://www.baidu.com&logo="http://www.baidu.com/img/bdlogo.gif"
 */
public class QRImageServlet extends HttpServlet {
	
	SimpleDateFormat fileNameTimeFormat= new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss-SSS");

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String qrName = fileNameTimeFormat.format(new Date())+".jpg";//文件名称 
		
		String text = (String) request.getParameter("text");
		if(text==null)
		{
			this.Help(request, response);
		}else{
			ServletContext sc = this.getServletContext();
			if(sc==null)
				return;
			
			String logoPath  = "";
			String thisPath = sc.getRealPath("/");
			String thisName = sc.getContextPath();
			thisPath = thisPath.replaceAll("\\\\", "/");
			
			String logUrl =request.getParameter("logo");
			if(logUrl!=null && !logUrl.isEmpty())
			{
				String localUrl = sc.getRealPath("/")+"temp/";
				File f= new File(localUrl);
				f.mkdir();
				localUrl +=  fileNameTimeFormat.format(new Date())+".png";
				if(FileUtil.DownloadImageByUrl(logUrl, localUrl))
					logoPath = localUrl;
			}else{
				logoPath = thisPath + (String) sc.getInitParameter("logo");
			}
			System.out.println("logoPath = "+logoPath);
			
			response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
	        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expire", 0);
			BufferedImage image;
			try {
				image = QRCodeUtil.encodeStream(text, logoPath, true);
				ImageIO.write(image, "JPEG", response.getOutputStream());
			} catch (Exception e) {
				e.printStackTrace();
			}
		//	System.out.println(qrImageRoot+"/"+qrServicePath+"/"+qrName);
			//response.getWriter().write("sucess");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
	public void Help(HttpServletRequest request, HttpServletResponse response){

		RequestDispatcher rd = request.getRequestDispatcher("modules/help/qrcode.jsp");   
		try {
			rd.forward(request,response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
