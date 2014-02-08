/*
 * @(#)codeAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud;

import java.util.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.apache.struts.action.*;
import modules.base.*;

/**
 * ����:����Ϊ������Ϣ��Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: codeAction.java,v 1.1 2012/09/30 01:54:04 Administrator Exp $
 */
public class cloudAction extends Action
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
        
        if(request.getSession().getId()!=bform.sessionID){
			System.out.println("����˻��Ѿ��������ͻ��˵�¼!");
			throw new CustomException("����˻��Ѿ��������ͻ��˵�¼!");
		}
        
        request.setAttribute("pagePath","Cloud Intelligetn Center.");
        
		
		baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
		// ���video���б�ID��name
        List videoID=new ArrayList();
        List videoName=new ArrayList();
        List videoUrl=new ArrayList();
        bb.getVideoList("", videoID, videoName, videoUrl, bform.user_code);
        request.setAttribute("videoID",videoID);
        request.setAttribute("videoName",videoName);
        request.setAttribute("videoUrl",videoUrl);
        
        System.out.println("cloudAction created!");
        
        return mapping.findForward("success");
    }
}
