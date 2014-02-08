/*
 * @(#)rulerBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.rzgl.userlog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.TimeZone;
import java.io.UnsupportedEncodingException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import modules.base.*;


/**
 * 功能:本类为权限信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: rulerBean.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class userlogBean extends ResourceClose
{
    //private DataSource dataSource;
    //private String date = TimeBean.getCurrentTime();
  
    public userlogBean()
    {
    }
    /*
     * 根据条件语句查询信息AJAX
     */
    public String queryTSUserlog(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
        	basePublic.error("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        	basePublic.error("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        //保存查询结果信息
        StringBuffer infoSB=null;
        //保存SQL语句
        StringBuffer sqlSB = null;
        
        StringBuffer countSB = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PageMan pm=PageManFactory.getInstance();
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            countSB=new StringBuffer();
            
            sqlSB.append("select id,user_code,user_name,user_ip,user_time,user_nr from t_s_czlog ");
            if(s!=null&&!s.equals("")){
            	sqlSB.append(" ");
            	sqlSB.append(s);
            }
            sqlSB.append(" order by user_time desc ");
            countSB.append("select count(1)  from  t_s_czlog " );
            if(s!=null&&!s.equals("")){
            	countSB.append(" ");
            	countSB.append(s);
            }
            System.out.println(sqlSB);
            System.out.println(countSB);
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
            
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ 
            		"查询用户操作日志信息成功！",userlogBean.class.getName()); 
        }
        catch (SQLException sql)
		{
			sql.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog出现数据库连接错误,操作为：查询用户操作日志信息失败!" + sql.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
		}
		catch (UnsupportedEncodingException ue)
		{
			ue.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog出现转化字符错误,操作为：查询用户操作日志信息失败!" + ue.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "userlogBean.queryTSUserlog出现错误,操作为：查询用户操作日志信息失败!" + ce.getMessage(),userlogBean.class.getName());
			throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
		}
        finally
        {
        	pm.close(true);
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    /*
     * 根据条件语句查询详细信息AJAX
     */
    
    public String detailTSUserlog(String id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
{
    
    //判断环境实例是否为空
    if (sc == null)
    {
    	basePublic.error("ServletContext 为空，返回。");
        throw new CustomException("ServletContext 为空，返回");
    }

    //判断会话实例是否为空
    if (session==null)
    {
    	basePublic.error("HttpSession 为空，返回。");
        throw new CustomException("HttpSession 为空，返回");
    }
    ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
    //判断用户是否登录
    baseForm bform=(baseForm)session.getAttribute("baseuser");
    
    if (bform==null)
    {
    	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
    }
    
    //保存查询结果信息
    StringBuffer infoSB=null;
    //保存SQL语句
    StringBuffer sqlSB = null;
    Connection con=null;//保存数据库连接
    PreparedStatement pstm=null;//保存预处理语句
    ResultSet rs=null;//保存查询的结果集
    
    try
    {
        con=((DataSource)sc.getAttribute("basedb")).getConnection();
        if (con==null)
        {
        	//Log.logger.log(Level.INFO, bform.login_id+"|"+date+"|根据条件语句查询权限信息（t_s_ruler）时，数据库连接Connection为空，连接失败");
        	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
        }

        infoSB=new StringBuffer();
        sqlSB=new StringBuffer();
        
        sqlSB.append("select user_code,user_name,user_ip,user_time,user_nr from t_s_czlog where id=?");
        pstm=con.prepareStatement(sqlSB.toString());
        pstm.setString(1, id);
        rs=pstm.executeQuery();
        if (rs!=null && rs.next())
        {
        	infoSB.append(id).append("</C>");
			infoSB.append(rs.getString("user_code")).append("</C>");
			infoSB.append(rs.getString("user_name")).append("</C>");
			infoSB.append(rs.getString("user_ip")).append("</C>");
			infoSB.append(rs.getString("user_time")).append("</C>");
			infoSB.append(basePublic.out(rs.getString("user_nr"))).append("</C></R>");
        }
        LogBean.wirte_log(((DataSource) sc.getAttribute("basedb")).getConnection(), "t_s_czlog", bform.user_code + "</C>"+ bform.user_name + "</C>" + bform.clientIP + "</C>"+ "查询用户操作日志详细信息成功！",userlogBean.class.getName());
        return infoSB.toString();
    }
    catch (SQLException sql)
	{
		sql.printStackTrace();
		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
				.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
				+ bform.user_name + "</C>" + bform.clientIP + "</C>"
				+ "userlogBean.detailTSUserlog出现数据库连接错误,操作为：查询用户操作日志详细信息失败!" + sql.getMessage(),userlogBean.class.getName());
		throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	}
	catch (Exception ce)
	{
		ce.printStackTrace();
		LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
				.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
				+ bform.user_name + "</C>" + bform.clientIP + "</C>"
				+ "userlogBean.detailTSUserlog出现错误,操作为：查询用户操作日志详细信息失败!" + ce.getMessage(),userlogBean.class.getName());
		throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	}
    finally
    {

        close(rs,pstm,null,con);
    }
}
    
}
