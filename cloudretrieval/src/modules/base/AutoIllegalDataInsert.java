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
     * 网站基本信息数据查询
     */
  //白名单过滤
    public String whiteIllegalDataFilter(ServletContext sc)
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
        StringBuffer infoSB1=null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("数据库连接Connection为空，连接失败");
                throw new CustomException("数据库连接Connection为空，连接失败。");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }
    
    
    
    //普通车辆违法信息
    public void illegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        ResultSet rs1=null;//保存查询的结果集
        
        Statement sta1=null;
        Statement sta2=null;

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("数据库连接Connection为空，连接失败");
                throw new CustomException("数据库连接Connection为空，连接失败。");
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
            				",'"+rs1.getString(12)+"','"+rs1.getString(13)+"','"+rs1.getString(14)+"',"+null+",'"+rs1.getString(15)+"','未审核','system','"+dqsj+"',"+null+","+null+","+null+","+null+",'"+rs1.getString(17)+"');\n");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }
    
    //白名单车辆违法要信息
    public void whiteIllegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        ResultSet rs1=null;//保存查询的结果集
        
        Statement sta1=null;
        Statement sta2=null;

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("数据库连接Connection为空，连接失败");
                throw new CustomException("数据库连接Connection为空，连接失败。");
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
            				",'"+rs1.getString(12)+"','"+rs1.getString(13)+"','"+rs1.getString(14)+"',"+null+",'"+rs1.getString(15)+"','未审核','system','"+dqsj+"',"+null+","+null+",'"+rs1.getString(17)+"');\n");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }

    
    //需要人工录入的信息
    public void unknownIllegalDataInsert(ServletContext sc)
    throws CustomException,Exception
    {
//    	判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }
        
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        ResultSet rs2=null;//保存查询的结果集
        
        Statement sta2=null;
        Statement sta3=null;
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("数据库连接Connection为空，连接失败");
                throw new CustomException("数据库连接Connection为空，连接失败。");
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+sql.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现数据库连接方面的错误...");
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ue.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("转化字符集时出现错误。");
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"系统自动执行"+"</C>"+"AutoIllegalDataInsert.illegalDataInsert出现数据库错误，操作为：系统自动执行创建事件表！"+ce.getMessage(),AutoIllegalDataInsert.class.getName());
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
        	con.setAutoCommit(true);
            close(rs,pstm,null,con);
        }
    }

}