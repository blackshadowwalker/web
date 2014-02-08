/*
 * @(#)ggfjAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
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
 * ����:����Ϊ����������Action��
 *
 * @author  �������д
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
    	//�ж��û��Ƿ��¼
    	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    	
        if (bform==null)
            return mapping.findForward("failure");
        
        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
        
        // ����ϴ��û����б�ID��ֵ
        List PersonIDs=new ArrayList();
        List PersonNames=new ArrayList();
        bb.getLevelInfos("t_s_ggfj.person", PersonIDs,PersonNames);
        request.setAttribute("PersonIDs",PersonIDs);
        request.setAttribute("PersonNames",PersonNames);
        // ���״̬���б�ID��ֵ
        List StatusIDs=new ArrayList();
        List StatusNames=new ArrayList();
        bb.getLevelInfos("t_s_ggfj.status", StatusIDs,StatusNames);
        request.setAttribute("StatusIDs",StatusIDs);
        request.setAttribute("StatusNames",StatusNames);
        return mapping.findForward("success");
    }
}
