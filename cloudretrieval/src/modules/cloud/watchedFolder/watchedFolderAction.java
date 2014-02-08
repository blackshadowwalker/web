/*
 * @(#)codeAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.cloud.watchedFolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.ServletContext;
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
public class watchedFolderAction extends Action
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
    	(request.getSession()).setAttribute("picture", servlet.getServletContext().getInitParameter("picture"));

        if (bform==null)
            return mapping.findForward("failure");
        request.setAttribute("pagePath","fileMgr Intelligetn Center.");

        baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
		ServletContext sc = servlet.getServletContext();
		DataSource ds=(DataSource)sc.getAttribute("basedb");
		Connection con = ds.getConnection();
		if (con==null){
			throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
		}
		PreparedStatement pstm = con.prepareStatement("select * from t_m_baseinfo where status=1 and work=1 limit 1");
		ResultSet rs = pstm.executeQuery();
		if(rs!=null && rs.next()){
			request.setAttribute("uploadServer", rs.getString("uploadServer"));
			request.setAttribute("uploadroot", rs.getString("uploadroot"));
			request.setAttribute("uploadurl", rs.getString("uploadurl"));
			request.setAttribute("uploadflash", rs.getString("uploadflash"));
		}
rs.close();
con.close();
        System.out.println("watched folder fileMgr Action!");
        
        return mapping.findForward("success");
    }
}
