/*
 * @(#)rulerAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.ruler;

import java.util.*;

import javax.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import modules.base.baseBean;
import modules.base.baseForm;

/**
 * ����:����ΪȨ����Ϣ��Action��
 *
 * @author  �������д
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
        // ���Ȩ�޼�����б�ID��ֵ
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
