/*
 * @(#)rulerBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.ruler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.util.ResourceBundle;
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
public class rulerBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
  
    public rulerBean()
    {
    }

    /*
     * ���캯��
     */
    /*
    public rulerBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
	*/
    /*
     * ɾ��Ȩ����ϢAJAX
     */
    public int deleteTSRuler(String value,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // �жϻ���ʵ���Ƿ�Ϊ��
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

        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        //ResultSet rs=null;//�����ѯ�Ľ����
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            { 
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|ɾ��Ȩ����Ϣ��t_s_ruler��ʱ�����ݿ�����ConnectionΪ�գ�����ʧ��");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            sqlSB=new StringBuffer();
            int num = 0;

            sqlSB.append("update t_s_ruler set status=0 where id=?");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            pstm.setLong(1,Long.parseLong(value));
            
            num = pstm.executeUpdate();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "ɾ���˵�������Ϣ�ɹ���",rulerBean.class.getName());
            return num;

        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler�������ݿ����Ӵ���,����Ϊ��ɾ���˵�������Ϣʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler����ת���ַ�����,����Ϊ��ɾ���˵�������Ϣʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.deleteTSRuler���ִ���,����Ϊ��ɾ���˵�������Ϣʧ��!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }

    }

    /*
     * ���Ȩ����ϢAJAX
     */
    public String addTSRuler(String labels,String values,ServletContext sc,HttpSession session)
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
        //ResultSet rs=null;//�����ѯ�Ľ����
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|���Ȩ����Ϣ��t_s_ruler��ʱ�����ݿ�����ConnectionΪ�գ�����ʧ��");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("insert into t_s_ruler(").append(labels).append(") values (").append(values).append(")");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            int num=pstm.executeUpdate();
            infoSB.append(Integer.toString(num)).append("</C></R>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��Ӳ˵�������Ϣ�ɹ���",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler�������ݿ����Ӵ���,����Ϊ����Ӳ˵�������Ϣʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler����ת���ַ�����,����Ϊ����Ӳ˵�������Ϣʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.addTSRuler���ִ���,����Ϊ����Ӳ˵�������Ϣʧ��!" + ce.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
		}
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
        return infoSB.toString();
    }


    /*
     * �޸�ǰ����IDֵ��ѯ��ϸ��Ȩ����ϢAJAX
     */
    public String beforeUpdateTSRuler(String s,ServletContext sc,HttpSession session)
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
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_desc");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("ruler_level");
            sqlSB.append(",");
            sqlSB.append("target");
            sqlSB.append(",");
            sqlSB.append("ruler_echo");
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(" from t_s_ruler ");
            sqlSB.append("where id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1,Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("id"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_page"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_level"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("target"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_echo"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_manager"))).append("</C>");

                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "�˵�������Ϣ�޸�ǰ��ѯ�ɹ���",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler�������ݿ����Ӵ���,����Ϊ���˵�������Ϣ�޸�ǰ��ѯʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler����ת���ַ�����,����Ϊ���˵�������Ϣ�޸�ǰ��ѯʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.beforeUpdateTSRuler���ִ���,����Ϊ���˵�������Ϣ�޸�ǰ��ѯʧ��!" + ce.getMessage(),rulerBean.class.getName());
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
     * �޸�Ȩ����ϢAJAX
     */
    public String updateTSRuler(String id,String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
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
            sqlSB=new StringBuffer();

            sqlSB.append("update t_s_ruler set ").append(values).append(" where id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            

            int num=pstm.executeUpdate();

            infoSB.append(num).append("</C></R>");
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "�޸Ĳ˵�������Ϣ�ɹ���",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler�������ݿ����Ӵ���,����Ϊ���޸Ĳ˵�������Ϣʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler����ת���ַ�����,����Ϊ���޸Ĳ˵�������Ϣʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.updateTSRuler���ִ���,����Ϊ���޸Ĳ˵�������Ϣʧ��!" + ce.getMessage(),rulerBean.class.getName());
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
     * ������������ѯȨ����ϢAJAX
     */
    public String queryTSRuler(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
            	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|������������ѯȨ����Ϣ��t_s_ruler��ʱ�����ݿ�����ConnectionΪ�գ�����ʧ��");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("ruler_level,");
            sqlSB.append("(case ruler_level");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_level' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end)");
            //�ر���Դrs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            sqlSB.append("ruler_echo,");
            sqlSB.append("(case ruler_echo");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_echo' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end)");
            //�ر���Դrs,pstm
            close(rs,pstm,null,null);
            
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(" from t_s_ruler");
            
            countSB.append("select count(1)  from t_s_ruler ");
            
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                
                countSB.append(s);
            }
            sqlSB.append(" order by id desc ");
            
           
            
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
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "��ѯ�˵�������Ϣ�ɹ���",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler�������ݿ����Ӵ���,����Ϊ����ѯ�˵�������Ϣʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler����ת���ַ�����,����Ϊ����ѯ�˵�������Ϣʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.queryTSRuler���ִ���,����Ϊ����ѯ�˵�������Ϣʧ��!" + ce.getMessage(),rulerBean.class.getName());
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
     * ����IDֵ��ѯ��ϸ��Ȩ����ϢAJAX
     */
    public String detailTSRuler(String s,ServletContext sc,HttpSession session)
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
             //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|����IDֵ��ѯ��ϸ��Ȩ����Ϣ��t_s_ruler��ʱ�����ݿ�����ConnectionΪ�գ�����ʧ��");
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ruler_code");
            sqlSB.append(",");
            sqlSB.append("ruler_name");
            sqlSB.append(",");
            sqlSB.append("ruler_desc");
            sqlSB.append(",");
            sqlSB.append("ruler_page");
            sqlSB.append(",");
            sqlSB.append("(case ruler_level");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_level' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as level_name ");
            //�ر���Դrs,pstm
            close(rs,pstm,null,null);
            sqlSB.append(",");
            sqlSB.append("target,");
            sqlSB.append("(case ruler_echo");
            pstm=con.prepareStatement("select code,value from t_s_code where type='t_s_ruler.ruler_echo' order by code asc");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" when ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" then ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
            }
            sqlSB.append(" end) as echo_name");
            //�ر���Դrs,pstm
            close(rs,pstm,null,null);
            sqlSB.append(",");
            sqlSB.append("ruler_manager");
            sqlSB.append(",");
            sqlSB.append("time");
            sqlSB.append(" from t_s_ruler ");
            sqlSB.append("where id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
            
            pstm.setLong(1,Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("ruler_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_page"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("level_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("target"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("echo_name"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("ruler_manager"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("time"))).append("</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "�˵�������ϸ��Ϣ��ѯ�ɹ���",rulerBean.class.getName());
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler�������ݿ����Ӵ���,����Ϊ���˵�������ϸ��Ϣ��ѯʧ��!" + sql.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler����ת���ַ�����,����Ϊ���˵�������ϸ��Ϣ��ѯʧ��!" + ue.getMessage(),rulerBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "rulerBean.detailTSRuler���ִ���,����Ϊ���˵�������ϸ��Ϣ��ѯʧ��!" + ce.getMessage(),rulerBean.class.getName());
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
