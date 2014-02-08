/*
 * @(#)codeBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.mmxg;

import java.io.UnsupportedEncodingException;
import java.sql.*;

import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import modules.base.*;
import modules.jcxx.dept.deptBean;

/**
 * ����:����Ϊ������Ϣ��Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: mmxgBean.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class mmxgBean extends ResourceClose
{
    //private String date = TimeBean.getCurrentTime();
    
    public mmxgBean()
    {
    }

    /*
     * ���캯��
     */
    /*
    public codeBean(DataSource dataSource)
    {
    }
    */

    /*
     * �޸Ĵ�����ϢAJAX
     */
    public int updatePassword(String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            //////System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            //////System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }

        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        int num = 0;
        DataSource ds=null;
        
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            String[] message = values.split(",");

            pstm=con.prepareStatement("select 1 from t_u_person where user_code=? and passwd=? and status=1");
            pstm.setString(1, message[0]);
            pstm.setString(2, message[1]);

            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
            	close(rs,pstm,null,null);
            	
            	pstm = con.prepareStatement("update t_u_person set passwd = ? where user_code=? and status=1");
            	pstm.setString(1, message[2]);
            	pstm.setString(2, message[0]);
            	
            	num=pstm.executeUpdate();
            	
            	LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
     					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
     					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
     					+ "�����޸ģ�",mmxgBean.class.getName());
            }
            else
            {
            
            	num = -1;
            	
            	  LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
      					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
      					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
      					+ "mmxgBean.updatePassword�������ݿ���󣬲���Ϊ��" 
      					+"�����޸�ʧ��:δ��ȷ���������",mmxgBean.class.getName());
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "mmxgBean.updatePassword�������ݿ���󣬲���Ϊ��" 
					+"�����޸�ʧ��ʧ��" + sql.getMessage(),mmxgBean.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���..."+sql.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "mmxgBean.updatePassword���ִ��󣬲���Ϊ��" 
					+"�����޸�ʧ��ʧ��" + ce.getMessage(),mmxgBean.class.getName());
            throw new CustomException("����δ֪�쳣����:"+ce.getMessage());
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return num;
    }
    
    /*
     * �޸�ǰ����idֵ��ѯ��ϸ�Ŀͻ���Ϣ����AJAX
     */
    public String bforup(ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            pstm = con.prepareStatement("select jh,user_name,tupian from t_u_person where user_code='"+bform.user_code+"'");
            rs = pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
         	   infoSB.append(rs.getString("jh")).append("</C>");
         	   infoSB.append(rs.getString("user_name")).append("</C>");
         	   
         	  infoSB.append(rs.getString("tupian")).append("</C></R>");
            }
           
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
       
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    
    /*
     * �޸�ǰ����idֵ��ѯ��ϸ�Ŀͻ���Ϣ����AJAX
     */
    public String forup(String xx,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            System.out.println("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            pstm = con.prepareStatement("update t_u_person set "+xx+" where user_code='"+bform.user_code+"'");
            pstm.execute();
            
            close(null,pstm,null,null);
           
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
       
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    public static String digest(String strBlock) throws CryptixException
	{
		if (strBlock == null)
			return null;

		try
		{
			SHA1 sha1 = new SHA1();
			return Hex.toString(sha1.digest(strBlock.getBytes()));
		}
		catch(CryptixException t)
		{
			return null;
		}
	}
}