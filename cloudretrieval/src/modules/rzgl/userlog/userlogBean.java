/*
 * @(#)rulerBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.rzgl.userlog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.TimeZone;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;


/**
 * ����:����ΪȨ����Ϣ��Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: rulerBean.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class userlogBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
  
    public userlogBean()
    {
    }
    /*
     * ������������ѯ��ϢAJAX
     */
    public String queryTSUserlog(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
        	basePublic.error("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
        	basePublic.error("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        
        StringBuffer countSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select id,user_code,user_name,user_ip,user_time,user_nr from t_s_czlog ");
            if(s!=null&&!s.equals("")){
            	sqlSB.append(" ");
            	sqlSB.append(s);
            }
            sqlSB.append(" order by user_time desc ");
            countSB.append("select count(1)  from  t_s_czlog " );
            if(s!=null&&!s.equals("")){
            	countSB.append(" ");
            	countSB.append(s);
            }
            System.out.println(sqlSB);
            System.out.println(countSB);
            rs=pm.list(con, perPage, curPage, countSB.toString(), basePublic.in(sqlSB.toString()));
            if(rs==null){
            	return "no";
            }
            
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
    
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                    infoSB.append(basePublic.out(rs.getString(i)) + "</C>");
                    //infoSB.append(rs.getString(i) + "</C>");
                }
                infoSB.append("</R>");
            }
            infoSB.append("|");
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ 
            		"��ѯ�û�������־��Ϣ�ɹ���",userlogBean.class.getName()); 
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog�������ݿ����Ӵ���,����Ϊ����ѯ�û�������־��Ϣʧ��!" + sql.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog����ת���ַ�����,����Ϊ����ѯ�û�������־��Ϣʧ��!" + ue.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog���ִ���,����Ϊ����ѯ�û�������־��Ϣʧ��!" + ce.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
        	pm.close(true);
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /*
     * ������������ѯ��ϸ��ϢAJAX
     */
    
    public String detailTSUserlog(String id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
{
    
    //�жϻ���ʵ���Ƿ�Ϊ��
    if (sc == null)
    {
    	basePublic.error("ServletContext Ϊ�գ����ء�");
        throw new CustomException("ServletContext Ϊ�գ�����");
    }

    //�жϻỰʵ���Ƿ�Ϊ��
    if (session==null)
    {
    	basePublic.error("HttpSession Ϊ�գ����ء�");
        throw new CustomException("HttpSession Ϊ�գ�����");
    }
    ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
    //�ж��û��Ƿ��¼
    baseForm bform=(baseForm)session.getAttribute("baseuser");
    
    if (bform==null)
    {
    	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
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
        	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|������������ѯȨ����Ϣ��t_s_ruler��ʱ�����ݿ�����ConnectionΪ�գ�����ʧ��");
        	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
        }

        infoSB=new StringBuffer();
        sqlSB=new StringBuffer();
        
        sqlSB.append("select user_code,user_name,user_ip,user_time,user_nr from t_s_czlog where id=?");
        pstm=con.prepareStatement(sqlSB.toString());
        pstm.setString(1, id);
        rs=pstm.executeQuery();
        if (rs!=null && rs.next())
        {
        	infoSB.append(id).append("</C>");
			infoSB.append(rs.getString("user_code")).append("</C>");
			infoSB.append(rs.getString("user_name")).append("</C>");
			infoSB.append(rs.getString("user_ip")).append("</C>");
			infoSB.append(rs.getString("user_time")).append("</C>");
			infoSB.append(basePublic.out(rs.getString("user_nr"))).append("</C></R>");
        }
        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ѯ�û�������־��ϸ��Ϣ�ɹ���",userlogBean.class.getName());
        return infoSB.toString();
    }
    catch (SQLException sql)
	{
		sql.printStackTrace();
		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
				.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
				+ bform.user_name + "</C>" + bform.clientIP + "</C>"
				+ "userlogBean.detailTSUserlog�������ݿ����Ӵ���,����Ϊ����ѯ�û�������־��ϸ��Ϣʧ��!" + sql.getMessage(),userlogBean.class.getName());
		throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
	}
	catch (Exception ce)
	{
		ce.printStackTrace();
		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
				.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
				+ bform.user_name + "</C>" + bform.clientIP + "</C>"
				+ "userlogBean.detailTSUserlog���ִ���,����Ϊ����ѯ�û�������־��ϸ��Ϣʧ��!" + ce.getMessage(),userlogBean.class.getName());
		throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
	}
    finally
    {

        close(rs,pstm,null,con);
    }
}
    
}
