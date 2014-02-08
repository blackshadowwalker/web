/*
 * @(#)gzsqAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.bmzx.cwfh;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * 功能:本类为财务复核的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: cwfhAction.java,v 1.1 2012/09/30 07:06:46 Administrator Exp $
 */
public class cwfhAction extends Action
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
        
        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
        
        // 获得学校核对的列表ID和值
        List XxhdIDs=new ArrayList();
        List XxhdNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfhd", XxhdIDs,XxhdNames);
        request.setAttribute("XxhdIDs",XxhdIDs);
        request.setAttribute("XxhdNames",XxhdNames);
        // 获得银行核对的列表ID和值
        List YhhdIDs=new ArrayList();
        List YhhdNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfhd", YhhdIDs,YhhdNames);
        request.setAttribute("YhhdIDs",YhhdIDs);
        request.setAttribute("YhhdNames",YhhdNames);
        // 获得核对错误类型的列表ID和值
        List ErrorMsgIDs=new ArrayList();
        List ErrorMsgNames=new ArrayList();
        bb.getLevelInfos("Error_msg", ErrorMsgIDs,ErrorMsgNames);
        request.setAttribute("ErrorMsgIDs",ErrorMsgIDs);
        request.setAttribute("ErrorMsgNames",ErrorMsgNames);
        // 获得是否发放的列表ID和值
        List SfffIDs=new ArrayList();
        List SfffNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfff", SfffIDs,SfffNames);
        request.setAttribute("SfffIDs",SfffIDs);
        request.setAttribute("SfffNames",SfffNames);
        // 获得状态的列表ID和值
        List StatusIDs=new ArrayList();
        List StatusNames=new ArrayList();
        bb.getLevelInfos("status", StatusIDs,StatusNames);
        request.setAttribute("StatusIDs",StatusIDs);
        request.setAttribute("StatusNames",StatusNames);
        
        //get depts
        Connection con1=null;
		
		PreparedStatement pstm=null;
		DataSource dataSource=(DataSource)servlet.getServletContext().getAttribute("basedb");
		ResultSet rs=null;
		
		List deptIDs=new ArrayList();
		List deptNames=new ArrayList();
		

		try{
			con1=dataSource.getConnection();

			if(con1==null){

				//////////System.out.println("数据库连接失败，请检查连接池是否建立成功或正常运行。");

				throw new CustomException("数据库连接失败，请检查连接池是否建立成功或正常运行。");
			}

			// 取出所有的 部门dept code and name
			
			pstm=con1.prepareStatement("select dept_code,dept_name from t_s_dept where status=1 and dept_code in (select dept_code from t_s_deptmgr where dept_manager='"+bform.dept_code+"') ");   

			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptIDs.add(basePublic.out(rs.getString("dept_code").trim()));
				deptNames.add(basePublic.out(rs.getString("dept_name").trim()));
			}

		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("出现数据库连接方面的错误...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("转化字符集时出现错误。");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("出现未知异常错误。");
		}
		finally{
			//关闭所有可用资源
			rs.close();
			pstm.close();
			con1.close();
		}
		
		request.setAttribute("deptIDs",deptIDs);
		request.setAttribute("deptNames",deptNames);
		
		System.out.println("deptIDs: " + deptIDs);
		System.out.println("deptNames: " + deptNames);
        
        return mapping.findForward("success");
    }
}
