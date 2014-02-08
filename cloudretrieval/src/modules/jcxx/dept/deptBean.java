/*
 * @(#)deptBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.dept;

import java.sql.*;
import java.text.NumberFormat;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

/**
 * ����:����Ϊ���������Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: deptBean.java,v 1.1 2012/09/30 01:54:31 Administrator Exp $
 */
public class deptBean extends ResourceClose
{
	private NumberFormat nf;
	
    public deptBean()
    {
    	nf=NumberFormat.getPercentInstance();
    }

    /**
     * ���캯��
     */
    public deptBean(DataSource dataSource)
    {
    }

    /**
     * ɾ����������AJAX
     */
    public String deleteTSDept(String values,String dept,ServletContext sc,HttpSession session)
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
        //System.out.println(dept);
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
            int num=0;
            con.setAutoCommit(false);
            
            // �жϸû��������Ƿ�����Ա
            
            sqlSB = new StringBuffer();
            sqlSB.append("select id from t_u_person where dept_code='"+dept+"'");
            pstm = con.prepareStatement(sqlSB.toString());
            
            rs = pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
            	return "have";
            }
            close(rs,pstm,null,null);
            
            sqlSB.delete(0, sqlSB.length());
           // System.out.println("ɾ��������.........");
            //ɾ��������
            sqlSB.append("update t_s_dept set status=0 WHERE status=1 and dept_code='").append(dept).append("'");
            //pstm.setString(1,dept);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
            
            close(null,pstm,null,null);           
            
            /* 
            //ɾ���ϼ���������Ϣ
            sqlSB.append("delete from t_s_deptmgr where dept_code = '").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
            
            close(null,pstm,null,null);           
            sqlSB.delete(0, sqlSB.length());
            
            
            //ɾ���û����µ���Ա��
            sqlSB.append("update t_b_jcxx_ryxx set status=0 where status=1 and dep_id='").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();
           
            close(null,pstm,null,null);           
            sqlSB.delete(0, sqlSB.length());
            
            //ɾ���û����Ļ����ȼ�ά����
            sqlSB.append("update t_s_dept_grade set status=0 where status=1 and dept_code='").append(dept).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));          
            num = pstm.executeUpdate();*/
            
            con.commit();
            
            infoSB.append("1</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
 					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
 					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
 					+ "ɾ��������",deptBean.class.getName());

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("����ʼ�ع�");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept�������ݿ���󣬲���Ϊ��" 
					+"ɾ��������Ϣʧ��" + sql.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("����ʼ�ع�");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept�������ݿ���󣬲���Ϊ��" 
					+"ɾ��������Ϣʧ��" + ue.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try{
    			con.rollback();
    			basePublic.info("����ʼ�ع�");
    		}catch(Exception ee){
    			ee.printStackTrace();
    			
    		}
    		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.deleteTSDept���ִ��󣬲���Ϊ��" 
					+"ɾ��������Ϣʧ��" + ce.getMessage(),deptBean.class.getName());
    		throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }

    /**
     * ��ӻ�������AJAX
     */
    public String addTSDept(String labels,String values,String dept_code,int dept_level,int dept_lx,ServletContext sc,HttpSession session)
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
            
            con.setAutoCommit(false);
            
            pstm=con.prepareStatement("select dept_code from t_s_dept where dept_code=? and status=1");
            
            pstm.setString(1,dept_code);
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next()){
            	
            	return "have";
            }
            
            close(rs,pstm,null,null);
            
            sqlSB.delete(0, sqlSB.length());
            
            //������
            
            sqlSB.append("INSERT INTO t_s_dept(dept_code,").append(labels).append(") VALUES ('").append(dept_code).append("',").append(values).append(")");

            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            int num=pstm.executeUpdate();
            deptTrigger(con,dept_code,dept_level,dept_lx,ds,bform);
            
            close(null,pstm,null,null);
            sqlSB.delete(0, sqlSB.length());
/*            
            //�����ȼ���
            
            sqlSB.append("insert into t_s_dept_grade(id,").append(label2s).append(") values (t_s_dept_grade_seq.nextval,").append(value2s).append(")");

            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
           
            num=pstm.executeUpdate();
*/            
            con.commit();
            
            infoSB.append(num).append("</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "��ӻ�����Ϣ�ɹ���",deptBean.class.getName());

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept�������ݿ���󣬲���Ϊ��" 
					+"��ӻ�����Ϣʧ��" + sql.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept�������ݿ���󣬲���Ϊ��" 
					+"��ӻ�����Ϣʧ��" + ue.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.addTSDept���ִ��󣬲���Ϊ��" 
					+"��ӻ�����Ϣʧ��" + ce.getMessage(),deptBean.class.getName());
            
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }


    /**
     * �޸�ǰ����idֵ��ѯ��ϸ�Ļ�������AJAX
     */
    public String beforeUpdateTSDept(String s,ServletContext sc,HttpSession session)
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
        
        PreparedStatement pstm2=null;//����Ԥ�������
        ResultSet rs2=null;//�����ѯ�Ľ����
        
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
            
            sqlSB.append("SELECT ");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");
            sqlSB.append(",");
            sqlSB.append("dept_manager");
            sqlSB.append(",");
            sqlSB.append("fgld");

            sqlSB.append(" FROM t_s_dept ");
            sqlSB.append("WHERE id=? ");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, Long.parseLong(s));
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("dept_code"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("dept_name"))).append("</C>");            
                infoSB.append(basePublic.out(rs.getString("dept_manager"))).append("</C>");
                infoSB.append(basePublic.out(rs.getString("fgld"))).append("</C>");
                //�жϸ÷ֹ��쵼������
                
                sqlSB = new StringBuffer();
        		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString("fgld")+"'");
        		
        		pstm2 = con.prepareStatement(sqlSB.toString());
        		rs2 = pstm2.executeQuery();
        		
        		if(rs2!=null && rs2.next())
        		{
        			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
        		}
        		else
        		{
        			infoSB.append("</C>");
        		}
        		close(rs2,pstm2,null,null);
                
                infoSB.append("</R>");
            }
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "�޸�ǰ��ѯ����Ϣ�ɹ���",deptBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸�ǰ��ѯ����Ϣʧ��" + sql.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸�ǰ��ѯ����Ϣʧ��" + ue.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.beforeUpdateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸�ǰ��ѯ����Ϣʧ��" + ce.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /**
     * �޸Ļ�������AJAX
     */
    public String updateTSDept(String id,String values,String curr_dept,
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
            
            
            String[] value = values.split("</C>");
            
            int num = 1;
            
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();

            con.setAutoCommit(false);
            
            sqlSB.append("UPDATE t_s_dept SET ").append(value[0]).append(" WHERE id=").append(id);
         
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
            num=pstm.executeUpdate();
            
           /* sqlSB.delete(0, sqlSB.length());
            
            sqlSB.append("UPDATE t_s_dept_grade SET ").append(value[1]).append(" WHERE id='").append(id2).append("'");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

            num=pstm.executeUpdate();
            */
            String[] dept_tr = curr_dept.split(",");
            if(!dept_tr[0].equals("no"))
            {
            	deptTrigger(con,dept_tr[0],Integer.parseInt(dept_tr[1]),Integer.parseInt(dept_tr[2]),ds,bform);
            }
            con.commit();

            infoSB.append(num).append("</C></R>");
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "�޸Ļ�����Ϣ�ɹ���",deptBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸Ļ���Ϣʧ��" + sql.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸Ļ���Ϣʧ��" + ue.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            try{
            	con.rollback();
            }
            catch(SQLException e){
            	
            	e.printStackTrace();
            }
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "deptBean.updateTSDept�������ݿ���󣬲���Ϊ��" 
					+"�޸Ļ���Ϣʧ��" + ce.getMessage(),deptBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /**
     * ������������ѯ��������AJAX
     */
    public String queryTSDept(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
            
            sqlSB.append("SELECT ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");

            sqlSB.append(",fgld,");
            
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
            
            
            sqlSB.append(" FROM t_s_dept ");
            
            countSB.append("select count(1) from t_s_dept ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                
                countSB.append(s);
            }
            sqlSB.append("  ORDER BY id ASC");
            
            
         
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
                	if(i==4)
                	{
                		//������Ա������ת��
                		sqlSB = new StringBuffer();
                		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString(i)+"'");
                		
                		pstm2 = con.prepareStatement(sqlSB.toString());
            //    		System.out.println(sqlSB.toString());
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
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
            
            close(rs,pstm,null,null);
            
            pstm=con.prepareStatement("select count(*) from t_s_dept where status=1");
            
            rs=pstm.executeQuery();
            
            double a = 0;//����
            
            int b = 0;//��������������
            
            if(rs!=null && rs.next()){
            	
            	 a = rs.getDouble(1);//����
            }
            
            close(rs,pstm,null,null);
                
            pstm=con.prepareStatement(countSB.toString());
            
            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next()){
            	
            	b=rs.getInt(1);
            	
            }
            
            nf.setMaximumFractionDigits(3);
            
            String rate=""; 
            
            if(b>0)
            {
            
            	rate=nf.format((double)b/a);
            	
            }
            else
            {	
            	rate ="0%";
            }
            
            infoSB.append("</S>").append(rate).append("</C>").append(b).append("</C>");
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");

        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
        }
        finally
        {
        	pm.close(true);
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
        
        return infoSB.toString();
    }

    /**
     * ����idֵ��ѯ��ϸ�Ļ�������AJAX
     */
    public String detailTSDept(String s,ServletContext sc,HttpSession session)
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
            
            sqlSB.append("SELECT ");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("dept_name");

            sqlSB.append(",dept_manager,fgld,");
            
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
            
            
            sqlSB.append(" FROM t_s_dept  ");
            sqlSB.append("WHERE id=? ");
            
            ////System.out.println(sqlSB.toString());
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, Long.parseLong(s));
            rs=pstm.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                	if(i==4)
                	{
//                		������Ա������ת��
                		sqlSB = new StringBuffer();
                		sqlSB.append("select user_name from t_u_person where user_code='"+rs.getString(i)+"'");
                	
                		pstm2 = con.prepareStatement(sqlSB.toString());
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("user_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                	}
                	else
                	{
                		 infoSB.append(basePublic.out(rs.getString(i)) + "</C>");
                	}
                   
                }

                infoSB.append("</R>");
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    private void deptTrigger(Connection con,String dept_code,int dept_level,int dept_lx,DataSource ds,baseForm bform) throws Exception{
    	

    	PreparedStatement pstm = null,pstm2 = null;
    	
    	ResultSet rs = null;
    	
    	try{
    		//��t_s_deptmgr����ɾ��dept_code�����������
    		pstm = con.prepareStatement("delete from t_s_deptmgr where dept_code = ?");
    		
    	//	System.out.println("ɾ��t_s_deptmgr����dept_code="+dept_code);
    		
    		pstm.setString(1, dept_code);
    		
    		pstm.executeUpdate();
    		
    		
    		pstm.close();
    		pstm=null;
    		
    		
    		//��t_s_deptmgr���������������
    		
    		pstm = con.prepareStatement("insert into t_s_deptmgr (dept_code,dept_manager,dept_level,dept_lx) values (?,?,?,?)");
    		
    		pstm.setString(1,dept_code);
    		pstm.setString(2, dept_code);
    		pstm.setInt(3,dept_level);
    		pstm.setInt(4, dept_lx);
    		
    		pstm.executeUpdate();
    		
    		//System.out.println("��t_s_deptmgr��������dept_code="+dept_code+"\tdept_manager="+dept_code+"���ݣ�����");
    		
    		pstm2 = con.prepareStatement("select dept_code,dept_level,dept_lx from t_s_dept where dept_code=(select dept_manager from t_s_dept where dept_code=? and dept_code<> dept_manager and status=1 )");
    		
    		String manager = dept_code;
    		
    		
    		for(int i=0;i<dept_level;i++){
    			
    			pstm2.setString(1, manager);
    			
    			rs = pstm2.executeQuery();
    			
    			if(rs!=null && rs.next()){
    				
    				manager = rs.getString(1);
    				
    				pstm.setString(1, dept_code);
    				pstm.setString(2, manager);
    				pstm.setInt(3, rs.getInt(2));
    				pstm.setInt(4, rs.getInt(3));
    				
    				pstm.executeUpdate();
    				
    			//	System.out.println("��t_s_deptmgr��������dept_code="+dept_code+"\tdept_manager="+manager+"���ݣ��ϼ���");
    			}
    			else{
    				
    				break;
    			}
    			
    			rs.close();
    			rs=null;
    		}
    		
    	}
    	catch(SQLException sql){
    		
    		
    		throw sql;
    	}
    	finally{
    		
    		
    		if(rs != null){
    			
    			try{
    				rs.close();
    				rs = null;
    			}
    			catch(SQLException sql){
    				
    				
    			}
    		}
    		
    		if(pstm != null){
    			
    			try{
    				pstm.close();
    				pstm = null;
    			}
    			catch(SQLException sql){
    			}
    		}

    		if(pstm2 != null){
    			
    			try{
    				pstm2.close();
    				pstm2 = null;
    			}
    			catch(SQLException sql){
    			}
    		}
    	}
    }
}