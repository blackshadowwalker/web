/*
 * @(#)gzsqAction.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.bmzx.cwfh;

import java.io.*;
import java.util.*;
import java.sql.*;

import javax.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

import modules.base.*;

/**
 * ����:����Ϊ���񸴺˵�Action��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: cwfhAction.java,v 1.1 2012/09/30 07:06:46 Administrator Exp $
 */
public class cwfhAction extends Action
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
        
        // ���ѧУ�˶Ե��б�ID��ֵ
        List XxhdIDs=new ArrayList();
        List XxhdNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfhd", XxhdIDs,XxhdNames);
        request.setAttribute("XxhdIDs",XxhdIDs);
        request.setAttribute("XxhdNames",XxhdNames);
        // ������к˶Ե��б�ID��ֵ
        List YhhdIDs=new ArrayList();
        List YhhdNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfhd", YhhdIDs,YhhdNames);
        request.setAttribute("YhhdIDs",YhhdIDs);
        request.setAttribute("YhhdNames",YhhdNames);
        // ��ú˶Դ������͵��б�ID��ֵ
        List ErrorMsgIDs=new ArrayList();
        List ErrorMsgNames=new ArrayList();
        bb.getLevelInfos("Error_msg", ErrorMsgIDs,ErrorMsgNames);
        request.setAttribute("ErrorMsgIDs",ErrorMsgIDs);
        request.setAttribute("ErrorMsgNames",ErrorMsgNames);
        // ����Ƿ񷢷ŵ��б�ID��ֵ
        List SfffIDs=new ArrayList();
        List SfffNames=new ArrayList();
        bb.getLevelInfos("stu_salary.sfff", SfffIDs,SfffNames);
        request.setAttribute("SfffIDs",SfffIDs);
        request.setAttribute("SfffNames",SfffNames);
        // ���״̬���б�ID��ֵ
        List StatusIDs=new ArrayList();
        List StatusNames=new ArrayList();
        bb.getLevelInfos("status", StatusIDs,StatusNames);
        request.setAttribute("StatusIDs",StatusIDs);
        request.setAttribute("StatusNames",StatusNames);
        
        //get depts
        Connection con1=null;
		
		PreparedStatement pstm=null;
		DataSource dataSource=(DataSource)servlet.getServletContext().getAttribute("basedb");
		ResultSet rs=null;
		
		List deptIDs=new ArrayList();
		List deptNames=new ArrayList();
		

		try{
			con1=dataSource.getConnection();

			if(con1==null){

				//////////System.out.println("���ݿ�����ʧ�ܣ��������ӳ��Ƿ����ɹ����������С�");

				throw new CustomException("���ݿ�����ʧ�ܣ��������ӳ��Ƿ����ɹ����������С�");
			}

			// ȡ�����е� ����dept code and name
			
			pstm=con1.prepareStatement("select dept_code,dept_name from t_s_dept where status=1 and dept_code in (select dept_code from t_s_deptmgr where dept_manager='"+bform.dept_code+"') ");   

			rs=pstm.executeQuery();

			while(rs!=null && rs.next()){

				deptIDs.add(basePublic.out(rs.getString("dept_code").trim()));
				deptNames.add(basePublic.out(rs.getString("dept_name").trim()));
			}

		}
		catch(SQLException sql){

			sql.printStackTrace();

			throw new CustomException("�������ݿ����ӷ���Ĵ���...");
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("ת���ַ���ʱ���ִ���");
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("����δ֪�쳣����");
		}
		finally{
			//�ر����п�����Դ
			rs.close();
			pstm.close();
			con1.close();
		}
		
		request.setAttribute("deptIDs",deptIDs);
		request.setAttribute("deptNames",deptNames);
		
		System.out.println("deptIDs: " + deptIDs);
		System.out.println("deptNames: " + deptNames);
        
        return mapping.findForward("success");
    }
}
