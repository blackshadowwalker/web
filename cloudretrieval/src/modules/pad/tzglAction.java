/*
 * @(#)xsxxglAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.pad;

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
public class tzglAction extends Action
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

//		// ������д�����б�ID��ֵ
//		List BankCodeIDs=new ArrayList();
//		List BankCodeNames=new ArrayList();
//		
//		bb.getLevelInfos("stu_info.bank_code", BankCodeIDs,BankCodeNames);
//		request.setAttribute("BankCodeIDs",BankCodeIDs);
//		request.setAttribute("BankCodeNames",BankCodeNames);
//		// ����Ա���б�ID��ֵ
//		List StuSexIDs=new ArrayList();
//		List StuSexNames=new ArrayList();
//		bb.getLevelInfos("stu_info.stu_sex", StuSexIDs,StuSexNames);
//		request.setAttribute("StuSexIDs",StuSexIDs);
//		request.setAttribute("StuSexNames",StuSexNames);
//		// ���״̬���б�ID��ֵ
//		List StatusIDs=new ArrayList();
//		List StatusNames=new ArrayList();
//		bb.getLevelInfos("status", StatusIDs,StatusNames);
//		request.setAttribute("StatusIDs",StatusIDs);
//		request.setAttribute("StatusNames",StatusNames);
		
		
		return mapping.findForward("success");


	}
}
