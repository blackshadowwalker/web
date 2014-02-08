/*
 * @(#)rulerAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.ruler;

import java.util.*;

import javax.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.baseBean;
import modules.base.baseForm;

/**
 * 功能:本类为权限信息的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: rulerAction.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class rulerAction extends Action
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
        String rulerCode = (String)request.getParameter("qx");
        System.out.println("rulerCode="+rulerCode);
        List rulerCodeList = new ArrayList();
        List rulerNameList = new ArrayList();
        bb.getRulers(rulerCode, rulerCodeList, rulerNameList);
        request.setAttribute("rulerCodeList", rulerCodeList);
        request.setAttribute("rulerNameList", rulerNameList);
        // 获得权限级别的列表ID和值
        List RulerLevelIDs=new ArrayList();
        List RulerLevelNames=new ArrayList();
        bb.getLevelInfos("t_s_ruler.ruler_level", RulerLevelIDs,RulerLevelNames);
        request.setAttribute("RulerLevelIDs",RulerLevelIDs);
        request.setAttribute("RulerLevelNames",RulerLevelNames);
        
        List RulerEchoIDs=new ArrayList();
        List RulerEchoNames=new ArrayList();
        bb.getLevelInfos("t_s_ruler.ruler_echo", RulerEchoIDs,RulerEchoNames);
        request.setAttribute("RulerEchoIDs",RulerEchoIDs);
        request.setAttribute("RulerEchoNames",RulerEchoNames);
       
        return mapping.findForward("success");
    }
}
