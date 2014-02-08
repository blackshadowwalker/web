/*
 * @(#)xsxxglAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.top;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.sql.*;
import javax.sql.DataSource;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * ����:����Ϊѧ����Ϣ�����Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: tzglAction.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class topAction extends Action
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

		baseBean bb=new baseBean((DataSource)servlet.getServletContext().getAttribute("basedb"));
		
		List languagesKeys=new ArrayList();
		List languagesNames=new ArrayList();
		bb.getLanguages(languagesKeys, languagesNames);
		
		request.setAttribute("languagesKeys",languagesKeys);
		request.setAttribute("languagesNames",languagesNames);
		
		return mapping.findForward("success");


	}
}
