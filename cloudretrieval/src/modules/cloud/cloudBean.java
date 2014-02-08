/*
 * @(#)codeBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud;

import java.net.URL;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import modules.base.*;


public class cloudBean extends ResourceClose
{   
	private boolean bDebug = false;
	
	public cloudBean()
	{
	}
	
	public int saveURLStream(String srcUrl, String destUrl)
	throws IOException
	{
		URL url = null;
		url = new URL(srcUrl);
		File outFile = new File(destUrl);				
		OutputStream os;
		os = new FileOutputStream(outFile);
		InputStream is = null;
		is = url.openStream();
		byte[] buff = new byte[1024];				
		while(true) {					
			int readed = 0;
			readed = is.read(buff);
			if(readed == -1) {						
				break;					
			}					
			byte[] temp = new byte[readed];					
			System.arraycopy(buff, 0, temp, 0, readed);					
			os.write(temp);
		}
		is.close();                                 
		os.close();
		return 1;
	}

	public static void main(String[] args)  {
		cloudBean c = new cloudBean();
		String src = "http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=790";
		String dest="d:/url.jpg";
		try
		{
			c.saveURLStream(src, dest);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
}