/*
 * @(#)modules.xsbmglBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
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
 * 功能:网站基本信息数据的Bean类
 *
 * @author  请务必填写
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
     * 网站基本信息数据查询
     */
    public String createTable(ServletContext sc)
    throws CustomException,Exception
    {
//    	判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        
        
        //保存查询结果信息
        StringBuffer infoSB=null;
        //保存SQL语句
        StringBuffer sqlSB = null;
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        ResultSet rs1=null;//保存查询的结果集
        ResultSet rs2=null;//保存查询的结果集
        ResultSet rs3=null;//保存查询的结果集
        //ResultSet rs4=null;//保存查询的结果集
        
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
            	System.out.println("数据库连接Connection为空，连接失败");
                throw new CustomException("数据库连接Connection为空，连接失败。");
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
            
            
            sqlSB.append("SELECT event_code,masrows FROM t_s_eventtype GROUP BY event_code"); //查出所有的事件类型
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            rs=pstm.executeQuery();
            
            
            
            while (rs!=null && rs.next())
            {
                //System.out.println(rs.getString(1));
                rs1=sta1.executeQuery("SELECT tableName FROM t_s_eventtablemanager WHERE eventTypeCode='"+rs.getString(1)+"' AND work=1 AND status=1 LIMIT 1"); //根据事件类型等条件查出每个事件类当前所用的表名
                
                if(rs1!=null&&rs1.next()){
                	//System.out.println(rs1.getString(1));
                	rs2=sta2.executeQuery("SELECT COUNT(1) FROM "+rs1.getString(1)); //查出当前所用的表中的数据总条数
                	if(rs2!=null&&rs2.next()){
                		
                		if(rs2.getInt(1)>rs.getInt(2)){  //如果当前所用的表中的数据总数超出数据库容量
                			rs3=sta3.executeQuery("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE status=1 and eventTypeCode='"+rs.getString(1)+"'");
                			while(rs3!=null&&rs3.next()){     
                				if(rs3.isLast()){infoSB.append(rs3.getString(1)+" "+rs3.getString(2));}
                				else{infoSB.append(rs3.getString(1)+" "+rs3.getString(2)+",");}
                			}
                			str_tableName=rs.getString(1)+"_"+dqsj;

                			k=sta4.executeUpdate("create table "+str_tableName+" ("+infoSB.toString()+")" +     //新建 一张表
                							  "ENGINE=InnoDB DEFAULT CHARSET=GBK COMMENT='事件表  "+rs.getString(1)+"';");
                			//System.out.println("!!!k="+k);
                			
                			if(k==0){
                				con.setAutoCommit(false);   ////////事务
                				k1=sta5.executeUpdate("UPDATE t_s_eventtablemanager SET work=0,endTime='"+dqsj2+"',sum='"+rs2.getInt(1)+"' WHERE work=1 AND eventTypeCode='"+rs.getString(1)+"'");
                				k2=sta6.executeUpdate("INSERT INTO t_s_eventtablemanager (eventTypeCode,tableName,createBy,work,ctTime,startTime,status,reserve1) " +
                								   "VALUES('"+rs.getString(1)+"','"+str_tableName+"','System',1,'"+dqsj2+"','"+dqsj2+"',1,'保留')");
                				
                				//System.out.println("k1:"+k1+"k2:"+k2);
                				if(k1==1&&k2==1){
                			        con.commit();
                			        con.setAutoCommit(true);
                					System.out.println(str_tableName+"建表成功!");
                				}else{con.rollback();System.out.println("回滚！！！！！！！！！！！");}
                				k1=-1;
                				k2=-1;
                				k=-1;
                			}
                		}
                		//System.out.println("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE 1=1 and eventTypeCode='"+rs.getString(1)+"'");
                		System.out.println(rs1.getString(1)+"表中有"+rs2.getInt(1)+"条数据！");
                		//System.out.println(infoSB.toString());
                		infoSB=new StringBuffer();
                	}
                }else{				//当数据库中还没有此表时
                	//System.out.println("1234567890asdfghjkzxcvbnm--------------"+rs.getString(1));
                	rs2=sta2.executeQuery("SELECT titleCode,prop FROM t_s_eventtabletitle WHERE status=1 and eventTypeCode='"+rs.getString(1)+"'");  //查看t_s_eventtabletitle中是否有对应的sql
                	//if(!rs2.next()){System.out.println(rs.getString(1)+"无对应sql");}
                	//rs2.beforeFirst();
                	while(rs2!=null&&rs2.next()){     //如果t_s_eventtabletitle中有对应的sql，查出并进行拼接
        				if(rs2.isLast()){infoSB.append(rs2.getString(1)+" "+rs2.getString(2));}
        				else{infoSB.append(rs2.getString(1)+" "+rs2.getString(2)+",");}
        			}
                	if(infoSB.toString()!=null && !infoSB.toString().equals("")){	//如果有接好的sql
                		str_tableName=rs.getString(1)+"_"+dqsj;			//生成表名
            			k3=sta3.executeUpdate("create table "+str_tableName+" ("+infoSB.toString()+")" +     //新建 一张表
            							  "ENGINE=InnoDB DEFAULT CHARSET=GBK COMMENT='事件表  "+rs.getString(1)+"';");
                	}
                	if(k3==0){		//如果建表成功，向t_s_eventtablemanager插入本表信息
                		k4=sta4.executeUpdate("INSERT INTO t_s_eventtablemanager (eventTypeCode,tableName,createBy,work,ctTime,startTime,status,reserve1) " +
								   "VALUES('"+rs.getString(1)+"','"+str_tableName+"','System',1,'"+dqsj2+"','"+dqsj2+"',1,'保留')");
                		k3=-1;
                	}
                	if(k4==1){k4=-1;System.out.println(str_tableName+"建表成功！");}		//操作成功
                	//System.out.println("infoSB"+infoSB.toString());
                	infoSB=new StringBuffer();
                }
            } System.out.println(dqsj2);
        }
        catch (SQLException sql)
        {	System.out.println("!!!!!!!!!!!!!!执行回滚");
        	con.rollback();  
        	con.setAutoCommit(true);
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"createTableBean.createTable出现数据库错误，操作为：系统自动执行创建事件表！"+sql.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
        	con.rollback();
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"createTableBean.createTable出现数据库错误，操作为：系统自动执行创建事件表！"+ue.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
        	con.rollback();
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"createTableBean.createTable出现数据库错误，操作为：系统自动执行创建事件表！"+ce.getMessage(),AutoEventTableMgr.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }
}