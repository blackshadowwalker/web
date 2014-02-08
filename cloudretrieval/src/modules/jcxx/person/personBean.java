/*
 * @(#)modules.personBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * 程序生成时间：[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.jcxx.person;


import java.sql.*;
import java.util.ResourceBundle;
import java.io.UnsupportedEncodingException;

import javax.sql.DataSource;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.*;

/**
 * 功能:本类为人员基本信息的Bean类
 *
 * @author  请务必填写
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: personBean.java,v 1.1 2012/09/30 01:54:30 Administrator Exp $
 */
public class personBean extends ResourceClose
{
    private DataSource dataSource;

    public personBean()
    {
    }

    /*
     * 构造函数
     */
    public personBean(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    
    
    /*
     * 删除人员基本信息AJAX
     */
    public int deleteTUPerson(long id,ServletContext sc,HttpSession session)
        throws CustomException,Exception
    {
        // 判断环境实例是否为空
        if (sc == null)
        {
         //   System.out.println("ServletContext 为空，返回。");
            throw new CustomException("ServletContext 为空，返回");
        }

        //判断会话实例是否为空
        if (session==null)
        {
        //    System.out.println("HttpSession 为空，返回。");
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
        ResultSet rs=null;//保存查询的结果集
        
        StringBuffer sqlSB = new StringBuffer();
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            int num=0;
            
            con.setAutoCommit(false);

            pstm=con.prepareStatement(basePublic.in("update t_u_person set status = 0  where id=?"));
            pstm.setLong(1, id);
            num = pstm.executeUpdate();
            
            con.commit();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"删除用户成功！",personBean.class.getName());
            return num;
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson出现数据库连接错误，操作为：删除用户失败！"+sql.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson出现转化字符集错误，操作为：删除用户失败！"+ue.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.deleteTUPerson出现错误，操作为：删除用户失败！"+ce.getMessage(),personBean.class.getName());
            con.rollback();
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(null,pstm,null,con);
        }
    }

    /*
     * 添加人员基本信息AJAX
     */
    public int addTUPerson(String labels,String values,String usercode,ServletContext sc,HttpSession session)
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
    
    
    ResultSet rs=null;//保存查询的结果集
    PreparedStatement pstm2=null;//保存预处理语句
    ResultSet rs2=null;//保存查询的结果集
    
    PreparedStatement pstm3=null;//保存预处理语句
    ResultSet rs3=null;//保存查询的结果集
    try
    {
        con=((DataSource)sc.getAttribute("basedb")).getConnection();
        if (con==null)
        {
        	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
        }
        con.setAutoCommit(false);
        sqlSB = new StringBuffer();
        sqlSB.append("insert into t_u_person(").append(labels).append(") values (").append(values).append(")");
        pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
        pstm.executeUpdate();
        close(null,pstm,null,null);
        
        //添加角色
        sqlSB.setLength(0);
        sqlSB.append("insert into t_s_userrole (user_code,role_code,status) values('"+usercode+"','ybyh',1)");
        pstm = con.prepareStatement(sqlSB.toString());
        pstm.execute();
        close(null,pstm,null,null);
        
        con.commit();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"添加用户成功！",personBean.class.getName());
        return 1; 
    }
    catch (SQLException sql)
    {
        sql.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson出现数据库连接错误，操作为：添加用户失败！"+sql.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
    }
    catch (UnsupportedEncodingException ue)
    {
        ue.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson出现转化字符集错误，操作为：添加用户失败！"+ue.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
    }
    catch (Exception ce)
    {
        ce.printStackTrace();
        LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.addTUPerson出现错误，操作为：添加用户失败！"+ce.getMessage(),personBean.class.getName());
        con.rollback();
        throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
    }
    finally
    {
        //关闭所有可用资源
        close(null,pstm,null,con);
    }
}


    /*
     * 修改前根据id值查询详细的人员基本信息AJAX
     */
    public String beforeUpdateTUPerson(long id,ServletContext sc,HttpSession session)
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
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language");
            sqlSB.append(",");
            sqlSB.append("photo_path");
            sqlSB.append(" FROM t_u_person ");
            sqlSB.append("WHERE id=?");
            
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
            	infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("passwd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("dept_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("role_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xb")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("csrq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sj")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("tel")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("mail")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("language")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("photo_path")) + "</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改前查询用户详细信息成功！",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson出现数据库连接错误，操作为：修改前查询用户详细信息失败！"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson出现转化字符集错误，操作为：修改前查询用户详细信息失败！"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.beforeUpdateTUPerson出现错误，操作为：修改前查询用户详细信息失败！"+ce.getMessage(),personBean.class.getName());
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
     * 修改人员基本信息AJAX
     */
    public int updateTUPerson(String id,String values,String p_path,
        ServletContext sc,HttpSession session) throws CustomException,Exception
    {
    	
    	String p = values.split(",")[0];
    	String bt = p.split("=")[1];
    	String photo_url = bt.substring(1, bt.length()-1);
    	
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

        String usercode = bform.user_code;
        //保存SQL语句
        StringBuffer sqlSB = null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集

        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }
            System.err.println(values);
            sqlSB=new StringBuffer();
            
            con.setAutoCommit(false);

            sqlSB.append("UPDATE t_u_person SET ").append(values).append(" WHERE id=").append(id);
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            
           
            int num=pstm.executeUpdate();
            
            con.commit();
            
            if(photo_url.equals(usercode)){
            	bform.photo_path=p_path;
            }
            
            
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"修改用户信息成功！",personBean.class.getName());
            return num;
            
        }
        catch (SQLException sql)
        {
        	con.rollback();
            sql.printStackTrace();
        	LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson出现数据库连接错误，操作为：修改用户信息失败！"+sql.getMessage(),personBean.class.getName());
        	throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
        	con.rollback();
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson出现转化字符集错误，操作为：修改用户信息失败！"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
        	con.rollback();
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.updateTUPerson出现错误，操作为：修改用户信息失败！"+ce.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }
    }
    
    /*
     * 根据条件语句查询人员基本信息AJAX
     */
    public String queryTUPerson(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
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
        StringBuffer sqlSB=null;
        //保存查询总条数语句
        StringBuffer countSB=null;
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
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
            
            sqlSB.append("select   id,");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("dept_code");
            sqlSB.append(",");
            sqlSB.append("role_code");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language,");

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
            
            countSB.append("select count(1) from t_u_person "); 
            sqlSB.append(" from t_u_person ");
            if (s != null && s.length()>0)
            {
                sqlSB.append(s);
                countSB.append(s);
            }
            sqlSB.append(" order by id desc");
            countSB.append(" order by id desc");
            
            rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
            
            if(rs==null){
            	return "no";
            }
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            while (rs!=null && rs.next())
            {
                for (int i = 1; i <= numberOfColumns; i ++)
                {
                	if(i==5)
                	{
                		pstm2 = con.prepareStatement("select dept_name from t_s_dept where dept_code = '"+rs.getString(i)+"'");
                		
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("dept_name"))).append("</C>");
                		}
                		else
                		{
                			infoSB.append("</C>");
                		}
                		close(rs2,pstm2,null,null);
                	}
                	else if(i==6)
                	{
                		pstm2 = con.prepareStatement("select role_name from t_s_role where role_code = '"+rs.getString(i)+"'");
                		
                		rs2 = pstm2.executeQuery();
                		
                		if(rs2!=null && rs2.next())
                		{
                			infoSB.append(basePublic.out(rs2.getString("role_name"))).append("</C>");
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
            infoSB.append("</F>");
            infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
           System.out.println(infoSB.toString());
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"根据条件查询用户信息成功！",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson出现数据库连接错误，操作为：根据条件查询用户信息失败！"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson出现转化字符集错误，操作为：根据条件查询用户信息失败！"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.queryTUPerson出现错误，操作为：根据条件查询用户信息失败！"+ce.getMessage(),personBean.class.getName());
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
     * 根据id值查询详细的人员基本信息AJAX
     */
    public String detailTUPerson(long id,ServletContext sc,HttpSession session)
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
        
        Connection con=null;//保存数据库连接
        PreparedStatement pstm=null;//保存预处理语句
        ResultSet rs=null;//保存查询的结果集
        
        PreparedStatement pstm2=null;//保存预处理语句
        ResultSet rs2=null;//保存查询的结果集
        
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
            if (con==null)
            {
            	throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
            }

            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            
            sqlSB.append("select ");
            sqlSB.append("user_code");
            sqlSB.append(",");
            sqlSB.append("passwd");
            sqlSB.append(",");
            sqlSB.append("user_name");
            sqlSB.append(",");
            sqlSB.append("d.dept_name");
            sqlSB.append(",");
            sqlSB.append("xb");
            sqlSB.append(",");
            sqlSB.append("csrq");
            sqlSB.append(",");
            sqlSB.append("r.role_name");
            sqlSB.append(",");
            sqlSB.append("sj");
            sqlSB.append(",");
            sqlSB.append("tel");
            sqlSB.append(",");
            sqlSB.append("mail");
            sqlSB.append(",");
            sqlSB.append("language");
            
            sqlSB.append(" from t_u_person p, t_s_dept d,t_s_role r ");
            sqlSB.append("where p.id=? ");
            sqlSB.append("and p.dept_code = d.dept_code AND p.role_code=r.role_code ");
            System.out.println(sqlSB.toString());
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            pstm.setLong(1, id);
            rs=pstm.executeQuery();
            
            if (rs!=null && rs.next())
            {
                infoSB.append(basePublic.out(rs.getString("user_code")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("passwd")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("user_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("dept_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("xb")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("csrq")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("role_name")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("sj")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("tel")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("mail")) + "</C>");
                infoSB.append(basePublic.out(rs.getString("language")) + "</C>");
                infoSB.append("</R>");
            }
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_czlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"查看用户详细信息成功！",personBean.class.getName());
        }
        catch (SQLException sql)
        {
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson出现数据库连接错误，操作为：查看用户详细信息失败！"+sql.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
        }
        catch (UnsupportedEncodingException ue)
        {
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson出现转化字符集错误，操作为：查看用户详细信息失败！"+ue.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
        }
        catch (Exception ce)
        {
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog",bform.user_code+"</C>"+bform.user_name+"</C>"+bform.clientIP+"</C>"+"personBean.detailTUPerson出现错误，操作为：查看用户详细信息失败！"+ce.getMessage(),personBean.class.getName());
            throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
        }
        finally
        {
            //关闭所有可用资源
            close(rs,pstm,null,con);
        }

        return infoSB.toString();
    }
    
    public String detailTUPerson2(long id,ServletContext sc,HttpSession session)
    throws CustomException,Exception
	{
	    
	    return "";
	}
}
