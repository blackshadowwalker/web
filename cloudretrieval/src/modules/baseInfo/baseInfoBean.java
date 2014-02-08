/*
 * @(#)modules.xsbmglBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
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
 * 功能:网站基本信息数据的Bean类
 *
 * @author  请务必填写
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
     * 网站基本信息数据查询
     */
    public String queryBaseInfo(ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
//    	判断环境实例是否为空
        if (sc == null)
        {
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
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
        StringBuffer sqlSB1 = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        PreparedStatement pstm1=null;//保存预处理语句
        ResultSet rs1=null;//保存查询的结果集
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查询系统参数成功！",baseInfoBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo出现数据库错误，操作为：查询系统参数信息失败！"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo出现转化字符集错误，操作为：查询系统参数信息失败！"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfo出现错误，操作为：查询系统参数信息失败！"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
        return infoSB.toString();
    }
    /*
     * 网站基本信息数据删除
     */
    public int deleteBaseInfo(String id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
    {
        // 判断环境实例是否为空
        if (sc == null)
        {
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            int num=0;

            pstm=con.prepareStatement(basePublic.in("UPDATE t_s_baseinfo SET status=0 where id=?"));
            pstm.setInt(1, Integer.parseInt(id));
            num = pstm.executeUpdate();
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除系统参数成功！",baseInfoBean.class.getName());

            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo出现数据库连接错误，操作为：删除系统参数失败！"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo出现转化字符集错误，操作为：删除系统参数失败！"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.deleteBaseInfo出现错误，操作为：删除系统参数失败！"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }
    
    
    /*
     * 添加网站基本信息
     */
    public int addBaseInfo(String id,String logo,String title,String foot,String version,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //判断用户是否登录
        
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }

        //保存SQL语句
        StringBuffer sqlSB = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"增加系统参数成功！",baseInfoBean.class.getName());
            
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo出现数据库错误，操作为：增加系统参数失败！"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo出现转化字符集错误，操作为：增加系统参数失败！"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.addBaseInfo出现错误，操作为：增加系统参数失败！"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }


    /*
     * 修改前根据id值查询网站基本信息
     */
    public String queryBaseInfoById(String id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
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
        StringBuffer sqlSB1 = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PreparedStatement pstm1=null;//保存预处理语句
        ResultSet rs1=null;//保存查询的结果集
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
            		"查询系统参数详细信息成功！",baseInfoBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById出现数据库错误，操作为：修改前查询系统参数详细信息失败！"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById出现转化字符集错误，操作为：修改前查询系统参数详细信息失败！"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.queryBaseInfoById出现错误，操作为：修改前查询系统参数详细信息失败！"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }

    /*
     * 修改网站基本信息信息
     */
    public int updateBaseInfoById(String id,String logo,String title,String foot,int work,String version,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
        //判断环境实例是否为空
        if (sc == null)
        {
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
            throw new CustomException("HttpSession 为空，返回");
        }
        ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

        //判断用户是否登录
        baseForm bform=(baseForm)session.getAttribute("baseuser");
        if (bform==null)
        {
        	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
        }

        //保存SQL语句
        StringBuffer sqlSB = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        baseForm bf = null;
        String nowTime="";
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
 					"t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改系统参数信息成功!" +
 							"["+title+", "+version+", "+foot+"]",
 					baseInfoBean.class.getName());

            return num;
        }
          catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById出现数据库连接错误，操作为：修改系统参数信息成功失败！"+sql.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById出现转化字符集错误，操作为：修改系统参数信息成功失败！"+ue.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfoBean.updateBaseInfoById出现错误，操作为：修改系统参数信息成功失败！"+ce.getMessage(),baseInfoBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
       
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
    /*
     * 修改使能状态
     */
    public int updateBaseInfoWork(String id,
            ServletContext sc,HttpSession session) throws CustomException,Exception
        {
            //判断环境实例是否为空
            if (sc == null)
            {
                throw new CustomException("ServletContext 为空，返回");
            }

            //判断会话实例是否为空
            if (session==null)
            {
                throw new CustomException("HttpSession 为空，返回");
            }
            ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

            //判断用户是否登录
            baseForm bform=(baseForm)session.getAttribute("baseuser");
            if (bform==null)
            {
            	throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
            }

            //保存SQL语句
            StringBuffer sqlSB = null;
            Connection con=null;//保存数据库连接
            PreparedStatement pstm=null;//保存预处理语句
            ResultSet rs=null;//保存查询的结果集
            Statement st=null;
            
            PreparedStatement pstm1=null;//保存预处理语句
            ResultSet rs1=null;//保存查询的结果集
            baseForm bf = (baseForm)session.getAttribute("baseuser");
            try
            {
                con=((DataSource)sc.getAttribute("basedb")).getConnection();
                if (con==null)
                {
                	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
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
    					bf.mainTitle = "信帧智能消防系统";
    				}
    				if(bf.zw.equals("dzjcGroup")){
    					bf.mainTitle = "信帧电子警察系统";
    				}*/
    				bf.footerContent = rs.getString("footerContent");
    				session.setAttribute("baseuser",bf);
    			}
                
     			con.commit();
     			LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改系统参数使能状态成功！",baseInfoBean.class.getName());

                return num;
            }
              catch (SQLException sql)
            {
                sql.printStackTrace();
                con.rollback();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork出现数据库连接错误，操作为：修改系统参数使能状态失败！"+sql.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
            }
            catch (UnsupportedEncodingException ue)
            {
                ue.printStackTrace();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork出现转化字符集错误，操作为：修改系统参数使能状态失败！"+ue.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
            }
            catch (Exception ce)
            {
                ce.printStackTrace();
                LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"baseInfolBean.updateBaseInfoWork出现错误，操作为：修改系统参数使能状态失败！"+ce.getMessage(),baseInfoBean.class.getName());
                throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
            }
           
            finally
            {
                //关闭所有可用资源
                close(rs,pstm,null,con);
            }
        }
}