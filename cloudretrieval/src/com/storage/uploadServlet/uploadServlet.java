package com.storage.uploadServlet;


import java.io.BufferedInputStream;  
import java.io.BufferedOutputStream;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.PrintWriter;
import java.text.SimpleDateFormat;  
import java.util.ArrayList;
import java.util.Date;  
import java.util.Enumeration;
import java.util.Iterator;  
import java.util.List;  

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.commons.fileupload.util.Streams;  
import org.apache.commons.io.FileCleaningTracker;

public class uploadServlet extends HttpServlet{  
	private static final long serialVersionUID = 1L;    

	/**  
	 * 实现多文件的同时上传  
	 */     

	public static void main(String []args){
		SimpleDateFormat curTime= new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		String newfileName = curTime.format(new Date());//文件名称    
		System.out.println(newfileName);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException, IOException 
	{    
		
		
		String callback = request.getParameter("callback");
		String uploadroot = request.getParameter("dirroot");
		String savePath = request.getParameter("dir");
		String fileTypes = request.getParameter("fileTypes");
		String fileNum = request.getParameter("fileNum");

		this.getServletConfig().getServletContext();

		uploadroot 	= (uploadroot == null)? request.getRealPath("/") : uploadroot;
		savePath 	= (savePath==null)? "tempdir" : savePath;
		fileTypes  	= (fileTypes==null)? "" : fileTypes;
		fileNum 	= (fileNum==null)? "0":fileNum;

		uploadroot = uploadroot.replace("\\", "/");
		//设置接收的编码格式    
		request.setCharacterEncoding("UTF-8");    
		String fileFullPath = "";//文件存放真实地址    
		String fileRealResistPath = "";//文件存放真实相对路径    
		String firstFileName="";    

		File file = new File(uploadroot+"/"+savePath);    
		if (!file.isDirectory()) {    
			file.mkdirs();    
		}    
		System.out.println("save path=" + uploadroot+"/"+savePath);    

		int fileuploadedSum = 0;
		StringBuffer fileNames = new StringBuffer();
		boolean uploaded = false;
		if(ServletFileUpload.isMultipartContent(request)){
			try {    
				 // create factory and file cleanup tracker
		        FileCleaningTracker tracker = FileCleanerCleanup.getFileCleaningTracker(getServletContext()); //required 
		        
				DiskFileItemFactory factory = new DiskFileItemFactory();  
				factory.setFileCleaningTracker(tracker);  
				
				ServletFileUpload upload = new ServletFileUpload(factory);    
				upload.setHeaderEncoding("UTF-8");    
				// 获取多个上传文件    
				List fileList = upload.parseRequest(request);    
				// 遍历上传文件写入磁盘    
				Iterator it = fileList.iterator();   
				System.out.println("fileListSize="+fileList.size());
				while (it.hasNext()) {    
					FileItem  item = (FileItem )it.next();  
					// 获得文件名及路径       
					String fileName = item.getName();    
					if (fileName != null && !fileName.equals("")) {    
						SimpleDateFormat curTime= new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
						String newfileName = curTime.format(new Date());//文件名称    

						fileName = fileName.replaceAll("\\\\", "/");
						System.out.println("fileName="+fileName);
						firstFileName=fileName.substring(fileName.lastIndexOf("\\")+1);    
						String formatName = fileName.substring(fileName.lastIndexOf("."));//获取文件后缀名    
						
						System.out.println("fileTypes="+fileTypes);
						if(fileTypes.isEmpty() || fileTypes.equals("*.*"))
							;
						else{
							int indexof = fileTypes.toLowerCase().indexOf(formatName.toLowerCase());
							if(formatName==null || indexof <0){
								System.out.println("this file type is not allow "+indexof+" @"+formatName);
								continue ;
							}
						}
						String fileFullName = "{"+fileNum + "_" + fileuploadedSum + "_" + newfileName +"}"+ formatName;
						fileFullPath = uploadroot + "/" + savePath  + "/" + fileFullName;//文件存放真实地址    

						System.out.println(fileFullPath);

						BufferedInputStream in = new BufferedInputStream(item.getInputStream());// 获得文件输入流    
						BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileFullPath)));// 获得文件输出流    
						Streams.copy(in, outStream, true);// 开始把文件写到你指定的上传文件夹    
						//上传成功  
						if (new File(fileFullPath).exists()) {    
							fileuploadedSum ++;
							uploaded = true;
						}  
						fileNames.append(fileFullName);
					fileNames.append(","+fileName);//汉字乱码
						fileNames.append("</C>");
					}     
				}     
			} catch (org.apache.commons.fileupload.FileUploadException ex) {  
				ex.printStackTrace();    
				System.out.println("upoad file failed!");    
				return;    
			}  
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// 设置字符编码为UTF-8, 这样支持汉字显示
		
		String retString= uploaded + "," + fileuploadedSum +  "," +fileNames.toString();
		String callBackString=("<script>parent."+callback+"("+uploaded + ","+fileuploadedSum+", '"+fileNames.toString()+"')</script>");

		if(callback!=null && !callback.equals(""))
			response.getWriter().write(callBackString);    
		else
			response.getWriter().write(retString);    
	}    

	public void doGet(HttpServletRequest req, HttpServletResponse resp)    
	throws ServletException, IOException {    

		resp.setContentType("textml");
		PrintWriter  out =  resp.getWriter();
		out.println("<html><head>");
		out.println("</head><body>");
		out.println("<h2>File Uplaod Server</h2>");
		out.println("<h3>Usage:</h3>");
		out.println("RFC 1867 'form based file upload in HTML'.");
		out.print("<br />");
		out.println("Content type of the POST request must be set to multipart/form-data");
		out.print("<br />");
		out.println("upload action url : upload/upload.do?");
		out.print("<br />");
		out.println("<B>Query parameter: </B>");
		out.print("<br />");
		out.println("savePath = destination directory of the file relative to user's workspace.Default is 'tempdir'");
		out.print("<br />");
		out.println("uploadroot = destination root directory, default is '/'.");
		out.print("<br />");
		out.println("fileTypes = the files types to  upload, format: mp4,avi,txt etc.");
		out.print("<br />");
		out.println("fileNum = the order of cur file to upload at onece submit.");
		out.print("<br />");
		out.print("<B>Returns: </B>");
		out.print("<br />");
		out.print("Format: BeUploaded,uploadedSum,filelist");
		out.print("<br />e.g:<br />");
		out.print("true,2,file1.avi&lt;/C&gt;file2.bmp&lt;/C&gt;");
		out.print("<br />");
		out.println("</body><ml>");
		out.close();

	}    
}  