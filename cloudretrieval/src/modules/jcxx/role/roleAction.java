/*
 * @(#)roleAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.role;

import java.util.*;

import javax.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.baseBean;
import modules.base.baseForm;

/**
 * ����:����Ϊ��ɫ��Ϣ��Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: roleAction.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class roleAction extends Action
{

    public ActionForward execute(
        ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception
    {
    	//�ж��û��Ƿ��¼
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
        // ��û���������б�ID��ֵ
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