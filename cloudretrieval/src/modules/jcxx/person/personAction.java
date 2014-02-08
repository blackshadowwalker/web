/*
 * @(#)personAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.person;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * 功能:本类为人员基本信息的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: personAction.java,v 1.1 2012/09/30 01:54:31 Administrator Exp $
 */
public class personAction extends Action
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
        request.setAttribute("language", bform.language);
        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
        
        String rulerCode = (String)request.getParameter("qx");
        System.out.println("rulerCode="+rulerCode);
        List rulerCodeList = new ArrayList();
        List rulerNameList = new ArrayList();
        bb.getRulers(rulerCode, rulerCodeList, rulerNameList);
        request.setAttribute("rulerCodeList", rulerCodeList);
        request.setAttribute("rulerNameList", rulerNameList);
        
        // 获得性别的列表ID和值
        List XbIDs=new ArrayList();
        List XbNames=new ArrayList();
        bb.getLevelInfos("t_u_person.xb", XbIDs,XbNames);
        request.setAttribute("XbIDs",XbIDs);
        request.setAttribute("XbNames",XbNames);
        
        List RoleIDs=new ArrayList();
        List RoleNames=new ArrayList();
        bb.getrole(RoleIDs,RoleNames);
        request.setAttribute("RoleIDs",RoleIDs);
        request.setAttribute("RoleNames",RoleNames);
      
        return mapping.findForward("success");
    }
}
