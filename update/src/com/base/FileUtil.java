package com.base;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

public class FileUtil extends File {
	
	private static String tempDir = "temp";

	public FileUtil(File parent, String child) {
		super(parent, child);
	}
	
	public static boolean mkdirs(String dirname){
		File f = new File(dirname);
		return f.mkdirs();
	}
	/** [离线下载网络资源]下载远程文件
	 * @param url  		：远程URL 
	 * @param localPath ：本地存储路径
	 * @param fileName  : 文件名称
	 * @return boolean  : true | false
	 */
	public static boolean DownloadFileByUrl(String rpcUrl, String localPath, String fileName){
		String tempFileDir = localPath+"/"+tempDir;
		File f = new File(tempFileDir);
		f.mkdirs();
		boolean ret=false;
		URL url = null;
		URLConnection uc=null;
		try
		{
			url = new   URL( rpcUrl);
			uc = url.openConnection();
			InputStream   isStream   =   uc.getInputStream(); 
			File   file   =   new   File( tempFileDir + "/" + fileName); 
			FileOutputStream   out   =   new   FileOutputStream(file); 
			int   i=0; 
			while   ((i=isStream.read())!=-1)   { 
				out.write(i); 
			} 
			isStream.close();
	        out.close();
	        
	        File newFile = new File(localPath +"/"+fileName);
	        ret = file.renameTo(newFile);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		return ret;
	}
	
	public static boolean DownloadImageByUrl(String rpcurl, String localurl){
		URL url = null;
		URLConnection uc=null;
		try
		{
			url = new   URL( rpcurl);
			uc = url.openConnection();
			InputStream   is   =   uc.getInputStream(); 
			File   file   =   new   File( localurl); 
			FileOutputStream   out   =   new   FileOutputStream(file); 
			int   i=0; 
			while   ((i=is.read())!=-1)   { 
				out.write(i); 
			} 
	        is.close();
	        out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return false;
		} 
		return true;
	}
}
