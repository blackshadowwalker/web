/*
 * @(#)deptAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.dept;

import java.util.*;

import javax.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.*;


/**
 * ����:����Ϊ���������Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: deptAction.java,v 1.1 2012/09/30 01:54:31 Administrator Exp $
 */
public class deptAction extends Action
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
        List DeptLevelIDs=new ArrayList();
        List DeptLevelNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.dept_level", DeptLevelIDs,DeptLevelNames);
        request.setAttribute("DeptLevelIDs",DeptLevelIDs);
        request.setAttribute("DeptLevelNames",DeptLevelNames);
        // ��û������͵��б�ID��ֵ
        List DeptLxIDs=new ArrayList();
        List DeptLxNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.dept_lx", DeptLxIDs,DeptLxNames);
        request.setAttribute("DeptLxIDs",DeptLxIDs);
        request.setAttribute("DeptLxNames",DeptLxNames);
        // ���������б�ID��ֵ        
        List DeptAreaIDs=new ArrayList();
        List DeptAreaNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.dept_area", DeptAreaIDs,DeptAreaNames);
        request.setAttribute("DeptAreaIDs",DeptAreaIDs);
        request.setAttribute("DeptAreaNames",DeptAreaNames);
        
        // ��ò������͵��б�ID��ֵ        
        List BmLxIDs=new ArrayList();
        List BmLxNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.bm_lx", BmLxIDs,BmLxNames);
        request.setAttribute("BmLxIDs",BmLxIDs);
        request.setAttribute("BmLxNames",BmLxNames);
        
//      ��û��������ȼ����б�ID��ֵ
        List GradeIDs=new ArrayList();
        List GradeNames=new ArrayList();
        bb.getLevelInfos("t_s_dept_grade.grade", GradeIDs,GradeNames);
        request.setAttribute("GradeIDs",GradeIDs);
        request.setAttribute("GradeNames",GradeNames);
        
        

        List Gyqx_jglxIDs=new ArrayList();
        List Gyqx_jglxNames=new ArrayList();
        bb.getLevelInfos("t_s_dept.gyqx_jglx", Gyqx_jglxIDs,Gyqx_jglxNames);
        request.setAttribute("Gyqx_jglxIDs",Gyqx_jglxIDs);
        request.setAttribute("Gyqx_jglxNames",Gyqx_jglxNames);
        
        return mapping.findForward("success");
    }
}
