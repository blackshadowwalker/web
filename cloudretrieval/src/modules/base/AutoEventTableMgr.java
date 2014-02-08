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
public class AutoEventTableMgr extends ResourceClose
{
    private DataSource dataSource;

    public AutoEventTableMgr()
    {
    	
    }

    
    public AutoEventTableMgr(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    /*
     * ��վ������Ϣ���ݲ�ѯ
     */
    public String createTable(ServletContext sc)
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
        //����SQL���
        StringBuffer sqlSB = null;
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        ResultSet rs=null;//�����ѯ�Ľ����
        ResultSet rs1=null;//�����ѯ�Ľ����
        ResultSet rs2=null;//�����ѯ�Ľ����
        ResultSet rs3=null;//�����ѯ�Ľ����
        //ResultSet rs4=null;//�����ѯ�Ľ����
        
        Statement sta1=null;
        Statement sta2=null;
        Statement sta3=null;
        Statement sta4=null;
        Statement sta5=null;
        Statement sta6=null;
        int k=-1;
        int k1=-1;
        int k2=-1;
        int k3=-1;
        int k4=-1;
        String str_tableName=null;
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sta1=con.createStatement();
            sta2=con.createStatement();
            sta3=con.createStatement();
            sta4=con.createStatement();
            sta5=con.createStatement();
            sta6=con.createStatement();
            
            
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd_HHmmss");
            String dqsj = sdf1.format(new Date());
            
            SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dqsj2 = sdf2.format(new Date());
            
            
            sqlSB.append("SELECT event_code,masrows FROM t_s_eventtype GROUP BY event_code"); //������е��¼�����
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            rs=pstm.executeQuery();
            
            
            
            while (rs!=null && rs.next())
            {
                //System.out.println(rs.getString(1));
                rs1=sta1.executeQuery("SELECT tableName FROM t_s_eventtablemanager WHERE eventTypeCode='"+rs.getString(1)+"' AND work=1 AND status=1 LIMIT 1"); //�����¼����͵��������ÿ���¼��൱ǰ���õı���
                
                if(rs1!=null&&rs1.next()){
                	//System.out.println(rs1.getString(1));
                	rs2=sta2.executeQuery("SELECT COUNT(1) FROM "+rs1.getString(1)); //�����ǰ���õı��е�����������
                	if(rs2!=null&&rs2.next()){
                		
                		if(rs2.getInt(1)>rs.getInt(2)){  //�����ǰ���õı��е����������������ݿ�����
                			rs3=sta3.executeQuery("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE status=1 and eventTypeCode='"+rs.getString(1)+"'");
                			while(rs3!=null&&rs3.next()){     
                				if(rs3.isLast()){infoSB.append(rs3.getString(1)+" "+rs3.getString(2));}
                				else{infoSB.append(rs3.getString(1)+" "+rs3.getString(2)+",");}
                			}
                			str_tableName=rs.getString(1)+"_"+dqsj;

                			k=sta4.executeUpdate("create table "+str_tableName+" ("+infoSB.toString()+")" +     //�½� һ�ű�
                							  "ENGINE=InnoDB DEFAULT CHARSET=GBK COMMENT='�¼���  "+rs.getString(1)+"';");
                			//System.out.println("!!!k="+k);
                			
                			if(k==0){
                				con.setAutoCommit(false);   ////////����
                				k1=sta5.executeUpdate("UPDATE t_s_eventtablemanager SET work=0,endTime='"+dqsj2+"',sum='"+rs2.getInt(1)+"' WHERE work=1 AND eventTypeCode='"+rs.getString(1)+"'");
                				k2=sta6.executeUpdate("INSERT INTO t_s_eventtablemanager (eventTypeCode,tableName,createBy,work,ctTime,startTime,status,reserve1) " +
                								   "VALUES('"+rs.getString(1)+"','"+str_tableName+"','System',1,'"+dqsj2+"','"+dqsj2+"',1,'����')");
                				
                				//System.out.println("k1:"+k1+"k2:"+k2);
                				if(k1==1&&k2==1){
                			        con.commit();
                			        con.setAutoCommit(true);
                					System.out.println(str_tableName+"����ɹ�!");
                				}else{con.rollback();System.out.println("�ع�����������������������");}
                				k1=-1;
                				k2=-1;
                				k=-1;
                			}
                		}
                		//System.out.println("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE 1=1 and eventTypeCode='"+rs.getString(1)+"'");
                		System.out.println(rs1.getString(1)+"������"+rs2.getInt(1)+"�����ݣ�");
                		//System.out.println(infoSB.toString());
                		infoSB=new StringBuffer();
                	}
                }else{				//�����ݿ��л�û�д˱�ʱ
                	//System.out.println("1234567890asdfghjkzxcvbnm--------------"+rs.getString(1));
                	rs2=sta2.executeQuery("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE status=1 and eventTypeCode='"+rs.getString(1)+"'");  //�鿴t_s_eventtabletitle���Ƿ��ж�Ӧ��sql
                	//if(!rs2.next()){System.out.println(rs.getString(1)+"�޶�Ӧsql");}
                	//rs2.beforeFirst();
                	while(rs2!=null&&rs2.next()){     //���t_s_eventtabletitle���ж�Ӧ��sql�����������ƴ��
        				if(rs2.isLast()){infoSB.append(rs2.getString(1)+" "+rs2.getString(2));}
        				else{infoSB.append(rs2.getString(1)+" "+rs2.getString(2)+",");}
        			}
                	if(infoSB.toString()!=null && !infoSB.toString().equals("")){	//����нӺõ�sql
                		str_tableName=rs.getString(1)+"_"+dqsj;			//���ɱ���
            			k3=sta3.executeUpdate("create table "+str_tableName+" ("+infoSB.toString()+")" +     //�½� һ�ű�
            							  "ENGINE=InnoDB DEFAULT CHARSET=GBK COMMENT='�¼���  "+rs.getString(1)+"';");
                	}
                	if(k3==0){		//�������ɹ�����t_s_eventtablemanager���뱾����Ϣ
                		k4=sta4.executeUpdate("INSERT INTO t_s_eventtablemanager (eventTypeCode,tableName,createBy,work,ctTime,startTime,status,reserve1) " +
								   "VALUES('"+rs.getString(1)+"','"+str_tableName+"','System',1,'"+dqsj2+"','"+dqsj2+"',1,'����')");
                		k3=-1;
                	}
                	if(k4==1){k4=-1;System.out.println(str_tableName+"����ɹ���");}		//�����ɹ�
                	//System.out.println("infoSB"+infoSB.toString());
                	infoSB=new StringBuffer();
                }
            } System.out.println(dqsj2);
        }
        catch (SQLException sql)
        {	System.out.println("!!!!!!!!!!!!!!ִ�лع�");
        	con.rollback();  
        	con.setAutoCommit(true);
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"createTableBean.createTable�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
        	con.rollback();
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"createTableBean.createTable�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
        	con.rollback();
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"createTableBean.createTable�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }
}