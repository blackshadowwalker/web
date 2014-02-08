/*
 * @(#)gzsqAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.bmzx.gzsq;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * 功能:本类为工资申请的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: gzsqAction.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class gzsqAction extends Action
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
        return mapping.findForward("success");
    }
}
