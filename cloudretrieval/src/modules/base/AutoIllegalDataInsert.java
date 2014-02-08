/*
 * @(#)modules.xsbmglBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.base;

import org.apache.log4j.Logger;

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
public class AutoIllegalDataInsert extends ResourceClose
{
    private DataSource dataSource;
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String dqsj = sdf.format(new Date());

    public AutoIllegalDataInsert()
    {
    	
    }

    
    public AutoIllegalDataInsert(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    /*
     * ��վ������Ϣ���ݲ�ѯ
     */
  //����������
    public String whiteIllegalDataFilter(ServletContext sc)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        StringBuffer infoSB1=null;
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            infoSB=new StringBuffer();
            infoSB1=new StringBuffer();
            pstm=con.prepareStatement(basePublic.in("SELECT LPNumber FROM t_s_whitelist WHERE status=1"));
            rs=pstm.executeQuery();
            while (rs!=null && rs.next())
            {
               infoSB.append(" AND LPNumber!='"+rs.getString(1)+"' ");
               if(rs.isFirst()){
            	   infoSB1.append(" LPNumber='"+rs.getString(1)+"' ");
               }else{
            	   infoSB1.append(" OR LPNumber='"+rs.getString(1)+"' ");
               }
            }
            infoSB.append(",").append(infoSB1.toString());
        }
        catch (SQLException sql)
        {	
        	con.rollback();
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }
    
    
    
    //��ͨ����Υ����Ϣ
    public void illegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        ResultSet rs1=null;//�����ѯ�Ľ����
        
        Statement sta1=null;
        Statement sta2=null;

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            
            sta1=con.createStatement();
            sta2=con.createStatement();

            pstm=con.prepareStatement(basePublic.in("SELECT tableName FROM t_s_eventtablemanager WHERE eventTypeCode ='DZJC' AND work=1"));
            rs=pstm.executeQuery();
            if(rs!=null && rs.next()){
            	String s=whiteIllegalDataFilter(sc).split(",")[0];
            	rs1=sta1.executeQuery("SELECT CLSSID,LPNumber,lane,violations,speed,modelCode,logoCode,carColor,LPNColor,status,LPNimage,shortImageA,shortImageB,shortImageC,absTime,id,shortImageCom FROM "+rs.getString(1)+" WHERE  LPNumber!='' AND violations!='NORMAL' AND exportFlag=0 "+s);
            	con.setAutoCommit(false);
            	while(rs1!=null && rs1.next()){
            		sta2.addBatch("INSERT INTO  t_s_illegalevent VALUES ("+null+",'"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"','"+rs1.getString(6)+"','"+rs1.getString(7)+"','"+rs1.getString(8)+"','"+rs1.getString(9)+"','"+1+"','"+rs1.getString(11)+"'" +
            				",'"+rs1.getString(12)+"','"+rs1.getString(13)+"','"+rs1.getString(14)+"',"+null+",'"+rs1.getString(15)+"','δ���','system','"+dqsj+"',"+null+","+null+","+null+","+null+",'"+rs1.getString(17)+"');\n");
            		sta2.addBatch("UPDATE "+rs.getString(1)+" SET exportFlag=1 WHERE id='"+rs1.getString(16)+"'");
            	}
            	sta2.executeBatch();
            	con.commit();
            }
        }
        catch (SQLException sql)
        {	
        	//con.rollback();
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }
    
    //����������Υ��Ҫ��Ϣ
    public void whiteIllegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        ResultSet rs1=null;//�����ѯ�Ľ����
        
        Statement sta1=null;
        Statement sta2=null;

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            
            sta1=con.createStatement();
            sta2=con.createStatement();

            pstm=con.prepareStatement(basePublic.in("SELECT tableName FROM t_s_eventtablemanager WHERE eventTypeCode ='DZJC' AND work=1"));
            rs=pstm.executeQuery();
            if (rs!=null && rs.next())
            {
            	String s=whiteIllegalDataFilter(sc).split(",")[1];
            	rs1=sta1.executeQuery("SELECT CLSSID,LPNumber,lane,violations,speed,modelCode,logoCode,carColor,LPNColor,status,LPNimage,shortImageA,shortImageB,shortImageC,absTime,id,shortImageCom FROM "+rs.getString(1)+" WHERE  LPNumber!='' AND violations!='NORMAL' AND exportFlag=0 AND("+s+")");
            	con.setAutoCommit(false);
            	while(rs1!=null && rs1.next()){
            		sta2.addBatch("INSERT INTO  t_s_white_illegal VALUES ("+null+",'"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"','"+rs1.getString(6)+"','"+rs1.getString(7)+"','"+rs1.getString(8)+"','"+rs1.getString(9)+"','"+1+"','"+rs1.getString(11)+"'" +
            				",'"+rs1.getString(12)+"','"+rs1.getString(13)+"','"+rs1.getString(14)+"',"+null+",'"+rs1.getString(15)+"','δ���','system','"+dqsj+"',"+null+","+null+",'"+rs1.getString(17)+"');\n");
            		sta2.addBatch("UPDATE "+rs.getString(1)+" SET exportFlag=1 WHERE id='"+rs1.getString(16)+"'");
            		
            	}
            	sta2.executeBatch();
            	con.commit();
               
            }
        }
        catch (SQLException sql)
        {	
        	con.rollback();
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }

    
    //��Ҫ�˹�¼�����Ϣ
    public void unknownIllegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        ResultSet rs2=null;//�����ѯ�Ľ����
        
        Statement sta2=null;
        Statement sta3=null;
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            
            sta2=con.createStatement();
            sta3=con.createStatement();

            pstm=con.prepareStatement(basePublic.in("SELECT tableName FROM t_s_eventtablemanager WHERE eventTypeCode ='DZJC' AND work=1"));
            rs=pstm.executeQuery();
            if (rs!=null && rs.next())
            {
            	rs2=sta2.executeQuery("SELECT CLSSID,LPNumber,lane,violations,speed,modelCode,logoCode,carColor,LPNColor,LPNimage,shortImageA,shortImageB,shortImageC,absTime,status,id,shortImageCom FROM "+rs.getString(1)+" WHERE LPNumber='' AND exportFlag=0 AND violations!='NORMAL'");
            	con.setAutoCommit(false);
            	while(rs2!=null && rs2.next()){
            		sta3.addBatch("INSERT INTO  t_s_illegaldataentry VALUES ("+null+",'"+rs2.getString(1)+"','"+rs2.getString(2)+"','"+rs2.getString(3)+"','"+rs2.getString(4)+"','"+rs2.getString(5)+"','"+rs2.getString(6)+"','"+rs2.getString(7)+"','"+rs2.getString(8)+"','"+rs2.getString(9)+"','"+rs2.getString(10)+"','"+rs2.getString(11)+"'" +
            				",'"+rs2.getString(12)+"','"+rs2.getString(13)+"',"+null+",'"+rs2.getString(14)+"',"+1+",'"+rs2.getString(17)+"');\n");
            		sta3.addBatch("UPDATE "+rs.getString(1)+" SET exportFlag=1 WHERE id='"+rs2.getString(16)+"'");
            		
            	}
            	sta3.executeBatch();
            	con.commit();
               
            }
        }
        catch (SQLException sql)
        {	
        	con.rollback();
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }

}