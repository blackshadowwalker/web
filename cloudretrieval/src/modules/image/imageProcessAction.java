/*
 * @(#)ggfjAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.image;

import java.util.*;
import java.sql.*;
import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * 功能:本类为公共附件的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: ggfjAction.java,v 1.1 2012/10/13 08:45:55 Administrator Exp $
 */
public class imageProcessAction extends Action
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
        
        // 获得上传用户的列表ID和值
        List PersonIDs=new ArrayList();
        List PersonNames=new ArrayList();
        bb.getLevelInfos("t_s_ggfj.person", PersonIDs,PersonNames);
        request.setAttribute("PersonIDs",PersonIDs);
        request.setAttribute("PersonNames",PersonNames);
        // 获得状态的列表ID和值
        List StatusIDs=new ArrayList();
        List StatusNames=new ArrayList();
        bb.getLevelInfos("t_s_ggfj.status", StatusIDs,StatusNames);
        request.setAttribute("StatusIDs",StatusIDs);
        request.setAttribute("StatusNames",StatusNames);
        return mapping.findForward("success");
    }
}
