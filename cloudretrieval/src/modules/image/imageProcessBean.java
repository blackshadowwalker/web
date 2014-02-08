/*
 * @(#)modules.ggfjBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.image;

import org.apache.log4j.Logger;

import com.image.ImageProcess;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * 功能:本类为公共附件的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: ggfjBean.java,v 1.1 2012/10/13 08:45:55 Administrator Exp $
 */
public class imageProcessBean extends ResourceClose
{
    private DataSource dataSource;

    public imageProcessBean()
    {
    }


    public imageProcessBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    public String FogRemove(String src, String dest,
    		ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
    	String thisPath = sc.getRealPath("/");
    	System.out.println(thisPath);
    	thisPath = thisPath.replaceAll("\\\\", "/");
    	dest = "imageout/"+dest;
    	String srcPath = thisPath+"/"+src;
    	String destPath = thisPath+"/"+dest;
    	System.out.println(srcPath+" -> "+destPath);
    	
    	ImageProcess im = new ImageProcess();
		im.FogRemove(srcPath, destPath);
    	return dest;
    }
    
    public String LowLight(String src, String dest,
    		ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
    	String thisPath = sc.getRealPath("/");
    	System.out.println(thisPath);
    	thisPath = thisPath.replaceAll("\\\\", "/");
    	dest = "imageout/"+dest;
    	String srcPath = thisPath+"/"+src;
    	String destPath = thisPath+"/"+dest;
    	System.out.println(srcPath+" -> "+destPath);
    	
    	ImageProcess im = new ImageProcess();
    	im.Retinex(srcPath, destPath);
//		im.LowLight(srcPath, destPath, 1, 254);
    	return dest;
    }
   
}
