/*
 * @(#)codeAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.realAnaly;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.apache.struts.action.*;

import modules.base.*;

/**
 * 功能:本类为代码信息的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: codeAction.java,v 1.1 2012/09/30 01:54:04 Administrator Exp $
 */
public class realAnalyAction extends Action
{

    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception
    {
    	//判断用户是否登录
    	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    	
        if (bform==null)
            return mapping.findForward("failure");
        
        if(request.getSession().getId()!=bform.sessionID){
			System.out.println("你的账户已经从其他客户端登录!");
			throw new CustomException("你的账户已经从其他客户端登录!");
		}
        
        request.setAttribute("pagePath","fileMgr Intelligetn Center.");

        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
		ServletContext sc = servlet.getServletContext();
		DataSource ds=(DataSource)sc.getAttribute("basedb");
		Connection con = ds.getConnection();
		if (con==null){
			throw new CustomException("数据库连接Connection为空，连接失败。");
		}
		PreparedStatement pstm = con.prepareStatement("select * from t_m_baseinfo where status=1 and work=1 limit 1");
		ResultSet rs = pstm.executeQuery();
		if(rs!=null && rs.next()){
		
			(request.getSession()).setAttribute("uploadroot", rs.getString("uploadroot"));
			(request.getSession()).setAttribute("uploadurl", rs.getString("uploadurl"));
			(request.getSession()).setAttribute("uploadflash", rs.getString("uploadflash"));
			(request.getSession()).setAttribute("defaultSoapUrl", rs.getString("defaultSoapUrl"));
			(request.getSession()).setAttribute("defaultuploadpath", rs.getString("defaultuploadpath"));
			(request.getSession()).setAttribute("defaultAuthName", rs.getString("defaultAuthName"));
			(request.getSession()).setAttribute("defaultAuthPwd", rs.getString("defaultAuthPwd"));
			(request.getSession()).setAttribute("defaultTaskpriority", rs.getString("defaultTaskpriority"));

			request.setAttribute("uploadServer", rs.getString("uploadServer"));
			request.setAttribute("uploadroot", rs.getString("uploadroot"));
			request.setAttribute("uploadurl", rs.getString("uploadurl"));
			request.setAttribute("uploadflash", rs.getString("uploadflash"));
			request.setAttribute("defaultSoapUrl", rs.getString("defaultSoapUrl"));
			request.setAttribute("defaultuploadpath", rs.getString("defaultuploadpath"));
			request.setAttribute("defaultAuthName", rs.getString("defaultAuthName"));
			request.setAttribute("defaultAuthPwd", rs.getString("defaultAuthPwd"));
			request.setAttribute("defaultTaskpriority", rs.getString("defaultTaskpriority"));
			
		}
		rs.close();
		pstm.close();
		con.close();
        System.out.println("fileMgr Action!");
        return mapping.findForward("success");
    }
}
