package com.storage.uploadServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.base.FileUtil;

/**
 * 下载远程 文件，输入URL即可下载
 * 
 */
public class RemoteDownloadServlet extends HttpServlet{

	SimpleDateFormat curTime= new SimpleDateFormat("yyyyMMddHHmmssSSS"); 


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		String baseUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		JSONObject jsonmsg = new JSONObject();
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 

		String callback = request.getParameter("callback");
		String uploadroot = request.getParameter("dirroot");
		uploadroot 	= (uploadroot == null)? request.getRealPath("/") : uploadroot;
		String savePath = request.getParameter("dir");
		if(savePath==null)
			savePath = "/filesDownloaded";
		String fileExt = request.getParameter("fileExt");

		ServletContext sc = this.getServletConfig().getServletContext();

		String realPath = sc.getRealPath("/"); 
		String contexPath = sc.getContextPath();

		realPath = realPath.replace("\\", "/");
		int index = realPath.lastIndexOf(contexPath);
		if(index>0)
			uploadroot =  realPath.substring(0, index);
		else
			uploadroot =  realPath;
		if(savePath.startsWith("/")==false)
			savePath = "/temp/"+ savePath;

		System.out.println("uploadroot="+uploadroot);
		uploadroot = uploadroot.replace("\\", "/");
		if(uploadroot.endsWith("/"))
			uploadroot = uploadroot.substring(0, uploadroot.length()-1);

		String url = request.getParameter("url");
		if(url==null){
			out.print("Please set url=?");
			out.close();
		}else{
			String newfileName = curTime.format(new Date()); //文件名称    

			String fileName = url.substring(url.lastIndexOf('/')+1);
			if(fileExt==null){
				fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
				if(fileExt==null || fileExt.equals(fileName))
					fileExt = ".file";
				else
					fileExt = "."+fileExt;
			}
			
			if(FileUtil.DownloadFileByUrl(url, uploadroot+"/"+savePath, newfileName+fileExt)){
				jsonmsg.element("error", 0);
				jsonmsg.element("filename", newfileName+fileExt);
				jsonmsg.element("url", baseUrl+savePath+"/"+newfileName+fileExt);
				jsonmsg.element("filepath", uploadroot+"/"+savePath+"/"+newfileName+fileExt);
				String callBackString=("<script>parent.window."+callback+"("+jsonmsg.toString()+")</script>");

				if(callback!=null && !callback.equals("")){
					response.getWriter().write(callBackString);
				}
				else
					response.getWriter().write(jsonmsg.toString());    
			}else{
				jsonmsg.element("error", -1);
				jsonmsg.element("msg", "文件下载失败");
				response.getWriter().write(jsonmsg.toString());    
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.doGet(req, resp);
	}



}
