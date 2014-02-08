/*
 * @(#)modules.personBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.person;


import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * ����:����Ϊ��Ա������Ϣ��Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: personBean.java,v 1.1 2012/09/30 01:54:30 Administrator Exp $
 */
public class personBean extends ResourceClose
{
    private DataSource dataSource;

    public personBean()
    {
    }

    /*
     * ���캯��
     */
    public personBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    
    
    /*
     * ɾ����Ա������ϢAJAX
     */
    public int deleteTUPerson(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // �жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
         //   System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }

        //�жϻỰʵ���Ƿ�Ϊ��
        if (session==null)
        {
        //    System.out.println("HttpSession Ϊ�գ����ء�");
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
        ResultSet rs=null;//�����ѯ�Ľ����
        
        StringBuffer sqlSB = new StringBuffer();
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            int num=0;
            
            con.setAutoCommit(false);

            pstm=con.prepareStatement(basePublic.in("update t_u_person set status = 0  where id=?"));
            pstm.setLong(1, id);
            num = pstm.executeUpdate();
            
            con.commit();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ���û��ɹ���",personBean.class.getName());
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson�������ݿ����Ӵ��󣬲���Ϊ��ɾ���û�ʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson����ת���ַ������󣬲���Ϊ��ɾ���û�ʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson���ִ��󣬲���Ϊ��ɾ���û�ʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }

    /*
     * �����Ա������ϢAJAX
     */
    public int addTUPerson(String labels,String values,String usercode,ServletContext sc,HttpSession session)
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
    
    
    ResultSet rs=null;//�����ѯ�Ľ����
    PreparedStatement pstm2=null;//����Ԥ�������
    ResultSet rs2=null;//�����ѯ�Ľ����
    
    PreparedStatement pstm3=null;//����Ԥ�������
    ResultSet rs3=null;//�����ѯ�Ľ����
    try
    {
        con=((DataSource)sc.getAttribute("basedb")).getConnection();
        if (con==null)
        {
        	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
        }
        con.setAutoCommit(false);
        sqlSB = new StringBuffer();
        sqlSB.append("insert into t_u_person(").append(labels).append(") values (").append(values).append(")");
        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
        pstm.executeUpdate();
        close(null,pstm,null,null);
        
        //��ӽ�ɫ
        sqlSB.setLength(0);
        sqlSB.append("insert into t_s_userrole (user_code,role_code,status) values('"+usercode+"','ybyh',1)");
        pstm = con.prepareStatement(sqlSB.toString());
        pstm.execute();
        close(null,pstm,null,null);
        
        con.commit();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"����û��ɹ���",personBean.class.getName());
        return 1; 
    }
    catch (SQLException sql)
    {
        sql.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson�������ݿ����Ӵ��󣬲���Ϊ������û�ʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
    }
    catch (UnsupportedEncodingException ue)
    {
        ue.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson����ת���ַ������󣬲���Ϊ������û�ʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
    }
    catch (Exception ce)
    {
        ce.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson���ִ��󣬲���Ϊ������û�ʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
    }
    finally
    {
        //�ر����п�����Դ
        close(null,pstm,null,con);
    }
}


    /*
     * �޸�ǰ����idֵ��ѯ��ϸ����Ա������ϢAJAX
     */
    public String beforeUpdateTUPerson(long id,ServletContext sc,HttpSession session)
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
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs2=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language");
            sqlSB.append(",");
            sqlSB.append("photo_path");
            sqlSB.append(" FROM t_u_person ");
            sqlSB.append("WHERE id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
            	infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("passwd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("dept_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("role_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xb")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("csrq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sj")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("tel")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("mail")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("language")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("photo_path")) + "</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸�ǰ��ѯ�û���ϸ��Ϣ�ɹ���",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson�������ݿ����Ӵ��󣬲���Ϊ���޸�ǰ��ѯ�û���ϸ��Ϣʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson����ת���ַ������󣬲���Ϊ���޸�ǰ��ѯ�û���ϸ��Ϣʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson���ִ��󣬲���Ϊ���޸�ǰ��ѯ�û���ϸ��Ϣʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
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
     * �޸���Ա������ϢAJAX
     */
    public int updateTUPerson(String id,String values,String p_path,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
    	
    	String p = values.split(",")[0];
    	String bt = p.split("=")[1];
    	String photo_url = bt.substring(1, bt.length()-1);
    	
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

        String usercode = bform.user_code;
        //����SQL���
        StringBuffer sqlSB = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            System.err.println(values);
            sqlSB=new StringBuffer();
            
            con.setAutoCommit(false);

            sqlSB.append("UPDATE t_u_person SET ").append(values).append(" WHERE id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
           
            int num=pstm.executeUpdate();
            
            con.commit();
            
            if(photo_url.equals(usercode)){
            	bform.photo_path=p_path;
            }
            
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸��û���Ϣ�ɹ���",personBean.class.getName());
            return num;
            
        }
        catch (SQLException sql)
        {
        	con.rollback();
            sql.printStackTrace();
        	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson�������ݿ����Ӵ��󣬲���Ϊ���޸��û���Ϣʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
        	throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
        	con.rollback();
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson����ת���ַ������󣬲���Ϊ���޸��û���Ϣʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
        	con.rollback();
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson���ִ��󣬲���Ϊ���޸��û���Ϣʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
    }
    
    /*
     * ������������ѯ��Ա������ϢAJAX
     */
    public String queryTUPerson(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
        StringBuffer sqlSB=null;
        //�����ѯ���������
        StringBuffer countSB=null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs2=null;//�����ѯ�Ľ����
        
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
            
            sqlSB.append("select   id,");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language,");

            sqlSB.append("(CASE status");
            pstm=con.prepareStatement("SELECT code,value FROM t_s_code WHERE type='t_u_person.status' ORDER BY code ASC");
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
                sqlSB.append(" WHEN ");
                sqlSB.append(basePublic.out(rs.getString("code")));
                sqlSB.append(" THEN ");
                sqlSB.append("'").append(basePublic.out(rs.getString("value"))).append("'");
                
            }
            sqlSB.append(" END)");
            
            close(rs,pstm,null,null);
            
            countSB.append("select count(1) from t_u_person "); 
            sqlSB.append(" from t_u_person ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                countSB.append(s);
            }
            sqlSB.append(" order by id desc");
            countSB.append(" order by id desc");
            
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
                	if(i==5)
                	{
                		pstm2 = con.prepareStatement("select dept_name from t_s_dept where dept_code = '"+rs.getString(i)+"'");
                		
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("dept_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                	}
                	else if(i==6)
                	{
                		pstm2 = con.prepareStatement("select role_name from t_s_role where role_code = '"+rs.getString(i)+"'");
                		
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("role_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                	}
                	else
                	{
                		infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                	}
                    
                }

                infoSB.append("</R>");
            }
            infoSB.append("</F>");
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
           System.out.println(infoSB.toString());
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"����������ѯ�û���Ϣ�ɹ���",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson�������ݿ����Ӵ��󣬲���Ϊ������������ѯ�û���Ϣʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson����ת���ַ������󣬲���Ϊ������������ѯ�û���Ϣʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson���ִ��󣬲���Ϊ������������ѯ�û���Ϣʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
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
     * ����idֵ��ѯ��ϸ����Ա������ϢAJAX
     */
    public String detailTUPerson(long id,ServletContext sc,HttpSession session)
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
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs2=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("d.dept_name");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("r.role_name");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language");
            
            sqlSB.append(" from t_u_person p, t_s_dept d,t_s_role r ");
            sqlSB.append("where p.id=? ");
            sqlSB.append("and p.dept_code = d.dept_code AND p.role_code=r.role_code ");
            System.out.println(sqlSB.toString());
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("passwd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("dept_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xb")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("csrq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("role_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sj")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("tel")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("mail")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("language")) + "</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�鿴�û���ϸ��Ϣ�ɹ���",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson�������ݿ����Ӵ��󣬲���Ϊ���鿴�û���ϸ��Ϣʧ�ܣ�"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson����ת���ַ������󣬲���Ϊ���鿴�û���ϸ��Ϣʧ�ܣ�"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson���ִ��󣬲���Ϊ���鿴�û���ϸ��Ϣʧ�ܣ�"+ce.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    public String detailTUPerson2(long id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
	{
	    
	    return "";
	}
}
