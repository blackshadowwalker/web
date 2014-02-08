/*
 * @(#)codeBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.mmxg;

import java.io.UnsupportedEncodingException;
import java.sql.*;

import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import cryptix.CryptixException;
import cryptix.provider.md.SHA1;
import cryptix.util.core.Hex;
import modules.base.*;
import modules.jcxx.dept.deptBean;

/**
 * 功能:本类为代码信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: mmxgBean.java,v 1.1 2012/09/30 01:54:27 Administrator Exp $
 */
public class mmxgBean extends ResourceClose
{
    //private String date = TimeBean.getCurrentTime();
    
    public mmxgBean()
    {
    }

    /*
     * 构造函数
     */
    /*
    public codeBean(DataSource dataSource)
    {
    }
    */

    /*
     * 修改代码信息AJAX
     */
    public int updatePassword(String values,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            //////System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            //////System.out.println("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }

        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
        }

        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        int num = 0;
        DataSource ds=null;
        
        try
        {
        	ds=(DataSource)sc.getAttribute("basedb");
            con=ds.getConnection();
            if (con==null)
            {
            	throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            String[] message = values.split(",");

            pstm=con.prepareStatement("select 1 from t_u_person where user_code=? and passwd=? and status=1");
            pstm.setString(1, message[0]);
            pstm.setString(2, message[1]);

            rs=pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
            	close(rs,pstm,null,null);
            	
            	pstm = con.prepareStatement("update t_u_person set passwd = ? where user_code=? and status=1");
            	pstm.setString(1, message[2]);
            	pstm.setString(2, message[0]);
            	
            	num=pstm.executeUpdate();
            	
            	LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
     					.getConnection(), "t_s_czlog", bform.user_code + "</C>"
     					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
     					+ "密码修改！",mmxgBean.class.getName());
            }
            else
            {
            
            	num = -1;
            	
            	  LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
      					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
      					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
      					+ "mmxgBean.updatePassword出现数据库错误，操作为：" 
      					+"密码修改失败:未正确输入旧密码",mmxgBean.class.getName());
            }
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "mmxgBean.updatePassword出现数据库错误，操作为：" 
					+"密码修改失败失败" + sql.getMessage(),mmxgBean.class.getName());
            throw new CustomException("出现数据库连接方面的错误..."+sql.getMessage());
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
					.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
					+ bform.user_name + "</C>" + bform.clientIP + "</C>"
					+ "mmxgBean.updatePassword出现错误，操作为：" 
					+"密码修改失败失败" + ce.getMessage(),mmxgBean.class.getName());
            throw new CustomException("出现未知异常错误:"+ce.getMessage());
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return num;
    }
    
    /*
     * 修改前根据id值查询详细的客户信息管理AJAX
     */
    public String bforup(ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            pstm = con.prepareStatement("select jh,user_name,tupian from t_u_person where user_code='"+bform.user_code+"'");
            rs = pstm.executeQuery();
            
            if(rs!=null && rs.next())
            {
         	   infoSB.append(rs.getString("jh")).append("</C>");
         	   infoSB.append(rs.getString("user_name")).append("</C>");
         	   
         	  infoSB.append(rs.getString("tupian")).append("</C></R>");
            }
           
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("出现数据库连接方面的错误...");
        }
       
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    
    /*
     * 修改前根据id值查询详细的客户信息管理AJAX
     */
    public String forup(String xx,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        
        //判断环境实例是否为空
        if (sc == null)
        {
            System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            System.out.println("HttpSession 为空，返回。");
            throw new CustomException("HttpSession 为空，返回");
        }
        
        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
            throw new CustomException("连接失效，请重新登录系统。");
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
                throw new CustomException("数据库连接Connection为空，连接失败。");
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            pstm = con.prepareStatement("update t_u_person set "+xx+" where user_code='"+bform.user_code+"'");
            pstm.execute();
            
            close(null,pstm,null,null);
           
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            throw new CustomException("出现数据库连接方面的错误...");
        }
       
        catch (Exception ce)
        {
            ce.printStackTrace();
            throw new CustomException("出现未知异常错误。");
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    public static String digest(String strBlock) throws CryptixException
	{
		if (strBlock == null)
			return null;

		try
		{
			SHA1 sha1 = new SHA1();
			return Hex.toString(sha1.digest(strBlock.getBytes()));
		}
		catch(CryptixException t)
		{
			return null;
		}
	}
}