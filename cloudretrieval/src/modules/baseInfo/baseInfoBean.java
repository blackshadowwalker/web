/*
 * @(#)modules.xsbmglBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.baseInfo;

import org.apache.log4j.Logger;
import org.springframework.web.context.support.ServletContextResource;

import com.jspsmart.upload.Request;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * ����:��վ������Ϣ���ݵ�Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: xsbmglBean.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class baseInfoBean extends ResourceClose
{
    private DataSource dataSource;
    public baseInfoBean()
    {
    }

    
    public baseInfoBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    /*
     * ��վ������Ϣ���ݲ�ѯ
     */
    public String queryBaseInfo(ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
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
        StringBuffer sqlSB1 = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        PreparedStatement pstm1=null;//����Ԥ�������
        ResultSet rs1=null;//�����ѯ�Ľ����
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            sqlSB1=new StringBuffer();
            sqlSB.append("SELECT ");
            sqlSB.append("* ");
            sqlSB.append(" FROM t_s_baseinfo ");
            sqlSB.append("WHERE status=1");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            rs=pstm.executeQuery();
            
            while (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("id")) + "</C>");
                //infoSB.append(basePublic.out(rs.getString("logo")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("mainTitle")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("footerContent")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("work")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("ctTime")) + "</C>"); 
                
                sqlSB1=new StringBuffer();
                
                sqlSB1.append("SELECT ");
                sqlSB1.append("filePath");
                sqlSB1.append(" FROM t_s_uploadfiles ");
                sqlSB1.append("WHERE fileCode=?");
                
                pstm1=con.prepareStatement(basePublic.in(sqlSB1.toString()));
                pstm1.setString(1, rs.getString("logo"));
                rs1=pstm1.executeQuery();
                if(rs1!=null && rs1.next()){
                	infoSB.append(basePublic.out(rs1.getString("filePath")) + "</C>");
                }else{
                	infoSB.append("nofiles </C>");
                }
                infoSB.append(basePublic.out(rs.getString("version")) + "</C>");
                
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"��ѯϵͳ�����ɹ���",baseInfoBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo�������ݿ���󣬲���Ϊ����ѯϵͳ������Ϣʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo����ת���ַ������󣬲���Ϊ����ѯϵͳ������Ϣʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo���ִ��󣬲���Ϊ����ѯϵͳ������Ϣʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
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
     * ��վ������Ϣ����ɾ��
     */
    public int deleteBaseInfo(String id,ServletContext sc,HttpSession session)
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

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            int num=0;

            pstm=con.prepareStatement(basePublic.in("UPDATE t_s_baseinfo SET status=0 where id=?"));
            pstm.setInt(1, Integer.parseInt(id));
            num = pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"ɾ��ϵͳ�����ɹ���",baseInfoBean.class.getName());

            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo�������ݿ����Ӵ��󣬲���Ϊ��ɾ��ϵͳ����ʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo����ת���ַ������󣬲���Ϊ��ɾ��ϵͳ����ʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo���ִ��󣬲���Ϊ��ɾ��ϵͳ����ʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }
    
    
    /*
     * �����վ������Ϣ
     */
    public int addBaseInfo(String id,String logo,String title,String foot,String version,ServletContext sc,HttpSession session)
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

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }
            
            
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String dqsj = sdf1.format(new Date());
    		String nowTime=System.currentTimeMillis()+"";
    		sqlSB=new StringBuffer();
            sqlSB.append("INSERT INTO t_s_uploadfiles (fileCode,fileName,fileType,filePath,ctTime,status) VALUES (?,?,?,?,?,?) ");
    		pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1, nowTime);
            pstm.setString(2, "logo");
            pstm.setString(3, "logo");
    		pstm.setString(4,logo);
    		pstm.setString(5,dqsj);
    		pstm.setInt(6,1);
    		pstm.executeUpdate();
            

            sqlSB=new StringBuffer();
            
            sqlSB.append("insert into t_s_baseinfo(").append("logo,mainTitle,footerContent,status,ctTime,work,version").append(") values (").append("?,?,?,?,?,?,?").append(")");
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1, nowTime);
            pstm.setString(2, title);
            pstm.setString(3, foot);
            pstm.setInt(4, 1);
            pstm.setString(5, dqsj);
            pstm.setInt(6, 0);
            pstm.setString(7, version);
            int num=pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"����ϵͳ�����ɹ���",baseInfoBean.class.getName());
            
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo�������ݿ���󣬲���Ϊ������ϵͳ����ʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo����ת���ַ������󣬲���Ϊ������ϵͳ����ʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo���ִ��󣬲���Ϊ������ϵͳ����ʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
        finally
        {
            //�ر����п�����Դ
            close(null,pstm,null,con);
        }
    }


    /*
     * �޸�ǰ����idֵ��ѯ��վ������Ϣ
     */
    public String queryBaseInfoById(String id,ServletContext sc,HttpSession session)
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
        StringBuffer sqlSB1 = null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        
        PreparedStatement pstm1=null;//����Ԥ�������
        ResultSet rs1=null;//�����ѯ�Ľ����
        
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
            sqlSB.append("*");
            sqlSB.append(" FROM t_s_baseinfo ");
            sqlSB.append("WHERE id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
            	infoSB.append(basePublic.out(rs.getString("id")) + "</C>");
                //infoSB.append(basePublic.out(rs.getString("logo")) + "</C>");
	            	
                
                infoSB.append(basePublic.out(rs.getString("mainTitle")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("footerContent")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("ctTime")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("work")) + "</C>");
                

                sqlSB1=new StringBuffer();
                
                sqlSB1.append("SELECT ");
                sqlSB1.append("filePath");
                sqlSB1.append(" FROM t_s_uploadfiles ");
                sqlSB1.append("WHERE fileCode=?");
                
                pstm1=con.prepareStatement(basePublic.in(sqlSB1.toString()));
                pstm1.setString(1, rs.getString("logo"));
                rs1=pstm1.executeQuery();
                if(rs1!=null && rs1.next()){
                	infoSB.append(basePublic.out(rs1.getString("filePath")) + "</C>");
                }else{
                	infoSB.append("nofiles </C>");
                }
                infoSB.append(basePublic.out(rs.getString("version")) + "</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+
            		"��ѯϵͳ������ϸ��Ϣ�ɹ���",baseInfoBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById�������ݿ���󣬲���Ϊ���޸�ǰ��ѯϵͳ������ϸ��Ϣʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById����ת���ַ������󣬲���Ϊ���޸�ǰ��ѯϵͳ������ϸ��Ϣʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById���ִ��󣬲���Ϊ���޸�ǰ��ѯϵͳ������ϸ��Ϣʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
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
     * �޸���վ������Ϣ��Ϣ
     */
    public int updateBaseInfoById(String id,String logo,String title,String foot,int work,String version,
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
        ResultSet rs=null;//�����ѯ�Ľ����
        baseForm bf = null;
        String nowTime="";
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
            }

            sqlSB=new StringBuffer();
            sqlSB.append("SELECT fileCode FROM t_s_uploadfiles WHERE filePath=? ");

            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1, logo);
            rs=pstm.executeQuery();
            if(rs!=null&&rs.next()){
            	nowTime=rs.getString("fileCode");
            }else{
            	
            		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String dqsj = sdf1.format(new Date());
            		nowTime=System.currentTimeMillis()+"";
            		sqlSB=new StringBuffer();
                    sqlSB.append("INSERT INTO t_s_uploadfiles (fileCode,fileName,fileType,filePath,ctTime,status) VALUES (?,?,?,?,?,?) ");
            		pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                    pstm.setString(1, nowTime);
                    pstm.setString(2, "logo");
                    pstm.setString(3, "logo");
            		pstm.setString(4,logo);
            		pstm.setString(5,dqsj);
            		pstm.setInt(6,1);
            		pstm.executeUpdate();
            }
            
            sqlSB=new StringBuffer();

            sqlSB.append("UPDATE t_s_baseinfo SET ").append("logo=?,mainTitle=?,footerContent=?,version=?").append(" WHERE id=").append(Integer.parseInt(id));
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setString(1, nowTime);
            pstm.setString(2, title);
            pstm.setString(3, foot);
            pstm.setString(4,version);
            int num=pstm.executeUpdate();
            if(work==1){
            	bf=(baseForm)session.getAttribute("baseuser");
            	bf.logo=logo;
            	bf.mainTitle=title;
            	bf.footerContent=foot;
            	session.setAttribute("baseuser",bf);
            }
            
 			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), 
 					"t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸�ϵͳ������Ϣ�ɹ�!" +
 							"["+title+", "+version+", "+foot+"]",
 					baseInfoBean.class.getName());

            return num;
        }
          catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById�������ݿ����Ӵ��󣬲���Ϊ���޸�ϵͳ������Ϣ�ɹ�ʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById����ת���ַ������󣬲���Ϊ���޸�ϵͳ������Ϣ�ɹ�ʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById���ִ��󣬲���Ϊ���޸�ϵͳ������Ϣ�ɹ�ʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
        }
       
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
    }
    /*
     * �޸�ʹ��״̬
     */
    public int updateBaseInfoWork(String id,
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
            ResultSet rs=null;//�����ѯ�Ľ����
            Statement st=null;
            
            PreparedStatement pstm1=null;//����Ԥ�������
            ResultSet rs1=null;//�����ѯ�Ľ����
            baseForm bf = (baseForm)session.getAttribute("baseuser");
            try
            {
                con=((DataSource)sc.getAttribute("basedb")).getConnection();
                if (con==null)
                {
                	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//���ݿ�����ConnectionΪ�գ�����ʧ��
                }
                con.setAutoCommit(false);
                sqlSB=new StringBuffer();
                st=con.createStatement();
                st.executeUpdate("UPDATE t_s_baseinfo SET work=0 WHERE work=1 AND work=1");
                //sqlSB.append("UPDATE t_s_baseinfo SET ").append("work=0").append(" WHERE work=1 AND work=1").append(" WHERE id=").append(Integer.parseInt(id));
                sqlSB.append("UPDATE t_s_baseinfo SET ").append("work=1").append(" WHERE id=").append(Integer.parseInt(id));

                pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
                
                sqlSB = new StringBuffer();
    			
    			sqlSB.append("SELECT logo,mainTitle,footerContent FROM t_s_baseinfo WHERE work =1");
    			int num=pstm.executeUpdate();
    			
    			
    			pstm = con.prepareStatement(sqlSB.toString());
    			
    			rs = pstm.executeQuery();
    			
    			if(rs!=null && rs.next())
    			{	
    				pstm1 = con.prepareStatement("SELECT filePath FROM t_s_uploadfiles WHERE fileCode=? ");
    				pstm1.setString(1, rs.getString("logo"));
    				rs1 = pstm1.executeQuery();
    				if(rs1!=null&&rs1.next()){
    					bf.logo = rs1.getString("filePath");
    				}else{
    					bf.logo = "nofiles";
    				}
    				
    				//bf.logo=rs.getString("logo");
    				bf.mainTitle = rs.getString("mainTitle");
    				/*if(bf.zw.equals("xftdGroup")){
    					bf.mainTitle = "��֡��������ϵͳ";
    				}
    				if(bf.zw.equals("dzjcGroup")){
    					bf.mainTitle = "��֡���Ӿ���ϵͳ";
    				}*/
    				bf.footerContent = rs.getString("footerContent");
    				session.setAttribute("baseuser",bf);
    			}
                
     			con.commit();
     			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"�޸�ϵͳ����ʹ��״̬�ɹ���",baseInfoBean.class.getName());

                return num;
            }
              catch (SQLException sql)
            {
                sql.printStackTrace();
                con.rollback();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork�������ݿ����Ӵ��󣬲���Ϊ���޸�ϵͳ����ʹ��״̬ʧ�ܣ�"+sql.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.databaseConnectError")));//�������ݿ����ӷ���Ĵ���...
            }
            catch (UnsupportedEncodingException ue)
            {
                ue.printStackTrace();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork����ת���ַ������󣬲���Ϊ���޸�ϵͳ����ʹ��״̬ʧ�ܣ�"+ue.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//ת���ַ���ʱ���ִ���
            }
            catch (Exception ce)
            {
                ce.printStackTrace();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork���ִ��󣬲���Ϊ���޸�ϵͳ����ʹ��״̬ʧ�ܣ�"+ce.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.unknownError")));//����δ֪�쳣����
            }
           
            finally
            {
                //�ر����п�����Դ
                close(rs,pstm,null,con);
            }
        }
}