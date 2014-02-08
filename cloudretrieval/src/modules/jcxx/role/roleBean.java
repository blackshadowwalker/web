/*
 * @(#)roleBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.role;

import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;

/**
 * ����:����Ϊ��ɫ��Ϣ��Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: roleBean.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class roleBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
    public roleBean()
    {
    }

    /*
     * ���캯��
     */
    /*
    public roleBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
	*/
    /*
     * ��ѯ����Ȩ����Ϣ��������IE�ͻ���������
     */
    public String createRulerTree(ServletContext sc,HttpSession session) throws CustomException,Exception{
    	
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null){
        	
        	basePublic.error("ServletContext Ϊ�գ����ء�");
            
        	throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
            
        //�жϻỰʵ���Ƿ�Ϊ��
        if(session==null){
        	basePublic.error("HttpSession Ϊ�գ����ء�");
        	throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //�ж��û��Ƿ��¼
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if(bform==null){
        	
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
    	
    	Connection con=null;//�������ݿ�����
    	PreparedStatement pstm=null;//����Ԥ�������
    	ResultSet rs=null;//�����ѯ�Ľ����
    	
    	
    	try{
    		con=((DataSource)sc.getAttribute("basedb")).getConnection();
    		
    		if(con==null){
    			
    			throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
    		}
    		infoSB=new StringBuffer();
    		infoSB.append("select a.ruler_code,b.ruler_name,ruler_level,ruler_manager from t_s_ruler a,t_s_rulervalue b, t_s_rolevalue c " +
    				" where a.status=1 and b.language=? and a.ruler_code=b.ruler_code ");
    		if(!bform.role_code.equals("super"))//not spuer role
    			infoSB.append(" and a.ruler_code=c.ruler_code and c.role_code=? and c.status=1 ");
    		infoSB.append(" order by ruler_level asc");
    		
    		pstm=con.prepareStatement(infoSB.toString());
    		
    		pstm.setString(1, bform.language);
    		if(!bform.role_code.equals("super"))
    			pstm.setString(2, bform.role_code);
    		System.out.println(infoSB);
    		rs=pstm.executeQuery();
    		
    		while(rs!=null && rs.next()){
    			
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(";");
    		}
    		LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ɫ�����޸�ǰȨ�������ɳɹ���",roleBean.class.getName());
    	}
    	catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree�������ݿ����Ӵ��󣬲���Ϊ����ɫ�����޸�ǰȨ��������ʧ�ܣ�"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree����ת���ַ������󣬲���Ϊ����ɫ�����޸�ǰȨ��������ʧ�ܣ�"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.createRulerTree���ִ��󣬲���Ϊ����ɫ�����޸�ǰȨ��������ʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally{
        	//�ر����п�����Դ
        	close(rs,pstm,false,null,false,con);
        }
    	
    	
    	return infoSB.toString();
    }
    
    /*
     * ��ѯ����Ȩ����Ϣ��������IE�ͻ���������
     */
    public String queryRulerTree(String role_code,ServletContext sc,HttpSession session) throws CustomException,Exception{
    	
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null){
        	
        	basePublic.error("ServletContext Ϊ�գ����ء�");
            
        	throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
            
        //�жϻỰʵ���Ƿ�Ϊ��
        if(session==null){
        	
        	basePublic.error("HttpSession Ϊ�գ����ء�");
            
        	throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //�ж��û��Ƿ��¼
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if(bform==null){
        	
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }
        
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
    	
    	Connection con=null;//�������ݿ�����
    	PreparedStatement pstm=null;//����Ԥ�������
    	ResultSet rs=null;//�����ѯ�Ľ����
    	
    	
    	try{
    		con=((DataSource)sc.getAttribute("basedb")).getConnection();
    		
    		if(con==null){
    			
    			throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
    		}
    		
    		infoSB=new StringBuffer();
    		//����Ѱ󶨵Ľ�ɫȨ��
    		pstm=con.prepareStatement("select a.ruler_code,c.ruler_name,a.ruler_level,a.ruler_manager,b.ruler_word " +
    				"from t_s_ruler a,t_s_rolevalue b, t_s_rulervalue c " +
    				"where a.ruler_code=b.ruler_code and a.ruler_code=c.ruler_code and a.ruler_echo=0 and b.role_code=? and c.language=? and a.status=1 and b.status=1 " +
    				"order by a.ruler_level asc");
    		
    		pstm.setString(1,role_code);
    		pstm.setString(2, bform.language);
    		System.out.println(infoSB);
    		rs=pstm.executeQuery();
    		while(rs!=null && rs.next()){
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(",").append(rs.getString("ruler_word").trim()).append(",Y,Y;");
    		}
    		
//    		�رտ�����Դ
    		close(rs,pstm,false,null,false,null);
//    		���δ�󶨵Ľ�ɫȨ��
    		String sql = "select a.ruler_code,b.ruler_name,ruler_level,ruler_manager " +
			" from t_s_ruler a, t_s_rulervalue b where a.ruler_code=b.ruler_code and b.language=? and ruler_echo=0 and a.ruler_code not in(select ruler_code from t_s_rolevalue where role_code=? and status=1) and a.status=1 " +
			" order by ruler_level asc";
    		System.out.println(sql);
    		pstm=con.prepareStatement(sql);
    		pstm.setString(1, bform.language);
    		pstm.setString(2,role_code);
    		rs=pstm.executeQuery();
    		while(rs!=null && rs.next()){
    			
    			infoSB.append(rs.getString("ruler_code").trim()).append(",");
    			infoSB.append(basePublic.out(rs.getString("ruler_name").trim())).append(",");
    			infoSB.append(rs.getInt("ruler_level")).append(",");
    			infoSB.append(rs.getString("ruler_manager").trim()).append(",QUID,N,N;");
    		}
    		LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�鿴��ɫ������ϸ��Ϣ�ɹ���",roleBean.class.getName());
    	}
    	catch (SQLException e)
        {
            e.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree�������ݿ����Ӵ��󣬲���Ϊ���鿴��ɫ������ϸ��Ϣʧ�ܣ�"+e.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree����ת���ַ������󣬲���Ϊ���鿴��ɫ������ϸ��Ϣʧ�ܣ�"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryRulerTree���ִ��󣬲���Ϊ���鿴��ɫ������ϸ��Ϣʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally{
        	//�ر����п�����Դ
        	close(rs,pstm,false,null,false,con);
        }
    	
    	
    	return infoSB.toString();
    }
    
    /*
     * ɾ����ɫ��ϢAJAX
     */
    public String deleteTSRole(String value,ServletContext sc,HttpSession session)
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
        
        if(value==null || value.length()==0)

        	throw new CustomException("���ַǷ��������˳�ϵͳ��");
        
        
        
        Connection con=null;//�������ݿ�����
        Statement stm=null;
        DataSource ds=null;
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {	
            	
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            con.setAutoCommit(false);
            
            stm=con.createStatement();

            
            stm.addBatch("update t_s_rolevalue set status=0 where role_code=(select role_code from t_s_role where id="+value+" and status=1)");
            
            stm.addBatch("update t_s_role set status=0 where id="+value);
           
            stm.executeBatch();
            
            con.commit();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ����ɫ�ɹ���",roleBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();

            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.deleteTSRole�������ݿ����Ӵ��󣬲���Ϊ��ɾ����ɫʧ�ܣ�"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
           
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.deleteTSRole�������Ӵ��󣬲���Ϊ��ɾ����ɫʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,null,false,stm,true,con);
        }
        
        return "1</C></R>";
    }

    /*
     * ��ӽ�ɫ��ϢAJAX
     */
    public String addTSRole(String role_code,String role_name,String dept_level,String rulervalues,ServletContext sc,HttpSession session)
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

        Connection con=null;//�������ݿ�����
        PreparedStatement pstm = null;
        DataSource ds=null;
        
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            con.setAutoCommit(false);
            
          
            
            String sfld = dept_level.split("</C>")[0];
            String sftq = dept_level.split("</C>")[1];

            
            pstm = con.prepareStatement("insert into t_s_role (role_code,role_name,dept_level,sfld,sftq) values(?,?,?,?,?)");
            
            pstm.setString(1, role_code);
            pstm.setString(2, basePublic.in(role_name));
            pstm.setInt(3, 10);
            pstm.setString(4, basePublic.in(sfld));
            pstm.setString(5, basePublic.in(sftq));
            
            if(pstm.executeUpdate() == 1){
            
            	
            	if(rulervalues!=null && rulervalues.length()>0){
            		
            		pstm.close();
            		
            		pstm = null;
            		
            		
            		pstm = con.prepareStatement("insert into t_s_rolevalue(role_code,ruler_code,ruler_word) values(?,?,?)");
            		
            		
            		String[] rulers=rulervalues.split(";");
                    
                    int length=rulers.length;
                    
                    
                    for(int i=0;i<length;i++){
                    	
                    	String[] sub_rulers=rulers[i].split(",");
                    
                    	pstm.setString(1, role_code);
                    	pstm.setString(2, sub_rulers[0]);
                    	pstm.setString(3, sub_rulers[1]);
                    	
                    	pstm.executeUpdate();
                    }
            	}
            	
            	con.commit();
            	
            	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ӽ�ɫ�ɹ���",roleBean.class.getName());
            	
            	return "1</C></R>";
            }
            else{
            	
            	con.rollback();
            	
            	return "0</C></R>";
            }
            	
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole�������ݿ����Ӵ��󣬲���Ϊ����ӽ�ɫʧ�ܣ�"+sql.getMessage(),roleBean.class.getName());
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	 //Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|roleBean.java--addTSRole():���ӽ�ɫ��Ϣ(t_s_role,t_s_rolevalue)�����������ӷ���Ĵ��󣬴�����룺"+sql.getErrorCode()+"������Ϣ:"+sqlRollBack.getMessage());
            	basePublic.error("��ӽ�ɫȨ��ʱ�����쳣�������ѻع���");
            }
            
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch(NumberFormatException nf){
        	
        	nf.printStackTrace();
        	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole��������ת�����󣬲���Ϊ����ӽ�ɫʧ�ܣ�"+nf.getMessage(),roleBean.class.getName());
        	try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("��ӽ�ɫȨ��ʱ�����쳣�������ѻع���");
            }
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole����ת���ַ������󣬲���Ϊ����ӽ�ɫʧ�ܣ�"+ue.getMessage(),roleBean.class.getName());
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("��ӽ�ɫȨ��ʱ�����쳣�������ѻع���");
            }
            
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.addTSRole���ִ��󣬲���Ϊ����ӽ�ɫʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	basePublic.error("��ӽ�ɫȨ��ʱ�����쳣�������ѻع���");
            }
            
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,false,null,false,con);
        }
    }

    /*
     * �޸Ľ�ɫ��ϢAJAX
     */
    public String updateTSRole(String id,String values,String role_code,String rulervalues,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
//    	System.out.println(id);
//    	System.out.println("values="+values);
//    	System.out.println("role_code="+role_code);
//    	System.out.println("rulervalues="+rulervalues);
        if (sc == null)
        {
        	basePublic.error("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        if (session==null)
        {
        	basePublic.error("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }
        //����SQL���
        StringBuffer sqlSB = null;
        Connection con=null;//�������ݿ�����
        Statement stm=null;
        DataSource ds=null;
        try
        {
        	if(role_code==null || role_code.length()==0 || rulervalues==null || rulervalues.length()==0)
            	throw new CustomException("���ַǷ��������˳�ϵͳ��");

        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            //����Ϊ�ֶ��ύ
            con.setAutoCommit(false);
            //ʵ����stm
            stm=con.createStatement();
            sqlSB=new StringBuffer();
            sqlSB.append("update t_s_role set ").append(values).append(" where id=").append(id);
            stm.addBatch(basePublic.in(sqlSB.toString()));
            String[] rulerArrays=rulervalues.split(";");
            int length=rulerArrays.length;
            for(int i=0;i<length;i++){
            	
            	String[] subRulerArrays=rulerArrays[i].split(",");
            	
            	sqlSB.delete(0,sqlSB.length());
            	
            	
            	if(subRulerArrays[2].toUpperCase().equals("N") && subRulerArrays[3].toUpperCase().equals("Y")){//�û�����ӵĽ�ɫȨ��
            		
            		
            		sqlSB.append("insert into t_s_rolevalue (role_code,ruler_code,ruler_word) values ('").append(role_code.trim());
            		sqlSB.append("','").append(subRulerArrays[0].trim()).append("','").append(subRulerArrays[1].trim()).append("')");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            	else if(subRulerArrays[2].toUpperCase().equals("Y") && subRulerArrays[3].toUpperCase().equals("Y")){//�û����ܶ�ԭ����ɫȨ�޵Ĳ���Ȩ�����޸�
            		
            		sqlSB.append("update t_s_rolevalue set ruler_word='").append(subRulerArrays[1].trim()).append("' where role_code='");
            		sqlSB.append(role_code).append("' and ruler_code='").append(subRulerArrays[0].trim()).append("'");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            	else if(subRulerArrays[2].toUpperCase().equals("Y") && subRulerArrays[3].toUpperCase().equals("N")){//�û���ԭ���Ľ�ɫȨ��ɾ��
            		
            		sqlSB.append("update t_s_rolevalue set status=0 where role_code='").append(role_code.trim()).append("' and ruler_code='");
            		sqlSB.append(subRulerArrays[0].trim()).append("'");
            		
            		stm.addBatch(sqlSB.toString());
            	}
            }
            
            
            //�ύSQL��䵽���ݿ�
            stm.executeBatch();
            
            //ִ��SQL���
            con.commit();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸Ľ�ɫ�ɹ���",roleBean.class.getName());
            
            return "1</C></R>";
            
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
           
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	 
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole�������ݿ����Ӵ��󣬲���Ϊ���޸Ľ�ɫʧ�ܣ�"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//�������ݿ����ӷ���Ĵ���
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole����ת���ַ������󣬲���Ϊ���޸Ľ�ɫʧ�ܣ�"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            
            try{
            	con.rollback();
            }
            catch(SQLException sqlRollBack){
            	
            	sqlRollBack.printStackTrace();
            	
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.updateTSRole���ִ��󣬲���Ϊ���޸Ľ�ɫʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
            throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,null,false,stm,true,con);
        }
    }
    
    /*
     * ������������ѯ��ɫ��ϢAJAX
     */
    public String queryTSRole(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        if (sc == null)
        {
        	basePublic.error("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        if (session==null)
        {
        	basePublic.error("HttpSession Ϊ�գ����ء�");
            throw new CustomException("HttpSession Ϊ�գ�����");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//����ʧЧ�������µ�¼ϵͳ
        }
        
        StringBuffer infoSB=null;
        StringBuffer sqlSB = null;
        StringBuffer countSB=null;
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
            
            sqlSB.append("select ");
            sqlSB.append("id");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("role_name");
            
            sqlSB.append(" from t_s_role ");
            countSB.append("select count(1) from t_s_role "); 
            if (s != null && s.length()>0)
            {
                sqlSB.append(s).append(" and status = 1");
                countSB.append(s).append(" and status = 1");
            }
            else{
            	
            	sqlSB.append(" where status = 1");
            	countSB.append(" where status = 1");
            }
            sqlSB.append(" order by id desc");
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
                    infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
                }

                infoSB.append("</R>");
            }
            
            infoSB.append("|");
            
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"����������ѯ��ɫ�ɹ���",roleBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole�������ݿ����Ӵ��󣬲���Ϊ������������ѯ��ɫʧ�ܣ�"+sql.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole����ת���ַ������󣬲���Ϊ������������ѯ��ɫʧ�ܣ�"+ue.getMessage(),roleBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"roleBean.queryTSRole���ִ��󣬲���Ϊ������������ѯ��ɫʧ�ܣ�"+ce.getMessage(),roleBean.class.getName());
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
}