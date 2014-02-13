package com.base;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

public class FileUtil extends File {

	public FileUtil(File parent, String child) {
		super(parent, child);
	}
	
	public static boolean mkdirs(String dirname){
		File f = new File(dirname);
		return f.mkdirs();
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
