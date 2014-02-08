/*
 * @(#)roleAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.statistic;

import java.util.*;
import javax.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.baseBean;
import modules.base.baseForm;

/**
 * 功能:本类为角色信息的Action类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: roleAction.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class statisticAction extends Action
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
    	(request.getSession()).setAttribute("picture", servlet.getServletContext().getInitParameter("picture"));

        if (bform==null)
            return mapping.findForward("failure");
        
        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
        
        // 获得机构级别的列表ID和值
        //List<String> DeptLevelIDs=new ArrayList<String>();
        //List<String> DeptLevelNames=new ArrayList<String>();
        List DeptLevelIDs=new ArrayList();
        List DeptLevelNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.dept_level", DeptLevelIDs,DeptLevelNames);
        request.setAttribute("DeptLevelIDs",DeptLevelIDs);
        request.setAttribute("DeptLevelNames",DeptLevelNames);
        
        return mapping.findForward("success");
    }
}
