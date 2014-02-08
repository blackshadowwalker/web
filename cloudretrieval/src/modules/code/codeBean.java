/*
 * @(#)codeBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.code;

import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import modules.log.*;
import javax.sql.DataSource;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * ����:����Ϊ������Ϣ��Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: codeBean.java,v 1.1 2012/09/30 01:54:04 Administrator Exp $
 */
public class codeBean extends ResourceClose
{   
    public codeBean()
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
     * ɾ��������ϢAJAX
     */
    public int deleteTSCode(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // �жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }

        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
        	
            con=ds.getConnection();
            
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            int num = 0;
            
            pstm=con.prepareStatement("delete from  t_s_code where id=?");

            pstm.setLong(1, id);
            
            num = pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "ɾ����׼���ݹ�����Ϣ�ɹ���",codeBean.class.getName());            
            return num;

        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.deleteTSCode�������ݿ����Ӵ���,����Ϊ��ɾ����׼���ݹ�����Ϣʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.deleteTSCode���ִ���,����Ϊ��ɾ����׼���ݹ�����Ϣʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }

    /*
     * ��Ӵ�����ϢAJAX
     */
    public int addTSCode(String labels,String values,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //�ж��û��Ƿ��¼
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }

        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            sqlSB=new StringBuffer();
            
            sqlSB.append("insert into t_s_code(").append(labels).append(") values (").append(values).append(")");
            
           
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
           
            int num=pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ӱ�׼���ݹ�����Ϣ�ɹ���",codeBean.class.getName());            
            return num;
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.addTSCode�������ݿ����Ӵ���,����Ϊ����ӱ�׼���ݹ�����Ϣʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.addTSCode����ת���ַ�����,����Ϊ����ӱ�׼���ݹ�����Ϣʧ��!" + ue.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.addTSCode���ִ���,����Ϊ����ӱ�׼���ݹ�����Ϣʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }


    /*
     * �޸�ǰ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
     */
    public String beforeUpdateTSCode(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
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
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            infoSB=new StringBuffer();
            
            pstm=con.prepareStatement("select type,code,value,content from t_s_code where id=?");
            
            pstm.setLong(1, id);
            
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(id).append("</C>");
                infoSB.append(rs.getString("type")).append("</C>");
                infoSB.append(rs.getString("code")).append("</C>");
                infoSB.append(basePublic.out(rs.getString("value"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("content"))).append("</C></R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��׼���ݹ�����Ϣ�޸�ǰ��ѯ�ɹ���",codeBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.beforeUpdateTSCode�������ݿ����Ӵ���,����Ϊ����׼���ݹ�����Ϣ�޸�ǰ��ѯʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.beforeUpdateTSCode����ת���ַ�����,����Ϊ����׼���ݹ�����Ϣ�޸�ǰ��ѯʧ��!" + ue.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.beforeUpdateTSCode���ִ���,����Ϊ����׼���ݹ�����Ϣ�޸�ǰ��ѯʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * �޸Ĵ�����ϢAJAX
     */
    public int updateTSCode(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }


        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            sqlSB=new StringBuffer();

            sqlSB.append("update t_s_code set ").append(values).append(" where id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();

            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "�޸ı�׼���ݹ�����Ϣ�ɹ���",codeBean.class.getName());           
           return num;
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.updateTSCode�������ݿ����Ӵ���,����Ϊ���޸ı�׼���ݹ�����Ϣʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.updateTSCode����ת���ַ�����,����Ϊ���޸ı�׼���ݹ�����Ϣʧ��!" + ue.getMessage(),codeBean.class.getName());
			throw new CustomException("ת���ַ���ʱ���ִ���");
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.updateTSCode���ִ���,����Ϊ���޸ı�׼���ݹ�����Ϣʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }
    
    /*
     * ������������ѯ������ϢAJAX
     */
    public String queryTSCode(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
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
        //PreparedStatement pstm=null;//����Ԥ�������
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
            
            sqlSB.append("select id,type,code,value from t_s_code ");
            countSB.append("select count(*) from t_s_code");
            
            
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                countSB.append(s);
            }
            
            sqlSB.append(" and status=1 order by id desc");
            countSB.append(" and status=1 order by id desc");
            
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
            
            if(rs==null){
            	
            	return "no";
            }
           
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                    infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                }

                infoSB.append("</R>");
            }
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ѯ��׼���ݹ�����Ϣ�ɹ���",codeBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.queryTSCode�������ݿ����Ӵ���,����Ϊ����ѯ��׼���ݹ�����Ϣʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.queryTSCode����ת���ַ�����,����Ϊ����ѯ��׼���ݹ�����Ϣʧ��!" + ue.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.queryTSCode���ִ���,����Ϊ����ѯ��׼���ݹ�����Ϣʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
        	pm.close(true);
        	
        	close(rs,null,null,con);
            //�ر����п�����Դ
           // close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * ����IDֵ��ѯ��ϸ�Ĵ�����ϢAJAX
     */
    public String detailTSCode(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
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
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            infoSB=new StringBuffer();
            
            pstm=con.prepareStatement("select type,code,value,content from t_s_code where id=?");
            //pstm.setObject(1, Integer.valueOf(s));
            pstm.setLong(1, id);
            
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(id).append("</C>");
                infoSB.append(rs.getString("type")).append("</C>");
                infoSB.append(rs.getString("code")).append("</C>");
                infoSB.append(basePublic.out(rs.getString("value"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("content"))).append("</C></R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��׼���ݹ�����ϸ��Ϣ��ѯ�ɹ���",codeBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.detailTSCode�������ݿ����Ӵ���,����Ϊ����׼���ݹ�����ϸ��Ϣ��ѯʧ��!" + sql.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.detailTSCode����ת���ַ�����,����Ϊ����׼���ݹ�����ϸ��Ϣ��ѯʧ��!" + ue.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "codeBean.detailTSCode���ִ���,����Ϊ����׼���ݹ�����ϸ��Ϣ��ѯʧ��!" + ce.getMessage(),codeBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
}